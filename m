Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA876FBEE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 07:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbjEIFuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 01:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjEIFux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 01:50:53 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507A99028
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 22:50:52 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-52cbd7e73d2so3047182a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 22:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683611452; x=1686203452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOxvOPHTRilyOmLohM9swFUYHYoS09dGPpcRJnsGSWU=;
        b=t6ApgQ/F7HvkVQL89vfe2rdqcHFhb1NwKfBKD7o4ppUVe+Qg0zQ73Te321bDYDY8iX
         5g0CFvv0r92cnQ/vHF+NlR/ThcUK+B/4bdvUaaDm+0Y+H0SJLTmCgIZmCR/iw1mFNmXE
         R4edOBnq/iaZABkuU5oepOrICQvrCMtWZ/iABzHfGwtXNBOvP8fEA3sRtPgd5c3RRGWM
         6vlAPmafDY0tM9eEote65wu6WQ17xJ11r1do93qSDS9+ZNXHjEU4vCfbZn6cLZrYYS/o
         XB4swlYNVBmdZ/4vuo+bLq5GlX5vQYu/B3HnnR6syW2KQysLNQjzMwDBuO1pMPjsKC0Z
         gE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683611452; x=1686203452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOxvOPHTRilyOmLohM9swFUYHYoS09dGPpcRJnsGSWU=;
        b=OYMO4m8Nx155Ng9tSvAF28r6Th8dC6y4q9uOw2M6Y0RsvqX+7CN6oM11xDiMeuV89H
         sIfRswrcgj2G1yUDP/dSudarY1+PALP+3xMRD7NpdqCRYXiabS82vCxYex9Nbx/bLaYJ
         /u0cis57zooAQZnf3I6CE1qu314eatHnA78LEga3t6Bs+cKs+KFSWh6HZHWvcPmkWIba
         Yqxcodk8E337j4+bcR4IVqlnBWWAS0x4HFYwmFjCCa2DJRe3nsTiN47/YPlG2Ohco+bZ
         oHNZ84IT+kklKArL13fas/XJ7/U9KiWci5FO5riP7e8aLoUymNU60YUJnpklRp+Ibfnp
         pH9Q==
X-Gm-Message-State: AC+VfDydQitYxzl7NIIlLwaptM4a4fEnxqAMJJBWM/yhVsixap2fz9Y/
        j8JoWujsaRJVsH54dC7akqNe
X-Google-Smtp-Source: ACHHUZ7sh9t6z0347Cym3km5R6SVH/r+Go7Ckx/CKViYyIgoDbGRY2pAY4lbQJgCW/QCr88TMVTu/Q==
X-Received: by 2002:a17:902:d50d:b0:1ac:5382:6e24 with SMTP id b13-20020a170902d50d00b001ac53826e24mr11881045plg.10.1683611451718;
        Mon, 08 May 2023 22:50:51 -0700 (PDT)
Received: from thinkpad ([59.92.97.45])
        by smtp.gmail.com with ESMTPSA id i12-20020a17090332cc00b001ac5896e96esm523686plr.207.2023.05.08.22.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 22:50:50 -0700 (PDT)
Date:   Tue, 9 May 2023 11:20:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
Message-ID: <20230509055044.GA4823@thinkpad>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 07, 2023 at 08:53:35PM +0300, Dmitry Baryshkov wrote:
> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
> flags to PWRSTS_OFF_ON.
> 

What does "stop working" implies? Does it work during boot and randomly stopped
working or it stopped working after resume from suspend?

Even though reverting to non-retention mode works, I think the issue might be
somewhere else. Like the vote might be missing to get the GDSC out of retention
mode.

- Mani

> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index aa29c79fcd55..277ef0065aae 100644
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
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
