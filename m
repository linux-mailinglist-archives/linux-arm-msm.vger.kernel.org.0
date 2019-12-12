Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BED711C60F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 07:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbfLLGnD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 01:43:03 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43572 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbfLLGnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 01:43:03 -0500
Received: by mail-pl1-f193.google.com with SMTP id p27so153689pli.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 22:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gqSv0O4Jb2rJI/j1QKP0HTNOP+/liesGa8Pn0aNdars=;
        b=JCXq7As0h3xDPxU/1A4Mwru5TAHokaxtSPhkGsaqZlGrPIL/pZu129xEd0OOZm9UKp
         gZeCbiY8s8KA6Lk9JGeT8VvNciHyOYbx1F/TZ5PsKhNOdotoMjYppXMK7pwn7+B1fReB
         4HOwkTP5FAh8sQ2XxF+2IYfUkKFQpdhzaUo7LVfE/OT2wldESxbDefbD1pFEpSwlfQc8
         Xz4TX3iKLmgGBYG5wDwsItuowLaI/PrdjDlCxPo2Svx8iTFUhGF6QqH1ikDrf0RQ64A/
         2bnvmk640Yiwd1BMEGiRvPnbFQJigvbh/cMcwyNLwYREXY21S5syosvsnibxW83wVeTD
         eOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gqSv0O4Jb2rJI/j1QKP0HTNOP+/liesGa8Pn0aNdars=;
        b=q7EiPzNP77CMFvs/WSFGWX2DJ7N9FqsLCjBCAn48ZJUTeAKH2gGyeiP9KpSRQfnCNM
         VFNiYe/3tnY14aKsvENCi7Eeo7S+AzdoYKySqI8lRQXdro08n7G3N5qmVGV4Qa117e2i
         hToGFBjnpYGX42FwI27an79qhDSZ1jFVvrTmnt1Y0jSzOfMLvIyAPBC2XWj22zcFXsQt
         0cQLZwgqg9Bv46eWnA4fBS+aJPo4L6b7yQS6C6Ngl4U/zNB/dg6HB8g47Y6iMk8bpbxY
         MJCmItwUH5UXoerbLiZhKcQcVsU5sNTEEgdnWZ/uSfk/z9ifTLvftoHg/bST2/nswF1V
         37yg==
X-Gm-Message-State: APjAAAWQZ7IDqqwDIQFF7yIJugzMvCW0cOrFzzeHmYvd6l1w2QCcHekT
        7gXcT+MAmwZOOkNbxLRRCNovs2N1LQk=
X-Google-Smtp-Source: APXvYqw8BTiKW99DlPj2SrfMZfGsqUZhWDftoDK4ljjclrWQ8969eDnphdqtzC+imZfj4KuXi61DYQ==
X-Received: by 2002:a17:902:7c83:: with SMTP id y3mr7901906pll.34.1576132982164;
        Wed, 11 Dec 2019 22:43:02 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z14sm3642476pfg.57.2019.12.11.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:43:01 -0800 (PST)
Date:   Wed, 11 Dec 2019 22:42:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Add vibration motor node
Message-ID: <20191212064259.GJ3143381@builder>
References: <20191211192906.56638-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211192906.56638-1-stephan@gerhold.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Dec 11:29 PST 2019, Stephan Gerhold wrote:

> PM8916 has one vibration motor driver that is already supported
> by the pm8xxx-vibrator driver.
> 
> Add a node describing it to pm8916.dtsi.
> Keep it disabled by default since not all devices make use of it.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, please also send a defconfig patch that enables the associated
driver (=m)

Thanks,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pm8916.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index 9dd2df1cbf47..0bcdf0471107 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -111,6 +111,12 @@ pm8916_1: pm8916@1 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8916_vib: vibrator@c000 {
> +			compatible = "qcom,pm8916-vib";
> +			reg = <0xc000>;
> +			status = "disabled";
> +		};
> +
>  		wcd_codec: codec@f000 {
>  			compatible = "qcom,pm8916-wcd-analog-codec";
>  			reg = <0xf000 0x200>;
> -- 
> 2.24.0
> 
