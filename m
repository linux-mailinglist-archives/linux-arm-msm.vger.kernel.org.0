Return-Path: <linux-arm-msm+bounces-31575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D297637A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F273B1F24738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E673D18C915;
	Thu, 12 Sep 2024 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDsrMbZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D1188A00
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127566; cv=none; b=CoOy+BjkscdPTzgS8mB+1Lx8k2QqnS8u8s5Wk96GGMxG7tgF1bAATD1a2XOeOaKYV3SBW/jLIM9NzRm4/N9IC+SMDHiFuN05kn7DeoRa1jz1BaROhEfxOV645PK0+2ZOJ9ndU0EzLkIZtgE8e84IYlWRNwINd0h4oeaS2qD4FjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127566; c=relaxed/simple;
	bh=KpZ/OBjQ952uyEtwlzqLtUdjSueYLObXbMJk3aHGCPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awsBKAFcSB/tIwzUnhktJCYEqnyr4OC7VTTZR/gmqWwwdSVfnFayUkSbicsKDNJcuUB18gvhBu8vMHmWWhPI6A/lYxFle1XSfB2XnHKQiazBfPTAZNCLUP2BWoQvF0v4Brd6iM6fDm0zxb3lBnHTQwoYc+4JjBUvHZUKRmPTsR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDsrMbZU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso893227e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 00:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726127563; x=1726732363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTkWSFh0slefdYYlB8sOq3Alq45nxHEpvtMyVah6e0Q=;
        b=fDsrMbZULkh5Ouv2B2W+/c/cD8HBjgKcNwaU+WIm3X5FPRCth0WR/ZwRrRRgra7lpV
         qEV3qy8DQuMrVc+3ggfDKSa7mEWje7ASCxrKqsWwtsYVmQLfnfb14oB8OJxfBdD+mNX8
         hndtfPmaeAKY7rP+CWgfwx9RZWKkhGv7qkomotadNrjnqQj8uEWqFgNzq+uHSy35OfAF
         7O9M2Sb3QvFYzhDmH45zzxkhLebUYyAh8TebXGxtnkDlAsF6LvBy9LpRzmVHducVvNrE
         eMBZaEICv98zFJ8t+X9rSMN8ke5Sv+gzLbTmYP/boe9tiRCu72j+7HcqqqdZKwEv85Mw
         /upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726127563; x=1726732363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTkWSFh0slefdYYlB8sOq3Alq45nxHEpvtMyVah6e0Q=;
        b=s9czIfmwV1oHWPTYdHUesOOGCWlNt9Hw5NkodVkjRQ/b+s5oNHisSg3P4C+72pj4k8
         eRQahDU594N3y1UF8xnquzG2z4B4huwq1UeHOGT4YzV1hYB+ltgtKNOi5VBX5aTBqqOy
         nT0qWHFV3bWBykMceDE3fodln9tS+3EE7TZNyp7V2GgPWvJ4zAQLsXjygWYFSIo3uAUp
         Jq0/jjNpX/ZS7fejN/0lOPLys4nRRgimQ7QIjHlJ82iFkOwy2xKMm9S4mZwntnm+trHC
         o0AZzYeKcgF0+cRlCJqO+Xz78kwGmQQfptmFFI26QWlUDkTNCZAzV+WgucLuujKn9tNL
         7TSA==
X-Forwarded-Encrypted: i=1; AJvYcCWf59NheGZrT4+Eii5TXgc+tkGzQSiNACppeop/dTC75ye+gBc340bx9u33fV+c4uxy6KSYAwWqMlD/Y06A@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3yFkTrXakPbKG+XOrsaQqyG8zNfR3wqdnVFeF699cdG0DjAQ
	H8jg8rBdQluoMBqILMmqiQE/w9QuZUaSr3NqM5a4X0U3TZ1ng7tfIHMC0RfWbFs=
X-Google-Smtp-Source: AGHT+IFreFJR91Jk0jO+3GaqJhwxC3JIon4VS/a8wOCAEnO6MaGHHHfffcWsljomGO5+V5BT8hHE/w==
X-Received: by 2002:a05:6512:4029:b0:52c:9ae0:beed with SMTP id 2adb3069b0e04-53678fec4fcmr1533271e87.52.1726127562565;
        Thu, 12 Sep 2024 00:52:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8caba6sm1832730e87.169.2024.09.12.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:52:42 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:52:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
	konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
	neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Message-ID: <73tpotwk5xotzpbbikzx2jx5re2i3g5w2ze3zqm2yrqcrt3ncx@oyid2nlcu65l>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-3-quic_mahap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-3-quic_mahap@quicinc.com>

On Thu, Sep 12, 2024 at 12:44:34PM GMT, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.

Please fix errors reported by DT tools before submission.

> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> new file mode 100644
> index 000000000000..4e1bf5ffa2ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SA8775P Display DPU
> +
> +maintainers:
> +  - Mahadevan <quic_mahap@quicinc.com>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display hf axi

AXI

> +      - description: Display ahb

AHB

> +      - description: Display lut
> +      - description: Display core
> +      - description: Display vsync
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: iface
> +      - const: lut
> +      - const: core
> +      - const: vsync
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sa8775p.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sa8775p-dpu";
> +        reg = <0 0x0ae01000 0 0x8f000>,
> +              <0 0x0aeb0000 0 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "bus",
> +                      "iface",
> +                      "lut",
> +                      "core",
> +                      "vsync";
> +
> +        assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +        assigned-clock-rates = <19200000>;
> +        operating-points-v2 = <&mdss0_mdp_opp_table>;
> +        power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +        interrupt-parent = <&mdss0>;
> +        interrupts = <0>;

empty line

> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

empty line

> +            port@0 {
> +                reg = <0>;
> +                dpu_intf0_out: endpoint {
> +                    remote-endpoint = <&mdss0_dp0_in>;
> +                };
> +            };
> +        };
> +
> +        mdss0_mdp_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-375000000 {
> +                opp-hz = /bits/ 64 <375000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-500000000 {
> +                opp-hz = /bits/ 64 <500000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-575000000 {
> +                opp-hz = /bits/ 64 <575000000>;
> +                required-opps = <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-650000000 {
> +                opp-hz = /bits/ 64 <650000000>;
> +                required-opps = <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

