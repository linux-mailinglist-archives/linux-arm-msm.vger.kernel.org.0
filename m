Return-Path: <linux-arm-msm+bounces-41387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B906A9EC11C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB0D188A6F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 00:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1482BD04;
	Wed, 11 Dec 2024 00:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rocketmail.com header.i=@rocketmail.com header.b="XeZDEnE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1A8489
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733878393; cv=none; b=AB1dRySNJt/Igl80hCpA3o20OvffrqcdUIxntUC0biYVl/V76iN7FUJZtvlIjMzPBtKGqt1Kk+HneSxYPy7tGiY+aNM4kZn7hR7QA5jumn9h0y9Y35tznsU1W1qENdeVD/zX6dKZCWgt6CB3zMdYQ3LaoR7nqdioHz3lMOUQdiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733878393; c=relaxed/simple;
	bh=LqHuqGpa5Grtt5aFubFwCo6EDZhmWlFfdhX7oG1lIrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWyLlPlj9tEzsTqKcb6oMXsEvsN1QeI1M5pBGLxCu6vJDYRmzbzLjgsdNNAIXfGvNM/pxIxhP94RFyuxOeMy1DD4ND7a3IpAwKpHDXzy9u6PixOsFLVO9qshOd/PSLoMpzBt1WRmXE8WL0pYWlAyYVRhvYLarYU38lAmg+wGbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rocketmail.com; spf=pass smtp.mailfrom=rocketmail.com; dkim=pass (2048-bit key) header.d=rocketmail.com header.i=@rocketmail.com header.b=XeZDEnE/; arc=none smtp.client-ip=87.248.110.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rocketmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rocketmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048; t=1733878389; bh=ktowREVGtv7pMwrhJAmbO+gSkvzC8xt1bBOXkRHQ/Y0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XeZDEnE/0q9FfDYJ99v76L29vtFncuQi2guHSaFkMNOjCVhCdaMLmxQL8iRzT2+Bl9pXcx6J6MpXvgyh3z9LH7MY1PQhMKT2i+9e/+19b3RoLq6bLt47bY116eaUxc1R+aOxp9L18mmYA4mD+BZ+VDmbKH7k6CskjKZjIEzUEvjnaYQYjwTFFSKaLIPuUHHnLYCGGjfSh1mBmuNn7GfWb8oUS18i4h/ud1YJ1P+/8tQbpZeKFynB+sHSzt24b/vrAL5ihKPDl+rNk2rHNPie9EExjSFNiAhpfdFw+lVlqpYQQOx9SeendVNQ9ZBNmTKYSWyTpE4s5JK30SdJhmKSnA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1733878389; bh=vjS+Dqfl1N6hwLTjSBtgSarju8FV0wpRRCmp+swdAA5=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=e8JdVz2rF9OxgVvTdF5/VKKL3kSM+ZlHxqj3aYnA77az0lUdIYcRVvlHO2KUz0a7hn18LAbtb4XIdE+aN0kaNlsa+wQHUMAEUrOd9AHpAYxPZhmwZJLgzfQB4KnJ6Z5jF1fDIMI3ZYQi+3XODR02XOpx4aKGXXggQCU3KQOyh0wTvk1kwzurHCMa2upmaTlD4C0hmi1abMYAmDTAPkVXe/4Iu6lugCCDP4PO6ldORiu2PDin4/0BMSpiRuJb+55LSu302kDki8+m+33TLXMJTF/0XmDrApgwbhMm250Q4ZfoHVZQwSZ9tQYeAaQEbw4JfEcLjfO61wG4Q1g1neW3PA==
X-YMail-OSG: R_zHgkAVM1lgYkaRnSsW_vEoALixplc.az4r89GopFYXnIWIdp4fkoJ2UmjDnrO
 ah7_sV0NsBPgOidKoqWEHmfzs4pd3d7eLYtFDiUsGAoodhCW105W_SIeJDiwc9_CTJZWmzFKl1y6
 fx74Q02cejSST_s0JB0J1Nx3xfNQn9LlbzTginX0Lj4JriZmPq0z0IjnMOTGOrMx9O1CK_DBSh8B
 DbMWjAup9m6Sd_VVoN43.46GfSy37fT8ulgeXycWsXG04w3.s7aapXqOdIb40ezGiwIKPA3BtMtV
 HjIWffiPyR_cjBGwLl5i1ST_scoDyZC.Mv_RdqtRKjYv5oWxYQiJLK68iQTqJbNFhiICVssy2GZg
 MEt4oJQvnSmk2NjUthGov_6TeIttD6uTOAklOvLG4fpaCP1rna_khx5_LU4BBMR8jkj9kxRc2DHQ
 verhYPq.IUD501kVZnzVX3s8bQNTrbIOz9OWDhMMqcj1HXp.wsoOOGe.ajMLRff2D88s5UZwZ68j
 khCbA9XK4PLnVEmq0jdqB91NFgqo_aQtHVgMXNXpHhK3CglTVZLq4d89pJ2fNGV2_2cdVqBund8t
 4o.Nf8e0Fjl9ZkTSuVgUTcz41te9Z7UXXPQzCRR31wXl0J0Q4wJRy1tPGTS9j9tNKq9Sb8u5iBhT
 .qAqns8zbFA5ek.2SzmxObim8NB8kVA_XRJ2eb70lXdTh1qKznP5GE5c2bmai1xdK3CTA.oFWH_9
 oTz_jnZQznAcOHKFV4C_oLpM17se1GBDCoZ4d3RR3TXg.iXoa2Ek51m5qcxneurAAIgR0ySpXcFJ
 8rKbEKZDeDND1elSI.q4vg_0CVdpNksMLxgwUx_MBDys6JqdYG7_qOIewegRAbDNDOs4nAxAFJZS
 mlWRI57KZLoRYTdVCl9H2mqBtF.PWIK2oOKKyrDSTGk1NPjHaw7_GIgWqTNjvpHKTDY84ClOsSew
 P5z8YxYEdeTbUh.vcyPDZGgcvoNK1pvtcM4pfjXgmQKTHnMEYP0vu_rMpRQ.W7gURPUGTk1qlgRR
 oL2Va0clphmjonzkMksGo0dhTPVrvaysbHhIGzk.g4KILELw6sfr3YMzq6zwo0nB2AJUhgNls57K
 11BkXske5znpwsH6e7s1X.nZxKVX1Ls4V1A.pb_Lbc26cMR5AHeT2dwodl4PFxD7QP6cuLLslRBt
 sYN01mpUPldm8bjxTt0OdwlTBAvNlRwkA6M7eyjSSw01dEwlpYDwpydJAU0iybVc91iGuK1cNWk3
 cNwxA0H_tjkxslvOV3q_buHAPt1TeZLPi9.4d62j2qfjeb.cRuy8ThtR01LgOaMqXjTt6xjzjqPB
 43ldJbiMrnAFe9vDds9DmDfgcAFk8Oh2jhthjjkzir80PKpaioEn49oaTnXcesyuj5IASMem60XF
 2PkVVewasoBUDFjlq6WtdLt0I.EAdkQawt.wIjkWxXyjsoIkEzW8MP3oFXoseTUAshyVnT72At_b
 PEQLErHlndwobqWxS_usglZT8crjSeAyR.MBOK22sDhFuRw37ddW4kmCY_qVrhoCIJi5BZEJUndt
 AEy_YCTZwVLAnE7HA4TJw3Cs6aDePhHZk.ZukUchymw2Drgz57BybIWfSfQ4QEChw41oF7QfdTYi
 .1go5SnNmKIPvGF6QZhpSnMiSszG1zEKl5X28o128._7g56koUvzwdBIUkrPLmN21aLw1nFNe7c8
 r8qCj3GJKVt3o92FYQOVcPfZuoxnHjGgVF_uhW3Lyo8WDjNvRajBm604atBT3j.750e9gLxgNXAW
 UxFqzWO6Q06U844ZwcFim2rPNcISLJtZDE4TDawkrmMgV65lLTL6mXsHCskOJmgi6XF.0Kd5PTNM
 QlsHwg1ANBcG.T80az0HhpJ5UrdcdO.x.mPTNWBIWzldor3GtPDyorAVfOi2ftFAI.MIPkf4x04f
 A629lMBLZCNDJcYP2wCg3U8YRsI4uG03Ap2_IIQfP6H5hofYvvW4TJ7W9NgHnk3.jvW873lNEAxG
 KVuvZIYUXqiaeHWqC0Z0VPRjD_TO6d8f2yqJxwnjfMAzCXCBUCq4fUGrqDgT5iLjWsJSVPD_FrpO
 c4kwDMVU81BtBAxH5oab3dFjXpx2h8pVb6njA5njaKKQjOXEs3UWClEW3rpaB8wLsmA.5DZcby3n
 dqBQ0XrXjRMKv2V5Jl5E2ClG8XDzBCUPPdZTSXRUa3Gj3l9sSjMh9o5Hv7nU5VI9pximGhQlkFMJ
 Sojd6DLrhdWc7CEzRAU6oUgKpCzeS7Vu7GFUrL_LBx_MCMfQ.qLMwtxST_pFCEkwEMLeuPnG6tQD
 M2IOuKcR6JjgovUbBPFp0QhPhGiR9SA--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 9d8cd608-909b-4f61-b1d3-8cc7f4afe820
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 11 Dec 2024 00:53:09 +0000
Received: by hermes--production-ir2-c694d79d9-zzg9t (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9eebe7d30b4fb4bf596e1406d98945ad;
          Wed, 11 Dec 2024 00:32:51 +0000 (UTC)
Message-ID: <d377405e-4cad-4c2e-ad38-8c0323384c41@rocketmail.com>
Date: Wed, 11 Dec 2024 01:32:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add display
 panel
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20241114220718.12248-1-jahau.ref@rocketmail.com>
 <20241114220718.12248-1-jahau@rocketmail.com>
Content-Language: en-US
From: Jakob Hauser <jahau@rocketmail.com>
In-Reply-To: <20241114220718.12248-1-jahau@rocketmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23040 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Bjorn, Hi Konrad,

gentle reminder that this patch is still open.

Link: 
https://lore.kernel.org/linux-arm-msm/20241114220718.12248-1-jahau@rocketmail.com/T/#u

On 14.11.24 23:07, Jakob Hauser wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add the Samsung S6E88A0-AMS427AP24 panel to the device tree for the
> Samsung Galaxy S4 Mini Value Edition. By default the panel displays
> everything horizontally flipped, so add "flip-horizontal" to the panel
> node to correct that.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Co-developed-by: Jakob Hauser <jahau@rocketmail.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
> Patch base is kernel/git/qcom/linux.git current branch "arm64-for-6.13".
> 
> The panel driver was recently added to linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c?h=next-20241101
> 
> The associated dt-binding in linux-next is:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml?h=next-20241101
> ---
>   .../dts/qcom/msm8916-samsung-serranove.dts    | 58 +++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
> index 5ce8f1350abc..caad1dead2e0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
> @@ -321,6 +321,41 @@ &blsp_uart2 {
>   	status = "okay";
>   };
>   
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&mdss_default>;
> +	pinctrl-1 = <&mdss_sleep>;
> +
> +	panel@0 {
> +		compatible = "samsung,s6e88a0-ams427ap24";
> +		reg = <0>;
> +
> +		vdd3-supply = <&pm8916_l17>;
> +		vci-supply = <&pm8916_l6>;
> +		reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
> +		flip-horizontal;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &mpss_mem {
>   	reg = <0x0 0x86800000 0x0 0x5a00000>;
>   };
> @@ -330,6 +365,13 @@ &pm8916_resin {
>   	linux,code = <KEY_VOLUMEDOWN>;
>   };
>   
> +&pm8916_rpm_regulators {
> +	pm8916_l17: l17 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2850000>;
> +	};
> +};
> +
>   &pm8916_vib {
>   	status = "okay";
>   };
> @@ -425,6 +467,22 @@ imu_irq_default: imu-irq-default-state {
>   		bias-disable;
>   	};
>   
> +	mdss_default: mdss-default-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mdss_sleep: mdss-sleep-state {
> +		pins = "gpio25";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>   	muic_i2c_default: muic-i2c-default-state {
>   		pins = "gpio105", "gpio106";
>   		function = "gpio";

Kind regards,
Jakob


