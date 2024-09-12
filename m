Return-Path: <linux-arm-msm+bounces-31573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA03976358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FA181C2323B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06B618C915;
	Thu, 12 Sep 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngXwistB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1F4189B8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127446; cv=none; b=BVgY0xbNo/XWX4CSc0xURJBM8Fma+8B8qlmfomLlBEh26YYXMZF8OLEJKHdQvP5/vbdIZ0QxjvtRRKkpzw+t9oo8kHSI+J7ooVCiC9EPjfUPmTbNjN/0MLjQfLhHsC9itLvs0eql80bi4B/cBe8asNzdFwgEWpr4jP+5vveBV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127446; c=relaxed/simple;
	bh=2LqACrC/f67ckKFHLjd87qsLYIsC7RhOTFV9UjSebdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2CaGF48RSokiBFvhPtCgblrsHHDKfONe5yAlkB+zuX89q6i10RTXAPuO7gE/hWBkJzkDZu8LP/EHc2BXJW7sYDKTF5Xuf9uCZ4szWwroc7sAt6pgc2XPaiZHBxluLk2BhuSaxdmbNdl809w9mUvaYWEuYPKjLpxmw9YLxOfbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngXwistB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53568ffc525so816053e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726127443; x=1726732243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fW1OWTJTwPN4yaezyohYYBkn9WSUMxGliMksrCDxZTM=;
        b=ngXwistBAw5V27C17Dysz59HDg7+En3IRTe2HPl81klWsejMxubnDQySLcrg50ra8Y
         JSdCUOjFw+Ofwh3L6cF427VMHSY5dryv36xZG0PkRijgGTpjIAt+yOGsr0PS7h/GSi0Z
         26/ncx6hRChTHs9HWMAaPKm09gX9TgyeiodF14TDE7eK7ZVvlQcLAguauS3YJWQEf06J
         m16qCRUlf3PGCB7Rg/l7vPIAlUTx2VOnq+aHdCvzzl0W0QyCcut+F/uD6K3O17/ClVBq
         x6e1h6s1mJOP+Rf0mnyQcJ1G+1gILlqjXZhqsqSbKatVL7cIoGdEBcHeHSxvObZm/7jg
         +v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726127443; x=1726732243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW1OWTJTwPN4yaezyohYYBkn9WSUMxGliMksrCDxZTM=;
        b=nTCAfhgGT+dsoxqYdswUJEzHGi92OcUV2nnw4jvzXynuvOcE4JdgSZ/GEu1EennBLT
         mGZuojLkKyZT7S4nDEIZZNchpteJxEh8M3PHupWS1n3Hmib8qiCVvAWeGoagwCKmXRDH
         /wMfylrxuWjEmDZVK3BMFdJLHN8mw4E3cH20WLf/1rgHdBoiM/PpAH8LlXl/doBlQ2G3
         waYzF9NtjsPlN4irliA17AQvFtW0KCi2VHDUpwoehoH4Io6WR36ZbtwRI4afLr/v+68L
         G+GKR6+havbeUnjsKYv39flQjK9X0OFYvezXamyRLHga6e7weQMMG5MI7csF/31QToD8
         7q0A==
X-Forwarded-Encrypted: i=1; AJvYcCW5akXVoze3QBFQ9qViNAvAK9IjaJirtYtuHpbbM9SpniHRiviNSdE1ZfSkgu6Tma+TstgsaO+BWrktYrQy@vger.kernel.org
X-Gm-Message-State: AOJu0YzPx4PfLoCH+BOkLokO6afv++pkzmrR52hcXVyGjvSrjtUBw7pM
	exBC+fXcpJLosooHD09ivb1YUgBQO/PosVc2PjEcQuIs3KmTUivZ7t/zGLOeQXo=
X-Google-Smtp-Source: AGHT+IHoEgXXvb2ufgKWD0LwGRMcBYHnNU0FkrySQs1z/TctRwUffjKkgYYzPpaPmZYfOUsY8xivgg==
X-Received: by 2002:a05:6512:b1e:b0:533:4b70:8722 with SMTP id 2adb3069b0e04-53678fba601mr1172150e87.15.1726127441934;
        Thu, 12 Sep 2024 00:50:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb7ccsm1852871e87.128.2024.09.12.00.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:50:40 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:50:38 +0300
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
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Message-ID: <7sj55umpspghithnuczpmqn7ex2shui2seqx23buwrkiu3736n@hoitmsdkhv2f>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-2-quic_mahap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-2-quic_mahap@quicinc.com>

On Thu, Sep 12, 2024 at 12:44:33PM GMT, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>

I don't think this was tested before submission. I observe obvious
issues which should have been reported while testing dt bindings.
I will not point those, letting you discover, identify and fix them.

Nevertheless,

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sa8775p.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    mdss0: display-subsystem@ae00000 {

Drop unused label

> +        compatible = "qcom,sa8775p-mdss";
> +        reg = <0 0x0ae00000 0 0x1000>;
> +        reg-names = "mdss";
> +
> +        /* same path used twice */
> +        interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
> +                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                        &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +        interconnect-names = "mdp0-mem",
> +                             "mdp1-mem",
> +                             "cpu-cfg";

Missing reset.

> +
> +        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> +
> +        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> +
> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu 0x1000 0x402>;
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        status = "disabled";

Drop

> +
> +        mdss_mdp: display-controller@ae01000 {
> +            compatible = "qcom,sa8775p-dpu";
> +            reg = <0 0x0ae01000 0 0x8f000>,
> +                  <0 0x0aeb0000 0 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +            clock-names = "bus",
> +                          "iface",
> +                          "lut",
> +                          "core",
> +                          "vsync";
> +
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +            assigned-clock-rates = <19200000>;

empty line

> +            operating-points-v2 = <&mdss0_mdp_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            interrupt-parent = <&mdss0>;
> +            interrupts = <0>;

empty line

> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;

empty line

> +                port@0 {
> +                    reg = <0>;
> +                    dpu_intf0_out: endpoint {
> +                         remote-endpoint = <&mdss0_dp0_in>;
> +                    };
> +                };
> +            };
> +
> +            mdss0_mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-375000000 {
> +                    opp-hz = /bits/ 64 <375000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-500000000 {
> +                    opp-hz = /bits/ 64 <500000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +
> +                opp-575000000 {
> +                    opp-hz = /bits/ 64 <575000000>;
> +                    required-opps = <&rpmhpd_opp_turbo>;
> +                };
> +
> +                opp-650000000 {
> +                    opp-hz = /bits/ 64 <650000000>;
> +                    required-opps = <&rpmhpd_opp_turbo_l1>;
> +                };
> +            };
> +        };
> +
> +        mdss0_dp0: displayport-controller@af54000 {

Drop unused label

> +            compatible = "qcom,sa8775p-dp";
> +
> +            pinctrl-0 = <&dp_hot_plug_det>;
> +            pinctrl-names = "default";
> +
> +            reg = <0 0xaf54000 0 0x104>,
> +                <0 0xaf54200 0 0x0c0>,
> +                <0 0xaf55000 0 0x770>,
> +                <0 0xaf56000 0 0x09c>;

Wrong identation (here and afterwards).
Missing p1 block

> +
> +            interrupt-parent = <&mdss0>;
> +            interrupts = <12>;
> +            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +            clock-names = "core_iface",
> +                "core_aux",
> +                "ctrl_link",
> +                "ctrl_link_iface",
> +                "stream_pixel";
> +            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
> +            phys = <&mdss0_edp_phy>;
> +            phy-names = "dp";
> +            operating-points-v2 = <&dp_opp_table>;
> +            power-domains = <&rpmhpd SA8775P_MMCX>;
> +            #sound-dai-cells = <0>;
> +            status = "disabled";

Drop

> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    mdss0_dp0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf0_out>;
> +                    };
> +                };
> +                port@1 {
> +                   reg = <1>;
> +                   mdss0_dp_out: endpoint { };
> +                };
> +            };
> +            dp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +                opp-160000000 {
> +                    opp-hz = /bits/ 64 <160000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +                opp-270000000 {
> +                     opp-hz = /bits/ 64 <270000000>;
> +                     required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-540000000 {
> +                    opp-hz = /bits/ 64 <540000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +                opp-810000000 {
> +                    opp-hz = /bits/ 64 <810000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +
> +    };
> +...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

