Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9751413CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 22:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbgAQV7w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 16:59:52 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41910 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729945AbgAQV7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 16:59:52 -0500
Received: by mail-pl1-f195.google.com with SMTP id t14so2448911plr.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2020 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wH8/aRr7zW2lkMolzBnmu3ZhKRNwfO3YsG0yBHBthEk=;
        b=desFXdRa4EW0maDZW25KfYW6BMApAUk5B2ccp7iA5pSZaLzWyGyPvTzn5xdxeMGDCt
         148AKMVVUeryNxZ4TR53Gcar45Yr1zfzwBXDm8pl9iKVOz/Noaeho/lOLwgV5drJJVhM
         CDF8TXclk2RjOKFD1j4V6KcM8z7g+erMnzJhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wH8/aRr7zW2lkMolzBnmu3ZhKRNwfO3YsG0yBHBthEk=;
        b=uPJrz7XnLXUibgAar/DR6SqFJ9e5sTJyQ5R1CdbzgAvSR6UE+CuLlbVT/L/UCCGsso
         DdGWjpK+t8RVBPcszeDfI3q1Y+q4D+hnN6qM/S6NVdujFSS6WDrJeDgUQaD84fb8D1wC
         VoayYchopVSQaMjvtPSTGQCgREJOR6f7i4IoRc0ryvFoT6zFmcElvDlqhCwD7HSWSLMI
         561GJc+qWcLa/d3Fj9yFAI0AGeLwQxqacV0hckmAvXc8yKCq//2VtTUyplw4PAQYZNia
         zlQE3/HAbFAamZNE5aBF5aAGK8mCHP3qA+yYH47lx5Vmz/i9qjdu3mQyeFlZP2q4lZVZ
         bw5w==
X-Gm-Message-State: APjAAAVjJpDjUfjyFUVQ3vgNsC7OZ1cngeSpu/l9tdRpWTEunBFc+Yl9
        Mqa1SaYRMyaKi9CgGLsu62D7SQ==
X-Google-Smtp-Source: APXvYqx0q2JaM2Mv0/oQbuhdtZgLabKhjJirCj4B6jf+VA1qMGTzLhDDnLc+PpUM6Adq0fzqc2Dc4Q==
X-Received: by 2002:a17:902:6b4b:: with SMTP id g11mr1443287plt.26.1579298391678;
        Fri, 17 Jan 2020 13:59:51 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m22sm30757146pgn.8.2020.01.17.13.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 13:59:51 -0800 (PST)
Date:   Fri, 17 Jan 2020 13:59:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy
 tuning params for SC7180
Message-ID: <20200117215949.GS89495@google.com>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-6-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578658699-30458-6-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 10, 2020 at 05:48:19PM +0530, Sandeep Maheswaram wrote:
> Overriding the QUSB2 V2 Phy tuning parameters for SC7180 SOC.

This patch doesn't set the PHY tuning parameters for the SC7180
SoC, but for the IDP board, which is based on the SC7180. Please
reflect this in the commit message (including subject) to avoid
confusion.

> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..826cf02 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -276,9 +276,11 @@
>  	vdda-pll-supply = <&vreg_l11a_1p8>;
>  	vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
>  	qcom,imp-res-offset-value = <8>;
> -	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> -	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
>  	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +	qcom,bias-ctrl-value = <0x22>;
> +	qcom,charge-ctrl-value = <3>;
> +	qcom,hsdisc-trim-value = <0>;
>  };
>  
>  &usb_1_qmpphy {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
