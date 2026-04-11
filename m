Return-Path: <linux-arm-msm+bounces-102795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDGiAmBn2mnK2AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:23:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C953E0A2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 280C33037152
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F3E385519;
	Sat, 11 Apr 2026 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f118YPds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrHNULzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D81CEADB
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775920864; cv=none; b=fDHo2sYd7NQGRMpLghkzSfElLYXJ0mdNVETh0kjeoU3JTr/Jul/6WjvL5UwoMCn46wG8qEG2erFKn6+c8gIfH0cWb8Exc4qaSrNnTmIQ1o7MKdsGuPayMShi+Zc9Rr3oM9LCle8wRDp1rYC7Bl1fZCBrblXaLJAKrJJ4LI5emFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775920864; c=relaxed/simple;
	bh=2dsnOpTyHGg5d4ByDswOZRwCDlSavjpyCW0ZgxHckxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns3g1zvNENIppFyMQQoPoAtQs8kKhT2+DR9QT0HnVUu6ofYwJiTa07eD5fD7dPqkEekeBpuGSm8uWkG4NwyelSddoHqMwzdSVZzG2FNrQENmLq2pPcgC11c1hlsupo0mmETc8hUDD2Leo1ecQFcs2jf+XxVmUSquouACugq+uHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f118YPds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrHNULzt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7vSiX3337216
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q1aZr1LclelNS9hB5lQ79N/H
	Dg+ucGyWzEG/IfDrNyw=; b=f118YPdsmjQXduKkTKUaAHaq43qXrKcRnoYYjQxF
	n84GHwt7gDNYUFXC2Yjsf+VnCADvVB3wQ889og3Yjdd5e4xKTrUbZJLFrAoVeFm2
	fQpxzlIUtuII+etSe0sVKuWfKYaXNCHWKhWtnfgte8fJCG4/yl4rGH6DtNzdBNtQ
	Bm2DqkEaVnf3WAeWDVVyZZ4T0KBbCi9/0LBRA1sGJZXNYG60FbwEnC+IS+GF16PB
	pJK4v7Wfggkn++PaZTa7i4M/rReBX5FvYZjY23BvUY4MdtgQvCPHmRJYcHJmFCAc
	gpeUTc1BzORqDvbJQ1WJNjYcNnagXz8QQXz2HaDu/lW60A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8kft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:21:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e4c29caso76259881cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775920861; x=1776525661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1aZr1LclelNS9hB5lQ79N/HDg+ucGyWzEG/IfDrNyw=;
        b=PrHNULztL3G8x4Z2qelFjWdzVfkwfLcFB7gv6VOwvDoLnOu1q41JDtNNtQa1bV+RJp
         n92fMfk04Xz+I+B2WqIQozS8JJlpbRBrs1ImjMpFSFuxwZktSe9Ffj2CZIUmPkARFEDl
         6Aw3d+S1ONGU0WiafGWJraTsy7y4rottK1CMWM7A3K0C4/hWnYS/DaRH6V3GbYzqw7I9
         78nFKrgNihoacRKpY1L2RzGPkSp/Oi+8o9UWQAOuXPzDhKtYcOrpBcMWSZARmUq7AYLq
         ONBScuKLjB2dH/lxdprfxiuAGc2HXZeq3HLGlaSY5kO9etgDck4JDfa4Z1vFvtXWsibf
         HUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775920861; x=1776525661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1aZr1LclelNS9hB5lQ79N/HDg+ucGyWzEG/IfDrNyw=;
        b=ksXBrO45IKou6tCr0wBX2Rw3TC+aZ+an/nRYZCNvU+c0DD13+dyOLySM8FNB8KAdzf
         4pO1EmWB4tVR7s1451V+6G2gZaJGl6XGtxBtU3VVJVAD1fUBTIXhkR3r9bZM79nwaqXg
         pfB9iNFBip3rYLhCCehxnwAak/5iiY0ymkNdkNh/jBCMLlx+Wve8Hbb90/K8wmU9egHn
         Y7UM9QhrqtK9TSq87M74UQAeJgLvsVfyxf5gdxI39deHIHeXZJUL8+LU2xR9QZNain3T
         zbNJqE2UhtUYYgbBJHn4Fkuw0zdzG/gw4Zop8LY4fH9N076ccdw+iKyDLmWvMsJGBsu2
         Bpsw==
X-Forwarded-Encrypted: i=1; AJvYcCXIAd7ziF2rUXhbTyiaRSmhOzQEzLBo9hVx4SLD1Vm8fchOhokECmTSdRcgrQlAL0N6gamm+TwjCiJR9AwC@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHrZzgq25VdJ29Nk9nc6xS3c4TDDxD1/z73kacwest+8XaDMX
	acbrk4MrbAcyEV8+BbcE3Lqa1cBiIgUSRd4syGesQqvgHmUpEOAvPVRqItoDxhCzA08o/3Vw7By
	SMDWbo3Sx4UkIkyAb8lGo5AuG+PgkyJLbOMJAPypXW7qvMiboXjY9vWareCPA5k4qcoFI
X-Gm-Gg: AeBDieveONycqknVlSXSKbIXRgkkZcK/wx9RmmtVkAdHmoxpKefd/5DpEq5IqO8FS6g
	5NlrFx5uMjBtg6VwCF4jcfSRbkoAouhduX5U/xFWgPCU3aA4yXlfiKYo946o6EDIQfXKzcgyZ8x
	HbtmhH/+em5e6Mj8acr6gQWRrfgyN6Bf2P52VL1dvwY8XbfpWVdI0UdYFT9nUg6Q+BHd3u8HoAn
	IcxDSvZzpW67/b/0qwR/S3tmeniFMnbsh9uQf9vp6dtYoejYgseli42H9Th4tYZgX3aAxWZRU8e
	Dkaz9xItLcO1nqrl92wBKPMI091fGvNyMmW7v79LUkQR04yj/U7hNXtA2To2l2pf3MPXfgqBE1C
	c5KENctTJGOcXT+qiuNT1utok8H99TIMt3TW7EgL4Z7mB66guHh/FDb8yTLY+ChiRc9IbIUX/74
	horRf1SESHlj4U4T3nlpX9ZZ1YBmPMbfmw5ak=
X-Received: by 2002:a05:622a:1915:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50dd5b775d5mr107453661cf.22.1775920860933;
        Sat, 11 Apr 2026 08:21:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1915:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50dd5b775d5mr107453241cf.22.1775920860525;
        Sat, 11 Apr 2026 08:21:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae96fsm12543531fa.39.2026.04.11.08.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 08:20:57 -0700 (PDT)
Date: Sat, 11 Apr 2026 18:20:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
Message-ID: <ntjffipqq63azsi6sbpz55b6pf23x7rcomot5zvc6adi62472m@bwwvv46faqh7>
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-3-9674cfc0b5a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-expressatt_fuel_guage-v3-3-9674cfc0b5a2@gmail.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da66dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Apu4DP7LmR_xVQy10KIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CpLy3KD99VVtWV5vB-s0pv_JR8V9JSBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEzMyBTYWx0ZWRfX+3dBkGJYiaGA
 FYkV2gjOWVVYRPYBPIaHHQuNpVC9xps1/YXdNrWeosv0kcyq52y8lBULiw1Fxz9dMRPtY4H4c0z
 75/6+R4wax/rVLxQCMpgJLcYZNCpNinSXY5wr/2xHrLo0Sg6Mp6O0i81W65zcBeuw2gKxbbibap
 POMNbRao+tBLmcmo+eN6nTW+/G4ZJqbKvnoK6bgS0ZCzdkLtm1+BIOgCHex6jmnccElt4u1Rywg
 qZufHIT1jRepbOKqQt7y/7cenulAWvgO4Zl5oHyQhLMM1u9OI8hXdM+Irq78FuZiKxzXwGpi4Od
 m5ugGTCqPQII8SDSE+kDjq+KVXTh7le5Jj43vzQyJ9vub5cAOsJ/QmkeRX8ofejjNMnyBiQGYwh
 q8s7OSfa4+2t9vKt7wTobCd7G0bxZ3Db21QZnLLhTXY8nTTolalCbJA/xJSazgArGS4SatY53Eh
 HY1rC3R3AbVP+NEHmkw==
X-Proofpoint-GUID: CpLy3KD99VVtWV5vB-s0pv_JR8V9JSBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110133
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
	TAGGED_FROM(0.00)[bounces-102795-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61C953E0A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:32:15PM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the I2C controller node for GSBI5 (gpio24/gpio25) alongside
> its pinctrl default and sleep states.
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

