Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEA614B4434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbiBNIeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:34:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbiBNIeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:34:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E705025C73
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:34:14 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id y9so13856346pjf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GLW5bsWsrIBvpX0WGgai6szvgx/ZSdBHtQT0kyAyIRU=;
        b=etZncaCvfxbGWc4/iSkYoXJF2QE4jd+jKxHUN34NPLOzw5qlbh/9khCQ7HCr36ZTEy
         b9SVXe/RltW7FmwVofvw7QLfHsKTOqGBvgGs+Y2Wkm90BrG00elFj0pQPqYkRnuPZdFm
         r2wq9UE9EKK0c1KWAC8TDungsQQQ837I95KG4JUnELChsjzQpB1opBLixaXOTShAFeEe
         toeNTDQzVC9Y8Gk4nroFIC9x6rNs6/k3Fw6olWqOSkIYgseHZPKMtff0dyBmIZqFO/su
         FbKhKGYFPmtOhHsbNt9OM+vLRFJ2VEbopYCe+yzGMIv0bfftim6uUNKG1U3UHorMOcSu
         Bt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GLW5bsWsrIBvpX0WGgai6szvgx/ZSdBHtQT0kyAyIRU=;
        b=SjzMgHCcLWqxON3Y7Js0PJ+jDFAhIBZyouIsFwxTCRfzZ3DKyVEr0EI7858hnUyEyG
         3vovCrT5ZRuBzuVaTPcFDrBswiCMTaGvTxB/5qMk9n7fPPvZCUIFtxgsCLN0mInj8VT4
         wPEF3HYg5gOqGNujx82RskD2OW5qQvJTUaBkgygTam2lkzX2dlGxDed+Mzl6ZCTSOqRL
         Syt8hWdQClo/bR/bjpWNmLzOZInhSeLfcEoCwUtYaXadY1RayyO7fCPZtHslA/gvhSIb
         0VHl4ZCx91I+OB3qeQjj3pcuB0HEzfACiDnyNRA4Ev8zVNvo9BeSixbS1Hev+YE44k3q
         6X+w==
X-Gm-Message-State: AOAM5301DCA5mbtWWjiI6Q42xuwzWhWvPSNYsJFFrCFn7Z4a6pwnz7Pz
        LsGjsxNFjkg69eufe3o5i/2H
X-Google-Smtp-Source: ABdhPJyClIhDUdpdDpO0O7aG5Wc87wwYfZRID1RKlTBPYrT/eMJBqwqz1JC6LyjPMptxeUrtMdqq6w==
X-Received: by 2002:a17:90b:4f48:: with SMTP id pj8mr6321465pjb.159.1644827654382;
        Mon, 14 Feb 2022 00:34:14 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id 13sm13614324pje.50.2022.02.14.00.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:34:14 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:04:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] mailbox: qcom: Add support for SDX65 APCS IPC
Message-ID: <20220214083409.GB3494@thinkpad>
References: <1644821755-27059-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644821755-27059-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 14, 2022 at 12:25:55PM +0530, Rohit Agarwal wrote:
> In SDX65, the IPC bits are located in the APCS GCC block. Also, this block
> can provide clock functionality. Hence, add support for IPC with correct
> offset and name of the clock provider.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 9325d2a..3f8612c 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -53,6 +53,10 @@ static const struct qcom_apcs_ipc_data sdx55_apcs_data = {
>  	.offset = 0x1008, .clk_name = "qcom-sdx55-acps-clk"
>  };
>  
> +static const struct qcom_apcs_ipc_data sdx65_apcs_data = {
> +	.offset = 0x1008, .clk_name = "qcom-sdx65-acps-clk"
> +};
> +
>  static const struct regmap_config apcs_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
> @@ -159,6 +163,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
>  	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> +	{ .compatible = "qcom,sdx65-apcs-gcc", .data = &sdx65_apcs_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
> -- 
> 2.7.4
> 
