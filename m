Return-Path: <linux-arm-msm+bounces-113781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s2WyBfHzM2rNJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:34:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D19706A098A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:34:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KDYlyd9h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WvZmZF8Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113781-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113781-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 179DF3092B3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037773FB048;
	Thu, 18 Jun 2026 13:29:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525023F9F26
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:29:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789360; cv=none; b=FGE9mh+vkp83ZHxvegw1hPGIsedmIQIyA78mibKLnIlGtHidOwRnZ+OV4XyG0MuiikJcvo9oJ/fKaGjD6JePmV7eiBHrkVu6TovJJGeeTS0cWB7by4OghQ6gjkFaiqtD6O0bvR3qRjmS8w2+OMvhq1HMflN1avJoGOm0X/jaFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789360; c=relaxed/simple;
	bh=mlHHjNKGYQGNjY5v8lTGaasIrG5x+Vk7zbuAseigc2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrMLvBOSVUVC7xfeSSrckrMuADggOQ3JoygHpK7vhDjNLK2of4mM7jziiZBPnmSliUE+o8NJwA5WDqYbXmUtF/mJ9NRXK4E9e3W4s8r1PXtDtWZr06ssQwsxn8dwvJ5GABFxnpAyfYTazb4XR4/iwHfUEPsHSHpHueP8Rbw2xBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDYlyd9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvZmZF8Z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICrsRA4026984
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbTxqabv9BTt+Gi+0SMc0DCQCI22NSxs9fC+qa6TN8U=; b=KDYlyd9hT1kV3IXt
	YW1lt0/NinbcVT1I6plb8ipoe+bcPvdBnLuaibWd7nm51B3msTTiWq0uhZ3K/q8j
	WQT0A5XVXkQu5pd9KdKKTsgVipgQTl9LTh81rUY1xIpAWYR+dbX276OfkSHdEk0U
	5L0u9hZ1QIfdDzVSqPq4XEXUCMZBDsnD3jrsF33j0h1g2XsN5rmuUG/c2vhsIbzc
	OpGDG8u2ASbNzX9r7p5mQwUOA/rlosxQ2Rmzqs1kOEnJV4m51EEGu04K/qUXxUlT
	nToiCdq9EaAvthp9tCBrIUmnDJfKkBbJ3DOAdclLANc0nL9t1u/Dk5LpLAL4Cwv+
	m4LB0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk3hx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:29:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso18234885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781789356; x=1782394156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbTxqabv9BTt+Gi+0SMc0DCQCI22NSxs9fC+qa6TN8U=;
        b=WvZmZF8Z/f23GfgBMyXn2vQv9ixk4FbbMpi6kwDz7HV3iPXnD8uvfKXR1NHYPj3dgY
         Ghmr+f7xZVhFVPWcbgSFrNbTDTlm0gNiPH+/yzj/WHIxrMMJsW8d83qKL+dElKdFpz8I
         vUAvPbSniTvI734HGTPKMPGJU559Atd9fRpVrGeFu1Cel2uKLHSB/SjrLlgOxqBy9kU1
         nYkZe/bRNYeumcPFdSzzNNZMhv+TcMtjXxv4FeM8YH0Kdv3hPJxUaRwXlqihyEQNMoQU
         Y/RNVwo72XluvVNNJCgei6hsWHVTLQ6ZEI8Bw4dDlXuqvS5/LmOPOQPTzLv0GazR69ic
         Z1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789356; x=1782394156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbTxqabv9BTt+Gi+0SMc0DCQCI22NSxs9fC+qa6TN8U=;
        b=OCrXRsp98RBatf8MnDkEi0bCVev3W+G14FYTQZuWFx2Wlhowi0Rjd4OBmldY03LoY1
         EzKQXPVjxcmymX/0p508e+N4oi9Fb+NqGiXSC+rU5Q7x5b8nnQKUBP8wdvsWx9xupiV0
         3i9NR4qAYKa76x1+8rWwcbpyW3JHYPgm22waw36fugsfmV261It9NTVm8ZM8jM3raf4S
         MEGKuP5/ZPqUjWHdlBc48y1v4uOBzFmaATeSjF41FDTQLuC8BVdO2nRZHU+21FwTscs7
         0kz7qr4ik8EehgW/TuzkAvVdt11kd1C7iwKb+hd/WFXS8br8EIvvEK1SPv+OjMCcHNy9
         MtLQ==
X-Gm-Message-State: AOJu0YwpEV5F09SUcQ3Xf2EMa7aMcCV3yNi/rtO9s4MtrSO3C8yd4gX4
	uBHdLr9Bvg0qhys6WRQPDrj9KIxOcYr/Zy+VOX9TW4QKHoX7CoUgmSMWAovhT+yYbzokO1prZlo
	sqyjq/LCuZ4utHAEA0ZMXhvRfX4a9O6TEi/TPNWd3GK1mB3beSU7DkCYBhdELqg5giVN2
X-Gm-Gg: AfdE7clw48tB8R3GqHBOagQXqitv+Qk4exj+daUQPQhC6M9wFlPW6Uk8Dao/zjz8Jxu
	k23VkxhEc2MpWiVj0jXQMXyTeCuym7EiZt78nG9B76hbs5Q/g1xFFP+FBF2tm+HmUNV0HAxQ7zl
	NL+kZM0SUsANZ8SlKXF/3xDWNU25UDKeqVqWWA6Y92Eqx4QFhS2T0D1gkn54PR7A+avReRcGl+a
	9f4HKneZogBW9aJ23s0z4jJ1v5OutFj1C2rFe72FeY8V+2PXVEvhj8jCDz0V/UD3rUTKLUuANjC
	dHDk9GizYXxqSG/g7yIooL7VqRJjsmwG1+FQQFqPRNoTE4uY2tp1kajajWUP9NQ4kbeLKeK+ZPO
	KceX9j01heOuZBpwj9hj67SWn3cGYmaKnrZE=
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr773859185a.1.1781789356353;
        Thu, 18 Jun 2026 06:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr773855085a.1.1781789355838;
        Thu, 18 Jun 2026 06:29:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c08234bf58dsm44455366b.29.2026.06.18.06.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:29:14 -0700 (PDT)
Message-ID: <18467cf7-a487-42a8-b2e6-b994da8ebf0e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:29:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-qup-pinctrl-v1-1-8950644af141@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-qup-pinctrl-v1-1-8950644af141@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dv6I4ZH_XIxiCLtUKx8f55GQ2K0ZSd9U
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33f2ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ksxQWNrZAAAA:8 a=Q99fjW5FZU2odprlntsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: dv6I4ZH_XIxiCLtUKx8f55GQ2K0ZSd9U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyNiBTYWx0ZWRfX8VNJfpzy4ujE
 hrtm64g3JDyjtVhOoT+AJpPNqWcmlbMIMfb2XbQIlM4yzDFOoK6tfqmYLymuGlAIRAgPlYci6XV
 ec+4c+08EHyBo9fIscSWnhUaVbeM6ds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyNiBTYWx0ZWRfX0bjGsnipaQ8M
 S6m8pidxdOMAEnOGcfJ2Rg6NeraC4+Ffp4LMMWtJTICne2Lw3QZJ7BxRPXEe2hsTorwkfthVpPc
 XO1kKfS7QXdXn9R3QQw7ur5kZblkecgKxQVMTR7IzeL2tELUiA7+AsaHWVev7a72VLXb2t1DTSN
 iWtorH3sD+q1bUQHscf/laVrVtiH6s9yWhXWfflDnEFWrgn8wZbb2rDqVFcbIwSYdGa43wOyb6s
 rrTD2QOP4iDUrBf8xXsnYzbjaIv3Q9o6IH5DFHPOIXvj3nj53qiGCDHl4wIhNdTeaK7GT7jQomk
 e+gIB+X8Y82TnKOIdi3VGh5Xy4khMQkPRH4ABYmzyYD+ZjJIf2NbYWNSwKytbpjYbpEh3AySyOC
 o1fZNwPsTj1LfitXaWkrmgRTmmLcG3vjUFbrdQ075KPfoJHPJkIJRmE4779zRS7LUg+hqRU39OU
 gnDXuWomsgdz7q/jgyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113781-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,radxa.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D19706A098A

On 5/7/26 4:44 PM, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.
> 
> Move UART electrical settings out of the shared SoC pinctrl states and
> into the board dts files that need them. Update the boards that currently
> duplicate uart2 pinctrl definitions to reference qup_uart2_default and
> override only the required bias and drive properties locally, and do the
> same for Arcata's uart18 configuration. This reduces duplicated pinctrl
> data and keeps the shared SC8280XP states reusable for future QUP users.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +			qup_uart0_default: qup-uart0-default-state {
> +				qup_uart0_cts: cts-pins {
> +					pins = "gpio135";
> +					function = "qup0";
> +				};
> +				qup_uart0_rts: rts-pins {
> +					pins = "gpio136";
> +					function = "qup0";
> +				};
> +				qup_uart0_tx: tx-pins {
> +					pins = "gpio137";
> +					function = "qup0";
> +				};
> +				qup_uart0_rx: rx-pins {
> +					pins = "gpio138";
> +					function = "qup0";
> +				};
> +			};

I find this overly verbose. Let's go for something like in glymur.dtsi,
where the common defaults are defined. I think we can even keep the
bluetooth/4way-uart configuration default as 99.999% boards will use
that

Konrad

