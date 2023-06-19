Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CEF734D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 10:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjFSI0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 04:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbjFSIYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 04:24:51 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200F9E60
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:24:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f8f3786f20so38098275e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687163085; x=1689755085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjnRSHazNP8DobZeaiT8Ue6LLZ8Gvl8GEQVM9lAqiGU=;
        b=MxuFNIujsOhZovl2Eonyic2jOI5llgiuTImhx8d3YwADFtJPOlxkOy+dwMDysOVksd
         6JwelaRxBoyMc8YBrVxNO5I8qG/xR5WDIcJenYgOF88JcsHlsGx0tP/8bSk24/4cHpVe
         76hTTgu60djIOgma3mdrMs/Vls1PFG836jKk8B/7AetMc4bm504RtfRSFaAVZ9OWZbVB
         +NLKUgf5eMlyKXx0BnMn+dx9i55veL08v/LgBkp5kxEaSvHRwnh1YInjEVwutF++5zQu
         Yyw/aaLqlM8pABu5oMVrz5aKep74pQGw4r+xv8JHSRQkcXq2kUaQJJtoj+iOBXG5OYog
         F3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163085; x=1689755085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjnRSHazNP8DobZeaiT8Ue6LLZ8Gvl8GEQVM9lAqiGU=;
        b=KvpwGT4r688GdooYxV5cjZqqg/nPXrszCqgW/FJBS0vWCXQ8Ku+TRLphUswSxVRNjB
         nqPA5SKWdG/WeC1tK38gh04O2Yt6S6BpDTO6bzHUSmNPk515TAQPzOQ+LPuo+f2ys8jd
         o5mC45ojtghvH8MB0chBl5+zQdQSI2Nh/yS8jV9/tX7DJtwmmUPCOHXbjFSkQWoYK1n8
         mVBWhIdRhDTtzq8Y8CL/kNB4jOQWjp0slGHmWRT8uGphclkl6rwEq7TzHZ5g+sGYnCYC
         6etpRJijhx00/bvSiKsi6Qml8wQ5xHeg6i0PjBtwe9BMyvetGE0Z8dVb4+6Osv3+MGLt
         gV2A==
X-Gm-Message-State: AC+VfDy3mPKj2g19LNP5W0D746Zj2fAQ9KZZM90s2NP8ZPOf/01TGd2t
        qRpN+UmrujR0LmEesCUEmruH9Q==
X-Google-Smtp-Source: ACHHUZ6AWUE7nvHDqozqzOVMDX6oF+d4bGgNfRxtK2PwgKS22LD54bXJdtjjOh7NfYRr7zPEPoWVjg==
X-Received: by 2002:a7b:c051:0:b0:3f6:1474:905 with SMTP id u17-20020a7bc051000000b003f614740905mr9049573wmc.29.1687163085515;
        Mon, 19 Jun 2023 01:24:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i1-20020adff301000000b002f28de9f73bsm30781262wro.55.2023.06.19.01.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:24:45 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 19 Jun 2023 10:24:40 +0200
Subject: [PATCH 1/2] interconnect: qcom: rpmh: add optional mask to send as
 vote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230619-topic-sm8550-upstream-interconnect-mask-vote-v1-1-66663c0aa592@linaro.org>
References: <20230619-topic-sm8550-upstream-interconnect-mask-vote-v1-0-66663c0aa592@linaro.org>
In-Reply-To: <20230619-topic-sm8550-upstream-interconnect-mask-vote-v1-0-66663c0aa592@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=McG7Xaz+SPLEJvALMH62I+CFHxe1OtZw2rdfvt/tQBU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkkBDLWGDVf57U6dMfdw3e1jzxd2L8NGj4tDo2w8jD
 2t3KZIuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJAQywAKCRB33NvayMhJ0fvuD/
 95QTjrK8eRawsCgiIAQC/XJH21bKJ/jQnSwXRUVmfNWs/O2u0uTB51sIq/2814U6usVvR384CDhbvx
 +QLrK+MDmi7IKHx+Zh9ID4X1TnuQjYTBmc48g28XJ9iwSy6OJ0K+QvqSKguYfqwV2SLZG3UnRHj8B+
 yjCFbk2rNZX+fyt/M3wTfOdEgwbVywAhJewbrPW1HY7mL7BqEcbjSLAm1Pjq7pixgk+PJLuImFt+Gr
 2zBIkOQk8q1kMKktWFkGU9/uWIEOo50/GI9z3j6UL+sIXJjyBlnAfK0fDMJBfo7whIgHC2RN0ZZX8l
 DvWvrHOW9xlGSLN1aY8enFH/HOHHNFoHsJ6sj4vKefPNyHJstAI0u1lEVn9qB1SMg6St4/IgdVApaW
 89QaXki9M+9w30kT1WUKge6OvNPv77h1xa4XvONDRqL6etcJaqGuj8lywWsnFZ4BpFs17jbB2Qbc9h
 njZpoLKb0LdK0Z00yGI/853NQoFgk+NscShXJAXpe0elLUj/TfHQ/gpFGMLlZMH77SAAfHqGpPP6La
 H48xmeUrQOXBE/W5TyJdr/oHGAkO0GnsH8X/K2oDEggS6Wq32uuLeQzrkuR0CobR20G/BAQveI0sy+
 Uwl7klLE9T8dcUhiVxWZVQQ+IW79sTagPUDxtPpmk+H0VrAu3XMJkv8KFk4Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the SM8550 SoC, some nodes requires a specific bit mark
instead of a bandwidth when voting.

Add an enable_mask variable to be used to vote when a node
is enabled in an aggregate loop.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/interconnect/qcom/bcm-voter.c | 5 +++++
 drivers/interconnect/qcom/icc-rpmh.h  | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 8f385f9c2dd3..d5f2a6b5376b 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -83,6 +83,11 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 
 		temp = agg_peak[bucket] * bcm->vote_scale;
 		bcm->vote_y[bucket] = bcm_div(temp, bcm->aux_data.unit);
+
+		if (bcm->enable_mask && (bcm->vote_x[bucket] || bcm->vote_y[bucket])) {
+			bcm->vote_x[bucket] = 0;
+			bcm->vote_y[bucket] = bcm->enable_mask;
+		}
 	}
 
 	if (bcm->keepalive && bcm->vote_x[QCOM_ICC_BUCKET_AMC] == 0 &&
diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
index 04391c1ba465..7843d8864d6b 100644
--- a/drivers/interconnect/qcom/icc-rpmh.h
+++ b/drivers/interconnect/qcom/icc-rpmh.h
@@ -81,6 +81,7 @@ struct qcom_icc_node {
  * @vote_x: aggregated threshold values, represents sum_bw when @type is bw bcm
  * @vote_y: aggregated threshold values, represents peak_bw when @type is bw bcm
  * @vote_scale: scaling factor for vote_x and vote_y
+ * @enable_mask: optional mask to send as vote instead of vote_x/vote_y
  * @dirty: flag used to indicate whether the bcm needs to be committed
  * @keepalive: flag used to indicate whether a keepalive is required
  * @aux_data: auxiliary data used when calculating threshold values and
@@ -97,6 +98,7 @@ struct qcom_icc_bcm {
 	u64 vote_x[QCOM_ICC_NUM_BUCKETS];
 	u64 vote_y[QCOM_ICC_NUM_BUCKETS];
 	u64 vote_scale;
+	u32 enable_mask;
 	bool dirty;
 	bool keepalive;
 	struct bcm_db aux_data;

-- 
2.34.1

