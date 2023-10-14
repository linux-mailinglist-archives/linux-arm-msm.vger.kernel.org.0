Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C2A7C95B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Oct 2023 19:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233304AbjJNR25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Oct 2023 13:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbjJNR25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Oct 2023 13:28:57 -0400
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71278CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Oct 2023 10:28:53 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 874741C0728;
        Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-088-078-204-065.088.078.pools.vodafone-ip.de [88.78.204.65])
        by srv01.abscue.de (Postfix) with ESMTPSA id 2BA9F1C072A;
        Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 1/3] ASoC: qcom: q6core: expose ADSP core firmware version
Date:   Sat, 14 Oct 2023 19:26:22 +0200
Message-Id: <20231014172624.75301-2-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231014172624.75301-1-otto.pflueger@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a q6core_get_adsp_version() function that returns the version of the
ADSP firmware (2.6, 2.7 or 2.8), also known as the AVS version (see [1]
in downstream kernel).

Some APIs differ between these versions, e.g. the AFE clock APIs.

[1]: https://github.com/msm8916-mainline/linux-downstream/blob/LA.BR.1.2.9.1_rb1.5/sound/soc/msm/qdsp6v2/q6core.c#L193

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6core.c | 61 +++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6core.h |  9 ++++++
 2 files changed, 70 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 49cfb32cd209..ea6232645c80 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -20,6 +20,9 @@
 #define AVCS_CMDRSP_ADSP_EVENT_GET_STATE	0x0001290D
 #define AVCS_GET_VERSIONS       0x00012905
 #define AVCS_GET_VERSIONS_RSP   0x00012906
+#define AVCS_CMDRSP_Q6_ID_2_6	0x00040000
+#define AVCS_CMDRSP_Q6_ID_2_7	0x00040001
+#define AVCS_CMDRSP_Q6_ID_2_8	0x00040002
 #define AVCS_CMD_GET_FWK_VERSION	0x001292c
 #define AVCS_CMDRSP_GET_FWK_VERSION	0x001292d
 
@@ -63,6 +66,7 @@ struct q6core {
 	bool get_state_supported;
 	bool get_version_supported;
 	bool is_version_requested;
+	enum q6core_version adsp_version;
 };
 
 static struct q6core *g_core;
@@ -108,6 +112,14 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 		if (!core->fwk_version)
 			return -ENOMEM;
 
+		/*
+		 * Since GET_VERSIONS is not called when GET_FWK_VERSION
+		 * is successful and these commands may return completely
+		 * different versions, assume that the version is 2.8 here.
+		 * Older versions do not support GET_FWK_VERSION and we do
+		 * not care if the version is newer than 2.8.
+		 */
+		core->adsp_version = Q6_ADSP_VERSION_2_8;
 		core->fwk_version_supported = true;
 		core->resp_received = true;
 
@@ -115,6 +127,7 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 	}
 	case AVCS_GET_VERSIONS_RSP: {
 		struct avcs_cmdrsp_get_version *v;
+		int i;
 
 		v = data->payload;
 
@@ -125,6 +138,28 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 		if (!core->svc_version)
 			return -ENOMEM;
 
+		for (i = 0; i < g_core->svc_version->num_services; i++) {
+			struct avcs_svc_info *info;
+
+			info = &g_core->svc_version->svc_api_info[i];
+			if (info->service_id != APR_SVC_ADSP_CORE)
+				continue;
+
+			switch (info->version) {
+			case AVCS_CMDRSP_Q6_ID_2_6:
+				core->adsp_version = Q6_ADSP_VERSION_2_6;
+				break;
+			case AVCS_CMDRSP_Q6_ID_2_7:
+				core->adsp_version = Q6_ADSP_VERSION_2_7;
+				break;
+			case AVCS_CMDRSP_Q6_ID_2_8:
+				core->adsp_version = Q6_ADSP_VERSION_2_8;
+				break;
+			}
+
+			break;
+		}
+
 		core->get_version_supported = true;
 		core->resp_received = true;
 
@@ -293,6 +328,31 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
 }
 EXPORT_SYMBOL_GPL(q6core_get_svc_api_info);
 
+/**
+ * q6core_get_adsp_version() - Get the core version number.
+ *
+ * Return: version code or Q6_ADSP_VERSION_UNKNOWN on failure
+ */
+enum q6core_version q6core_get_adsp_version(void)
+{
+	int ret;
+
+	if (!g_core)
+		return Q6_ADSP_VERSION_UNKNOWN;
+
+	mutex_lock(&g_core->lock);
+	if (!g_core->is_version_requested) {
+		if (q6core_get_fwk_versions(g_core) == -ENOTSUPP)
+			q6core_get_svc_versions(g_core);
+		g_core->is_version_requested = true;
+	}
+	ret = g_core->adsp_version;
+	mutex_unlock(&g_core->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(q6core_get_adsp_version);
+
 /**
  * q6core_is_adsp_ready() - Get status of adsp
  *
@@ -334,6 +394,7 @@ static int q6core_probe(struct apr_device *adev)
 	dev_set_drvdata(&adev->dev, g_core);
 
 	mutex_init(&g_core->lock);
+	g_core->adsp_version = Q6_ADSP_VERSION_UNKNOWN;
 	g_core->adev = adev;
 	init_waitqueue_head(&g_core->wait);
 	return 0;
diff --git a/sound/soc/qcom/qdsp6/q6core.h b/sound/soc/qcom/qdsp6/q6core.h
index 4105b1d730be..472e06bf8efc 100644
--- a/sound/soc/qcom/qdsp6/q6core.h
+++ b/sound/soc/qcom/qdsp6/q6core.h
@@ -9,7 +9,16 @@ struct q6core_svc_api_info {
 	uint32_t api_branch_version;
 };
 
+/* Versions must be in order! */
+enum q6core_version {
+	Q6_ADSP_VERSION_UNKNOWN,
+	Q6_ADSP_VERSION_2_6,
+	Q6_ADSP_VERSION_2_7,
+	Q6_ADSP_VERSION_2_8,
+};
+
 bool q6core_is_adsp_ready(void);
+enum q6core_version q6core_get_adsp_version(void);
 int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo);
 
 #endif /* __Q6CORE_H__ */
-- 
2.39.2
