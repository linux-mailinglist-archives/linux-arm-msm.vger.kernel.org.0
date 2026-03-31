Return-Path: <linux-arm-msm+bounces-101121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIuyAAoWzGnfOAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:44:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC5370240
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09DF530071D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FEE38F25A;
	Tue, 31 Mar 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQqFPHPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkGNi9ZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BE338F62B
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982591; cv=none; b=S4EtQsV+3Acxz8l35+zqPNHWvoxJcrNwzeKYQEZBowHeo3Nj2Uj4B5DyUKrJDoR0e95MpAcs9apEH1qZWTfqAtnnzn7ayxlj1IzqXi0jktSIxtCPdj/QJaABQx5eZuJwgz6VjBH3OI52Dn86DBQ9VSLz9YHr4vxkFEnySR+SH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982591; c=relaxed/simple;
	bh=K96N7nNaFMzJ8cI33xDYcKxKaHytZImcOsyPx65LEsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh72REVGJXy472vS6wGdTbDV1vRr4S8hAWtZQlHTK71p5krSUDxAtgTlHGKGcM4+yHsPHTZf3EFS9T/gzjnO5JKLnPwjIOkOIfZjZyPx/21ZLL5sciJiPRwrQ/ujdL1dvqdfeBi6iAgq3RR4LVtlPw8a8bc2vhh9BuyGnkdBJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQqFPHPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkGNi9ZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdUX73239966
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SMdOIbthHq2n0ySGFj2ZWAir
	YYbzuHu09slMTEz98co=; b=PQqFPHPAs/aoYc+1EjsyFI0OiPt7+RbOM+zC8fiB
	VxaGbKJaQ0n2L5ipfejg+9HKBT8T/p6HKKg5lPWumgASjZOSh4W9PtTjqm/znVky
	dcHjcQ/1fDQiJoE51KfCSFHeMSSXwXVBHuDcawPXshbXy+P0WWlRs3TQu309G3WB
	SnTNbhL4lwWvMPm4WzayhMAe1KiU+uBvQwtrL/XrG05T7Ct5DFing3zwoG9VPXpW
	V5YxCMuo9AZ6ciIr+4slDJG1KlS87OIm4/3/Ex8lWABbDffxgG3YUBHjw+3Q+VNV
	JBvgPddCi0fLGMNOh1TVLzeKpbKEvaTDQuRi+zCIcin7HQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ytmnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:43:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso69117331cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982588; x=1775587388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SMdOIbthHq2n0ySGFj2ZWAirYYbzuHu09slMTEz98co=;
        b=NkGNi9ZSFT05stQe3Q24Uoho1df1oCSG9oeU47vVE/QdkiQ5GIwqHvQYGUIHO7Cxho
         VwlNbdQnSVKKLFPZ84QwFF6Z55KNmzzL+4PalOnNnYVjVX40GAgsCSFY/QMt+xmcOswc
         EnLm/qDD2ierfr3WpsN43BFTNNNYtjq0/143xCztNd714bj82Qe0Cl2BhUde5tvbrlwD
         GrBKNR11wrzidFf/B/gcfEbDLj0yEPJcXhC2XgjMSPQBl66+ZVNXQ9ns1AhQhtx1PqtO
         WVg1c89oLdqNUU792twaGrkZqMV8JjSYSDYGus6S12SNUtzaUoynetNwkcN3qHbWqmIK
         ZddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982588; x=1775587388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMdOIbthHq2n0ySGFj2ZWAirYYbzuHu09slMTEz98co=;
        b=X6/9sB79J6GxGmbafdDjS1GbpwDRYRL2KMZRVwNhxmgyx0nl4N+Yy/XcHjnzGUr3Gq
         XhieesxS/U6FLnYH1LSFBExKCFZr2ebgX443iH+6xp3P5TtA/wz8EmZcTmxgG13j6/7g
         ctNmSttDUCyNLoMpGfi0wvrunv0m+uxM3PGZ3uRAJ1b+Ec8LKFShN5o1C/MnZDXSpIPG
         XQLsnUs/l987vmi95xVNat/wDhWjFwCtmf+HDNqLWRRpuARByz5aHqFed+CCSYxLWhWt
         9wbPtLt7xRHd/T4UJxfn0elGPNTZnb1xeMKmAeN8ndzv88/PAS3APWcQ37N32ozvzUo6
         Pvsg==
X-Forwarded-Encrypted: i=1; AJvYcCXth8BFx+PGrbhOR6aFyF5qxzoI6eXc7x5OlqJoo+20cK6LOKkgpuxOjgViy/WDUFHtBBF5bwqdT4P3yEKH@vger.kernel.org
X-Gm-Message-State: AOJu0YxWRDiGNhZE/2wx/dsCnPsn0GFu8F0MVXI6GDGWKzugQn0Z2kFN
	yxc1WSTBEU3g/UyOaUnjaPk/PEnbCQv/8jxdG03hgMM09DZ9h9bNtGe6ZMqkIMlTpXT0RmFdN69
	Y+cH3HAQhUtT2omksZzjNM6/aQS9zekXGyU3QKZE09bgMdF03tbTLTlOFN76PLNqkCihu
X-Gm-Gg: ATEYQzzpMKTxcN/YOUgCnaDlTmTxjG2NDpQ2+AiRS/FwPrR48B/euJ8CV7d0BRVyePh
	43IUnFhvWURHra1n1NN2bpYwT4ccZb9miagXAx2cSGjkSonRG/sIbmp6NHH/4ZqYUAQINi9PLq+
	MPV1a1obctlsXS+TzmHR9u7UbTzEGIRm+Em9Ml+GU/wWycful3qcLK7u4+qbXdraf1eRU5ze56F
	k0SnoOW4j9MyyyqijvCxglKEkM/5fbBR3pOm7xq2v5cncWa8VV+P8PNGMdy/k44Wy76PZEUf/GS
	Ouqu25u40AhOb3wiQ14VYfivkDF6mLI/p66mfyNGV2a0fasE27BgYpi0UIOElWaj2ubAGL4VxVY
	Q6JLXMocv/JoSAEGVpgSekOuJo644khv6zsuTEhYTsGVpRcsQ0gp84x6Yaix9azLcInSoXtTLEC
	Gl8ZbdYceo8G2MiX1a6S3UYbGmLGhW9yV7WwI=
X-Received: by 2002:a05:622a:2e8b:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50d3bb9d73bmr7995271cf.12.1774982587877;
        Tue, 31 Mar 2026 11:43:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2e8b:b0:50b:46ba:d271 with SMTP id d75a77b69052e-50d3bb9d73bmr7994861cf.12.1774982587355;
        Tue, 31 Mar 2026 11:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f48sm23457211fa.6.2026.03.31.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:43:06 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add MAX17048 fuel
 gauge
Message-ID: <t6dgamqbvqp373hfzkdjxi3blgyvnqiwvtzoepwylmakevpgni@qhdl4lf7j2wl>
References: <20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com>
X-Proofpoint-GUID: qsQKO3m25GC8a8OZRCz5VdfldWeM-OHW
X-Proofpoint-ORIG-GUID: qsQKO3m25GC8a8OZRCz5VdfldWeM-OHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfXxX45HKGIfV0Y
 0kLe/7SHzeT++uh205UXgL6MoDsg1EjjqdAQBkeNcVUiIe+sIegBUem7DZUJzUdUEjsDDz73GJf
 InT0a/PZsc4dWGXXNEtyiR/uvIlBXHKac/yWL9YxVcmSC525AO9HKgVqkUG/MBZcM2fK5yNMs8j
 j0dYbRN9odaTYZDGPNTQWhvm0iOoUkC02aXOCxxjMKoydfgkFIPtggf9c0pTvGM9TSnD6IfXMbN
 bRJqUFBmBDEF1+IE9F88qbdgsW9ZlCl+2Mb1bJPXQ/jSezsHSUcfmqbeKqrdiMhNF3V6MY0CIML
 jSbAu8TRnAgYGtedhqci45xUtZvQ/YFAFCO6adElCupXwgDwdxeAi+5l0wLGeFuzftYB4xXN5ca
 uTK+mMz6MEar/hLCNnlE/2jh/1hMdf3Qh5K5jEcn6AZxyBf+E9r2K2PD0v/4cARLsVtedn29YpL
 MMD0Mj/SEfUaVlHwURQ==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc15bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=ahZNpFjp22rXwMqW-dcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310179
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,0.0.0.36:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ABC5370240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:00:04AM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add MAX17048 fuel gauge support.
> 
> Tested by comparing battery capacity readings between upstream (mainline
> max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
> across a full discharge cycle. Upstream reads ~3% lower throughout. Both
> track the discharge curve correctly:
> 
>   Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
>   Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3
> 
> +
> +	/* Fuel gauge (MAX17048) on i2c-gpio 24/25. Alert on GPIO 67. */
> +	i2c-fuelgauge {
> +		compatible = "i2c-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		sda-gpios = <&tlmm 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

These pins seems to match GSBI5. Is there a reason for using bit-banged
I2C instead of defining and enabling GSBI-based I2C?

> +		pinctrl-0 = <&fuelgauge_i2c_pins>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +		i2c-gpio,delay-us = <2>;
> +
> +		fuel-gauge@36 {
> +			compatible = "maxim,max17048";
> +			reg = <0x36>;
> +			maxim,double-soc;
> +			maxim,rcomp = /bits/ 8 <0x62>;
> +			maxim,alert-low-soc-level = <2>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
> +			pinctrl-0 = <&fuelgauge_alert_pin>;
> +			pinctrl-names = "default";
> +			wakeup-source;
> +		};
> +	};
>  };
>  
>  &gsbi2 {
> @@ -281,6 +307,13 @@ touchscreen: touchscreen-int-state {
>  		drive-strength = <2>;
>  	};
>  
> +	fuelgauge_i2c_pins: fuelgauge-i2c-state {
> +		pins = "gpio24", "gpio25";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	nfc_default: nfc-default-state {
>  		irq-pins {
>  			pins = "gpio106";
> @@ -325,6 +358,13 @@ touchkey_irq_pin: touchkey-irq-state {
>  		drive-strength = <2>;
>  		bias-disable;
>  	};
> +
> +	fuelgauge_alert_pin: fuelgauge-alert-state {

I don't see the previous node in upstream DT. Please make sure that you
list all dependencies.

> +		pins = "gpio67";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
>  };
>  
>  &pm8921 {
> 
> ---
> base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
> change-id: 20260331-expressatt_fuel_guage-465dfb3f87ab
> prerequisite-message-id: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
> prerequisite-patch-id: ab8b8d87fd2d518c4c5b5dace3f22238d1abbe49
> prerequisite-patch-id: 47e32e653e520a27770bb05d99135694b0128ba0
> prerequisite-patch-id: 7ef7df61e7ef6476a35811d765f522f793d9ecc7
> 
> Best regards,
> -- 
> Rudraksha Gupta <guptarud@gmail.com>
> 
> 

-- 
With best wishes
Dmitry

