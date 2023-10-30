Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F99A7DB775
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 11:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjJ3KJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 06:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbjJ3KJl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 06:09:41 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5B88A65
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:09:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507b96095abso6104099e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698660577; x=1699265377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0y2DFM2LPG1teWJjvY3TK3xeJgx1vKnV7mxdqKxnohk=;
        b=tKCc/efLj+7bgIAOLvIdZsm10f5eLlM2T3AoIXuoiPK7FbY8avl1C7jOmpMfvcn2Kn
         a9bO0xXoyiWATd6rAsgXE5cl/G6Ui+mY2dKz2GmFryk3t9dqBJlbhjIDYSyjviCYOytV
         C181xeyqgmkarGPkKL+gX21rNL9uBUqZrVm3unI1wDL350aMlxjSt9nsDT8A9zfdI6He
         LpKQUOrdoFyJSn4nOO2dSlEmDuhMdcFiCyphIOgDMct9Gqim3aT9CYsni+OaDUkq16kE
         e08m1eRLIKrdUlO8QRL39kw7DlZmmYRcASKgJp7a+6DAullfXAp6GJ0jRG/rC0/U/Atv
         mO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698660577; x=1699265377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y2DFM2LPG1teWJjvY3TK3xeJgx1vKnV7mxdqKxnohk=;
        b=wzIjNUSWNgZyas4lA5nIZ+8lkU68uBhopnMrioVzAjJZRYc/J1kYTnWdkaFIajkgt0
         4BHEVTc+UCcIOa9fyZCqPVaYrSOfsfMPg0lxIIPTwpE8tr6dvRZL386P/yKEVsG0k6yj
         FgbYJ0pt5KH0S9AST71Qu4dw6xwyiVBi6+ZyDELodNb06ypJ1zYc3r9B+WEboGLRI299
         KWyGRJt+99NsBipPz5KOURxo5YP0+f3VKzvc8M9CWJgZCpWdYkWI7C7OJA6eqFqJmrbL
         dXcsGGy6sNtkxNUISQoWovUsll25XUBIG3WiK1pCqgbsxvJS4gLxVYIPDNt6/Rg0e3P9
         57Bg==
X-Gm-Message-State: AOJu0Yy+i1IzFLbFf6B23wgB6GWgJ12VQ0f0ZLJ8GBqgXD8sU+8TYBhD
        9uR2QZIOGkCHi1HBL0MiTyLeBeEgTHDK+wVSpFBabg==
X-Google-Smtp-Source: AGHT+IHNBxn3cXELrnJX/E2SxZW5Wl5MWkraZKMmV4K8N0LwWPmPM9LYKjpQUbaZXuJpAe61yveeQg==
X-Received: by 2002:a05:600c:468e:b0:3fe:e7b2:c97f with SMTP id p14-20020a05600c468e00b003fee7b2c97fmr7183406wmo.36.1698660218664;
        Mon, 30 Oct 2023 03:03:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b0040472ad9a3dsm8776700wmq.14.2023.10.30.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 03:03:38 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 11:03:15 +0100
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add SM8650 remoteproc
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-remoteproc-v2-3-609ee572e0a2@linaro.org>
References: <20231030-topic-sm8650-upstream-remoteproc-v2-0-609ee572e0a2@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-remoteproc-v2-0-609ee572e0a2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TkT4wt2310yY48l8xXkR00+vzE+Z0XLgSG9XiuLyvd8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP3926H6Bkp0+nf/AY+ehqBs9OFnmvuUcSNhbC5Wg
 DgZCfHWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT9/dgAKCRB33NvayMhJ0e6gD/
 oC7S01eR3M+XOzwocTiaklsW1VDVZEGPr2KQSk0btLyxh555v3hDGDWiLpmosZgQSCgxWul4PWhn/X
 oEbMpV44ndrQgaZbtYZNXwvF6JaINpDTxyI/U8Ftm+Re+mFTXfpw46KZOzJXH1eTT4zC4DpL5Q9OjZ
 Otmu1QTSxJHG9BvbbrmkCiVQ00r5bXlSs4W1euAAQjvK1RrMFpo/Fa7sKRaBzV8XFsuFp1UnAyIXKM
 m3s0dsWbMy/IbzVaKigmH2ayWFZ6RJdtQtFycfpRWFqkDRdg0j2Q5bHXv937HQHjdOk1RTtm9MvWTz
 1YmVipyvX5LqhjtNlPi33FgBhQ4cCNLUe6wAsYbEcYmxEBKgmG7+ydNQeD5OsIY5qPtOz49U+zDO9w
 tfdPrKfKJikQCG5dw5GlsHfxsSL8ACjSJ7G4slKp4QT6BNh4ynfYZa9V2BVUVGVp9nPnZst3zf1TW9
 35gnkAZa0151zHyZst1bRsTst06ulB/qtv9TCmM7hyxmFLofbcexIne5EBMkhPW25/KtNVqGCrA+X0
 m3iE7OajbR77RIZmhgmevkL6VnaUaLDLn5vHBE12DH+jo5jTfuCp2IiaxqGdigXVd04ajOxvw/GMMp
 2ceqFRqepwQX1xAe2/rrV2/QFLdP7DEvsIXmh3JAmD2+m9u3at/5ig7mXqow==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DSP Peripheral Authentication Service support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4829fd26e17d..c593e6d529b3 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1195,6 +1195,53 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct adsp_data sm8650_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
+static const struct adsp_data sm8650_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.region_assign_idx = 2,
+	.region_assign_count = 2,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1247,6 +1294,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
 	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
+	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
+	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.34.1

