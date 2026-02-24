Return-Path: <linux-arm-msm+bounces-93857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFgTNCURnWkGMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:47:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20156181191
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7EF3058DC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB10231827;
	Tue, 24 Feb 2026 02:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOHg+c25";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0AqqGPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5FB15624B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771901215; cv=none; b=GY7KD1sMWUN0bwSQcdeJXOZiq4xYzQmlOaWvSuyBAlvb9k1dPUg3OX+VsT1htb+8Z0Ckdd+ZCQUMAYWqcw90u6R5S5OEIE34NOI9okmkF2ZguvSl/IqM9DcvSwdvoLFWO2nZWNRYf9Y9KMiam6+WiJrA7h1ZxfWSZ9d4sGcxPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771901215; c=relaxed/simple;
	bh=qRUYvlXxIZY20zPk8ECsuhVKz0x+UxNCptPuC6juTlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8BSWtXCR7eebT3d1GWdUvGNRSDm/GZjIKM5miuhg+iqYntOXd7F4Wn+t+UPBK6Jz+aUKS9ZEIZV/iviokLBv5wCyFonfKnky5TthZxaWmTJrm8gQeCNu/EJ7zoXngb6iWvrTwphqa0a4trSqSmF30EVpdSR65wwSkh5g2jAwTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOHg+c25; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0AqqGPg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIHmAF322185
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKvDDeqz+mNOB5u9/ZS3tcm3iKJq9M5SZJMjlZE1ub4=; b=iOHg+c25+5djRIqJ
	XGV9nWkpGpWGQPQbjDJW5LBWS3k3RYhB0iralmu44PhSuERAWVaN02ZJ6KJ0ErAU
	bLYr9wNktRf3vHUZnNPt+rkfEip2o/2LcEwzRc1TjQ9aerEayBJsIvE9pzgm787a
	EX0KLSyKUmJ+4MffxPUHvY4kBDFGOqyO1gA5BNCXpWORkrxGXbsghKsqDJPw4Tm5
	sVGkJB1zzGLqbgtkprwl50NUXJyn64mRXuXVZsu4imuPLLwr5m7gHGss+sk19q4V
	kfZp5xPugFHNfGZ13f+FW+fyVHbb0lrfOnmnTGNdUV7b/I9ivuDdi9vC4jTSes0B
	0iZDVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y2mc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 02:46:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso5015873285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771901211; x=1772506011; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KKvDDeqz+mNOB5u9/ZS3tcm3iKJq9M5SZJMjlZE1ub4=;
        b=J0AqqGPgxzKlAH6Be0EftVnrEcdjugpa/YI+gf+bcr86O/uQa75S/ReKdI5THFn0nj
         GlRR7SgwsbEb20MMm5WwPcHy+DSRgCE7ywSIiyegfHSH1CHB/AXqtLfvkALHSgdpJ84c
         vixEDkrKjBqWI9EvDWHv3C8Jq+OVWg868Da+x5Ru+1/ZXHC4Yf82ZbktW6DYzpk3Ixcm
         Jy95XfMD9lTURhHO3Gsv+stc7FMgccL0R+VA1mXd9Cu43t641kVYhVGBOMkgxWhBEarZ
         UKeYE4SSb4tuITIRptqoTmEUqT68JR+JDp472uT4mbbFOwPPEnQjfNFCklNawTd0gn0S
         4ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771901211; x=1772506011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKvDDeqz+mNOB5u9/ZS3tcm3iKJq9M5SZJMjlZE1ub4=;
        b=dLJ9GLnE3UszDtTgR7O8BP2S3HtDYG2fOn3sbEpSSnDXdBvHf+TtAcZLeUfidDt2H0
         TVnou49Gj1pLvAbKjxcuBp4qx3W6zARCdla/Rb9b7/QNuegnQRWyeRHhkVgj1yeEuQE+
         0DItmdE4rDWotxFn8sCEy1hJz0BdfXfH0wWs7jsqEoWqWU2I7/SmcAFF5KUcYcZXB2Rj
         yb6YlbGtLjbFwOyDHCkFC6s538xLC6CjL8nDr9ATc5c4TF/Fg0TQxR9MdwCjeHXSFmEe
         pliMSfKf7rqDvB0xDIoAPQPPTyHBfy+pdw3leyQNOnI0gGfgdnFrN2ELA23HxSRYwc4O
         WfzA==
X-Forwarded-Encrypted: i=1; AJvYcCUFiL7GC667PQKpO0f9mWi2aeB+a9W5Vy9NHXG+tcKnGa1y66TsOl2YnNdJPocmHIj+LHHk/0fOJinHETRh@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXtK4GyZuCiHsCPlESxpA+986gCkdoBqm1ZSii3g8XnoUSIkv
	PRKD8xRhBPbfOn5Q6BgU/x5DTJk1KJ5S1/yqroscdGSJe1dFOIq+ZJ9hk7aWW5B1UOHiNQfiZGV
	pFzktZIz8QjjRLE2Ih485ZQbygUHjsSckCx9atJqtLzGF3X/Wd4M4s2KdkacMtk1dabY8
X-Gm-Gg: AZuq6aJUPdLd0EP5rsf7EGTmk2/ur78uN3uR1EA1XzAkSgyFPjoXO0pCOxWYWnfTcZG
	RX/tXoH8sm3NRkfb3suwBBac9WJqhj6uuecSiMHkmhRCe5a6bvPGWLnAh1wm+erskTngAX+P4Rl
	xLKQf+kkXl/iGgl3TeK0jWcWAsfggq5jEHqSGbQSNZvIJUMSin0YfPqDOjGeTXhTMlwIzVRLhP4
	SyQy2boshhuxzbCggtIsNI9WfBq6+uzDdQq0C0wCrwGj5WBygiS4GjnJxyHV+b5dV7uWtveo0vf
	4RDiXBdpfAKT55eS0KleooxnZKbtLaUQIEkvSPfHgTNPxiVLazgH8iw9WAnzeJkZ8QVWrwMnw+L
	coD10IiubhtROM5NQ5JCbyqrOQTGX7kHcuTDkZF2/JiMqo1r9GcbGulJ1h9P36sK4mF6Ti9eFh8
	Hv6zv7JRmMqtJkwMJgaEB7wpnPb8B3joV58BE=
X-Received: by 2002:a05:620a:4891:b0:8c9:fb65:7f0d with SMTP id af79cd13be357-8cb8ca033cdmr1325733885a.28.1771901211137;
        Mon, 23 Feb 2026 18:46:51 -0800 (PST)
X-Received: by 2002:a05:620a:4891:b0:8c9:fb65:7f0d with SMTP id af79cd13be357-8cb8ca033cdmr1325730185a.28.1771901210619;
        Mon, 23 Feb 2026 18:46:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7b02490sm18350771fa.45.2026.02.23.18.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 18:46:48 -0800 (PST)
Date: Tue, 24 Feb 2026 04:46:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Message-ID: <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfX5Db3crvhjsGf
 3EiGNFy7A/4UFScF47h1htyUYFI5LbbFHgb1T3lODhcjdqbaMS7DySzG2UJ8UtjEY7Y0CdMvaOJ
 UNMw7CzzLL3YlKm732nbZ4qrpHuFnVESaIqIbLX2wJpK4GiGZRlPnEYLJ+1JngX8wRG1S2K3K7r
 /GlZ/M9K4TR+gjDFDo92eebbUoFwv1uWoJrD3cP9DLcF/FvR6zR0oENWZq5hL3dNkbI9d9gVKq0
 l0/QNOlVZlUIZVJALyZwrPsRzwwi8jTJ6uYswvnOTtY2wO43h82kstfyjYREbd1av44Ye2SWyNl
 8ObWyPfb5fVLSb53rsUied5lIaLwcafhU5zxKMd+wkvclVRtsxVZPqIMkccT0CNtFUAyrJNH1MQ
 V0gMl7B5BKz35sPljO1HgTa3SG4MlCKMAMsITLtcHc4W6B7CGrmnb86GgFTzecUCffM8G/46aIr
 3tdjw+O3LP9WTiNXX/Q==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699d111b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=FNN4Il8BKJnmybe0k9EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: HhdlJpWNFSu_mJd73aDj8Q0KIkrBi4Lh
X-Proofpoint-ORIG-GUID: HhdlJpWNFSu_mJd73aDj8Q0KIkrBi4Lh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93857-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email,0.0.0.0:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20156181191
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:24:04PM +0200, Yedaya Katsman wrote:
> Enable the MDSS nodes and add supplies and bindings for the Samsung
> S6E8FCO panel.
> 
> The ldo and iovcc pins boot up with a current of 16 mA, but they work
> fine with 2mA, so I used that.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc455d2235f8e6a9737a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> @@ -82,6 +82,32 @@ key-volume-up {
>  		};
>  	};
>  
> +	panel_ldo_supply: panel-ldo-supply {

regulator-foo-bar-baz

> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_ldo_supply";

Is it an actual name (e.g. from schematics)?

> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +
> +		enable-active-high;
> +		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&panel_ldo_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	panel_iovcc_supply: panel-iovcc-supply {
> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_iovcc_supply";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +
> +		enable-active-high;
> +		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&panel_iovcc_en>;
> +		pinctrl-names = "default";
> +	};
> +
>  	thermal-zones {
>  		rf-pa0-thermal {
>  			thermal-sensors = <&pm6125_adc_tm 0>;
> @@ -128,6 +154,46 @@ &hsusb_phy1 {
>  	status = "okay";
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l18a>;
> +
> +	pinctrl-0 = <&mdss_default>;
> +	pinctrl-1 = <&mdss_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "samsung,s6e8fco";
> +		reg = <0>;
> +
> +		vddio-supply = <&vreg_l9a>;
> +		ldo-supply = <&panel_ldo_supply>;
> +		iovcc-supply = <&panel_iovcc_supply>;
> +		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
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
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +
> +&mdss_dsi0_phy {
> +	status = "okay";

Missing vdds-supply.

> +};
> +
>  &pm6125_adc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
> @@ -387,6 +453,34 @@ &sdhc_2 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <22 2>, <28 6>;
> +
> +	panel_ldo_en: panel-ldo-default-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	mdss_default: mdss-default-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mdss_sleep: mdss-sleep-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_iovcc_en: panel-iovcc-default-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
>  };
>  
>  &ufs_mem_hc {
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

