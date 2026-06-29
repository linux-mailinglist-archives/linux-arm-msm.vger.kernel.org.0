Return-Path: <linux-arm-msm+bounces-114975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cCB9FkBJQmrj3wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:30:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 515736D8E9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:30:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mpZs+7PK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kW2GzBCR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114975-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114975-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A28833000B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8FF3F7A8A;
	Mon, 29 Jun 2026 10:24:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D293DFC94
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:24:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728694; cv=none; b=O/ZMJuRqVBJfH+HfG3p5iB8434UH04LJwrGdzsQSKG8r8tAJkzdEx5Bt9P7RIVmWbuD8jkPGj8NACx72TYpIK2VR5jCCxcQyW0b979tRdaF61gzj9FHXOqUviVSPAhPEs9c8yNJ9Gt95+tFhuIXpJK8FQ3j4OaUSX8vG8x6Qh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728694; c=relaxed/simple;
	bh=gx6Hc+xwDO6+Tr9b3IiC7MpXO14GpZ80jXnsZw3dv9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9xFvLjjOdRPHDCnR4JnKNy0HISLG6RN/7JMPomX13lgUJX27yqqkazFF0t2P+15WJ4e2MzLnM8mgxFlMrBgYsGpG0XvA/dNYr6G5bua9pU84RSM1DA5oPo1/t07dKouCjrkf+YVcfDnYePAgQ8F/WY6RIMXNxZYl4AjBOsQzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpZs+7PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW2GzBCR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OBaG2348369
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1Fbhotj1M3nPhbbjSPmKC0CX6nRcaFEC/MDtEsul2o=; b=mpZs+7PKc3Ubkqzc
	7uY8WYPtje7SgmtgutoA1jnVTJvqqiEy2UG8IgA+JsjQbA1QFHoxpk4FNWtEfcR1
	jDF+u4lU6t2FhqvT9sKEi1ZxEpWIyRaGV334w1C8AXzL8rC4wDS6ngj/sNuyxEME
	X6huopiWCmvHhw9LVWeE/vttniqQ4szGKWFBm9FPQVNqEM6cl9bB/UNCIFQo0AOJ
	GUWJVaRo/AlJFvK/qu8/uFk6lFypZvcvgsaphu2jD8B8I0IGN58VWN6rSoKwbzlR
	OMJx/HhucffyV2ebF2txoJnh+nVftvc/klPtwVSkcGPrewXFuOmBoUFDDhuC159A
	Xgx75A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0gxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:24:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845d3bef1e2so1753598b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728692; x=1783333492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1Fbhotj1M3nPhbbjSPmKC0CX6nRcaFEC/MDtEsul2o=;
        b=kW2GzBCRpy/7ACSQjmSIpoEITbuqhK+uKidzxGkwHshyCe2WjuCO1uGPMYWzXHXNGX
         kwH7uYiLe5lJKU1DEIlUHjTci/ph4jO/RvlE5NJ6iLj8nxeJx1OXE16KvjTPEqxXhAax
         /u5mJwgyoTJAR0CrD7L2gnEqY19Dd5waaqGuK7b9BgNw8fYkcw2AIGf52jj0szRv7Ofl
         Q1gvbQS1coKAC2UjoI4d8wx/d6T9bz+X7n5pguXyQkejDWb7RTQLoH+Wf4CD7pQXjnZq
         gqXF+3BNiRsOvtfGBLLkFoYUFGbVV0epPAVcXARkbVkvrXUEc0HKs9QcXnEQmI2mkwsl
         fgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728692; x=1783333492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1Fbhotj1M3nPhbbjSPmKC0CX6nRcaFEC/MDtEsul2o=;
        b=RVZqmndfz9hNFdnZAo91EExf/5ImAlhvdTwRK+z+rqX/gEsJyEUfSJbLiOgFzHjTlb
         dRQquROSEHsP6TdLtNvlNm2SgYwTB398dBOZNJCv9xH85F01Vo7vUBpzWeSsTRG2ryNw
         wIDD0Xf7u3jH9kHIKXjnTKbFlhQJ3cHYX4EjJEslZLYGje98kLYz3zvrWUM1yQnWgNcj
         lpdRQMNWm/oSabXeIOaVEFHAGuxAJjYegL9v0iNt+0FtFvsb/d6AXXZ2hYTmBhe72/XT
         96EeoswOHTqpaFNLTEjejNMWUNLg/AGTKcAgwEiu+Rdt8v3nMJZrbczjQHCl+dXJ7Edb
         eRCg==
X-Forwarded-Encrypted: i=1; AHgh+RraXCmkmvuzlOxp79uPbDLplC/WTJ9WbCs3JNlquobLuFzbIwoD9959EdFqXbqdn+4bEOUG777jPXygOQpr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcp2D6cryJi9igzMC4JGAOSiJBMX4vpaCR925KDQiyZPX0lucl
	nz5eeDCaVsBV+aiqOv4IsqvFsQE8OALvkZJ/xsBA13BQ4kaIVnumh+35QYw36G/2J7DAQPV5dBi
	sXOD+LrAicOU0FlDF9VY+F2NxDz8pyWG6bSJ9plAGpHNa2ko0tSbQNXGiPnF6HqfhrIrq
X-Gm-Gg: AfdE7cmEEdowRZOojQLjMaU038nHrHHfGeNl5+kYejvzPJBUjDV2jsTpwjCZ2uLiw8T
	BWiOxSwqd4E9OIipqnKhWJlGuTD9GOVL0OMg1NWbS4fga6AomG4JEXB/1/VlfwwtHTT9S/Z3JFj
	4bTvRw+iiC2dtZ9c8aRNTZmuqgYQLt84cWdQwlWavb7+OmqDeeHNflEWTJta8QABmiHhdkFUmNV
	iAwtN9bm6GDA5hx42gtx314QIQe5HQzCN48MLcCJbsmfjwSmJ3g6mEeWuBz6ryg7MLws3xrbR86
	Rg2IW2UyXgLy/PFpRccbfG2JjMK3I4ph1w9/SBd4hxqcOJnmJRda9l7+puHrfyaytHSA2sqc33R
	2GKwWB8E1/QnSF8r3gAFdicrRQfFVaIKDPYARO1eZit8=
X-Received: by 2002:a05:6a00:8c11:b0:842:672e:7b5d with SMTP id d2e1a72fcca58-845b39f9acdmr15279466b3a.17.1782728692427;
        Mon, 29 Jun 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c11:b0:842:672e:7b5d with SMTP id d2e1a72fcca58-845b39f9acdmr15279454b3a.17.1782728691963;
        Mon, 29 Jun 2026 03:24:51 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8477594750esm2435981b3a.21.2026.06.29.03.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:24:51 -0700 (PDT)
Message-ID: <86321e30-2bee-41bb-9d63-d0e6ab4154db@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:54:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
 <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NCBTYWx0ZWRfX8k9f49d3vaaL
 mjHnmx654wwcqMv6RuYDu0VzH8+iC2tNT2UDMraZSTBOlHZl66HVcaHieOvxvCM4MirRl9phe9K
 bX+97pzVHqbsBWN+wrbW77NDtuxTJ2U=
X-Proofpoint-ORIG-GUID: zNG17Heotdfn_pCAoy_reg_oqxzNaV_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NCBTYWx0ZWRfXyYy4OUPFOUiB
 jVvltqu1MIpcz4e/AX8769w5fQH2MJi1LwCCSj20NRoibFuiEB7FBiON+VCO/cES9KLRNO67rJA
 ZdcTRSVugiUWc371paGV6Lc1R8usT0Bgj6vTiWtchnpBNQ0dbe24NG99Q8E35dsuxpv2QlHze31
 YxBmPKwelOriQctDyLQZ0W/B99CEMLA2pKPqbNRQPKX41/7+xJ5pXeageLJJ4NY5zqa5QVyLV8S
 zD7RQWzwQrEaaglGzH3aIMhod4HC312qI+t/IYogretNLxcT6zTdX/rp6cCy8vIKrGfkCI8uir8
 3bLqbPygCGEsUf9LuFXStiXOf6aWg4Mf7yAuh2lBZeam7V4pyeDYDhlS5h9IAqgNnmCvSmcaGEE
 ApS+U/i5Nbzzg14lss5GxK9F5iZCYyB+boB9eFLQuFGQoboX0U2EFIvV/qhLCmeEpwK5IkcDTio
 0LppvSgb2eHFQbO4QZA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4247f5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=nI5agbhGWDarof4E6psA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: zNG17Heotdfn_pCAoy_reg_oqxzNaV_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114975-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 515736D8E9B

>>> Since 75 MHz and 201.6 Mhz require the same power level, is the former
>>> OPP any useful?
>>
>> Yes, both use the same power requirements. However recommended by the ICE team,
>> the DT should include all opp/freq supported by the hardware.
> 
> Is there any reason at all where the OS would prefer the lower OPP?
> 
> I think you at one point mentioned some dependency vs the storage
> controller's clock frequency

I think Abhinaba captured all possible frequencies(even lowest ones) as
what the hardware currently describes. It's upto storage controller
running frequency and let it scale ice clocks to higher/lower to it's
max capabilities.

Describing hardware based information also avoid revisiting DTs at later
moment.

-- 
Regards
Kuldeep


