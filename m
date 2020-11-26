Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE642C52EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 12:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgKZL2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 06:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388558AbgKZL23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 06:28:29 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB67CC061A04
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 03:28:27 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c66so1398520pfa.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 03:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gV52KlcmQLvJ8tMXJvAByGqnsCZ1lIaAcBWSdloAI+g=;
        b=aBtQ4s9hpXlFm1/68Q5uXRMP9klfP1DyICqgRlVQJYFfILDbDUOyllyPcW6wxa7V34
         CinBicpHsCEkkm2zvV0zeu2j5Y0Atg9lVbyG9ufToNHccjXJ2ASncfevHxS8qmouMl9r
         P6Bm+5UOb+yVo02jxnlLVQT8gx9A6x+Ycd/4uMZD1YV38AceiLspBd6jAoejstw4QCfN
         eslqt8whCp9g71fL0rEnVdP7r83ter5lZIEKzVYASJARhLqMNtqS0puATjt0SQcuj7NP
         ho4crZgO+wqsCQdbaW7fFoo+A7loIeynUMVbXEzzeQPwC55JsJTTj9wwfh+DTjT6TzuR
         fQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gV52KlcmQLvJ8tMXJvAByGqnsCZ1lIaAcBWSdloAI+g=;
        b=tH3DgALaKq1aCCvL6gSOx6v0fTSPTZnAzLp9s2+9v/1IzZNmrQyGtFvcQ7TYnx6+Er
         lQIu/4nAy8Z8rhjYeZhY/hIQacf/ntgIGULd6R9iKllpPTHJGct2/wq/KhbuVJoJS6QC
         SkCWOcu69mW9285zMInrCO5cDFFg6s+vhrdycwtGU/cYjRO8AvyERse1jkxmf8TxJaae
         NGCAC1IKvCRLKnhWmMm3K5/CycwtaXOURfiz9gHESH5efeFtCtrdymyJEV7qjBqrMhcJ
         Z15rUq07IKBjBWtyDQsOAzBj/tJuga0J0c3GqFPbkKBxvsd9Vo08ABP1al7CDrw85LEL
         9+3g==
X-Gm-Message-State: AOAM53118EdBQiVfNVSmaU/hm5wb3bll2elTzDXzBJ2r4HApCxHFBvlm
        I4z7J+cJvKfBBeD7TauviO2c
X-Google-Smtp-Source: ABdhPJyFSUhwciUETSWScLoI3QA8S8CCYLJ7w78i/eHQiwluTlhMyCDBXASxzHxgflxxu6DygynLvw==
X-Received: by 2002:a65:68d4:: with SMTP id k20mr2207291pgt.121.1606390107304;
        Thu, 26 Nov 2020 03:28:27 -0800 (PST)
Received: from thinkpad ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id f5sm4387848pgg.74.2020.11.26.03.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 03:28:26 -0800 (PST)
Date:   Thu, 26 Nov 2020 16:58:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: rpmhpd: Add SDX55 power domains
Message-ID: <20201126112820.GA51288@thinkpad>
References: <20201126092711.1084518-1-vkoul@kernel.org>
 <20201126092711.1084518-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126092711.1084518-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 02:57:11PM +0530, Vinod Koul wrote:
> This adds the power domains found in SDX55 SoC. Downstream code tells me
> that we have 3 power domains so add them
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/soc/qcom/rpmhpd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index e72426221a69..4cb5d4ab82e2 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -132,6 +132,18 @@ static const struct rpmhpd_desc sdm845_desc = {
>  	.num_pds = ARRAY_SIZE(sdm845_rpmhpds),
>  };
>  
> +/* SDX55 RPMH powerdomains */
> +static struct rpmhpd *sdx55_rpmhpds[] = {
> +	[SDX55_MSS] = &sdm845_mss,
> +	[SDX55_MX] = &sdm845_mx,
> +	[SDX55_CX] = &sdm845_cx,
> +};
> +
> +static const struct rpmhpd_desc sdx55_desc = {
> +	.rpmhpds = sdx55_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sdx55_rpmhpds),
> +};
> +
>  /* SM8150 RPMH powerdomains */
>  
>  static struct rpmhpd sm8150_mmcx_ao;
> @@ -205,6 +217,7 @@ static const struct rpmhpd_desc sc7180_desc = {
>  static const struct of_device_id rpmhpd_match_table[] = {
>  	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
>  	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
> +	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
>  	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
>  	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
>  	{ }
> -- 
> 2.26.2
> 
