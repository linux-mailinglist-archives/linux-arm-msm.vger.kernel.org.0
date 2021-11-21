Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3514D458167
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 01:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236712AbhKUAlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 19:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhKUAlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 19:41:17 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89030C06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 16:38:10 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id e17-20020a4a8291000000b002c5ee0645e7so5092083oog.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 16:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tn9dMzIKu+ibK/KdrE/W8IVEn4E4fjI9mXQYWJsCk88=;
        b=iF1PX9ZgYCiyA3YNcueQeuDUmHPZ474YKh7mUqa7JDoaO/GyGC09M66xoPBO0VZ+ij
         iv+pF4gZPnp8qwcO148FMNRM03ZZPwWuZfL+0P3QXEmczFUhzB63H8/iENu5KMG8hA/k
         /SdU8m5Fl0fthrBmhtzUB24ws3NZ/UHBogM4LNRRkREzbk/HecZjuxD4FjeuzEQB1Zgt
         NL9UC4TODH10SWcGL0H5H5lvndaAedg16u0+azDLJyhsDHtc4hI8Ht1tEhY4F+fX4p3j
         qTr1t42D35QNq9k5Y8NpcRXmowo7s7GmFstiQLVKXzbFQNgam/VLMMOaQsUb5URbRc77
         5aXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tn9dMzIKu+ibK/KdrE/W8IVEn4E4fjI9mXQYWJsCk88=;
        b=qhgLhKl5fj8trf27+PoQsF4gdOZHZp3o3qVmfnkxi9qxLYZHWMiIvrB8JXqrwadc5u
         dC08YQm7haYWeaaxGUUS3ow/voZp29ft7Ak/ebY88kSGsy7/lh0rVpOVLRn+xTjDFE6n
         c3FzOPPpp6lBK0AcOHF6phnAqJxBPioGQUDI4zd6x20bwpdv3jo1EKWlqD5dWNeZ8WFZ
         U7pF3YwNDrsRk5BlSkpLAvLP9NtbDKk2Kr7daHCWc/GtizrIKK8NjsrjnNVgCiCVm7aB
         iwhp1mHS123rZnuohlQTfmDXos/LpLx4VdbTU/w2draGIvhEG8YgXTW/eYl9DHnP4Eur
         B5cw==
X-Gm-Message-State: AOAM531vHBn42oJCK/AvV3K3Xho44v8zr/5/MtOiHj2t74pMEZ4Vo2pY
        8dZDpKYNI+44BpkaE34w2329iA==
X-Google-Smtp-Source: ABdhPJxIoHejU0c8j1lIrQZztowra82H18yHBeXtKud/4RL6yZ4W5TyMj/ZPNmdbNupeaFPxnbSBMQ==
X-Received: by 2002:a4a:e7c3:: with SMTP id y3mr24837489oov.75.1637455089886;
        Sat, 20 Nov 2021 16:38:09 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c3sm1023639oiw.8.2021.11.20.16.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 16:38:09 -0800 (PST)
Date:   Sat, 20 Nov 2021 16:39:55 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 2/3] soc: qcom: stats: Add fixed sleep stats offset
 for older RPM firmwares
Message-ID: <YZmVW9zqgsycfd+F@ripper>
References: <20211119213953.31970-1-stephan@gerhold.net>
 <20211119213953.31970-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119213953.31970-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 19 Nov 13:39 PST 2021, Stephan Gerhold wrote:

> Not all RPM firmware versions have the dynamic sleep stats offset
> available. Most older versions use a fixed offset of 0xdba0.
> Add support for this using new SoC-specific compatibles for APQ8084,
> MSM8226, MSM8916 and MSM8974.
> 
> Even older SoCs seem to use a different offset and stats format.
> If needed those could be supported in the future by adding separate
> compatibles for those with a different stats_config.
> 
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes in v2:
>   - Use SoC-specific compatibles instead of qcom,rpm-legacy-stats
> ---
>  drivers/soc/qcom/qcom_stats.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 131d24caabf8..d6bfd1bbdc2a 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
>  	.subsystem_stats_in_smem = false,
>  };
>  
> +/* Older RPM firmwares have the stats at a fixed offset instead */
> +static const struct stats_config rpm_data_dba0 = {
> +	.stats_offset = 0xdba0,
> +	.num_records = 2,
> +	.appended_stats_avail = true,
> +	.dynamic_offset = false,
> +	.subsystem_stats_in_smem = false,
> +};
> +
>  static const struct stats_config rpmh_data = {
>  	.stats_offset = 0x48,
>  	.num_records = 3,
> @@ -246,6 +255,10 @@ static const struct stats_config rpmh_data = {
>  };
>  
>  static const struct of_device_id qcom_stats_table[] = {
> +	{ .compatible = "qcom,apq8084-rpm-stats", .data = &rpm_data_dba0 },
> +	{ .compatible = "qcom,msm8226-rpm-stats", .data = &rpm_data_dba0 },
> +	{ .compatible = "qcom,msm8916-rpm-stats", .data = &rpm_data_dba0 },
> +	{ .compatible = "qcom,msm8974-rpm-stats", .data = &rpm_data_dba0 },
>  	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
>  	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
>  	{ }
> -- 
> 2.34.0
> 
