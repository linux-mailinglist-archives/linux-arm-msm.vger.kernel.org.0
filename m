Return-Path: <linux-arm-msm+bounces-105286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMgZJnzv8ml/vwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:58:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0449DCAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACBBC301389E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4432371CE6;
	Thu, 30 Apr 2026 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOkdvvqF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfQ1m+Gz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E3371071
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777528694; cv=none; b=qc7AVnJEild+mCxSPNm0F3ZbmhLGeo5d9V5E5H7T9Rny76NyzrsFz0g1K3GkPanD4M75CLdRYQBlDLk9thyTwM8GxOGxFuISr5rMCuOuS3YQlEVjyZMvu8FQCDEr6AESRgyFTXMjwuQJPiRza4r0/5fquKojUQU/0np/fwDYNzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777528694; c=relaxed/simple;
	bh=t9cXcyt0z2yHmYkZ44DNTIYbLWTfQIg1ta0VpGKMTk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgmvl3au3K+T890gRHdziIsUSfWZYnfatfb+irup7OxqK2E+wrK6r+scl2RrrAwSDevNEuUAFNGNNtBEw6i7WHicFC79PIoZoB+aBtXj0nHPGugaM3nhxBB4DxYBanHFaTmmUYgzWfiwrMFlxaxgXxSYaIBwwz1E29y8fEEPokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOkdvvqF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfQ1m+Gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5a8qD2855826
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=; b=jOkdvvqFmg96sXkc
	yrcRaa5hLhfTvR7HWeapM3Gdcy0Xj3Q0+FgakOlknczAuXiCIwYt1b3RYqSZkj94
	BHovbkGEAoQJFlESWJXS7Vro3dZrKHAER4wC7hsv/ZTeX+nT4/H0vUdyWHbIJQN7
	c+zSCva5zBJRn24elNsQ18GMG9Cwl+PCb4xIjpWDFvFGtlGaaeV3NmHLpA6iDYIz
	XdC7DplIfrkeNYDChZXCUz2EasOdd4YG1X4VtpU5OtAvVQji1EGoe0s2UsijscHy
	ymALlauFqa9AiGPXJiBUc8aEyUIc57oh4AAPACfr9Dd1aKRxhCSaV1O1Y3Dd4uWE
	tW0TOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp2xne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:58:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e06219cbso6183175ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 22:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777528692; x=1778133492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=;
        b=jfQ1m+GzE+iT2tPD8LAaIpNzBDdgOxK6pqzJnZEwm/lZlZs9wjT2JEYbXzQ8kirtfh
         y9FlasTExddUUjPTsVGR/dTT6F0CMKiSfIcNvcvCrUs/I/mDNKpNim4wfoC5r93YeofL
         8NQwtfuGOR3naUyyTbnyNG8FcYdi56SG140WkA6/AYfFbBKKGQkKgsMieeZwvyPDAD13
         DMlp4nfP9MgBul5nWMsOBPztBsu4YJNiNIc0oGTsMpQjxK/9/bjH3uRVf8UcvXhAdyZ7
         ZbJqohFG/MZolRlaDMrRTZNGhyQf+Y4NE8nLkLCuZ8DHGvVkRonDSUnaOmDxXa2D1Q5c
         l3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777528692; x=1778133492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N42TpL/Mv5cDad7xtlaN8zH2kvLnL6Ebp9znzF+M56I=;
        b=oGheXmGFz5On+qa18QMYJ3p5ewCVKe9vdT568SEb3Aym0j76QiouESK1GsnElkGOCN
         FNNVaw2QyFRlhQGfKf/H2zXM6tNtHqqEKFZNlCZE+e20YbC3QoCQRY+x0k/Xi2/cy5gp
         fx2181FcSUIlqle/he8caV6iJAKQH3nvK1zuVZ8zJZtLAfEIi+UnG1Hq5r4vv/fchf2x
         ZZJh5bGsa9alDbde3jy30eoqp39RMcBgoXS/fXwy8z/jZllc9N5BeS+X5lwdrhrytkdA
         ruuV3Bf1VMo+MmVrJcVzWkx6ABa7uy2mCCO4IJe4fH0+mcrSqIw6X1RxO2+ZuW4WuCkY
         saxw==
X-Forwarded-Encrypted: i=1; AFNElJ+xju6PQ+l03fbR7JNagNRJ4ddsh/DQznA3VCsgzgGQVQ6ePKCiTNSqA3byBYtl3/zPAun7UxGrn4rf6N2M@vger.kernel.org
X-Gm-Message-State: AOJu0YzTACwKOoMbFl1bDBB6HpuXRILhJlOu85KN+exnJ+fmXynqwiOg
	kJYmX0oYcDlOyJr0XZIRXHfSoCRqdzNvWn0KGGkKQ1Z3/iEYfqM8ZvMsv23yzAbdIIH4neRXk/z
	u+qVLjV2Ib4JAqrJ540eNuAMp/FKpKktBvk1DYgw4Vl7samVZG7JvzcnFkMfNBpaYETN1
X-Gm-Gg: AeBDietOe++Vo4fO/c6gYD/MoYfebnDHtZ1RE0PlIEW+hoKX9xrH1j7kAuVDHyTa85c
	pQ4XSMOOUl0fVKtCAS0vfU+3b4nQHKAADvZylY4iCJYXTQ5REFOV6d9WDlBW7zmXk9D0sCNaSno
	xzDMM1OhniZO9Otp8RCTykbVxA4HSVZ+c9rSr9YPoVuH+icqOrUQ8qruvbVtlK5SwBIIqb0VQ9/
	abPHjI2I+qk3Y+lv4KW44eBnMEkZiN75IJA8jkDpuAcdrcrECRSJ/W50Ne3lyf4+2zQhna57z/d
	+9zLcYTFZdc91qn4fvukNIe92zg0rFRTpuiw+LYpMrq36KbW9POWUhScTqn4kNXRIam6/K4xdWn
	FjssRfUa6NGJ3OpP50rfiCM8wqbWdVEqArwPjxh601UnP2NUYxeyTK/KSfS8YrwXr
X-Received: by 2002:a17:903:1248:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b9a24ea28bmr15442465ad.32.1777528690751;
        Wed, 29 Apr 2026 22:58:10 -0700 (PDT)
X-Received: by 2002:a17:903:1248:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b9a24ea28bmr15442195ad.32.1777528690235;
        Wed, 29 Apr 2026 22:58:10 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879e08bsm40357295ad.30.2026.04.29.22.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 22:58:09 -0700 (PDT)
Message-ID: <d007856c-e853-4ce4-a9dd-3b4de2531cd4@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 11:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
 <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <f9148fc8-31ca-4400-a12e-630c80db020b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O5_FapKh2Ulrs4YNB8JYD2GGDCFws5KG
X-Proofpoint-GUID: O5_FapKh2Ulrs4YNB8JYD2GGDCFws5KG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1NiBTYWx0ZWRfX8rP7hu2o1h2x
 27SlFdxcLlrqp5EjflGBPjsKsWYXoe4Qnap74YmPySbCbhCYFd7wTYTXZ57/rSL1EpD2UM+5zX4
 kfUr3i1ST8sBzlPU+tav855kj7Jjb5LM0qs3WFX89I2A0sx/4SnT8X7XnndYk1f4r9jzNAc9/Cn
 lq2BoJ5rY7yn+MobsrHiLRz9aJUEiaVVKc5vldpX+ZfFaVQSNV73y25UDG3iDK/eumyJTFYSGrk
 HmB+LBKqpdDTtSyXdwbz9pKBuLOORWSPmVtA3YmcpAodlg4Sx/t86tWpivIxj3tQ6jKLeIHlBpA
 L6x6KgwOecYk/0D5W1jZjj/+DDuhn1t58xMgSO7OQmmDG23hpiKfnWrR+f53tbx4jT8dcE8PEsG
 ANA006qzw7+fCxVy3+kWN3OnnQFfqo9b41Ah/NvUUpJjE3BnUVd1wyxCYa0SozG+9IBPDKiV15k
 5K9sri8+pA7UYNZ332w==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f2ef74 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_KhGAaAYyJUefK6zY6QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300056
X-Rspamd-Queue-Id: E5D0449DCAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105286-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 8:52 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 16:14, Jagadeesh Kona wrote:
>> Enable camera clock controller driver for camera functionality on
>> Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This change should be dropped instead. I am removing all Qualcomm clock
> controllers from defconfig.
> 

Sure, will drop this change and update it as m in Kconfig itself and post
v3.

Thanks,
Jagadeesh

