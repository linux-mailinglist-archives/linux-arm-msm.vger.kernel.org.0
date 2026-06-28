Return-Path: <linux-arm-msm+bounces-114772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l8eyC88VQWpukwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:38:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A46D3D17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:38:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m9Z9snRZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="F1UC/owj";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0DB9300CBDE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CFE3A544E;
	Sun, 28 Jun 2026 12:38:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E72417DE
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:38:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650287; cv=none; b=k7cWUbf04H1QQUUgmoISTBPwu96UktiOJQDfbVamPzoM368bsCuLdCo89UCDLhBe7v/JUhjOrt6O+SRH1Tq2Fv9sr782xjfNLtDZI9Oajgsa/oXlnG950tyYSo5CDCAXODhlU51cPD5RMa/D9ZY9ZCx5nXtiyJBd0O5+zeR9pR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650287; c=relaxed/simple;
	bh=yz++YvvFynwf10mUVCyVXaLp61l1CvG+8T9djnRbXIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo92QxokfFuA8Ehjv4F5kSbqIjzGnrPObiXb7o9cXzcJlLhps90SwoUorFd1znkTpmaslkkEuowvqy3fFxinHHWqfWo8peZMypuVkm5zvj6vTDR3LqvhUSi+EN7B1DId6TDyZj2M5Cve81whwb4AMVoZkndfvtdPJ7Vce9Zd+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9Z9snRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1UC/owj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9PpNd3626761
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zc/j1QLWvpn2G0HkthyPFZLZ
	K2+orSup3skrIePvboM=; b=m9Z9snRZUSYj4rviCbXfBb7+ripczoXZYXqOzMsl
	XcO0aBYuhRZ40sl9CBw53kxaL1wQhhumOUoBtgUYZ2pNVhKKZFZmFcyOn0o70NqY
	YwTpKW3j7mVgQT7FDWW19GldpX2vhy4MhGb7Y4WqLPuzOmZ3eUFhKnbM+kf4xXrx
	qrQEN+pe1Tj+JwqMp9Hng/QaP4rBk3uEIQ3KCwHdGGc88K6gSLvsSnm690K6ZDlK
	VL0N+8Hxb0tduvSNMcf2A07G0KZEvH64e9JsXYiJNgtL9CQtppY2mFpMMtyfRZOm
	an8J2eVKYcD0Y8jMQOH6k/ce+0KdTF2Z0RypStAIemg8vA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tujv9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:38:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b447639d3so169776185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650285; x=1783255085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc/j1QLWvpn2G0HkthyPFZLZK2+orSup3skrIePvboM=;
        b=F1UC/owjXOGQKBrNbGNJe/ElRtZVTgO15nO4Ay/tMpGc2+ZAcAMjViZw8wKkeKntP3
         JA2MJ9C6wkArd2BOgqwz9pli8cHSh7/u02adsCFfcq78jxJx4n5oTjimqYB2KCwOOAiO
         VH/XgjUwWSZuBfWtBkyzdADGT2nz+rvCaOvOEUNwrFITAtcJefLeKxWbV4dQV4xQkFrA
         kSMAY1GOXOWplDzw3uOKrRzwUMz/AjmpIjSM2eRhNXEZFUCb7rKlQ4Ocaq3DuG2UzPR6
         J7v9P+P/fDoRz0bL5SVtSmmsQ7TqDww7zaPvOV2QRGlXayZXYKDKd7MngB1k5M94B28w
         9Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650285; x=1783255085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc/j1QLWvpn2G0HkthyPFZLZK2+orSup3skrIePvboM=;
        b=c6eAHWc2TNOvPLSdP0IYAi5Ecg7pNgcs0YADfLrzUgidTCy92/uVHuXjRDBXUfbJf/
         jak5eREOrn+YLheB0XndmkW7he/p5sB5AV8jlIv++XmLnu5BD7dfGWnKv6W+ihrhCSaJ
         rENZ2Yb2BbUjb6D7S3haotBuqcgvftopSDA9nvpmoeOlwT53LXOk0kRki8RFETinzweg
         7PgztSNJYtjRYFFhLQSokFurkOJAiL2NydXthkZyOfqUQJjC+wVqSD9V2l/rERFJX3T5
         zyClKLhlg6oA5m9alwtr78NvwSsKMSMgYWmYwQ6Kfj9pLEKoVZkd8Nh/V+xFDVCt4hVn
         bpBw==
X-Forwarded-Encrypted: i=1; AFNElJ9Zn0+a1qabR8xbQKFGkLTQTGt2SVAaC/Qd7kn3mBhvwrK/0zxu2YOpMSC4W6YczmEQZMB9cCS4RNKf2VRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xn/NVA27cOikbnXINPGI9qTbLEhmxNUa7B4uaBURKzw/q9NF
	DsMQKbUVxT7Fo1uyLJ/jphwn6m/Hd5FJczMlDkQrmoJEvPhvO8V4+22roqExnjDw7V/mZeaP27i
	3MyOW2tPSPBhSvLX0Mcf2q673Z9RqyLvAt9/Cn7I5P9U7zemF+gxC3aMDJwwgf+gSbBmxIll/EK
	h5
X-Gm-Gg: AfdE7cnoycW/mQhtwqHXEXiBY/auHPjZSxd0l3kblwdqKAwdd32C/nCVNRxLOLUA2j1
	OAXVvdE2JMmqoTZoTCba6FvoyWdNdpZ8ySUeXzh+vE/lk8kxiieGOpN1ks3ewTM3ZQ6ZAVocG49
	+Bw6FnK+BWODayLlqd8H2Nlw1MGZa5lmXjjaX6o1FD0s//Oa1pBpDsUfXUt6lGPb+vWX0qOOc8K
	pe314QCnV3HlJlWGIslaDbFZ4GZxATeFm4uAL3s1G32mKX58vbuMxkTFZ4QXO0xNSoadPLrvX0q
	FmpV/xlJ7gJ1JHUItYmDY/JEtz1lSusUBHP82KauomWPXRPxx5DsQlnwsjadTnR35TJ6nupDDYm
	cMbGZJeleer+qjhtxiKy5Pd2QLlY+W66ul7HL4jsCvUsi8oVSAl9C8E2CZsIS66za97Bi5vLuGc
	5TJNzLd6IIt8+BD0lmaPeOmbGI
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr1043024385a.68.1782650284767;
        Sun, 28 Jun 2026 05:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:92b:67e6:8aca with SMTP id af79cd13be357-92b67e68d46mr1043020985a.68.1782650284174;
        Sun, 28 Jun 2026 05:38:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb8822720sm129700e87.5.2026.06.28.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:38:01 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:38:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Shikra LT9611UXD support
Message-ID: <dlozejklrptk6itth2znyfklonwemgnbwxzn67t2dvy5ig2g24@3g6nnvmqw5ja>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
X-Proofpoint-GUID: ugSfiNRtQZ-lYaAL4QgK3O6YwGxg_joH
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a4115ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Jsedhb4udUXVVV5JfpgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ugSfiNRtQZ-lYaAL4QgK3O6YwGxg_joH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX6IdbWH7Q83MA
 k44VwsWVQ4NAooSNBD9TX674h+Rr66lbbtxFIKGHxT96RWEDY8iRUoRZ4THJUuwzN0NmXEo5ITO
 McSHwMbnwr67UU8AfPTlOIcCjciWAiShMxT5QCS8kNMv+TBslJgwh8VUPb1LLiAR2UrjIreHtP+
 QEsWHpoEuE8DLSAezFzGyVFjGKAn3rwa7LxtHe/RhckkuQviJzQzbPyr+Zw6BdVnjSSulb41npz
 t39b9YV2qSdx45umu2qDyTpXZUJd1wSM6691xJL1H8CgD7jrpjy8GAP8amEGBYTB8e74mJOSO/4
 RGwO7b2O2M0K18lqMmY5WRdOnBm4BihITtBtsqpIjIcPbo6cb7PDGzXJFYxelNW73gfhapND8G0
 oChCQBvaNnl8LbLznXM9xstolxJqoiY4+VPIJkubRaMzmiRNMOdDUAwDLkkWIIjY7Lc+uOG+j3C
 JciV6F/HUt1Yd26L8YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMSBTYWx0ZWRfX9DFayX/3gOBN
 qxrs3rIUhcDks8nxXUQnU/hscQZIPT/9GJCT2lUrHMqpUZBt5fdB1iZc+wBhGl/e5FyzE+YMuQw
 Cq+sZoQ3LgA2ypT7yHYAzZku/N379rw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,3g6nnvmqw5ja:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 792A46D3D17

On Sat, Jun 27, 2026 at 03:31:39PM +0530, Nabige Aala wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Device tree changes to support lt9611uxd hdmi-dsi driver.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 ++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index fd691d53a0fa..9cc4a1c6e4ed 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -23,6 +23,36 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
> +	vreg_lt9611_vcc: regulator-lt9611-vcc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lt9611_vcc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hdmi_reg_en>;
> +	};
> +
> +	vreg_lt9611_vdd: regulator-lt9611-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lt9611_vdd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
>  	vreg_wcn_3p3: regulator-wcn-3p3 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "wcn_3p3";
> @@ -68,6 +98,78 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&i2c4 {
> +	status = "okay";
> +
> +	lt9611uxd: lt9611uxd@41 {
> +		compatible = "lontium,lt9611uxd";
> +		reg = <0x41>;
> +		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
> +		vcc-supply = <&vreg_lt9611_vcc>;
> +		vdd-supply = <&vreg_lt9611_vdd>;
> +		lontium,port-select = <1>; /* PORT_SELECT_B */

Nope, NAK.

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

port@1 { reg = <1>; };

> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm8150_l11>;
> +	status = "okay";
> +
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +};
> +
> +&pm8150_gpios {
> +	hdmi_reg_en: hdmi-reg-en-state {
> +		pins = "gpio4";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		bias-disable;
> +	};
> +};
> +
> +&pm8150_l11 {
> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */

I see this being set for all EVK boards. Why is not a part of the base
DTSI?

> +	regulator-min-microvolt = <1232000>;
> +	regulator-max-microvolt = <1232000>;
> +	regulator-allow-set-load;
> +};
> +
>  &remoteproc_cdsp {
>  	firmware-name = "qcom/shikra/cdsp.mbn";
>  
> @@ -103,6 +205,26 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio76";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-high;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
>  &uart8 {
>  	status = "okay";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

