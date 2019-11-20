Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E19103193
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 03:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfKTCbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 21:31:06 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:44962 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKTCbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 21:31:06 -0500
Received: by mail-pj1-f67.google.com with SMTP id w8so3487622pjh.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 18:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SlN3JHcAAyOx0sje3WAh1eglKaUDFqxxQJszfVhKmBE=;
        b=iEeP9ev0UFZrSPin+hJSCR7lQbtZv3KNvuwn7+5XY9KpwKUQk9Gb7qp5iRKnjN6jeu
         t0bhuybu0Q8Tq2mGEzOak0aphlyz7PpeFKIm9r8GiNCLh5xkTxyFNjY/sknc3YHIwTuw
         lR1bfxpphqay8eCHNMX/zi9egpk53TlsLqkqfspbyNvWxUyLezxrcyOFERzlYdfMMiFv
         p35NIDwW86KgndGkEV1hlFSOWE+UF5nxnv57d5ouTdqPoKZG2lL3S146/sNjPElDnltK
         RJ7xHDNpfcc9fox2ZuIDGVarImzgMadIVdrF3tUM255bXFRsOcQ6W1UYI5qQ5cBMXCqX
         EzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SlN3JHcAAyOx0sje3WAh1eglKaUDFqxxQJszfVhKmBE=;
        b=dJi3gDUcGuwXyBswsQY/H5QWjBZgdEGvBXYP2zxJdRfDGeco4LJqXVz82xyDwkcoFR
         4uc8CgaB45DB15JSjUeyoxxXca4DTt2rfWQAFDjAg+TNemrgsjIieMYo2D3E79ERsNam
         Ey3zHeuTQZnTdViOsN1YTUm31VHs/HQ7fpPuKKpqI6DCgtEq4gqW1sau6RPvGGwBGTXN
         plof6pJrhGRwtOyXZtrfSY2TO/zZ2GFGQFxmBdMWbIbba4x1u3qBDv226fVNmOTveOp9
         RlQJYLvCUzynvCfT1/EzbWkxUire6gWOXRntLRFNl7dlRpo3wwNlQIPSBMkluyrWZym1
         Jq5w==
X-Gm-Message-State: APjAAAWFnGc/8CqV3LK3r7ZrOE4/1Vl3iIKGI6mjCz0l1bEC+UvSx2t5
        BkAKO6x3TZkeekiKHtzHNmD3DA==
X-Google-Smtp-Source: APXvYqyXbCW923yEMBw7Rl9sdB7zP/c721VfAPUCYtkNIjCgR4IHGYcb2KqOmRRZInis80aMt42LRg==
X-Received: by 2002:a17:902:ff0f:: with SMTP id f15mr463498plj.52.1574217063689;
        Tue, 19 Nov 2019 18:31:03 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s24sm27215232pfh.108.2019.11.19.18.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:31:03 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:31:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 3/6] soc: qcom: rpmhpd: Add SM8150 RPMH power-domains
Message-ID: <20191120023100.GL18024@yoga>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99b99a-e1a501f1-823e-4ede-86ad-f517323c5014-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f99b99a-e1a501f1-823e-4ede-86ad-f517323c5014-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:

> Add support for cx/mx/gfx/mss/ebi/mmcx power-domains found on
> SM8150 SoCs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmhpd.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 51850cc68b701..3b109ee67a4d2 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -131,8 +131,44 @@ static const struct rpmhpd_desc sdm845_desc = {
>  	.num_pds = ARRAY_SIZE(sdm845_rpmhpds),
>  };
>  
> +/* SM8150 RPMH powerdomains */
> +
> +static struct rpmhpd sm8150_mmcx_ao;
> +static struct rpmhpd sm8150_mmcx = {
> +	.pd = { .name = "mmcx", },
> +	.peer = &sm8150_mmcx_ao,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd sm8150_mmcx_ao = {
> +	.pd = { .name = "mmcx_ao", },
> +	.active_only = true,
> +	.peer = &sm8150_mmcx,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd *sm8150_rpmhpds[] = {
> +	[SM8150_MSS] = &sdm845_mss,
> +	[SM8150_EBI] = &sdm845_ebi,
> +	[SM8150_LMX] = &sdm845_lmx,
> +	[SM8150_LCX] = &sdm845_lcx,
> +	[SM8150_GFX] = &sdm845_gfx,
> +	[SM8150_MX] = &sdm845_mx,
> +	[SM8150_MX_AO] = &sdm845_mx_ao,
> +	[SM8150_CX] = &sdm845_cx,
> +	[SM8150_CX_AO] = &sdm845_cx_ao,
> +	[SM8150_MMCX] = &sm8150_mmcx,
> +	[SM8150_MMCX_AO] = &sm8150_mmcx_ao,
> +};
> +
> +static const struct rpmhpd_desc sm8150_desc = {
> +	.rpmhpds = sm8150_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
> +};
> +
>  static const struct of_device_id rpmhpd_match_table[] = {
>  	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
> +	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
>  	{ }
>  };
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
