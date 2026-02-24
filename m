Return-Path: <linux-arm-msm+bounces-94004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XfoYF3nCnWmsRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 16:23:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C22188EF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 16:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A161B30055CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770513A1E72;
	Tue, 24 Feb 2026 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksOR/Agx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1sQjNP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534239B4B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946610; cv=none; b=BwJJch+6V1Oe6OxfYIorLQpjfW6NXeoWS48zZ2/sqxKpsSNWA3AXCj3vn1WuZU5n7B3/VbI4Y0Fe8aGYUG3Omv0njrCTCWnDp6nYKPCy7vzQAZkZfApS/OnI5c59TReYndje7Pv0uhqCdF4YwH5VDN4EsbY7KS7c04XmwEWZeiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946610; c=relaxed/simple;
	bh=/DYZw3AqVi0HQFvijkQ+vQHOy/zex5fgGfkRBnsMJu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSXwaEzYBP2uDvEYZRp0AA85rNJ3FJAHvRDzz3CmUrYzgigR4ix0ZFV2zjgkNOG+3NW5i/QrIqIIM0TPhGQLAMgsNq8k3StQPTuVCX3Ij2CJV73DqCTxFRzV/h6fhj3dPUd5ECbvwRCCKj/herW6dOS5toEpZyBCWUz7ej9kOfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksOR/Agx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1sQjNP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFM1R3324615
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q28D0qIiT56rXz2RxXIvxCmq
	8mmHIJrA+524DFPK59o=; b=ksOR/AgxdUpOfWrPq7kyNAhiQaaURE3j+66rmOgo
	vwCFX+YqsS578l1jtJQxaAa4jyld0tnLJENRhMY72zbTYlPMYzkxsLO/x6I1kZpV
	SHsuqV09JEkj2tYCTXRvnaRcKp148uuJKKbe7UV24pngiLyNR+Ht7t5Tx47IGtCC
	ZPA4Wkh6w0Yp811H+grvVRn37PNeOOmXa7flt2mazNzUbAeJuxQeTAg7pJrvI5DI
	3Mnb6qlpwi0j1IQl02L3qWN1+UDQSWkOicIC7nqErgkUxXGLCUc79/Diklof8o3l
	gxrMkBTGTG2+PlXk+Qnq5otQe3mR+QHUANqqcxiLYKyz7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y4q7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 15:23:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so4453392185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771946607; x=1772551407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q28D0qIiT56rXz2RxXIvxCmq8mmHIJrA+524DFPK59o=;
        b=Y1sQjNP9PL8oEFEn78rI16vSAW8MgtbfoIOSHjioWiX+6HobjDtHJxwkUR3xnK0Qjl
         UrmW0NfBjSLi31pbuw8OVQn1oO0dxzHTRmkA96+wj/EebeVzL6OtVm/BdxhBMnl5r44a
         2cI6rg3qppDM6J+Zrku7XVJK/mkBvL4Xy7Wt/X1jNCp2UTWIBZU9/vAJXGLtS1j5n9DD
         WVmvByekBdYeO56t9g61XdyPmLvTUwcyp3qPkezYn3GfD36TbIefSCuMwOaXAMWqXLbZ
         KZaTs0zA6Ja5y7UcYglcvtuyJKlJutahpIcm940AHZo4o9hYOaao+viOhzNOSReK3hGR
         swPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946607; x=1772551407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q28D0qIiT56rXz2RxXIvxCmq8mmHIJrA+524DFPK59o=;
        b=l81Fc29ggmnJkLR00C4RghwNU0s6lfc52hLOYfQqSHG7vWyRBLKbBPB6QRhcjkiFGH
         TiBmB26nRxxYXl0BAeRP6GaRXsBWhgHG1JSaEo2m33YEl+4yEFAKc4wq28x1heQzm2Ch
         r80eNsa6q77T8RWFLYnqKPVFavpir4jIoKowdru50nUd0sW3h6OeIiQD2+TZ5HD6N8GX
         NrwCm8lkTI+z0ffAzMmyPnO+cIQ/8AqCfXfWSYyNqSxNVL6aS8lwcHF+vHnmYXbZmMjU
         eaqpTSAYT+0t5+QKiYLXnMQnYyKUAIHsKGYiW3Oq19wvrgGaK1HTxh95JTXN3aFn45eL
         Bt7A==
X-Forwarded-Encrypted: i=1; AJvYcCUw2Xy5/6/s4J78Rz0QPaEvjcFw9jyH1tfQqytIgAbe890tU7W7FoUmEmF5bqndv70slT8kCDpDiTK5Zvip@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/s5adC78HHKO2Ddh4uXYC95D3EV0LGHA0xHqSF+VH3a0meSsp
	0Kl06BQmQb3IDUK3cGGNRaJp36zYw4UG4mcCjqPKbw9h8LorIGIMEeSR08Cyl7BX7Ztmuewv7FT
	Jh9pUF5gLsBEvJRpXH3GA9MkmKt7tdY5+xPjNqVNKHk3cp8wltaLVY4TPasrmyHvivKlexPWP+i
	8P
X-Gm-Gg: AZuq6aIQLfcac6gvJoju7SLntYi7nL5u4vDCpijuBObZSTIOLAf0MshE45ukHzmLmSn
	rdtW3LDxZCxe8D1z4um90160YnhS/jPknlvxgAH1QHA+Y3oaNK+CbLlD/mKEgElriydyt/qj4Er
	6hBL5BIbBGGwkSeaeWIFCS2jZpPaU2NypKJleI8YhEKFi7mhZqu5zvC/2QoWAD3GidWRlxNZj5W
	PTNQtAPi4vx03R3a7e3oFiUFFqEG8inQr+qiJfW/O/z7Pplx+GD+LftrLSOXnHCIIEnZ00PBu2k
	AClmDgpISbX3PHnZObsWb+glgq5I6nLuHAJTTwHhC5SugHXmQrcRbibtPCFWtlzxdLNFHzdGbTH
	nuzGhz9h+gSHtjNpPaSdEdoSkPF50eYcWoBr0mYebAzgc1VeJefyjS/pFmUzrMwL6yRZCnLBppg
	Xdc+z+ePvAGRCR2+iQA+9tuboi+Xb0++3iK+8=
X-Received: by 2002:a05:620a:c44:b0:8b2:989b:efe6 with SMTP id af79cd13be357-8cb8ca0d840mr1594975385a.26.1771946607192;
        Tue, 24 Feb 2026 07:23:27 -0800 (PST)
X-Received: by 2002:a05:620a:c44:b0:8b2:989b:efe6 with SMTP id af79cd13be357-8cb8ca0d840mr1594969585a.26.1771946606560;
        Tue, 24 Feb 2026 07:23:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4b4afsm2274933e87.79.2026.02.24.07.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:23:25 -0800 (PST)
Date: Tue, 24 Feb 2026 17:23:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
Message-ID: <msp3bxcyivr6zsmj6fobxbra4mxans5oworqjf4rrrgxv4s24m@6pembdv6w6nc>
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
 <20260224-eliza-base-dt-v1-2-54e8e3a5fe43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-eliza-base-dt-v1-2-54e8e3a5fe43@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEyNiBTYWx0ZWRfX4a7afZXjlhnk
 6PGjhRz5OATDNqcjCZM19oU6LXAK44lz0u9dnk2h4d7hlFK5NA8K/miDsedkiu5+a9vnW4Gq1jE
 kH98MiigDTU3Uyq+/5EaimTCSlmxyXdh8Dk0ip4fP5R6KR12mAACVxCuTMGEGd6YYOcrdSusXqh
 4ITIKUu1w8B85AcK5cksqEeFBPhzMBZjrUI4MNQNW25YHSboCbJSSwl9Y7Du+VzDtYHsJylpas2
 9/pLzhaOrmj0DPqApW9ydLJgXqGD/nf3yCMVYzk1Lm7xj82FHw9AVwtpl0/axclzeArqigFi9oS
 OFScpslr5aFoLzmqU90TIXBRKVkQ8JJ49S19+VKMy5EVeMjoR2N6Zszb7mk/i54cjCMIhVDvBFD
 kgURk9CqrwKotKfSuB/R1ipi9DjBUZ+DTdVULHMPLvjj9AWqqNjJduj6wcKRsB8XxvQ5yjOwBc3
 XlTjD0DcJFSpHMpSoEg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699dc270 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=p1HlqQK6dgA6bnMk3p8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ditvntDIebIb5ThzthAgDDlRQYejT9YY
X-Proofpoint-ORIG-GUID: ditvntDIebIb5ThzthAgDDlRQYejT9YY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94004-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52C22188EF3
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:13:26PM +0200, Abel Vesa wrote:
> Introduce the initial support for the Qualcomm Eliza SoC.
> It is a high-tier SoC designed for mobile platforms.
> 
> The initial submission enables support for:
> - CPU nodes with cpufreq and cpuidle support
> - Global Clock Controller (GCC)
> - Resource State Coordinator (RSC) with clock controller & genpd provider
> - Interrupt controller
> - Power Domain Controller (PDC)
> - Vendor specific SMMU
> - SPMI bus arbiter
> - Top Control and Status Register (TCSR)
> - Top Level Mode Multiplexer (TLMM)
> - Debug UART
> - Reserved memory nodes
> - Interconnect providers
> - System timer
> - UFS
> 
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 1304 +++++++++++++++++++++++++++++++++++
>  1 file changed, 1304 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

