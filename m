Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C89A1234B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 19:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLQSV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 13:21:57 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39304 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbfLQSV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 13:21:57 -0500
Received: by mail-pg1-f193.google.com with SMTP id b137so6115194pga.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 10:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qkSZEp2LsinKzRtMJteSGld5vsa6OFgl+t86XDP5eEU=;
        b=fepTE0HUb5CxTHXBrBY/0AvfYJMMrP1gat9cDME0DI3EuyUd6j3bN1pQjn/LoB/JX5
         FplU4s+GxX6xCAMCsdFs+w4PxLGsCGR+K+4ZqqrwKaj22+Inf0SCofnPXxQ81SobXr0V
         FYwTUqXsz/LtG/3rJsZz934fXOd2gNEXg8QK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qkSZEp2LsinKzRtMJteSGld5vsa6OFgl+t86XDP5eEU=;
        b=miJBylF0FTZeLmqvnk8kLzIB+hDbnlzpRvm6Oq8E3v7Ed5kIzYHsIjcayvPkBixngA
         PUQjNJ1+nxg1b6XERzwyGgUNLJGoLerLocLQ2e6DIC8MdLTEvopX2qIXJHChUp7y9/6L
         cQpVROBmaquM3FsTZb4GPOySTcbQkcyCEmb3/x4jeVf+r6MHbY5xc1sOLeEGljoHH7HY
         SC9P4W7eW/HKS6RfrHy0Jed+7LFYA1GAfAZGtNe+aQgyQihZMwPc415K7o3HMBsqMejE
         WSHJGyTtG9PCPpyUGYLsf5EM0tX5PLc5YB2xcjftSIbEDIbJKm+u48q6rP3fyKTyq1Ry
         vRwQ==
X-Gm-Message-State: APjAAAWh1T0OB+WzbYNGE+sHMrvT/jGrYViYHj6nTEVWsGLUS3UsuVoG
        CaedPjXZ+2Qcb5QFE727QbQ+5g==
X-Google-Smtp-Source: APXvYqxIHPlHk6frzgBdbcR7f5i/RUbydfwrku2XtLrzXZ5HNuusSXKMYkvaNahnG8jdCyClazvg1w==
X-Received: by 2002:a63:a555:: with SMTP id r21mr23297365pgu.158.1576606916432;
        Tue, 17 Dec 2019 10:21:56 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 73sm27711835pgc.13.2019.12.17.10.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 10:21:55 -0800 (PST)
Date:   Tue, 17 Dec 2019 10:21:54 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH] arm64: dts: sc7180: Enable video node
Message-ID: <20191217182154.GU228856@google.com>
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

Hi

On Tue, Dec 17, 2019 at 01:23:38PM +0530, Dikshita Agarwal wrote:
> This is a preparation gerrit to enable video node for sc7180.

gerrit is a code review tool, please change to something like
"Add venus video codec node for sc7180"

> This change depends on patch series Venus new features.

Notes like this should not be part of the commit message, but put
below '---'. It would also be good to include a link to the series,
I suppose it's
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=213439

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
> +			compatible = "qcom,sc7180-venus";

This compatible string is not listed in the bindings
(Documentation/devicetree/bindings/media/qcom,venus.txt), nor
in the driver.

