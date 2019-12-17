Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567311235B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 20:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfLQT27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 14:28:59 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46156 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbfLQT26 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 14:28:58 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so6190525pgb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 11:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i/zpLv8lE1Uei6Q5Sx7cAmMDb3bT/fGYajv7dIvOKeE=;
        b=hmFyP9YpwXdycSUewYe/UXs3bnMml8U1T7bYOZ707V0rFHcuCRD2nLhbeYGTE8+QE6
         YeODZNO4iHpY74xxfg8h3QIrN5+e2rmLTf4zCWzmdD8QLQkKIYPfRFr3uRQXAPXdjMOO
         FV5KcXU4rccMrDCxXAkxmXOOwEkYKu3j6Agfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i/zpLv8lE1Uei6Q5Sx7cAmMDb3bT/fGYajv7dIvOKeE=;
        b=kUMI9IlxaJ/KFVEgg/tcGwMmQb2fuLH1JvZmHI4k0PBp4fq+DseUOdFdlk4BwhkNps
         AGrdlSV6coAzKnJcCJbVEVcaj/ChbVkBGg3uB5fPfVxeDhwz5/eaW2TS+cT682ptGZmw
         R26NnjlmEIBPpjFobeiaeEciodYxkSviHOMcwtnqKsdyc5Al4uAFU7BBDbq+Cw1u6qaP
         wQfU89fim+O6iZi3rZy9diquPunCwtvF/6uvDA28ZgLBUunvTBP6vQsmC0dOTkfbX6P1
         OMSCy9aTOS1GrbSlyItT0sqkU42GNIMgSroU//Dddc/L5tKpt9ZdBJmHyCb6f/cqCO8r
         5zyQ==
X-Gm-Message-State: APjAAAXVqQHRiKLj6fU9Wh0qLk/hNtpkYMb19XZ1EAIxHR9unbAiOme/
        LjzW2rsjFlSjrhHrcsMrhtL5XQ==
X-Google-Smtp-Source: APXvYqxiTyHBI09mSIZ7WxUE/kaAZ+419iXHJeFYLdYs35fJkGC4N7ohu7jcUgy7taZPaKRwKqVlBQ==
X-Received: by 2002:a63:d041:: with SMTP id s1mr27414886pgi.363.1576610938241;
        Tue, 17 Dec 2019 11:28:58 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k1sm18812089pgq.70.2019.12.17.11.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 11:28:57 -0800 (PST)
Date:   Tue, 17 Dec 2019 11:28:56 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH] arm64: dts: sc7180: Enable video node
Message-ID: <20191217192856.GV228856@google.com>
References: <1576569218-24817-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576569218-24817-1-git-send-email-dikshita@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 17, 2019 at 01:23:38PM +0530, Dikshita Agarwal wrote:
> This is a preparation gerrit to enable video node for sc7180.
> This change depends on patch series Venus new features.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 52a5861..ccf9ef5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1297,6 +1297,34 @@
>  
>  			#freq-domain-cells = <1>;
>  		};
> +
> +		venus: video-codec@aa00000 {

Per convention nodes should be sorted by address, so this one
should be between system-cache-controller@9200000 and
thermal-sensor@c263000. If new nodes are always added to the
end conflicts are virtually guaranteed, especially in the early
phase of adding support for a SoC.
