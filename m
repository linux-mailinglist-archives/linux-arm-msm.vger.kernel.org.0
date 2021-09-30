Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507AB41D9B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 14:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349928AbhI3MYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 08:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349808AbhI3MYm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 08:24:42 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9B3C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 05:22:59 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so24491244lfd.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UjJvdphNoww1UQC7tKg+Ad3Su/zXKxP5zUPapu5vK68=;
        b=eILJWnBJzwlcMWIDqw5C/dW+1sebRPzKo5zpompiXrwowfEecgJA8hVmrBUomsaz+T
         thCgZmKGpV86dcTaRxC02nQo9YclQ6g1g9M2MOS7BcykyouGykQ7t1LTU7NjYmTmu8or
         CpWx8vGn+c1Kz8eC+XPOtOGG+C7PakRf72U+umkjGja85Vk+LzlwRCchanNuS2d+GML3
         LamKNUTpJmhigVOkeVz6W7QPppyWiAZkG3WhUfI61dumKE3c3kcw25yLIxM5MCQdlb9y
         vFx9dOW4Tw7rz+k/WMjgPc+taNYzorfdAg2NeY252rzEjGQhvGWSTUu72hjIPDPmMPCm
         7OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UjJvdphNoww1UQC7tKg+Ad3Su/zXKxP5zUPapu5vK68=;
        b=22x9mp3UpR6/1z8JmhCOnVjJa4HTftZMDPfb1SeO0Fi5n4Z+YpDDa/JqMX9Yoqssm0
         T6iG9DmE+XkwfORdy28qT//2O4fgHIGAaMkwLkGc9f27+qdzPKw/8DYekUZHErgTPcQ4
         X3Q/aIDabKNvoNgmC3SVSZIDJbbqZAiQz1hXl1UFM9zoBRV2oal3AIzwV3a34VZiv550
         siDdQz/ffUV0Zb513SqDJWlt1AY/M0uVk9YJjmqQ5cUSvq2fxkeEmq/ZMZiRHIknioZV
         1BBn/+mwqNIi5eeAoJwoIWYsnrZoqFAiQJfWBdsRpO2kkOMIkzFYTXgwinJdSNB/mHS0
         OACg==
X-Gm-Message-State: AOAM530PGKkUYbGX8TFK88i2T5cOf0zHmiOpV2hywtbR8qoxgbijYJIT
        FrvlUqYJ/RrsvO/VaSq4HP6GUtcW55y4tw==
X-Google-Smtp-Source: ABdhPJx4TQyhAUiMeCUBekDoEbTX/3PW20niivSARnP/iSN5VxaxugLdn5/liPkrSsHhFmc6So774Q==
X-Received: by 2002:a05:6512:169c:: with SMTP id bu28mr5566933lfb.41.1633004576863;
        Thu, 30 Sep 2021 05:22:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-130-172.elisa-laajakaista.fi. [88.112.130.172])
        by smtp.gmail.com with ESMTPSA id m29sm353866lfo.191.2021.09.30.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:22:56 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] interconnect: qcom: Fix endianness in an intermediate storage
Date:   Thu, 30 Sep 2021 15:22:54 +0300
Message-Id: <20210930122254.8899-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A minor issue is reported by sparse:

bcm-voter.c:72:77: warning: restricted __le16 degrades to integer
bcm-voter.c:76:78: warning: restricted __le16 degrades to integer
bcm-voter.c:82:66: warning: incorrect type in argument 2 (different base types)
bcm-voter.c:82:66:    expected unsigned int [usertype] base
bcm-voter.c:82:66:    got restricted __le32 [usertype] unit
bcm-voter.c:85:66: warning: incorrect type in argument 2 (different base types)
bcm-voter.c:85:66:    expected unsigned int [usertype] base
bcm-voter.c:85:66:    got restricted __le32 [usertype] unit

icc-rpmh.c:165:28: warning: incorrect type in assignment (different base types)
icc-rpmh.c:165:28:    expected restricted __le32 [usertype] unit
icc-rpmh.c:165:28:    got unsigned int [usertype]
icc-rpmh.c:166:29: warning: incorrect type in assignment (different base types)
icc-rpmh.c:166:29:    expected restricted __le16 [usertype] width
icc-rpmh.c:166:29:    got unsigned short [usertype]

The change is intended to be non-functional, only the stored data of
'struct bcm_db' is changed and build time warnings from above are gone.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/interconnect/qcom/bcm-voter.c | 8 ++++----
 drivers/interconnect/qcom/icc-rpmh.c  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 8f385f9c2dd3..976938a84bd1 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -69,20 +69,20 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 	for (bucket = 0; bucket < QCOM_ICC_NUM_BUCKETS; bucket++) {
 		for (i = 0; i < bcm->num_nodes; i++) {
 			node = bcm->nodes[i];
-			temp = bcm_div(node->sum_avg[bucket] * bcm->aux_data.width,
+			temp = bcm_div(node->sum_avg[bucket] * le16_to_cpu(bcm->aux_data.width),
 				       node->buswidth * node->channels);
 			agg_avg[bucket] = max(agg_avg[bucket], temp);
 
-			temp = bcm_div(node->max_peak[bucket] * bcm->aux_data.width,
+			temp = bcm_div(node->max_peak[bucket] * le16_to_cpu(bcm->aux_data.width),
 				       node->buswidth);
 			agg_peak[bucket] = max(agg_peak[bucket], temp);
 		}
 
 		temp = agg_avg[bucket] * bcm->vote_scale;
-		bcm->vote_x[bucket] = bcm_div(temp, bcm->aux_data.unit);
+		bcm->vote_x[bucket] = bcm_div(temp, le32_to_cpu(bcm->aux_data.unit));
 
 		temp = agg_peak[bucket] * bcm->vote_scale;
-		bcm->vote_y[bucket] = bcm_div(temp, bcm->aux_data.unit);
+		bcm->vote_y[bucket] = bcm_div(temp, le32_to_cpu(bcm->aux_data.unit));
 	}
 
 	if (bcm->keepalive && bcm->vote_x[QCOM_ICC_BUCKET_AMC] == 0 &&
diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3eb7936d2cf6..e8533027ce38 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -162,8 +162,8 @@ int qcom_icc_bcm_init(struct qcom_icc_bcm *bcm, struct device *dev)
 		return -EINVAL;
 	}
 
-	bcm->aux_data.unit = le32_to_cpu(data->unit);
-	bcm->aux_data.width = le16_to_cpu(data->width);
+	bcm->aux_data.unit = data->unit;
+	bcm->aux_data.width = data->width;
 	bcm->aux_data.vcd = data->vcd;
 	bcm->aux_data.reserved = data->reserved;
 	INIT_LIST_HEAD(&bcm->list);
-- 
2.33.0

