Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F851A18B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDGXio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:38:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36299 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgDGXio (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:38:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id n10so1541273pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mOG8uXDl25YkIY1KwvU7WP+vA59IBuf+1/ymXSgkT1I=;
        b=qaqchf5jB5Eqy41fV6WU2Pz9vxP8irw80dxERZBvo8vJlEUyLvQcVHqo4d7BqKi5mk
         OzWDY3XOoxKXqyjI/WiJMwIx732T7Zasabr7mN8xRgxLdQugRkuLklMqQo+Ko7LHb3Jk
         s6ekr19+LwPrmvkJCNgUquIJZGlUv7tY+a1Ynp/veuOitVrFvnVN0CibRse67tRCbWoB
         Da7DlOB6sd3vxeH/eOHhilb8y74yZqq9KWgdDEQqkEVeKW/CelXsOB1V4m/Bl+mWGGG6
         QCv8SivvGUS3W6VPJQSAru20CvvFR1SUImMZ681gh306B9PWC+k/syh4IpzC6qvd+HEq
         lmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mOG8uXDl25YkIY1KwvU7WP+vA59IBuf+1/ymXSgkT1I=;
        b=cSA0GouBcbwo502qumZQp/Qa0/koNnJLwwoDqNTdue3kXBIERWN0QTvr0FLrQKTPWD
         txp90+vaL/N8ZkcSXda54FPeftH9Y0Ey18u+2AIGtk9c7WyVcEv1aangOevJd6kpUIKh
         q4ATn02r/WD2bAo2fWixScx8FgFRIwCokSNVHBzRGRuaL0KOhipB4OwwKkb4X8BdNi/6
         aDu3GHGt29KXX1qqE4dYFVdMICMCKVwYdLfFCCilcR/ZPJKpQBSEy6Btwmcob61tPEau
         H7LJrdH6CKeujguNFnxItXQ9E0JGVu02Uob45TzoLIHFb1mlzaVZbbVykf9QCjppKZtV
         4W/g==
X-Gm-Message-State: AGi0PuaQa1ze1W6G30xw+ZWrDFYKVdEa2xcXf3VK7ev5LwT7qTTAIVTC
        z0CGr3hqRFdEJ89WbTPI5N8H8Q==
X-Google-Smtp-Source: APiQypLJ4W6r4lUs3kl4+KovCBimfVWxesaytHb1fY7SpaerFs+CbFQPc75tWHX2dn9mukWlYUgjuw==
X-Received: by 2002:a63:2e44:: with SMTP id u65mr4419244pgu.142.1586302722857;
        Tue, 07 Apr 2020 16:38:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id hg20sm2573036pjb.3.2020.04.07.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:38:42 -0700 (PDT)
Date:   Tue, 7 Apr 2020 16:38:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8150: Add USB and PHY device
 nodes
Message-ID: <20200407233848.GN20625@builder.lan>
References: <1586298267-4722-1-git-send-email-wcheng@codeaurora.org>
 <1586298267-4722-3-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586298267-4722-3-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Apr 15:24 PDT 2020, Wesley Cheng wrote:

> From: Jack Pham <jackp@codeaurora.org>
> 
> Add device nodes for the USB3 controller, QMP SS PHY and
> SNPS HS PHY.
> 

Thanks for the respin Wesley, and thanks for testing Vinod. Just spotted
one little details below.

> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Tested-by: Vinod Koul <vinod.koul@linaro.org>
> ---

Please make a habit of documenting what changed since the previous
version here, below the ---.

>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 21 ++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 92 +++++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+)
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
[..]
> +		usb_1_hsphy: phy@88e2000 {
> +			compatible = "qcom,usb-snps-hs-7nm-phy",
> +							"qcom,sm8150-usb-hs-phy";
[..]
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sdm845-dwc3", "qcom,dwc3";

The first cell here should be qcom,sm8150-dwc3. The Linux driver will
"fall through" and match on the less specific "qcom,dwc3", but if we in
the future realize that we have sm8150 specific behavior/quirks we can
make the driver match on the more specific one to implement this.

And similarly the order of the compatibles in &usb_1_hsphy should be
reversed as well.

Regards,
Bjorn
