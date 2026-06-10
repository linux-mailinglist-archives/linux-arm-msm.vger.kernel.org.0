Return-Path: <linux-arm-msm+bounces-112494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 213mOWhsKWqJWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:53:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E3669F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XdC7YVX6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Xq1Ny/vE";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112494-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112494-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAE313006D4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44242408633;
	Wed, 10 Jun 2026 13:50:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2551E49F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:50:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099449; cv=none; b=V0RiCuEKlYXvYXbmR7fKuSLI6W/23vQENdsddbIPbaWYkYs0vwUyMJFO2jfDDROhwhX6oVwSLdv6WFOsiP/hsdnQ0wpkdGCM5pGFbcbjXpGKfsi9VYIXLhtGlo4UuuWd2MyVLyuE7SGWAXtlHEFOYVDMNM6zjdwx8bhxf06sTZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099449; c=relaxed/simple;
	bh=mWCuAY02eBmCof7KV7ZxTm4W5InDHX5elgSJCSI8Csg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKg2ANgcZm3j1/I1tR1lbaXFJspMzl4Iq7OTD8ysUeX+JEVA+ZzBoK1yZRnwKMcUudydvb0HVXnZjR7vEY5TJq0zzfMOOROHqyvE7E4OeoTEBjtXF+4bRGz53Vpx46HnnCOcHIpN7LTFSC6n1cLSuXTpc/xW/z7+5AZQdq9vTXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdC7YVX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq1Ny/vE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCKNE1554748
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8t/WuqNQBXyFZ5QFH6E6pOb42vMVFxFhkMg8VXQC3I=; b=XdC7YVX6AKiqfIEX
	b/U6Q0poN6ZzC/9rRq3Infs8lYF6L4GZL4gTFB5xJXjPjSmDmp1ef1ayEStsho6y
	ZjACBiY/3oisZtWt9jSVGVbyYnjmFnxSIBs/HmYylOHmpbfSHZ1ZDPZMYyQIW/Su
	TXVnqg28IWVibZkLDWeyj7j6NkrQxDRxhevtM6jXbVFRge9yTQ3CB1y64bwbbop6
	ALByKMUbUSPkN+oIaz6/vFTJfQwXbQ6VBzolMY81tvvNFyj/earz+GJKQ573Vn3n
	72nwKLTPS1tt696rLFjEeetLspNM4xT2VDqA0sFWghH5sSv+7yqI4AZjs8Q+ZbOq
	E1DxWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntrra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:50:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176ff55dc2so11424591cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099446; x=1781704246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8t/WuqNQBXyFZ5QFH6E6pOb42vMVFxFhkMg8VXQC3I=;
        b=Xq1Ny/vEpSsLC3WNwwj/ThjCgLn7XLdybwf2PF/KVjVc8qbtojNhIKLL2jlYfUzpPM
         DpTvAeBYV6X3jKlNBGewhnLIdgYhzXPP/PSGCxfOnBgtVcKZwvzlJaeNupZhSnF7EBNX
         i51zHB60MRe5kpKUOWysPULIjmxDItPmXnkTmDY7rz3aav4RZ9gkA9qTXJEpcXfLL84O
         RbhXWlaeA2+HgPqQ9NtjkwjR3S0/hj18wmcgDhXhdGzujDKpjnIvOFH/FAmOaHBkoEQl
         XtAxeE4vyvazKAYH0p/UwA1tNIA3of4KAmIlvZQP5vNtsqjsAj5Yi5RoZXJ6A+KMF3C4
         tv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099446; x=1781704246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8t/WuqNQBXyFZ5QFH6E6pOb42vMVFxFhkMg8VXQC3I=;
        b=T6QVDNyHoTDGmaYon2hVTX08717QAmhFxsvBYoy+Sj8TEEeljZQ1VATy666sL6lRiW
         lUEmGXAHSFa0QfAEXw/Hma94y9O2pmNMpOoc7l0q3EvFXyhezlISDylG5Tl+ePua7wRX
         +S9Fj6cS7s8efwerP0ZRe2BV76bN9+fnBgPyNpA1tcIELSxtK7AuTtlugwj413GW9T31
         nkqEQqnLRydCkKz0pJjWD0UcJBMJf0LOhwJnaDI+R88fYs0kV1l7s2WAqgDeeyY8E7BR
         76h3FuKGPcDNbiMnDevJniQsjBWpdvK5h1Rpi1HKUaau2BoxgNdTXMXsZP1G/pcTNE/s
         wH4g==
X-Forwarded-Encrypted: i=1; AFNElJ+Z43NILwBRSqqbQjCkB/2fE/G1SnNciGgEa3PaYvsBid52ong15y7isPhCyo1OUdBDeml2J1NgFYSajD8j@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2Lm8CCblzIIFWUnU3SOrH68v/rd3D2x82CnLi3kAqRXwAj0Z
	UIbyP/QW8K+hxwi2lbNTVwJF8F1rSZAOq8h++E6r7J2GhzMHKItJuG/rDcUyITW+h4pe6/NPYnA
	bHRU0sz1TVEcdhnEvRBtTDuJ2wEa+fB9wwF1XS/DwV3xGtKGyRKXBnNsTsciM/yVV90/E
X-Gm-Gg: Acq92OGv9wwGTsle1LJn0o7HOmAHJF5wYfHdr1DZN04PFQ+s6twQcPPMUdxAv9HgTpX
	9KOmLAQxWeJhZZeYc20jG0Jj6Dk8qOE0RBomXoRubOtoEhPC9uVjZkuFgL1K0QAV8h6tPvNsNjR
	IV4me49QzEoybuj/gxSEZu9nBfssEPHWDQjGg5RyhrnG3pJo81+LTH6od0QJbFKYZfDCyVqSR19
	n35lOLjIxpuQuj6ptm+isHnBpdfqYREyEME/GAfsTxrlzYmzVnWZjnY+rrS2v7XuampHBP+B3Ug
	DKWk8LCtF3LDY1ePlzCs4cmwEEjmbcYAqqP2RiJxUDXBsvJVv81NmMK5WgPjS4Ds5L5LB/94iyx
	+ZwF+xnMRjXC1iZ8I+zTNyb42UZFgfo2W1AkOmRi1ZkzjjFC6Kp4MFzLU
X-Received: by 2002:a05:622a:207:b0:510:144a:636 with SMTP id d75a77b69052e-51795c763d3mr221730001cf.8.1781099445991;
        Wed, 10 Jun 2026 06:50:45 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:510:144a:636 with SMTP id d75a77b69052e-51795c763d3mr221729431cf.8.1781099445388;
        Wed, 10 Jun 2026 06:50:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559eee00sm1208276766b.56.2026.06.10.06.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:50:44 -0700 (PDT)
Message-ID: <488e587d-22fa-4718-a8f0-3d859fee4122@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] clk: qcom: gcc-mdm9607: Drop incorrect
 system_noc_bfdcd_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-8-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-8-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S3tLTspNAsG5dMN1p8ASFwxXyi754yY6
X-Proofpoint-ORIG-GUID: S3tLTspNAsG5dMN1p8ASFwxXyi754yY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX6yffa3f35OEj
 uNJLmOtq18PDHlakDY2FG7tJpkRFfEqM7kuj852ctQ5cuovmBiKrCsKuWXPPM+1I0qmrGR16BTl
 Q2+WpDx5tHKG7Htqg/C08vPU11qSa8GrGGKeMtCDWhmXVNLdmk3GEzqGBz5e4Or2U7CqDyqFp5m
 GY1lcyRt60g8/QEcwKVvTRlXY3ftAsMuuTkSItvrDcu4HISqyUfNYEUf4mz6KoecWzEEoNfvIKh
 twbfdUzrh9rRl1M2+AO7HOmRALhzpoYIKW0WatLGJ5vCljXGENPLdIRek1zzmKCNn+es5TrBd/p
 Bo8SK/iT9fe1y6319ZnTaN2L9MhpSpyobszbJumDWmewjpCTyUZ3lL1A83Rdb7drFTnLUcM2Leg
 kGroCq63yQOvaX6GqD3ey5dYuZB0WXUs9cWh+MRv+UGnawaJRLbfLd+NtO7UTs6GLxOUtydbMs8
 d3kdtbY2a7HB4nMSGfQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a296bb6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6nsel-XMCCOZ1T56_SoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112494-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gerhold.net:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E65E3669F9D

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> This clock does not seem to exist on MDM9607. Reading/writing the registers
> always results in 0.
> 
> Presumably, this definition was mistakenly copied from gcc-msm8916. On
> MSM8916, this root clock is used for multimedia subsystems (camera,
> display, video). MDM9607 has none of that, so this clock was probably
> omitted in the hardware.
> 
> There are no users inside gcc-mdm9607, so we can just drop it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

This one's inexistent indeed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

