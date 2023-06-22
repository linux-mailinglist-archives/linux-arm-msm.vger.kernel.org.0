Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDDF73A043
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 13:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjFVL63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 07:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjFVL6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 07:58:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C986319AF
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 04:57:56 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b466744368so83928691fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 04:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435075; x=1690027075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU/QNfxVjYbWI2/agoiWsfl5ruwbIjST09FyM+SFUY8=;
        b=MZqIss5vdkr3pmHI1Er1dLMAr5Ff3KzM02vZoyn+nZrjnUMDy3s+CGl1BpIIYJyzxr
         Wbfv5nTfSeccmipVeh31WiKD+U0rqCUHj0GHs/2jGDMnKR09BPHs9/kIW+kNkw4gm2F7
         iKgVri9DcPoEn0pM3yY0U/rcEpsAYvh0VxKREUDOf5sXBFjrNjpk9lNW0k7H5WLmBh27
         f+kL/mg26deC+cCddPjd2GYOF0igNBUURQ8IeH5qZ0OcwaRP8gneOpOdZkAl3LstOWcY
         pvUvPeG76K1zvyd4H6Nn478XaMn58QYAhfYa+xMoSi5uCuT/EntQNOVnmDQsZlxltJQ0
         OMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435075; x=1690027075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU/QNfxVjYbWI2/agoiWsfl5ruwbIjST09FyM+SFUY8=;
        b=i5Qn7iiDQrIP1TTIc1Mp3ptDmH2VGkAFcwIm5+5wH5ckDiS/mvp2OqrO2pXhjpTDQm
         XRhfNdEGsSLGNhMp5hAMcYYOwtQNVbcBLiLeR7Me/CfDJT0gghIW81y8npgZCmavfKx6
         Cfl90QjI0iaBEGGF1ZnxyB5jvn4uGyraHJh9M1CkOUZjqycfohIaNyhGfSvlW5yXOdCq
         bY2nMqUt/EH+BD86tjpM7d+NrHWvwne2xZrFTdPRLBhlmWyV/ZbqocckqeSfCZWIxqsy
         E1n389Yl5lbuFAq1Zbrz98gjeCJCLThKc7xU7JNMkEAVA+GB2E9+yyVXO0J+i5gKS2Es
         jwPw==
X-Gm-Message-State: AC+VfDx5xlr9VIiggWxARx5H0XrfkrAwZJnRuvT6ZOLbV2JF5lW1iWb/
        Sd+5R7aul68mpy5CfjgqEBia3A==
X-Google-Smtp-Source: ACHHUZ6Adw6Piu+YSQXCRXHA+AKXGMtaOeNIPDgvY1YQYsqEV2s27GV49JUasNzcTcs7On2APyDiSA==
X-Received: by 2002:a05:6512:54a:b0:4f4:cacb:4b4b with SMTP id h10-20020a056512054a00b004f4cacb4b4bmr11234730lfl.18.1687435075017;
        Thu, 22 Jun 2023 04:57:55 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 22 Jun 2023 13:57:45 +0200
Subject: [PATCH 5/9] clk: qcom: gpucc-msm8998: Use the correct GPLL0 leg
 with old DTs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v1-5-5b7a0d6e98b1@linaro.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=831;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=i8Lw042X9XBNaAM5OkUSQrnlDPICd5ZeS5J2C6fGlZY=;
 b=me7knvddhaTPeU8nQVjnZIZmIFOw4YVK/zy9Jno9N9rZoEuEB2x5vTP8eDxWxY3fRQaGj/mek
 38sJXMWE1YHDajluayrbOh+rK4B3QARql0uWfUQ/+iR8n7Y4XG5Inpw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GPUCC has its own GPLL0 legs - one for 1-1 and one for div-2 output.
Add .name lookup to make sure older DTs consume the correct clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index f929e0f2333f..cc0b43354787 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -98,7 +98,7 @@ static const struct parent_map gpu_xo_gpll0_map[] = {
 
 static const struct clk_parent_data gpu_xo_gpll0[] = {
 	{ .hw = &gpucc_cxo_clk.clkr.hw },
-	{ .fw_name = "gpll0" },
+	{ .fw_name = "gpll0", .name = "gcc_gpu_gpll0_clk" },
 };
 
 static const struct parent_map gpu_xo_gpupll0_map[] = {

-- 
2.41.0

