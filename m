Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B6B6FB877
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 22:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjEHUsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 16:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjEHUsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 16:48:30 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7799558B;
        Mon,  8 May 2023 13:48:29 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 54251C6FC8;
        Mon,  8 May 2023 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1683578878; bh=eL8C+MHKsd/HYelky6jxok9NEsmBztDAwCSfki3LBy0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=uekS+g+nG3HG9j2PLdabIcfXfZ4LGTry4GClzI6dokH6O01ebdzvcTcoRyVzP1dJP
         VbiJ4caM88k/8fXofdwlYqZ93tguaDyKaoK//1vPlmGbTOLSvFxyqVURVUgr9qNeo9
         ErCpNtaJclpsq03iVkNo90MzEGAZo69C1wndBx+Q=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Date:   Mon, 08 May 2023 22:47:57 +0200
Message-ID: <6529911.lOV4Wx5bFT@z3ntu.xyz>
In-Reply-To: <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sonntag, 7. Mai 2023 19:53:35 CEST Dmitry Baryshkov wrote:
> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
> flags to PWRSTS_OFF_ON.

+CC Rajendra & Manivannan

Following the mails at [0] this was the suggested fix, which I haven't
made into a patch myself yet.

With this (and without the revert of the linked patch) panel init is fine
again on FP2. Thanks!

[0] https://lore.kernel.org/linux-arm-msm/5897497.lOV4Wx5bFT@g550jk/

Tested-by: Luca Weiss <luca@z3ntu.xyz>

> 
> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET
> support") Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c
> b/drivers/clk/qcom/mmcc-msm8974.c index aa29c79fcd55..277ef0065aae 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>  	.pd = {
>  		.name = "mdss",
>  	},
> -	.pwrsts = PWRSTS_RET_ON,
> +	.pwrsts = PWRSTS_OFF_ON,
>  };
> 
>  static struct gdsc camss_jpeg_gdsc = {




