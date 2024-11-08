Return-Path: <linux-arm-msm+bounces-37350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599B9C22CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 18:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB0E1F22D36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 17:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781DD199FBF;
	Fri,  8 Nov 2024 17:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtUCnpyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FB1E907A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 17:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731086567; cv=none; b=BSnyhsRUr6zcrnZ1HUd96lZF6cuamSbLsQhNkA+qveGews+3t7kWF/DeT331WbSHTEIhvByrDdnJ2I/qGmrCt+uioiZI5zNKnxB7Ek3hQyLT/EaQw6Kd+stxtd/YQlgQXC/KsG2sU4fpw/1/vwpfxXg7hjjSy2jK75ZrCbobBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731086567; c=relaxed/simple;
	bh=AZeXblRqUA+athYMQ8PexgeQYbRAQdfZV5DIZ5kLB0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwRY6YQb5DM0Gaop8v8B9no5/n/SETXSyYnhl6Xy3/I7/azwCbDytABC1gRLJyRmw3D3g8yZ0XYjCOYUZMYX77nib7THaxc/pYcLbODmD7Sdd4u5em3iA1em1Fv7TYOPIiLmOkP7XqVLYNKsYmu7fmJkOsIWusTlNXL4w1yCJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtUCnpyT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f2b95775so3308866e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 09:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731086564; x=1731691364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuMsjEWNzhW+6P3eECc9hh/03bxywxtcZPQ/jBAhyYE=;
        b=UtUCnpyT695O8bCaSLpXzcTn/y5tE0pJTdVXgzqtSmLS2ObyJeehT2+dvL/hZ6gkus
         zgkwqquYU1mPfPuSaQ3SecgJwvX0hhyhgzifwDP/tn7btgr6/Nn5DoOdsDGJnKHSSFea
         uvCTDHHc1XGFB6RQjUibVFRaD/AoMRw4O81+44wtCzqsgO0lNscHejAOwT8HarTSza+z
         pxcdzqhHGb9E062meeMjbIOtbFY3RkPtDzY+vryXyMPChKgSv6tjF5JAC4GIhwRNPTSH
         usNPFi0FsxhMsrgRSh8EtFhW5x5Z7axNpbRUVzds0mRihtrWFudG1ChC0CN7QdSOwln2
         jtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731086564; x=1731691364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuMsjEWNzhW+6P3eECc9hh/03bxywxtcZPQ/jBAhyYE=;
        b=K/TVGdWBTkvPvdeihLuGKSZA8qIHAAPG2pteOIYQXd18XGow/ytPJ9pHKi1NfaX3f/
         luZKYmITH89xXBEWQK3EKm9L4ZW7i/7pjk8K72LWJpWVCt3k0krOTjq1Tv/FZDHQcqlu
         wwgi9PhAFMOvCJ3UyML+Z8CvkQe9ipeqDMSNpTaFiZib9mlbReaBKvKHHneMOHkY+oFh
         qfcaej5oRQ56sIH7SP80aDZPI+gMOoyWQ/DW7/KQb7YBNuPiHhSil9KYhgIOt8JPN1eG
         CSzwHAathA3blUpJOY9QA4V57lwaL8jjwM55ACjh5/tpoHSYuntqlc3nOxzpKFG/RUJD
         tWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmgISIBa7+y18ig4/RB27ddE7qrAiUCUTrZC/G6VpagdHtVRRFIRTmiI7XdpWNnDWozIR76MZmOTnFElPr@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFXy35pWfCfEiLNhzKbdYteoawa5xWXI5dxj6DieiNLXFfGGr
	C7HyBdC6WVp2v+r2iE6tueFHVo6lSbZu35DFrUOHhWnAL6E4Ju5gBPArM9vjYTs=
X-Google-Smtp-Source: AGHT+IG/kHT7uoJA9pS6MJzi5G/TAbHC1g+M286p5WIMFKq0cH1FOM6xU7xjhvQPNXqOerM7diDKNA==
X-Received: by 2002:a05:651c:1551:b0:2fc:9674:60b5 with SMTP id 38308e7fff4ca-2ff2028afd3mr36644341fa.25.1731086563412;
        Fri, 08 Nov 2024 09:22:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179ff9f7sm7271371fa.119.2024.11.08.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 09:22:42 -0800 (PST)
Date: Fri, 8 Nov 2024 19:22:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <be4blr2wvnc7b4iubexxnzqevjpgnfhdt7azcuwdtqgp6xbdvh@c3txmpuo5lot>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>

On Fri, Nov 08, 2024 at 09:39:20AM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |  60 +++++++++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>  2 files changed, 170 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0abd277aa3ddd2e1384d0af59699dc1deda5575b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,qcs615-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on QCS615
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm camera clock control module provides the clocks, resets and power
> +  domains on QCS615
> +
> +  See also: include/dt-bindings/clock/qcom,qcs615-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-camcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1

Please use qcom,gcc.yaml instead of copying the same set of properties
over and over.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@ad00000 {
> +      compatible = "qcom,qcs615-camcc";
> +      reg = <0xad00000 0x10000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>;
> +
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...

-- 
With best wishes
Dmitry

