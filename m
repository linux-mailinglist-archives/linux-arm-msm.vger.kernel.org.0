Return-Path: <linux-arm-msm+bounces-92831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL1HJ7Gpj2mZSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 23:46:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2C139D80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 23:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC2E7301C966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 22:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2201248880;
	Fri, 13 Feb 2026 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXJBaBWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1kM180S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232D27FB1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 22:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771022765; cv=none; b=WsKg15yU4VC9CkHQrBXtnyCRrOEIdXDlPO/aHA/lZ8JjDtp4e2HAlJ4+7DoN9wTLSa8DWKhGOBkOOXvnXonjYPHSlzdz5yRIPJjeCYqnJZKrBvL0TNE2BclaQ1JuvtOAFns+a1NpOBfTYJ/A+4uevbiepVcjqFT9Z0pGYSQH/5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771022765; c=relaxed/simple;
	bh=knJBdqPjVtEV62c0/GHhHaUpxoq6PevP9pwkwQcrQXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPIMwDRJdsOsFECFXEjgGVdnXPJpvcw9q8tLnDknIM2jrpCLe67DGRc9mHk0rKByUd/ogip5Hg8aemBCPTtGx5HMad+8gg2pgkIzICQUMd6tlS2lxJVd8qKgLLmwtXyJqRhaN5dpze6xgm55ezegU0W/q/XNGDwQyCgJ11wPwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXJBaBWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1kM180S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DKZqWi1827712
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 22:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3SsDYUO/omo5M8jNjG2gaAOl
	NQh7/M+BuNJyGGLsXeE=; b=VXJBaBWEJSeBXk2+pKZW/Dyj5r9h7dypGiqmo5iA
	mrISmWKXpPCs/3B4fsYgD8lWfOD3EMNXfIed9ZDL5vTONpT3TBuYkvfyR9PX8M1b
	hz7OGbS4Si/VPQXMTF4rMjDexggRKqjoWti+D4yIdfU75OunRBTrH1KsXzDaAnAE
	LIyNgdg+cLAeo04d7Wl9eJAZGQBCCxkno/u7w94i+5TcBNxjrGmybXwa38Xu4N4b
	gKe1A/ASiHVw/aR2g5Zv5NO61mz7Q9g6O55BiF5hW12ijl2xPBVr+YBRRAGfpDaU
	p0ez7ErsXgDASxeQYGypHxSf42/C4o6fz0+R6MjD62r8Tw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9wg03kg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 22:46:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896fb2fb9d5so69771336d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771022763; x=1771627563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SsDYUO/omo5M8jNjG2gaAOlNQh7/M+BuNJyGGLsXeE=;
        b=F1kM180Sv/8d23+2m5cN+Xj5fIpYb84ZMDma3m3AiVPuo543WJej2yqtyum1ABHMA3
         frVM5O2cyqXvBU1Wk0DNgH814+m3IB6umUZk5S5YJo/IH/+wE2jDaOkLritZAf1bRoB6
         5yY9btkgoKGTVF30jAGYep3rGKiv0ubXUC0tmXxTmF7USQRSbUPpH3pZj39NaAVg66lO
         7Q7jbGKvyJwC/J+q6/4fGglllhhT2R8LvAIuS6/GgGWB10cnErABZ/fpA324+VEnbux3
         NA8ArmT++sy66SbZLhsnpUl8fGwdTircrmhAwacaYNTMrl4KpK63ydOYtoz4joCgNLiD
         KQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771022763; x=1771627563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SsDYUO/omo5M8jNjG2gaAOlNQh7/M+BuNJyGGLsXeE=;
        b=xTadz+xa/8bsRtCpaSmXVp5R4TxoyjiT0gOko5jvZWULJWdsNkm+5/tvqXX9ThVvYv
         PsIeJqxzwks/UecnR++yExcKPRYyQT6ZdFnhb2tix7qItCpYoxj5ecV9IhwxrLsJZbZm
         WDdAuk9+X7KdgB82Xa+WFpPLl+n/+bdnmjV6VNFt12PCnovtm9UlSZoXKDQg+8KYP3WK
         dBYgumBSl2I6Tr9qzC0NKHpZMfZWzCtjqSDTASz66NaLIwibsqmjfmVmmFN7rQmQC0s7
         0YjzXQUrc2Unk/WgloKl+4tazUsYgnB8DZ8RtPVsrp4q3etg2E/lb+v+vDoInjIdLwp5
         S4/A==
X-Forwarded-Encrypted: i=1; AJvYcCVXRfVyfCNBQhlbFaQ5qb3tcT6VYKG05CGrkavX5Ngi0eh29JHO0magiQfB1+uF3oEV2Lr5bc1BNi3rsBV/@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSZGBdpWZS/M8mrIn0KaCWNoqfsONqQJeRdmEQLRvxehoxI97
	y7E/liIdAAb8Y3G93aakQ/MKIvZTuFZiUTNzd/Aw+9oy8xA3VdSNkyciJL6mGjzvLeiN7iK4fO3
	r9Md2+l9ZIxoU9MUFwKjYzPVOstVN4ybTqUOixczY/Wwkk6tYyE7s6V1VRBwb89kiYNZT
X-Gm-Gg: AZuq6aIoGSPm5Qys+0Ajo51htwAggzHnXTNIzbfvohPSxCzL0DFCL/djlSFje/DhGVQ
	ZtA8j28Deqw2FBbSi2ZPEg9TCu14nI4KKBTXej83hE7qKGSOvesSlMxSnl5wlZo4AziUDfErWvJ
	CO0rSHiyK9k3jDurSQbfadSQbydyoDtJ86qNj6/GZbfvjVI0HXU2qbP+IofpZHgr6/nvEg68du5
	nN8RjVgJCuhelSVyPd+kUncq7SvQETdouYNtXdJH/TRPqFJwQIcQWgXmS1X6GgXLyaMATtJvDh1
	tcFIWFEsi74H1PZ+a6Se8+GnfR2wtE7JSJoZ73OHEIdOfjaJhNDIj/tpb4QBX1j59qjUIiUb3Ur
	2w6WN9z4haEVmgkZlX3HsSV0/Aa97HtGAmlfgjisFWetJ/X/2BDdnJlHAhXoxd/HatdnkFOylZD
	ChflBaTxnynedc2V0OZzh6D4DbUMS4MCaDsrI=
X-Received: by 2002:a05:620a:460b:b0:8b1:728f:952e with SMTP id af79cd13be357-8cb42269571mr428793385a.31.1771022762593;
        Fri, 13 Feb 2026 14:46:02 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:8b1:728f:952e with SMTP id af79cd13be357-8cb42269571mr428790285a.31.1771022762117;
        Fri, 13 Feb 2026 14:46:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068925besm15182931fa.4.2026.02.13.14.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 14:46:00 -0800 (PST)
Date: Sat, 14 Feb 2026 00:45:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm670: add thermal zones
Message-ID: <3ekefztyorudtf4xcdcamoyxjrgylaszemb52qmqgoxflyp3jb@6gi2levlz3qt>
References: <20260210021607.12576-1-mailingradian@gmail.com>
 <20260210021607.12576-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210021607.12576-3-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE3NiBTYWx0ZWRfX5hv6VyQXnhk1
 26lXgLGm105hs5eO4B1sYpEAJt18pctzBM1fqbTkivpXJcWEnwaro9+2GsrSSlZ/bl8dYrhh0At
 pqu7MCmBjeNJ8DV97lYWCk7kdjcjpCfWhdlTc6UAO6iNzAFPLT0GDovSY3wohkOy+YcCnSGE7gD
 I61qtw0GSCPOFZgkKzsxoy96BKM1zfeQy6t8MQXfhuAKNDjYb4mR/2sOgZPMbBv7vdZMWRqeSJH
 sdxZLUkqv4vJm5H5x4Ya70IRTgrUUC5YnB6iIG8mbE2O0hLIJamc/eoy+iJojhcr+cl86UDb/qu
 fsHExS0tODk0MiDaMHTd71+yzq0dAxHnmfz4/cQuZG+fJBMN+XsBRm6EMJ3+EBilukbYg0QWYam
 Qa4siVeKhoJzmDaStrb53Po+H4OKJPeesZEo9oytmn5lED8aNEcfJSaONvE2fA/CJ/m6BRxJkDz
 dDTjKhk7FS5QiMqqSWg==
X-Proofpoint-ORIG-GUID: 1rW6ac5G7WNB_IjiFuMZM6BUQZ6bRdWT
X-Proofpoint-GUID: 1rW6ac5G7WNB_IjiFuMZM6BUQZ6bRdWT
X-Authority-Analysis: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=698fa9ab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=fwIEsm_0hnujN-Tp9KwA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130176
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92831-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EEC2C139D80
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:16:07PM -0500, Richard Acayan wrote:
> Add thermal zones to safeguard from overheating to high temperatures.
> The temperatures are very high, but should still be safeguard for
> devices that do not specify their own thermal zones.
> 
> For some zones, do not include untested cooling devices (although the
> GPU is untested).
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 558 +++++++++++++++++++++++++++
>  1 file changed, 558 insertions(+)
> 
> +
> +		cpu0-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens0 1>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Note, use of the CPUs as the cooling devices was removed for SDM845 in
favour of using the LMh. Please consider switching to the LMh device
instead.

> +				};
> +			};
> +
> +			trips {
> +				cpu0_alert0: trip-point0 {
> +					temperature = <95000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				cpu0_crit: trip-point1 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu1-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens0 2>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu1_alert0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +

-- 
With best wishes
Dmitry

