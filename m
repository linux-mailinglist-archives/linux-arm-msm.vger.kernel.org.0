Return-Path: <linux-arm-msm+bounces-49065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A5A410CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 19:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E91717A6D57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 18:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4F6176AA1;
	Sun, 23 Feb 2025 18:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHtmnjkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6FA5D8F0
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335138; cv=none; b=vAaZqKRjGxa0+SoVplmrFFu/wVJeUTP8Z8bhbQWBlyh/g9K9rnf1H1AoGv5QKt3keEK+unpPV+MwmJiu5dFROCqQ6E0GPr5ZIuYp1CHahHKXMLqUrHPYIWLhcsxrUy2nY4bJjwEYyEE5KuhQNad1A56CkEdG+yjEzZkI3DDUzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335138; c=relaxed/simple;
	bh=IebdohvZSQVB2m0xM8vghThlOlO40yKJD09EDoioSGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvt8a8YvkNLwpS/OXlB4Hx1yyL33Z6iN98IVqKZPeOjebOM3sAJfToGnLXyDGB+50wGTeyQ027tpRmLeKiGgWLv/Y1zLzxjAdceTXdjleVlLDsy20CCvNA4Ewbd3KE/mkk4dHr1dCV86tOILqrCXPlqb74GfkYlb6m+gcunrJuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHtmnjkZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a2d4b61e4so27732821fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 10:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740335133; x=1740939933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtNMK+QZB8Ju1QcEFH1uDPKTHzJj1OW/FdNy3G2F6jE=;
        b=kHtmnjkZEQEkeKO+kQQ7+rM2m2hLtegoQ0KyhQV89jmpIzFcerpFqBB6op9EdofpjG
         wRmsu4NBF4N1AXrpnjTzv2Fu7o2Kbg+wslGVJXPUrhIoqwl04TxkEXGfFy7UMwiU2zg0
         Z33ON6AjhWVJt4qd8uZZ+Z174Y3l3hMKl9lcE3yrM7hgET/hJ3uWewxcK6KQfJWcpLct
         U/OSdfT9sSLm4aRfd4T8w+JGds8aE0QgV6/jKVIlmk8S5iLI4c2ns0rEhCT8D3D//DWh
         0b+7PEOV5XGffnhKpLXKkrh7ZurRW2SqjFBqfISeuMAgRwX/QbqQ4jhuArK2vmGACvJ8
         rT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740335133; x=1740939933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtNMK+QZB8Ju1QcEFH1uDPKTHzJj1OW/FdNy3G2F6jE=;
        b=ShAs+KH+YDtpCgItEvbRLBzpAIx/cIp3pZQOXZlhFqRmA9zg8aVvo3sTYM0V52kwiA
         0D1jAt1BOrl0Zq/SrBEvppgt2jMZQrt1hbIcJIaMQkq1FRU5r/boqxpREBI5jT6JjmbR
         05XSMDWCmxQ59ICB95qJdPYXccqzutSDgu2uUkvsXWKCjHVpjQUQW0m23bIoGMCXl3Eu
         D/bwkx5uYtQt804nBdITIV4rc9PoYF871sJ66x7/nQHX5bSheS5Ug4RD22gXsLze9DhV
         //8Ecyjs871pL4pTsHlrIantyLazppvvstNJNQG6H3QJW++KZo+vGP4zs724PVGmAGPz
         oWNg==
X-Forwarded-Encrypted: i=1; AJvYcCU81vYenTvPmqPn0moJXzRGFG34lvM4Rv6tRSAOY5t9UGOLhYl/MsBXMzXHQ1a/DNNjcpgKXSvnTDcTCUBq@vger.kernel.org
X-Gm-Message-State: AOJu0YztY5E//s35RamhsXidrm9TQYDAHZwp4hBjhSsSPE7S7xbiMYH8
	op707Pmqci5+9W15lgiTBoBHWH1QpIssODba3/ai2A0iMD7l/ONimE33AkdWwuQ=
X-Gm-Gg: ASbGnct+yK5tl85ewVcZxH61Z2qHqHuWW+Q2deQuJW7GsZ6tKR4PkybUaOyAyvVnMC0
	ZC/FK2LhfzTKqwRrAk+/UttoGbTbtin8Hk48FdSMF/hqT5GH4NB/a3iV7UWimvKqGYCLQUEyDrt
	7mSkDK5kK0oTN3Xe1w4ZH+IjR1tVZ23je6rT06TO24Hsc87J5SxeZmXHOA7wqFTjigmlaPehSwr
	pWSbaQi8kpwsVX7X0Nx0P4xvqZ850ZTTfpEQlq3inAN31UcGUisWFa/rwnDsZo6268q4ywTFmdT
	dmXBStjyiUmg/zA5HCF1PgmAUutya3R8QBPyEQJQaPZ1Rn9GX6LTZw8Sd77oulOTIxFk4LJ28lm
	8UcqWmA==
X-Google-Smtp-Source: AGHT+IGKB1vocXj8KVqyAz4vvD7IpDGljmlluQ7IMEzMaAFJ3qaRjIbImaAgV9NSc9jWouTyZFOjIg==
X-Received: by 2002:a2e:80d3:0:b0:302:4a61:8b85 with SMTP id 38308e7fff4ca-30a599951ebmr34295601fa.37.1740335132749;
        Sun, 23 Feb 2025 10:25:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3097b6584efsm26654891fa.33.2025.02.23.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:25:31 -0800 (PST)
Date: Sun, 23 Feb 2025 20:25:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>

On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel from DJN using it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83112B-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca@lucaweiss.eu>
> +
> +description:
> +  The Himax HX83112B is a generic DSI Panel IC used to control
> +  LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: djn,fairphone-fp3-panel

Would you know a better name or ID for a panel?

> +
> +  reg:
> +    maxItems: 1
> +
> +  iovcc-supply:
> +    description: I/O voltage rail
> +
> +  vsn-supply:
> +    description: Positive source voltage rail
> +
> +  vsp-supply:
> +    description: Negative source voltage rail
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - iovcc-supply
> +  - vsn-supply
> +  - vsp-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "djn,fairphone-fp3-panel";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +
> +            iovcc-supply = <&pm8953_l6>;
> +            vsn-supply = <&pmi632_lcdb_ncp>;
> +            vsp-supply = <&pmi632_lcdb_ldo>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

