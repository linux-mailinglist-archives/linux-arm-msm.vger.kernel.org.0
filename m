Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369A3658E40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 16:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbiL2PSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 10:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiL2PSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 10:18:08 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E095643C;
        Thu, 29 Dec 2022 07:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672327077;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=o9yw6kwnyVHqftafsTZRSK4tSSkPBL8db2BOCD1EwNk=;
    b=F+eYRHNUH3aMOrCmUY+iyyqyw39IdWu3vV7TBGa1gKcA8oju/dl4M/JQe/+WCDO2vF
    tQbOoK3dpIu8Jc+fuvrOoujcRCyKFZwjAYGgb38phMO20rIYTx0ybF7F46A9Ot1rvTN9
    9D4RLvkXonYr8UsLxN/9tmhFoCxbb03NBXT2EDzBWasSeqgoJ7fP4BakGJRb5yeomxYl
    v1DW9CNRQSDsAf1qFK0P0dfxdzRwrTtn9hUejHgW6hP39fDHuEKh6DV9CiuFOqHkqTWZ
    nAe7PKuu8MY/Yo7PMLNEUsBP6KcfVSuSforI1Koh7syclJHmSiu8iK0Ij6M5U4FbE+Xw
    vhRQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo02
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349yBTFHuXT4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 29 Dec 2022 16:17:56 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] soc: qcom: apr: Make qcom,protection-domain optional again
Date:   Thu, 29 Dec 2022 16:16:48 +0100
Message-Id: <20221229151648.19839-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229151648.19839-1-stephan@gerhold.net>
References: <20221229151648.19839-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

APR should not fail if the service device tree node does not have
the qcom,protection-domain property, since this functionality does
not exist on older platforms such as MSM8916 and MSM8996.

Ignore -EINVAL (returned when the property does not exist) to fix
a regression on 6.2-rc1 that prevents audio from working:

  qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
    Failed to read second value of qcom,protection-domain
  qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
    Failed to add apr 3 svc

Fixes: 6d7860f5750d ("soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/apr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index cd44f17dad3d..d51abb462ae5 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -461,9 +461,10 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 		goto out;
 	}
 
+	/* Protection domain is optional, it does not exist on older platforms */
 	ret = of_property_read_string_index(np, "qcom,protection-domain",
 					    1, &adev->service_path);
-	if (ret < 0) {
+	if (ret < 0 && ret != -EINVAL) {
 		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
 		goto out;
 	}
-- 
2.39.0

