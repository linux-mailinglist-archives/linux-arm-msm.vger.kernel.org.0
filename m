Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7C111A578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 08:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfLKHxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 02:53:05 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45338 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbfLKHxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 02:53:04 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so1372261pfg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 23:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vq55uCFLXhs3ZCSCodzVz5wONq66uwh2dV8Oy9WTDz8=;
        b=mDpPrJUIJYVjmkFpHxpy8F+FfeM2Sf0eRg2mKlBjIBRg79fki0bKHRnGHhKDS1OkqD
         glzMZlBnoEQUisCdLNsAXUMWBVBvMbJ1566H6YnJusL0fXZLIzqPLSFQg02wdS+HDAEo
         O7+N/WYTenkxyNFM81aueTTgPKkChCyX7vkK7dkrZYXvx1DHBv/8hFWjya/VnacJOBMB
         YrwDotElYm1xJPjQyWGND4Jxi38L9FP7ZEUaHqMtPTtyt6jFH3nChpHHL9OD71r0muGs
         n5VIgyKIq8tz5fmJfefzuTgo4TmVRs9Q2e0AxHhAHG4FXgkh9liXoGAZu7CICxQarxcO
         pqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vq55uCFLXhs3ZCSCodzVz5wONq66uwh2dV8Oy9WTDz8=;
        b=ru7pkOFyataQg1HWVw3MyjMVnujFeUjjCk62YXGka/D4PO5+78siF9qlzWsQ4LufFC
         MvC/C3dtzah09d3bvaly/IBeQJpv0wrpOQlE3Q+KpgqyEOdnmQlqSFpfZF4L0wOyAt5L
         I9yewmBJqD2qr4AmzR/LAWsv0/0JaeceWlY2RKUKslxr/sauJ6Idin3iZNTJAB3ZmiO3
         lgTTfsZrGylNWeeJWQ5I9cqq4CjnqR8ow0MeOW21s8iLpCvJHJQi9foLZ7iWHv2LYZst
         qHEHVMzmU1VdXthbKJLA/wXNxa1YkWpvtjwy/YtOz5qJu2BLPtgtVxRDPeKbe5ysKf90
         +sYA==
X-Gm-Message-State: APjAAAXAuoeklvbvRAG7zS122DNetjtUjJQcEoGqR1cyNCwBlXYTKBpj
        /2wCSq5iqOCzuitm0MLYQvB+qA==
X-Google-Smtp-Source: APXvYqy+EwwCZr87pLcH/OaBsG6YcTrm8FJBCrW1oGk3rxl2DyThWcKGgcSXC0PubcIcgwCKCIJ5Jw==
X-Received: by 2002:a63:5512:: with SMTP id j18mr2484410pgb.189.1576050784012;
        Tue, 10 Dec 2019 23:53:04 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j16sm1689171pfi.165.2019.12.10.23.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:53:03 -0800 (PST)
Date:   Tue, 10 Dec 2019 23:53:01 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi
Message-ID: <20191211075301.GI3143381@builder>
References: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Dec 01:20 PST 2019, Rakesh Pillai wrote:

> The MSA memory is at a fixed offset, which will be
> a part of reserved memory. Add this flag to indicate
> that wifi in sc7180 will use a fixed memory for MSA.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This patchet is dependent on the below changes
> arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node (https://lore.kernel.org/patchwork/patch/1162434/)

As mentioned for that patch, squash this change into that patch please.

Regards,
Bjorn

> dt: bindings: add dt entry flag to skip SCM call for msa region (https://patchwork.ozlabs.org/patch/1192725/)
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 8a6a760..b2ca143f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -250,6 +250,7 @@
>  
>  &wifi {
>  	status = "okay";
> +	qcom,msa_fixed_perm;
>  };
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> -- 
> 2.7.4
> 
