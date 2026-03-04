Return-Path: <linux-arm-msm+bounces-95242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANPAKp+hp2maiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:06:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A681FA32E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12F623022978
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 03:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0F0364E9E;
	Wed,  4 Mar 2026 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTZK/ug8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/hpLq70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D736494A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772593564; cv=none; b=ZNK5lqAS8vxgGAL1enE9k0jFn+ln9dxWsfcfdu+gXQwyJBWWZhQqdLhFMWzr+V9PH3bK8kvie2nlGVQTiMB0cQghJKWFhpUtpfE1tc68wCF5EjuQgd0PwGo6fMrQSVTdKPGy1TYcTrSryDCQmrV2aS9eIfFI7dNGtgYOOdzU8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772593564; c=relaxed/simple;
	bh=WwVC+N0l7G0UP3qE95WD5qZ7Z5fDT407m9RxyJMjz7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=homKxSrSHPr3GIfr6L7USnsE+9UD92s8cFeOv7ckPYcc/xgAXAVclUPR/b6ojtKzY+JwvaQLg/mka4ri3TYt8Mntekt7IMgEhQ9cRdOjgEbg5xLQSqVgg4XZnmXwB8VMj3kxmfalzjsQ7q1DrvY7hm2bo9JRNWVvWi+jNpJVPm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTZK/ug8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/hpLq70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6242RPHN4030582
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 03:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZYR5EVWpVGfwRaK9iWWlNhRq
	Nikp7eG2djRtE0hPVE8=; b=aTZK/ug8tV2FEICmYdzAJUR+zqPMCbiAK5/4OilB
	CMfiF/bU4lUiaSiYOa2+oR2dlEaExvMHCcokCNNFbHmb+8OU2712PGB53AIZ2gM5
	ntfDqDI9AXhk3739AayfYi2UALQflan5r3vv++pPSeOD8/yhCTYXr/uOAwpTl665
	lJCAKbUUjl/JF0hN1/7PJzdrT7vOGVOvZXOjMWu51TcXlp1JW/vX10Lle4N/5BI6
	0UnfQXfmwimoS6dZeEEv0zoqi+M7IGVG/fITjmgzHoBF0M1Fjg3onKAI2Axw+4ba
	adXa0r3DSXnkcdW5L9hdSEV/zS4bqG3TJWkXDqb1YR2VYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu3m17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:06:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so880744885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 19:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772593561; x=1773198361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYR5EVWpVGfwRaK9iWWlNhRqNikp7eG2djRtE0hPVE8=;
        b=C/hpLq70ozPeqtUpfvaajpvjgi/WZMqxe7O7Qdd4QtsCuQk5vM1+clV+q27HM/JN3n
         ZFGak2nHx1+mB1K+ENksjF3i4HfH59YaiCK2Xk+QxhyM6x2ucuifh2XeKPDTUXKKc3Qn
         wYlS4nHCfMro8bQ9LHgNGiH9CgNmDHzJBxrj4ccBajA0XJ1HZ7qngfzFasaJEQhHKodG
         AcF6ZbaDP5cuGB5+j6ezLIdxCzdM6SAkW2ArEdoalJKW5Y2p3MfLVVtY2RboQVUHkgIN
         k+yrFACS/3k4OYr7eS21EODBGPqhzCNtz3NfbQObxZTjjAIBxfP7P24G8sj/D9XdVEch
         QWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772593562; x=1773198362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYR5EVWpVGfwRaK9iWWlNhRqNikp7eG2djRtE0hPVE8=;
        b=kEhXpFE6JerhkApPhp1QdfYMsGssHDDBT+d5KhGzzAtgf/C1BLJrChpw8zVWhgefXp
         LO717PxHN1Fzb1kWot3aJlAqfccUtE9H6aLgNfzSNNy1WTJpasYJBrD9RdbTku+uURuv
         3ReTCbyAO4B0zbmue7UkTRwJ37vLEo/+LvPkUkR1JI5D7oZsFoJ4UvNtM47lzK6J9j4z
         7PFuYh9+CbT74k9jaA3mGRa4V1J5mPJHsbqVlGM6U7PpDK2B5c/3f5+snV3Ryujr1zQn
         XTKLO/5/MPZOxYXSRhtEXDxb+T7IO0A505JWlC2TZHvzrF8XRuHgQmNZHm2oxJVC0Q7y
         ubkA==
X-Forwarded-Encrypted: i=1; AJvYcCWezlActzCsduDk1gy7Ve9xZS+iiyj0QccsYsWNeh2EHtg1KKsbr3/0Vz9S0+5fA/9EiE3df4lXWe/WTAai@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2U9+UdwXpbzz8LKkCq8xQ7cSz8iSlr9/TSCTbi0tH5qpdk5CE
	iXsFYoBSSlJ3gdVebgysWX4s4hkxrOyhUfBdWEysWfeJqL1aqZ5d8dyLcJXL47KKGJjwRF6Plyv
	xyDtSXZjMPbRufUEGY+ppUxPMPUa3n+rTnkOaotHS3OfF8lwGlrs2UEszAugZlsUokIQV
X-Gm-Gg: ATEYQzzZiXRRcMce1Uc/kmN1RS2hbBFzitbH7fXQCCAUy6w9QhGBMY8t4GA3HGOhG1o
	SzuDMDqBSX8LRNQy3HijrQVmR1w3R0BWXA/D8UGfcwsTxaV6/6anhVMD4cSodmqKH21ZCURfD9G
	+rrNUKCEc8qTjxMustJIpNhF1bumfuje3cMx5/1gfa6k9JBcr28LqzqlGxGf9DAjKxn2yfLsNuF
	QABj/KbBUuuPUtrIMr910lA2Zflb10JjrFyFKrqfouzXhKzxgTb7hP5/M+ksF+UOY2oDDtXynwX
	340S+ZIyZqmdk1xUmFsDCUmmM5xNgDLnUYh9vexSTXEZnL+NIhgPiFEgN69Fk7/kPQwtdRI5ICc
	3ebeRQz/pDaA68PTg3YGLl8bsB8PS9A8LrSdsU6/FqSSqfCzAVNBPv1ZVAdLBWYA3LJ4/clu9ZG
	XYffV9YoIfRCIw1LTF838QdLtF9tl4IjDHeOI=
X-Received: by 2002:a05:620a:bd3:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cd5afac33emr77354985a.66.1772593561497;
        Tue, 03 Mar 2026 19:06:01 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:8c7:c25:9e69 with SMTP id af79cd13be357-8cd5afac33emr77353185a.66.1772593561077;
        Tue, 03 Mar 2026 19:06:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357dd0bsm966811e87.34.2026.03.03.19.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:05:59 -0800 (PST)
Date: Wed, 4 Mar 2026 05:05:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH RFT v3 1/2] arm64: dts: qcom: glymur: Describe display
 related nodes
Message-ID: <cc7n4ubnuaboej5uazgf3h4ojzyajietjgbahmsuodoses5vpm@fgq2kst6ijpm>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
 <20260303-dts-qcom-glymur-crd-add-edp-v3-1-4d1ffcb1d9f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-dts-qcom-glymur-crd-add-edp-v3-1-4d1ffcb1d9f6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a7a19a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=GtQPGISGVa-A3H143mEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: T1Sd3iDDAZroEmArNL9igsLsQHVe9SyE
X-Proofpoint-ORIG-GUID: T1Sd3iDDAZroEmArNL9igsLsQHVe9SyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyNCBTYWx0ZWRfX68RiHOzDeIZZ
 dx6qyYwMaQOwM7yEv1ck0whYY/SvMt5LqtOAkILGoYfhc5/07W0uEpMFspJG/P/517acXQehnDc
 ZaT6ndyyBJG8s9t28hmUMXxiUwpj+ZrVvtaInaZHtFFVzykiwqyFTJBL+RY4N/AYCp94Q6UJcwc
 p9UQcQ0ZpR8DSckNotThW1GnkI7jnAc4JuImPMwSTkI9etbYXIcfLc9W5zAYEl0trwAJfuXJs1r
 UVbJMkz42u+YPIyGmBHcK1MWfUZVTOkLu6BuYcj1MnaHybq6phDUf/14KS1y0zH/q7ssbuKZDk6
 nkGhlkxcWNH6HFoFMF8f9rVYBvWK2FQ+W/NrFkdKPrzDL+No1vIMnTW+G6yGJPgpCU6/h0yNeM/
 P33z8f48//pRJRJ93AlawK4uVvVWRQKa5iiqSSb921SVl8xdBk+Blgw5mmE1WirSC2SPRORZdkv
 QGV5tvTVdeKjy04tfOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040024
X-Rspamd-Queue-Id: D6A681FA32E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95242-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:44:08PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
> controllers. Describe them along with display controller and the eDP
> PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
> clock controller and link up the PHYs and DP endpoints in the graph.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 471 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 463 insertions(+), 8 deletions(-)
> 
> +				mdss_dp0_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-192000000 {

This should be 160000000, otherwise RBR mode will select the wrong clock
rate.

> +						opp-hz = /bits/ 64 <192000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-675000000 {
> +						opp-hz = /bits/ 64 <675000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +

-- 
With best wishes
Dmitry

