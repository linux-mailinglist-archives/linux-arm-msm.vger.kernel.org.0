Return-Path: <linux-arm-msm+bounces-94005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPvsHKjGnWkkSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 16:41:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 842031892E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 16:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B224307143D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 15:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA943A4F46;
	Tue, 24 Feb 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxjCyNNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVJmx/72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0927F4F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947374; cv=none; b=WuhUJTAZ7MGmzfpMm/agThT8E7i26jJD41Zln3A5liMA6Go/+V61EW1L4svUfLMPuW3m7HcdtsKgG8LHbnVR4nA8lyz/2JfdlSqXWZ0AJLevaIDYkQyBxgeFNDpQ7jPrehadEJVFRwYfu10kiJMoVAS9ej7mYu31mkFgwBpptzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947374; c=relaxed/simple;
	bh=DEQoS77XqFqbPz/oWWsBdDJUStiSoe6lULA5s4Qp99Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER16JgR4HsqolXwz1+gW3c7ce9dOLPILxfPcC9Go5SqKk3BzlCWhxRz2zx1nUNbBri7Fj74HCiZEsSUdpfAs8CDJbaOkkSZTGraft7RZAWuSdZhx+mRmFD776eu+g2hTsFLL3o3+vEvc1miESl6khwPPq/PIqzyEkR8s6K7E9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxjCyNNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVJmx/72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OFYaPl061773
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3iMtRmzYhrbg3zCOE+dybfJF
	aHuQmjB1Xzgvd2WZaPg=; b=jxjCyNNHKXoAjqTO1YdLGVzqGwKgDPUXF0b7xXqF
	cHBw2UyXWnmVa8CpYnNK+7IkepMUN00OfIWACFPNI6pDfQmv+bB8ayU7XdebtbRI
	1RFq5qROD6mFqXiFMrG0imBmYYJnTEmMyBwV1wuJYRoyi3hPGK3Krrl+XECgU//+
	yBD5/6je3jeXwyq7otkV8QLsJEFsAQQ9mKKEkStj59nbTsLbW1nvBg4+BwnnkW6f
	iK3SaZnh8JcEZRbTmJ9oHVkxT2XrrooUkYmbKk9AfJhIJVymwIvysMV475LMyqMu
	xBIhJLCt6XMgsJyCzNg/+SI1RDLc2TrF0Wfg+V15t/laVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherj807e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:36:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so4037420185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771947371; x=1772552171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3iMtRmzYhrbg3zCOE+dybfJFaHuQmjB1Xzgvd2WZaPg=;
        b=aVJmx/72sfki7ahfxokXsWorMe2tpJbIrDU2t1kBbHDxFUp4YsfR3BrymXD35NcZsH
         ZN3viOJLxAZf2jXSWLPtFEPuYU5EDYm+ZjaXNa0hkH4CxfVdW/uo2ldRKXF5YtfBDUs3
         B4K7y2S6gb/PjG5j9f472nYOF2GDChf9h+7W5UsqtqyvedVbRKV92vWKg3cyJmyCtZsh
         xUYjvgP8eNujBAaLrHQZSeMzNmeJEa3h79JyvsJbog202Wpqghu0Qeqofd2s4HY3OVNs
         WNNdrtwlHvI1gGgt9Ypz6Uc2QVeHMZ1peVT5xLzsLufJyP3dSOToqLh3FnK2wOLDLjsZ
         TX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947371; x=1772552171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iMtRmzYhrbg3zCOE+dybfJFaHuQmjB1Xzgvd2WZaPg=;
        b=dWisb6YK+hNoef4Ijv8HnJEAC/PzH61J+x0sYqdZXWqxQfQhlaNmBCyGtAZXnqLcJy
         tDUKr1CgETkDyLelTJzGpz5yUXhq9NT5263F4okiS4mZJ2ilCh5heBrVngOYL02hx9QM
         diCylTMXFFuk3dg6RHkqIqsc/Vu8GgZu4ELn16sXXbORukLlMomUw3BSIoygUgTyadYK
         DGdrPlF9cwlx17GA/Ts0XkAEwbj5Ix+5f+Wx1CqKjqSl94cEvoEZouIYFWhD14D0cOps
         lkHspw+CXlETb763xedQnSI6G7bcEZDbFGJTLaSASUSKNS1BKQPdj7qbpgfWzsi/6Zbt
         28Rw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Nj2q4WLb6KLBdCWWkjXduY8sBI8eEWPKOeoDJJcZdk8J76LVjkQHGZkGuEzSuVKpHnW4CaLPAfY1jNb9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/T7Q2rjsJGQXT/Vu/uuQpmxGnHOBaVKdZmh5dXQEzjmDyf6ao
	vE7q2wLNVSDt0Zs8ufOF5WCuV0NYd560pYOOLnf9k7zz0sl2ee+x8kKEvmJmMxNmacp8dp+azcE
	p6ALuX2TyQIV0z8VcUAnf0KZrrvxn4KkD+f5vk8Ld5aBA03B8nPmPidOkvjAw4mZeiwLO/tvMri
	ZQ
X-Gm-Gg: AZuq6aLuWDynew6wz9dozQ36gsL3EG53DxIOuW0r2MvMOdIwwRHPXC3cWONjsKdD57B
	QQmqNUzBVdhlZQKp2byuR4ug8sBn22U0ey73fvVNVN6tvRqtqecYzXEfHh/vhSB/Odgnf31Q+c4
	er8SH4NVoZ/GbkcICaMJuAkWy6+yqTJ81DBzGl8DHoM+tXbH28QBlZivKp58dyfNzEDWa5A7RWD
	r86UOH9BBQ36M1mgoZEh7bW2S+WFWDgNVr/2uYxwtrgdlNmrBQaZCm2pBOMR+ymujaLg0uRrruI
	SY1eGU6HjZUPhXa3ZzxeTvsLgx7OmepF/+49D8bn6j+Y+92pilrQ+MNCb04X7K2p0T26HrnpPMy
	H/+FiDNBbq4r9laBDtZj5RUg1YV/Ik/2s25JsFrpHueuX16iTsLxCjvdfA5Kmx9wnxTDKFzJjJm
	gPcK6vk9qy+U3AaLEePFsGwDt7DU/MdxfsdB0=
X-Received: by 2002:a05:620a:4552:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cb8ca1dc8dmr1637100585a.35.1771947371376;
        Tue, 24 Feb 2026 07:36:11 -0800 (PST)
X-Received: by 2002:a05:620a:4552:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cb8ca1dc8dmr1637093485a.35.1771947370786;
        Tue, 24 Feb 2026 07:36:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7aaed3esm23523451fa.40.2026.02.24.07.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:36:10 -0800 (PST)
Date: Tue, 24 Feb 2026 17:36:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <zuyjfmdyg7dpmeb7blijbshtxnvvztw2hhpxbvhdpry5k7igfn@wgh6twmznaui>
References: <20260224114424.1966947-1-zstaseg@gmail.com>
 <20260224114424.1966947-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224114424.1966947-3-zstaseg@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEyOCBTYWx0ZWRfX/E8iu5YavlmJ
 5d6ryWtKn37DR79GLI7BOJn4eLcmwbVCc2436HxCcmL4LaJHNFWIN7AB86DxZAowrQwClIeBa/g
 ztZqwoVSUecrxmAHahv9Oyg6TTStbCKPDg4KaJwIXD1sKUVY5gbsu9zf9yJ6NXenqCx+A2FXBBA
 ZItNlt1neiSVVj+DG0yYIPv2o1+RrWgSVkl31ShShV8lkGxvusB41+hahL+xQzlx7RBnUNdFAVF
 pgnFH1WhSXJNL9HtfpSrStYm5uAzYMhZ8rbe3FORfTdkvSZQWQE0lmsBN1hGyXb5XfkAk9VQDrz
 h6cAN64fAyzHtc046f3vi7Mph9EZpuzijE5CegTd9l7NOSE17YcBxBJ2LTWG8oDG3iZHG1WsVPM
 Ewkc89zsq/jnEVeMTN7UQYC9dVBfzkXAuPna0fvIM4Gp1Z9qL3BcUs+hci7KWeXD5sAJ2KrBRL1
 amEAEg0GizivOE54n/A==
X-Proofpoint-GUID: Qll4MNDPF8u5GW8d6J53F6HGhGUypaxY
X-Proofpoint-ORIG-GUID: Qll4MNDPF8u5GW8d6J53F6HGhGUypaxY
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699dc56c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=n7UKcF_LFDN_CY_19WMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94005-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 842031892E9
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:44:24PM +0100, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 865 ++++++++++++++++++
>  2 files changed, 866 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +
> +	/* S2B is really ebi.lvl but it's there for supply map completeness sake. */
> +	vreg_s2b_0p7: regulator-smpa3 {

I think this should be regulator-smpb2

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s2b_0p7";
> +
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <700000>;
> +		regulator-always-on;
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +
> +&uart7 {
> +	/delete-property/interrupts;
> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&bt_uart_sleep_cts>,
> +		    <&bt_uart_sleep_rts>,
> +		    <&bt_uart_sleep_txd>,
> +		    <&bt_uart_sleep_rxd>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn6750-bt";

Please use PMU for describing this BT (see qcs6490-rb3gen2.dts)

> +
> +		pinctrl-0 = <&hst_bt_en>,
> +			    <&hst_sw_ctrl>;
> +		pinctrl-names = "default";
> +
> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_l19b_1p8>;
> +		vddaon-supply = <&vreg_s7b_0p952>;
> +		vddbtcxmx-supply = <&vreg_s7b_0p952>;
> +		vddrfacmn-supply = <&vreg_s7b_0p952>;
> +		vddrfa0p8-supply = <&vreg_s7b_0p952>;
> +		vddrfa1p7-supply = <&vreg_s1b_1p856>;
> +		vddrfa1p2-supply = <&vreg_s8b_1p256>;
> +		vddrfa2p2-supply = <&vreg_s1c_2p2>;
> +		vddasd-supply = <&vreg_l11c_2p8>;
> +		max-speed = <3200000>;
> +
> +		qcom,local-bd-address-broken;
> +	};
> +};
> +
> +
> +&wifi {
> +	status = "okay";

No calibration variant? Please set one here and send the BDF to ath11k:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

> +};
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

