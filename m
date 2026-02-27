Return-Path: <linux-arm-msm+bounces-94547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB78AU4Vomk0zAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:06:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2B1BE748
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8A2A307AFE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28423A1A38;
	Fri, 27 Feb 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+hs2y0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1147A0A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229926; cv=none; b=ak98RPJAVmaktbOET07jifQgvT39x13IJvIJjjUC3BsoyUzoKnKODuQNIx7qDISy4+P0cQt9dgQh+50P0JF7QsBl6RTG+fgvhizZgs53M87Ly/kHRr8xvuXiWMwr9UWQOUCuOpOVvrI0dePv93FLcEfUg+sAuZ6bTYQ+VNCk81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229926; c=relaxed/simple;
	bh=IDj5Rn0oQ9xMORXPoJgzk06haI8L0G7nxe79nTKJ9Vc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FsHcwFKUxJDnNeHK6KDiW8/xvV/jMAqXWERwCX4LoYVHJ2zx81cdhorrneY3M5am5lv6wNQDYffj29c2DknKspd57GQYc77P7mFeZ3kutVVfSE5vk4fQL9ewG5VJ0QfqTDBp1cvOmYiRlnjCZiGkledH6gT+E6DD8WxUku2eAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+hs2y0U; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4399851b14bso1776418f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229921; x=1772834721; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rBgTyc0JwXy7Q9otY3P3GvJm6ra8p82NpxJLudZ+C20=;
        b=g+hs2y0UnHQbARsipKAazQO5Pka6hyiiKq2rNIeG0VyAyiSYHFLeFYAbg8znWd0E6l
         NmXyrB4t4aBAzoGOMHlQgqRIoDwn0zeAzKf+yslECisJGDXxC5Rjp5UVDd74A+vqPUPU
         GYz6VxOYPnCVeXjbV0iLOGsy3JueRzhN9ewDq2OWx7n1Zg8dcTsvZRoDyVJ2eXKVfh1E
         fx5Z1l0+2jNMeZsLEDHw160KyQ4yjh1b0jcR3IJ+1DlTxFhnLwfopQKPPQO127TanibL
         RteZ/jw0LSBpjB585yQY6eZCYVPNTJufJvpEr4BoFoOKyBfvSMLV+RVpmtGdqxFT7y60
         wRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229921; x=1772834721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBgTyc0JwXy7Q9otY3P3GvJm6ra8p82NpxJLudZ+C20=;
        b=YNZS0w3CMLttKK4JFge1+mWrty6itOZUS50QfaSbIHZU6Iwy4amHOcIGVzu4DRY91E
         z7/Fe+1QNs6A+XebBs9XeJgJl9C3qNhj/tQvxaMN6p+PpkFdTVvprNUuVKjp21PR0jcX
         sHiyRq9V5LoQi3Ewmif3DhfZ4RRone++m+VM9HrRZU/JQrn4O3FMcZJsZiKx1xOQxV+5
         jvOSNfMxmKNdjXo+KcVVAUBC7xwE5T4SOevLMqyuFY8Wh/zc2nrkDoZkXK6ygov3V36W
         2DdWkgbPXkoimIRvTJ3kIdlVbm56aFVVV8+8YnV75Kgd5I/PXQBg+LGnA7TaqIxgVGul
         dKGg==
X-Gm-Message-State: AOJu0YznAPeu0MRYWBoq0ZLBzBEXx/Zc6cPn2QmmnNZ5qE8rUD23YRjC
	OX+xuPqOxYMKa/KqdP4jhCwwJDp9KYOtDxcVlbDmS+mh4C8GxLjWDpnwFC9bUDIPJtA=
X-Gm-Gg: ATEYQzzmTzX+X/aBBuyjG+lJ82KZJ9cgJD2i+oOxoY/VvJdDYVoUGWSjYhMYLmnAUDe
	zwDd7C2I/WWsW147fJxjno6FOJ64rLkrENx2GpQyEXABpf2UNnOqBaUG9jQODaQlDkqpMwezkm4
	/JdjdhOgQoIXphABXtwH/CZCw+V3HVNorGC1jSVNRtu0kfepIWY+g3cqK/8b+5Nsq3MhV9kvyxJ
	HuBw4D0g4ZzNduh99ozbv8TFE7hCxXuhF5n19uOGn0qg+Fjxdj8oNT0LKQyUw+iFKaqNDrV1yx6
	b1v9UCB+A1paO8U6sVM8kyTbeCCfIPEIgDDENSOAQIDW0LRJexG5U5ltTTCrHr0mD2JO72YeIOE
	/u6rnCFYNLhp0TAg7j2augGLAoSFbCBwPSKMftcginPb39Ga8v/9CebZXjxBUZhYz6+Uxvku3gS
	pUEQIMiSQxBYb/7DicUK1bx2yNja6wxD5TI0Y2RsUhuAkERuVP71z6GoeZZmiDaGQWDrkaA7PAX
	j5aJ3zKPz6UkzaEywvz9gVp
X-Received: by 2002:a5d:5d0b:0:b0:439:94a7:5164 with SMTP id ffacd0b85a97d-4399de36b02mr7099438f8f.48.1772229921417;
        Fri, 27 Feb 2026 14:05:21 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c71ad07sm9794155f8f.16.2026.02.27.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:05:21 -0800 (PST)
Message-ID: <051f77c615de15302ff7835757c130197df954a9.camel@linaro.org>
Subject: Re: [PATCH v8 11/18] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:05:20 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-11-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-11-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-94547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.2:email,0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 76A2B1BE748
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
>=20
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 171 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 171 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 9c5ebe1b48ecd..5fac814ce0f6b 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -5562,6 +5563,176 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		camss: isp@acb6000 {
> +			compatible =3D "qcom,x1e80100-camss";
> +
> +			reg =3D <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0x4000>,
> +			      <0 0x0ac71000 0 0x4000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names =3D "csid_wrapper",
> +				    "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names =3D "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe_lite",
> +				      "cphy_rx_clk_src",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names =3D "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONL=
Y
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names =3D "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "sf_icp_mnoc";
> +
> +			iommus =3D <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x1860 0x60>,
> +				 <&apps_smmu 0x18e0 0x00>,
> +				 <&apps_smmu 0x19a0 0x20>;
> +
> +			phys =3D <&csiphy0 PHY_TYPE_DPHY>, <&csiphy1 PHY_TYPE_DPHY>,
> +			       <&csiphy2 PHY_TYPE_DPHY>, <&csiphy4 PHY_TYPE_DPHY>;
> +			phy-names =3D "csiphy0", "csiphy1",
> +				    "csiphy2", "csiphy4";
> +
> +			power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy0_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy1_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy2_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg =3D <3>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					camss_csiphy4_inep0: endpoint@0 {
> +						reg =3D <0>;
> +					};
> +				};
> +			};
> +		};
> +
>  		csiphy0: csiphy@ace4000 {
>  			compatible =3D "qcom,x1e80100-csi2-phy";
>  			reg =3D <0 0x0ace4000 0 0x2000>;

