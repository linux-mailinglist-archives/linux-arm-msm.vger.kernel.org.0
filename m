Return-Path: <linux-arm-msm+bounces-114770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UTwdGRIVQWpRkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:35:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9F6D3CE4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oeZo7v+s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="L/GVa15J";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37060300821B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A9A3A5E77;
	Sun, 28 Jun 2026 12:35:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD63A4F34
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:35:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650127; cv=none; b=rxItgNJUehFlm7UaQ5Gp2ZQOWJD1/D0on3z4n381kzkLS0g+xln1Kz5dYNjdlpof31c7SV3UyOk86Ldk2g1e5h4HvKKvH/WsMPk+cznGCVJODc6AhXKMM1G6eoQPR2d6nAylsW2UJBHyiWIHvJCm4LHsrkCOUeEf5cRVSr9u08g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650127; c=relaxed/simple;
	bh=49NvDIcC/x3KSwI6tNZPCo+7enIgzAQ5ClHFuKbQwD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS1pybl0qJ0dgVoq2fPmd+2vX7G5gDy0H8rGDt8/D3Oer1fnY4RsWL0i3aa8hzt1RRU8XNv1jbisC/+zpPG7MkB2TmcXveZFw8BIMqPfJhFE7Yf268XnUM4571hictUSYNLXDTLpB/FRgaQBAeyZmff/iAjmndC79rd2z/F46mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeZo7v+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/GVa15J; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P2fa3611307
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SpT8oDlZHMAEx/WC+Fkg7HmX
	1PAaNDKpCSqFtKiCbec=; b=oeZo7v+sFCPhdND1lMHvgm4ftK69/n+6Qjb3Q7qw
	G23mDtwNoBzwQ8lSwVBfBNdyDPv5jaYRHKeiEJsVTV9v73RLR8Q903+FPDY2e7Il
	tC7vXhMZZfFHSUkbXMxgE07dgfjlMnPOU8LhJ80qZX8W4xdR+Mpq9+B4hj9ISIaI
	p53WoqpiW0DagymB6arHOAUJjwtU3RjXkzc+9/3emye0RscqSkA+QZs1YcO7uMNO
	f72Ebf8p+pvNY8TL0Vk5EZfJ2vHn+N0AwSvM5DqiRtx2cAZjmkCVLhrf2WYre501
	9MpGp24EYw5kuDT9Jon9muFvoCW30S1HCGWVWQgQbiwtag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a2w6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:35:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ad11e2197so449871685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650125; x=1783254925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SpT8oDlZHMAEx/WC+Fkg7HmX1PAaNDKpCSqFtKiCbec=;
        b=L/GVa15Jaul4UcbFNYM3Uhc20ZjHI5gtkta1gU192LUhrBCixQfLFke0dn1b12jDjB
         QSNaBb7TVOMiewaTcek/CNuvUy4Vn4qAhMpUTDSWqD7pbgBXSQs94sgOaYMSlRATEcyM
         LKVCBX+1QVjw5kNCfq3bEDcL8kuFLPHeuEt29NLUkHRaoo/zMDl7EDUNNmT3KUc/5D9h
         QZhBvHbX9+n+OpRgx+eNH5PCmrOFFWiW5/NCuMAUEZBbIV/SmnEyoUwX+tMnPUDowSeQ
         tXiB7mMxc0sn2Kcw0UT767wh5wa+P4+KeCIAP5uj9YjXrvYf4S0kCEz0poz3U/wlr9V+
         +3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650125; x=1783254925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpT8oDlZHMAEx/WC+Fkg7HmX1PAaNDKpCSqFtKiCbec=;
        b=EwWGEGQIeNrSOkYeTxfoNT1S3s16RbD2nNaUPGHKZYXlCmZ1GbYH9ciiIhX+VbHPMZ
         W/9/0D4n/OphUlvFM2yMHDv7XMYtDorAH9qAo61UtMeCR0iyrzga49LfJ4SEaoQ90FFi
         vVerOrG0dXqdhM2uK4SfSNMcPHl1wyitTuBz4l7MM0GT8BP5afciH/0Q2q9Xsx9xNX3c
         F8ZywjvmXaNNdy6SlYdONS1t1dRzgje/DpMjhHwqRGR/VQmQozZO33hoMsB+UJwWLbWO
         fSl/7pBEwsLJHX39YQPD0pruIvF/XTExBe3wGBDPpq+jnapBzD+umV1+7U/bDEi9nMD0
         uzsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MQs2Vy7IDqtrvcYftynCjKY2Qf4m9jlB8Zr4E3N94uEjLcIUqqNOW+RFaqyb17yGviN6pZ31X5HsUOlZI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzisk2VokZP6t5Pl3TnCqv+nFwSCl9ckuCkuiAH5MqtUdLnIjVq
	mKS6QeBAFGtt2qKhAK0C4UU6LeFqKmR+e/4OlGQlPffoUu7xkuZQUhVLbKZqXn7oxu3s4Tfmov+
	etL0dTzyD/Ro04TqBdabyb8+YHlrrFk6ksr5R7uwpeBJrHTw8hkocntkoc9qhoyUty/qf
X-Gm-Gg: AfdE7clufw6UavwDxW9i2ERcm7kQDAVMtg++sZ0kJ+COB+5xTnPeKYpc+AE4Zuy/Sl1
	4kZP1NOjN0z9ZaxpR+5AIfg/fB0lUYU4aDECY6GDbIhDXP94O1iW9tXsWOSqzWirymUgMVPESl/
	Malr+lrdILO22xu18QMm9t7TUs+/0yQaStW659W6Pg05oUorgqXg0lwF/ZqIkDJEqizCFgvj94m
	4U98lX2huOOsyCajEVBV/2xUIZ2RSnEO4rAW9sh0Q+EwqDfPtkyIoKGhK9J2j6vDpUK62aIMowK
	sk8gnI4w4pKNH840KlYLljRpH1BKrR8Ai2OzX03j7yFmxBX3w0D8zWv0RuF6xCJciAzheYs8/qY
	RGCLSrbEKZY68tGf2ceRTgqneZXVn5hWGTJq8e1n17lA7eqJk8jyTrgFOqcaQwS1npxRMaWSzi1
	qAKCG0uvs/udIMccgzvZ7bjnZO
X-Received: by 2002:a05:620a:2951:b0:915:c858:7d1c with SMTP id af79cd13be357-9293b85ae97mr1996431985a.14.1782650124621;
        Sun, 28 Jun 2026 05:35:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:915:c858:7d1c with SMTP id af79cd13be357-9293b85ae97mr1996427085a.14.1782650124202;
        Sun, 28 Jun 2026 05:35:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156f23sm64732571fa.27.2026.06.28.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:35:21 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:35:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
Message-ID: <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfXxVdPL+u3rN2I
 tpBzBXdqzJUHpIzley7EPLy9QpBYWcbvSNxLKqoQH27z7UQ3HH3706uUE3S4ce/QMrju41OMKZk
 yznNqs+v/RvyS6JdMXXeMkyI1szRgXwjPVgNQbEqm+Xk553k2tix9FVL0rqdlaf4P0GY3cZqXMD
 oR4wjAfY6fv0SOTW7OL7CT+tsSZPVrARooN/woKf1LsHN0rAIVw+EalN5nfW+bjC/88gtlU7EAV
 1kc8IHFtyh4SvRbbbHpzp1vHS2FDE0yhpvg4SmuSh7z4u8SMc4bewJNka/1ViFaPlRY+KRDqI+S
 gUTd3YpNi63k/SqH+UmGeVmcKky1IvgrSclTzGLFeuPtrVKx3oG/qsWfFKZ/Te/vWf4wx9XttWR
 juKqJayI2/pGD4Masv5WSffkIhirxrRc0scWczbTnbq1aj1UWO0hvLMD1MXI2camtySYcmOx3Qb
 Spdf4H3pUKfXuu5wT6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX3LlYYxAV6PGH
 jLUFg5ZPi5MNQyJYVvSrhhLo0YtoqNYqs95BGz2BVMg2bwUgZe8Z5mr3LwYZZyznYh3AIy0atZd
 HO0pH56u3W5r8aZAZs9BHqfuKRyGvs8=
X-Proofpoint-GUID: yNTuu7a7qnyDfaqMOB_hb-sEw5fDztDg
X-Proofpoint-ORIG-GUID: yNTuu7a7qnyDfaqMOB_hb-sEw5fDztDg
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a41150d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114770-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,lldl2cztbqi4:mid];
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
X-Rspamd-Queue-Id: 9EB9F6D3CE4

On Sat, Jun 27, 2026 at 03:31:35PM +0530, Nabige Aala wrote:
> Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
> DPU display controller, DSI host controller, and 14nm DSI PHY.
> 
> Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> compatible strings are used as the primary match with QCM2290 fallbacks
> to reuse the existing driver support.
> 
> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> from mdss_dsi0_phy.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 201 insertions(+), 2 deletions(-)
> 
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "iface",
> +					      "core",
> +					      "lut",
> +					      "vsync";
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmpd QCM2290_VDDCX>;

Don't blindly copy bits and pieces from other platforms. No, its' not
QCM2290.

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +

[...]

> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmpd QCM2290_VDDCX>;

The same.

> +				phys = <&mdss_dsi0_phy>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
> +

-- 
With best wishes
Dmitry

