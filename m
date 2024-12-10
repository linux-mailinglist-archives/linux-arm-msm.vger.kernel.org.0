Return-Path: <linux-arm-msm+bounces-41257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 812BE9EAE23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AA5A1888216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908FF1DC9BE;
	Tue, 10 Dec 2024 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXLf2MVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DAA166F0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827124; cv=none; b=Aw9COFrvFrr2JD3qCG4iyymUGEhNYUz9UL5tNH70MXgAQt7nByocP7m4mLUYroBzkerbBmWlBKgpKj8/cnKPqsJoKxzwXJXi9ZR8rgRej9t+o7dPzMz9/iXEOWpdz2F7nq++j3wuJUGFWLnEKYDRlRTLhzO58EwGhb4WpdgwYEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827124; c=relaxed/simple;
	bh=h44+dyKGKKuqJkpvjJETwC8EkeHJa+UH7zPpXtgHUvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqRqRma/rJctLlsnEuOPDHoeGbzMgt75EAqaSCx1SB6vj+lopar4nxzAeq+AgM4J+FsVCNOA+WTQ3jewAKc0bDTtLYXGx4EjqRUC8f22kcVzev9SFzQm2UhGPAs8kkf0pexc6eNsWRU4o3+mo+oSrBRz92OTcD241xjWHlh+pwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXLf2MVj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so23492651fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733827119; x=1734431919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+XZK8mlHOVAhY/lRiEPttNWsrY1uEn18gobmjnDJZnA=;
        b=KXLf2MVj5No6UqCigv62I4CufP6uXL6xAzzTvIlahlB2D8pHgNaUNefEqOZqAcSGP0
         3qIQRiQKi1XnQx9Fe1K5IUCmD2Apz426iXk3ywZuAt9Q81zTLOkmt4qFQU8Dm0WzGFFX
         svCGcxW0PqEB6L7a/KEPQAX3GBaaCjkNa/AG1a1AcY/MUpyIJFuLUQu012eWGWXKR65N
         bXV99IgYo/pML38NXcWjXMDj6BQUJzBo5hajAFfzwLf71j+VFQZWa2NgcuS7G17XFpf9
         3zHSDDqvJNKfRImpprA74t/y7tXGcZb1uFlhes+ry5XILXQw7s/M7TYCQK+grJ6OA/yR
         SZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827119; x=1734431919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XZK8mlHOVAhY/lRiEPttNWsrY1uEn18gobmjnDJZnA=;
        b=ntROgBVvYSepoId7AE77TTJaFpjGxrKmpNiptn3Gq8UFxheqeNDKqJ7q6u1tZIfWG1
         lSpAfAyQboAmckYDrPtNeWuKu9AMWC4JbPBSeAroEXUyLmnB3he+GCR5Kopwg4CjD0Tj
         8baIfE54sH4Gh74W4E0SculF/tM5PuVyDR10VzeZKUy7xUmE7wPtLKMT+PalcwVwijgT
         aswlOO5K1xXES7p42GUL4xQ/54xu7yhZbUazg8MLXmjpLpJqrynHMjZqcOtsTpg8xPL8
         KAiRL2hrbzo/p70aFMyPkfolzZtTn4RBlzVv8KbuM6cVlLIk7N6mEQLiAjJ/ClGGzikk
         fA1g==
X-Forwarded-Encrypted: i=1; AJvYcCVTf8bkW3BjsDe3POk1tt0j7lIydZAZwKpTEANTu2oNrEy30D9RtbEnUHcCsZuRcIX6c85od94/bPWJ9kP0@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5YUPrnltAfLhu8nQJkocBqp85lBaWW2JrYSGOeKw2R1hyB8+
	TQH08PeFL0BC4Q3jcgUGYiAuNr39x3x7nhvLICd2OgiB6O/+W9Z/M7/VXSc7B/HcNWJQeFJE01N
	ImsI=
X-Gm-Gg: ASbGncskKNCycqmTOhl3019+QP+UQD/QEoNOkP2HN6cqO5P59p2DBl/uwOzwAVNvrUu
	mbTWk/astkCL8kwk6xYhGjHxEGtUj2B4uKvL3ZXXR/gxbRaWmu6Vw0n2nfQJzTpMdTklfOmxwXt
	12S3xDLuKDXY+I2V0xlWHcYoUNXr/e10fbeYap+7XAU21fesmscnDWpReul20RlIeSzE4Ye0qfJ
	2prSNwU9NbfwxN1lmXuH7jfVAPBJgviqIdGkZbuTtZjrfu3B7FcVSZwIsdCBFSMOMoNQWcqcePO
	dmTBP0oU5TISMXDucNPb8aTQFlCzn7LF6A==
X-Google-Smtp-Source: AGHT+IFwNunZUPzwt3T0CqWqQAHy20Eg37A0H8eltYTc4tnYVPfwbB1+UM//AWLsraLtkpPIouA3OQ==
X-Received: by 2002:a05:6512:3b13:b0:540:274f:a494 with SMTP id 2adb3069b0e04-540274fa588mr411966e87.42.1733827118749;
        Tue, 10 Dec 2024 02:38:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401eb916bfsm640174e87.252.2024.12.10.02.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:38:38 -0800 (PST)
Date: Tue, 10 Dec 2024 12:38:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fange Zhang <quic_fangez@quicinc.com>, Li Liu <quic_lliu6@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add DisplayPort support for QCS615
Message-ID: <5tao3qowqb5av5bhvwn4l3bfdumbfgqcvzxl3doojhjtd4hxsa@yc6wzmx5zets>
References: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
 <20241210-add-displayport-support-to-qcs615-devicetree-v1-1-02f84a92c44b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-displayport-support-to-qcs615-devicetree-v1-1-02f84a92c44b@quicinc.com>

On Tue, Dec 10, 2024 at 05:11:05PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller and phy configuration for QCS615 platform.
> 
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 107 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 105 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 0a629c44e960e38891f48a8a021b86a6c1dadea1..dbd6eae267d7470d9b9a6c303eac03b64c3df3fc 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -2889,6 +2890,7 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
>  
> @@ -3002,6 +3004,107 @@ mdss_dsi0_phy: phy@ae94400 {
>  
>  				status = "disabled";
>  			};
> +
> +			mdss_dp0: displayport-controller@ae90000 {

Which order should nodes follow in DT?

> +				compatible = "qcom,sm6150-dp";
> +
> +				reg = <0x0 0xae90000 0x0 0x200>,
> +				      <0x0 0xae90200 0x0 0x200>,
> +				      <0x0 0xae90400 0x0 0x600>,
> +				      <0x0 0xae90a00 0x0 0x600>;

0x0ae90000, etc. If it is not written in your company's "upstreaming"
document, please update it. If it is written there, why didn't you
follow it?

> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dp_phy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&mdss_dp_phy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&mdss_dp_phy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dp0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss_dp_phy: phy@88e9000 {

Also misplaced node.

> +				compatible = "qcom,qcs615-qmp-dp-phy";
> +
> +				reg = <0x0 0x88e9000 0x0 0x200>,
> +				      <0x0 0x88e9400 0x0 0x10c>,
> +				      <0x0 0x88e9800 0x0 0x10c>,
> +				      <0x0 0x88e9c00 0x0 0x200>;

0x088e9000, etc.

> +
> +				clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
> +					 <&gcc GCC_USB3_SEC_CLKREF_CLK>;
> +				clock-names = "cfg_ahb",
> +					      "ref";
> +				clock-output-names = "dp_phy_link_clk",
> +						     "dp_phy_vco_div_clk";
> +
> +				resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
> +				reset-names = "phy";
> +
> +				qcom,tcsr-reg = <&tcsr 0xb24c>;
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <1>;
> +
> +				status = "disabled";
> +			};
>  		};
>  
>  		dispcc: clock-controller@af00000 {
> @@ -3013,8 +3116,8 @@ dispcc: clock-controller@af00000 {
>  				 <&mdss_dsi0_phy 0>,
>  				 <&mdss_dsi0_phy 1>,
>  				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&mdss_dp_phy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&mdss_dp_phy QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

