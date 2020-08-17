Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F7424701A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 20:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389680AbgHQSCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 14:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389716AbgHQSCB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 14:02:01 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F57C061344
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 11:02:01 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d4so8021656pjx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WDw5eMluEqJ71UREIfdhLPB079gyndxPuX/d/PHa2Q8=;
        b=lH4mJXL67WGnjmOPFlC/XMt7+biiQPvdCIitAOA7CnDS96ZV60CLgfv8bglKeuCSu6
         4SfaZpWGc+jg2/VTpMrRebhg63dsBW0e+GKH7i2JdiltjEMkX8M2aFxFahU6JdFifONV
         t8EVV3qa9mFYayJE4ty3p9v42scjEUUEmPDpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WDw5eMluEqJ71UREIfdhLPB079gyndxPuX/d/PHa2Q8=;
        b=eZaC14+H31qzLDIftzC6Ye3I1Yj49CMCDG69VerjM/OP7L1nzmm3SuB8CA41dCdAcd
         pt3ThD1Iwbsu/kVs+fqXyxhdDZoReYEenQrOivDIr9kIzhpZzB8ejlcHVuq4A27ruLk+
         H2MrBpElISP4kgFzcsf277bzz+0iS+ImBELi04zRGPe/H1hknh4um693gLKw0eQYElaI
         dBUaFGF2FuDAxwnhbKq2Dq4Kv/5PDlmj4+JKLaZuPSlqCcPm4V0/Gd5d58snMzU5ORXd
         uNwRLilNhtFOOCPtAChBP3PoiFe0j2EsG9BYExPJKfHbjhwTjXd7821T1YrCp8hgcyn2
         SrQA==
X-Gm-Message-State: AOAM5309zkLnqRcqmO07VRg6TUlSeFQLlmwtG3Mlm4M1YLsTdGJO+fTo
        DdfYp/QioF8piUhi1RitadjPCw==
X-Google-Smtp-Source: ABdhPJzTSklBYKNKgwQHtVwq6E0KgdOo2lDcZNazJWEFqsY1hZgpv5RGw21eM5NAFArPgo5KBNW+lg==
X-Received: by 2002:a17:90b:3891:: with SMTP id mu17mr13119099pjb.160.1597687320442;
        Mon, 17 Aug 2020 11:02:00 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id x136sm20161179pfc.28.2020.08.17.11.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 11:01:59 -0700 (PDT)
Date:   Mon, 17 Aug 2020 11:01:58 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for
 BT uart
Message-ID: <20200817180158.GD2995789@google.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 24, 2020 at 09:28:01AM +0530, satya priya wrote:
> Add sleep pin ctrl for BT uart, and also change the bias
> configuration to match Bluetooth module.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - This patch adds sleep state for BT UART. Newly added in V2.
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 ++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 26cc491..bc919f2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -469,20 +469,50 @@
>  
>  &qup_uart3_default {
>  	pinconf-cts {
> -		/*
> -		 * Configure a pull-down on 38 (CTS) to match the pull of
> -		 * the Bluetooth module.
> -		 */
> +		/* Configure no pull on 38 (CTS) to match Bluetooth module */

Has the pull from the Bluetooth module been removed or did the previous config
incorrectly claim that the Bluetooth module has a pull-down?

>  		pins = "gpio38";
> +		bias-disable;
> +	};
> +
> +	pinconf-rts {
> +		/* We'll drive 39 (RTS), so configure pull-down */
> +		pins = "gpio39";
> +		drive-strength = <2>;
>  		bias-pull-down;
> +	};
> +
> +	pinconf-tx {
> +		/* We'll drive 40 (TX), so no pull */

The rationales for RTS and TX contradict each other. According to the comment
the reason to configure a pull-down on RTS is that it is driven by the host.
Then for TX the reason to configure no pull is that it is driven by the host.

Please make sure the comments *really* describe the rationale, otherwise they
are just confusing.
