Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6CB298E2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 14:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780303AbgJZNhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 09:37:54 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44141 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1772881AbgJZNhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 09:37:53 -0400
Received: by mail-ot1-f67.google.com with SMTP id e20so7959083otj.11;
        Mon, 26 Oct 2020 06:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t64kmtN/HDyxP4t5ivuGyA/qPv7YzZlRpPGh3lKtqTI=;
        b=rpSrVUML7FZiBFC1lnkXgqFmbXuzlUhO1B4h9ApnHoVqWF6nVp6+eQJB6cL3H99eon
         drzTSNXrEMLJJytzQFiSBVOqklz9MbVsOTT7uO/KaGTCP05F9LrtMUkdhYzrDkEK4eef
         BBOjtjnzviDFVJeFJDVX+jg1QMrUps2hd7CNuXIMuD955RNAUoyGw8Y2hbKrA+M0uutz
         j4k/kTSXIwCjx8E35eSPgNqzi0C73xqqKgK2el0D+KRChtmIdBGTScMxwhe5VEV2nw19
         ahdmk9rY/eOMtipaUl5uQjZaDBP+HwwlquWpoSvuSuohy3nD9RFmdEj+jbb8YaPpTBMb
         8wIA==
X-Gm-Message-State: AOAM5302Yyi9R9Q+mhYHqd07uiB83hOHcqiPwrvVtnilMjoY8vcS87oZ
        yGDlBDo3oTudWugRCW3toKtqNpofwg==
X-Google-Smtp-Source: ABdhPJwFWowVXR46tpcBVBTc1a9/5mTGJ/6c9gdWvieDSmH6ZIEqs+3E3MTlTuX3IKjN2c0Qav7dfg==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr11224458otg.236.1603719471915;
        Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w9sm1502116otm.47.2020.10.26.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 06:37:51 -0700 (PDT)
Received: (nullmailer pid 42863 invoked by uid 1000);
        Mon, 26 Oct 2020 13:37:50 -0000
Date:   Mon, 26 Oct 2020 08:37:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
Subject: Re: [PATCH v2 3/3] dt-bindings: drm/msm/gpu: Add cooling device
 support
Message-ID: <20201026133750.GA41262@bogus>
References: <1603113268-21161-1-git-send-email-akhilpo@codeaurora.org>
 <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603113268-21161-3-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 19, 2020 at 06:44:28PM +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 1af0ff1..a496381 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -39,6 +39,10 @@ Required properties:
>          a4xx Snapdragon SoCs. See
>          Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
>  
> +Optional properties:
> +- #cooling-cells: The value must be 2. Please refer
> +	Documentation/devicetree/bindings/thermal/thermal.txt for detail.

This file doesn't exist anymore.

> +
>  Example 3xx/4xx:
>  
>  / {
> @@ -61,6 +65,7 @@ Example 3xx/4xx:
>  		power-domains = <&mmcc OXILICX_GDSC>;
>  		operating-points-v2 = <&gpu_opp_table>;
>  		iommus = <&gpu_iommu 0>;
> +		#cooling-cells = <2>;
>  	};
>  
>  	gpu_sram: ocmem@fdd00000 {
> @@ -98,6 +103,8 @@ Example a6xx (with GMU):
>  		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
>  		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
>  
> +		#cooling-cells = <2>;
> +
>  		/*
>  		 * Look ma, no clocks! The GPU clocks and power are
>  		 * controlled entirely by the GMU
> -- 
> 2.7.4
> 
