Return-Path: <linux-arm-msm+bounces-66787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4196B12F55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 13:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C205A3B8473
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822E7212B0C;
	Sun, 27 Jul 2025 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q89WmYfw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE231E8326
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753615520; cv=none; b=gU13w2ngbmZ+Rmq/Q46k3S7XL44qGiszoLl3TS74fgneW8wPBUiMLNzkSBJmrjJwtXAxki1sqafm27EbPdv+zuwTQk0oFdN1EbaADJrSFUEJ9iU7D7kcf/eEWMGh3SdJY2FZvuG+cVZNthLvAfTBCedH6FgA1LAabOhTBok3/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753615520; c=relaxed/simple;
	bh=mpicCbPyy9dZQR13RfrXUc9e1M5HBHhRY/bkK7x1vjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPfbmV40Sn4OMt8m4lZ8e5irDMEm+rQM2XrGWy18hGRybWlB0AEhZDUx153BqSVPrP2LeUAeqHjWgCNxmPSw2Mg9u0vzykyaSqtsmvvXOX1Z4RPHToVAlNQ7AUN4e7OKqxlytg38SZkCHiWhp6coK8W0i42ViusA+kjMSfBuGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q89WmYfw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R3MtLl004838
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 11:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfJKZhMSNWDE28vPZNyTvcOOnTgpUT1dF1tLEjH+ZFc=; b=Q89WmYfw4DOBQLol
	HXZhb830aRzwUa747kEC9YifTj/wkA3q2bIZcgwtVvfdoZZHKXDmxP6bkDv7Z3ZP
	Rm9/MDUmfHojmgAC0IQ2WT04PVnhLq9TKKm5r249awK4A6PLE2y7Is+Fjdj5hG9h
	OYsPMsrDRtGAxJ9zi4wvX+rjhgsxfLZj/DteH6LL4+8KFj0GpDmhIOCJkMg++5vv
	IwxEHkLYGUEB2MkFpXKrrkMaoG5sbsPMaFVZTkE1QfETKUaOe8KydM9/H1hS5l1N
	E6WU4E/G6wtdzc8uj6i+ZWk41m9hxkGAio3xb4kQHEbLMYHMZFi6kV7iDfFapILK
	JVaAXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484rachyq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 11:25:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073f12d826so16591186d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 04:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753615515; x=1754220315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfJKZhMSNWDE28vPZNyTvcOOnTgpUT1dF1tLEjH+ZFc=;
        b=SgkDOBOLEUASd8tcsflj2gxMTLdjQczkdRKwmIQW5nSuc8k0OHH/QO5PuTxqSLLRwf
         gBRxK+HY+j39w5SJi+ZCpZhxWFOaQZJNhZiPTgPdJdKYSyOV4jQTIGLFb1aZ4oYHyk6j
         Lqfm4M/wBC19q+4nG/CptHAL8ysWRs//n4z7yldU8Q3SAc+JEmGkSj+eCccT3MvlxqBu
         p+fwIli5LmrIglqOjz70z4gQ+Q44wKq+X2iudZFsQw6RhePxP4K1kgv7qgMmC+AknhlV
         /KyJ4fT1Xmth9G1426y6zulfwl1/QQQeMxsY0gkuaYb51+yV5OYBp1CRymEwkpjJjRpo
         TYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaxiKEFwza30OXwRx66pUJ0erb85nLam+RkO3Ui2qvpiymKu3e3g0WB+SK4auK6Qepp558Be22NbVTWJoV@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4BD2uzj5enMEpi/AWg4WfIE37oT//ePz2JXrrQCFW6/LTNQs
	62JALjx3diSK2cDmW4xVAoMnbJr9Wd+TP+cDnonVTovKqEQM7vDVgjAjYxd/S/RFaijDW5s5FSi
	CxbPMpSVryG8Vs7q0NHzc7ifRTeJamKYGXCtFOIw+nPFu2bfYTC6wpj4J1CdoP7Ejzl5e
X-Gm-Gg: ASbGnctay80Tb600u1F0bMCN03yGLQ/x4LceL4s0H2U7qsUhI+98VpzGoQ4j26geExZ
	xTH3ADSXRtyhe1OLFgm50K/6MVC8/Ti1MIKsnfvyRKw+vkLTDAWTmcu8Wyp9zhJ8+USnqij47s2
	jkdq5OVUrwHR/+ppmAr/ZY8hbJXnAhqs7YnAen+Vp402sRBJbOUVS4W7nrjxNqrH0FgEvoXqdT2
	vIip7Ct9m1alM5e3ktz8hKpmg0RbRTasBpiekh1Dc23B0+MxwKZyc/UqQV/+NQ90coEUYRdKfcL
	kevh2EMj+45DGMOAQppMgAicZhU+/pg8+RW14VMK0Fb5LdbulVAJiDf9W4Ha+LqCn9A=
X-Received: by 2002:a05:6214:300f:b0:702:bd34:75c8 with SMTP id 6a1803df08f44-7072049f3famr99229076d6.5.1753615515313;
        Sun, 27 Jul 2025 04:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkCofJ/1O0p8bOeiGbSGwSMF+ue6NzNwSlWHo2EXq+Z7g+oFlTe7pN+OBZy9EjswapZE4S/Q==
X-Received: by 2002:a05:6214:300f:b0:702:bd34:75c8 with SMTP id 6a1803df08f44-7072049f3famr99228736d6.5.1753615514814;
        Sun, 27 Jul 2025 04:25:14 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-458705c4cacsm114650875e9.24.2025.07.27.04.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 04:25:14 -0700 (PDT)
Message-ID: <8b3abd1a-4246-485c-9f2b-63ee37ef808c@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 12:25:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
 <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=68860c9c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XE7kxn0J_hhxY9Cja4kA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 21njUJbRlf5CHM33ps7h_fDTXSyJzDOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEwMSBTYWx0ZWRfX3PzQl8hWb+iy
 Qny5nXTemM9ZVsnNvf4tZgLmlXStQFSeGHh9o5bsOF5HUROHGa4HtiFAlaQnH/mdBmmlzQ2p+E9
 in0SnZybB+Hmoivhv6klStiWV1y/6/u27v+GgcNlec/Zb3D2AJQK0eSjjz0O16etaJL7mtWCu1Z
 IqAjlnIfet+frS01izTU9j87avdS0iU4OgXbcXcjfp/zGFRnYy+lp6m1Ypam3YN0A3Y2lZ+VPQD
 s/suzFDIxzNH182XDak75TMcWnJGMBqB8eVMOKvTOqsgcG/W7cdWZAFuAx1JlWNzw6N6M2MtepD
 xbX8IQD2GFafO65biZpjixO88wmt0h+dv4U7q9SlCciCS1QTBFsLBGgk7gyJLW1zH4ryqQps+P7
 xM/b7NRuauOfWAyb2oF1WvBld2kmcOf2JAZry35uVBqR8OO8A6Hxj5JxijIvKX/mi9aXx/Z5
X-Proofpoint-ORIG-GUID: 21njUJbRlf5CHM33ps7h_fDTXSyJzDOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=699 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270101

On 7/24/25 3:24 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
>> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>
>>> Qcom Slimbus controller driver is totally unused and dead code, there is
>>> no point in keeping this driver in the kernel without users.
>>>
>>> This patch removes the driver along with device tree bindings.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>
>> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
>>
>> +Dmitry, does you computer history museum require this driver?
> 
> I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
> the driver would be actually useable there, I'd prefer to keep it.
TBH, I have never verified this in full audio use case in any of the
qcom platforms. This driver has been unused since it was originally
added in 2017. AFAIU, no one is using this lets remove this now, Am
happy to take it back if someone has managed to test this.

--srini
> 


