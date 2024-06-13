Return-Path: <linux-arm-msm+bounces-22669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04E907FF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45839284BFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62A514F13D;
	Thu, 13 Jun 2024 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCgMMSkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F5139D04
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322953; cv=none; b=Yd0XnNxPI1+u2CyrSFniEWNLqCUAP3WxokXQ1Rd762ERBNxfQJn/+HWgvrW4ngu1YENFRB7qh7sAYDddIc7hpmcCoolHSeujstUtp6fpHnCtkL2bA9bHX62Wd4Y+JdTI+pIfqz71jjRzYZO9nCDwnUa7IqkcoLZw5Yv1kwNVp3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322953; c=relaxed/simple;
	bh=I/UgswSXAUmQqDFfEJFjOHo0vIe40dl4ZXc/9eouMtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfC01KmBCG0qFS+53tozXM9hQ8GRSvSQtoSitTuc/eiceXjbntEF8Zsny7pK9pb++lYWtOjQ0hwaloWvUce4WkHE2BtdnC3W1+YJ/TK99q7HtoOz6d32SeV4HsfZlOU9hNBP4KfFJURjMdkj5hPA3x62UZSGeBU7TMIRcPg/0sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCgMMSkG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c8973ff29so1622697e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718322950; x=1718927750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l4hbm8OoTLo4l2aiuFtHBEILqr9ou2NQIRsDH6v++2M=;
        b=WCgMMSkGr+4KdXfKl2I+TG8v/JhDmitY0bOMWez0H+Yu13UHjpDg1BqmQ1Jqrp3QYY
         7H2/1pInFYtN/dVRyNZKCaGO1J1L6agLm4Td+3uRUzA0rhlXN7e4PrjGOp0MN83W29gQ
         tvwI7TXkBWdOwZQ2jf79tibhKVrh7PR6xj0iYaIprdzbFhrhLU7+c6QNngWsq4CzXhpC
         +vxjxUkoT8GRoNTQM7I0/pHfbY+3f5XY7TtrznnmjWXICQUsdJooARRnsRPsw8yrvcvR
         pFfJJR+Z4HARKUL5iZbNIF/334MA9hiFh1uHKRQGDntcWyL3I/DeV0uXupz6mVtS5haV
         4z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322950; x=1718927750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4hbm8OoTLo4l2aiuFtHBEILqr9ou2NQIRsDH6v++2M=;
        b=JlCvLHuATKGDq6L4KynAOC+5piltqOpQvpUs6DMY1i0K8pDBwmQc/wB5GPR5Mr7afD
         wm2/N6o4Ux0y1thxF8LX76QcUO/0fIiIDB2kh6j/cU/Tp/0HPvTHK6Tw+JaV84eFEoR1
         ggK7T7N9AhL2+/koUVyjpiLB7PLMG1mWDYq6sedk3SZWnYWlucWRpZX97Ok6g54jnXrG
         1WXmi9T0F/bISWVbp4M1WwvSPEDGuRN3XUOV/tCPAxeZ9tjr+yygBrYLYlDeIkK3brqL
         Pdjnf+gSjIp95xObWRzp8yF+rswoD7u7JT23ZmBqPAByE9jR3PgOSCY2gKMlmZ1i0+K2
         GTmA==
X-Gm-Message-State: AOJu0YwY1cZCgmF1vGuINWiDQsZi1x+soytAXpspyTBBxus1/dUgLMGT
	QQfJaJmWexsBsTP80VXlP0ZciTLktola7Hf9SC8pM9phLwN4G9kzA48YzJ4JL0k=
X-Google-Smtp-Source: AGHT+IHCIqESmXtjRH3QmZKEoSYUbL+jyllLs3Umw8Kq2gKsHG0tbHwmo7UfWfTrve9WZBJNRWwgxQ==
X-Received: by 2002:ac2:555e:0:b0:52c:9a1f:52e7 with SMTP id 2adb3069b0e04-52ca6e988a6mr682371e87.58.1718322950103;
        Thu, 13 Jun 2024 16:55:50 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:fbed:73e4:f21c:5826? ([2a00:f41:900a:a4b1:fbed:73e4:f21c:5826])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287aae2sm364886e87.219.2024.06.13.16.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:55:49 -0700 (PDT)
Message-ID: <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
Date: Fri, 14 Jun 2024 01:55:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
 <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/24 17:15, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Port device nodes from vendor code.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---

[...]

> +
> +			hdmi: hdmi-tx@c9a0000 {
> +				compatible = "qcom,hdmi-tx-8998";
> +				reg =	<0x0c9a0000 0x50c>,
> +					<0x00780000 0x6220>,
> +					<0x0c9e0000 0x2c>;
> +				reg-names = "core_physical",
> +					    "qfprom_physical",
> +					    "hdcp_physical";

The way qfprom is accessed (bypassing nvmem APIs) will need to be reworked..
but since we already have it like that on 8996, I'm fine with batch-reworking
these some time in the future..

> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <8>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,

Not sure if the MDP core clock is necessary here. Pretty sure it only
powers the display-controller@.. peripheral

> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_CLK>,
> +					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
> +					 <&mmcc MDSS_EXTPCLK_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MNOC_AHB_CLK>,

This one is an interconnect clock, drop it

> +					 <&mmcc MISC_AHB_CLK>;

And please confirm whether this one is necessary

> +				clock-names =
> +					"mdp_core",
> +					"iface",
> +					"core",
> +					"alt_iface",
> +					"extp",
> +					"bus",
> +					"mnoc",
> +					"iface_mmss";
> +
> +				phys = <&hdmi_phy>;
> +				#sound-dai-cells = <1>;
> +
> +				pinctrl-names = "default", "sleep";
> +				pinctrl-0 = <&hdmi_hpd_default
> +					     &hdmi_ddc_default
> +					     &hdmi_cec_default>;
> +				pinctrl-1 = <&hdmi_hpd_sleep
> +					     &hdmi_ddc_default
> +					     &hdmi_cec_default>;

property
property-names

please

and use <&foo>, <&bar>; for phandle arrays instead of <&foo bar>
(this is a really old dt and we still haven't got around to cleaning
up old junk for style issues..)

> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						hdmi_in: endpoint {
> +							remote-endpoint = <&dpu_intf3_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						hdmi_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			hdmi_phy: hdmi-phy@c9a0600 {
> +				compatible = "qcom,hdmi-phy-8998";
> +				reg = <0x0c9a0600 0x18b>,
> +				      <0x0c9a0a00 0x38>,
> +				      <0x0c9a0c00 0x38>,
> +				      <0x0c9a0e00 0x38>,
> +				      <0x0c9a1000 0x38>,
> +				      <0x0c9a1200 0x0e8>;
> +				reg-names = "hdmi_pll",
> +					    "hdmi_tx_l0",
> +					    "hdmi_tx_l1",
> +					    "hdmi_tx_l2",
> +					    "hdmi_tx_l3",
> +					    "hdmi_phy";
> +
> +				#clock-cells = <0>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&gcc GCC_HDMI_CLKREF_CLK>,
> +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +				clock-names = "iface",
> +					      "ref",
> +					      "xo";

GCC_HDMI_CLKREF_CLK is a child of xo, so you can drop the latter.
It would also be worth confirming whether it's really powering the
PHY and not the TX.. You can test that by trying to only power on the
phy (e.g. call the phy_power_on or whatever APIs) with and without the
clock

Konrad

