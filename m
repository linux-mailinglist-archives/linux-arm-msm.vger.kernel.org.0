Return-Path: <linux-arm-msm+bounces-56652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5BAA805D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 13:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF3917AA2E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47C52566;
	Sat,  3 May 2025 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAG4AY+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382C78F59
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271065; cv=none; b=d5VNU5V/qQdkIytHLP9IOD7Qi29I9xTNIuaGqz6YnMDH9Rbgf+Se4n6gEoX8CCoUxXxhrqeLmjR/lE8mnV0W2sOUdSrefsjc/oecTOiQT2qKHnM3UTMURwz8TsDy/Que4JWUPxdcoTcamPh9en2fxYmCsllYAZLYQw5y38Rpbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271065; c=relaxed/simple;
	bh=osPDfcecZqVOsBKtOG/9K12hOUEbQ3zRaBPBK4271XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTlG1KowZmGuJSutWdWbtEEyA7U1ap5CUTw3nG2ChA9fpvJuKpsjtLoMvf67mk7jYF+eymwccQjz7VCWos1G162Tbn0EJjuLheQQFV72BQLM2c4gmn6YH0dOY3DxdTflSlk16FJaX+hPMCOE+Fmo2zzfy9iTzW7bpCQfcH/EP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAG4AY+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5438e7Rb028170
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 11:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyCrKhEc3d77syMYDxLeKe5vR94keERW1gwgMtjT8+Q=; b=pAG4AY+FuNhNdA6F
	hAXgDOJwRW6pD8F9mWi8SqhV0bW4f0SZA1GnbxWMyjaoUky4PkcaPm1Kmu+1eJ+c
	gRQv2lgFjXWBVH/pQOvbXu3vOp9dZglbOUTx9vDTzWIjbigFSnqeTL14AUVPNbOL
	2s7hU7kNpwPowHiQnRJh2eUqVegJUaCIeS0hkyB6OUiwFLVv3Rswk+O0KJKVskjd
	1IH6qtijqeJfZjVruXBnng5KlMrIWE5OQnG9zqdHJNYOxbGV8/QH3KH6qabkSNSr
	8ng9iSmaLmaBVA7x0PzYzR3enCtHa6j3Xl1CAOzePuNc+JCe0ZVBjEK6TgmFoUHS
	LaQIMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0n6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 11:17:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9c5af3dso2535936d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 04:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271049; x=1746875849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyCrKhEc3d77syMYDxLeKe5vR94keERW1gwgMtjT8+Q=;
        b=qgND7gG0oRZTBFwDC6HlNqZYCupzJ6y+OdnBBqSPepyz9z2w1r3gpkOdjiG7egwY4J
         0SDO7gyXPeLsaXYDmZMe64HJoATGLc3so31Q1i+9qEV6h+WmuYkzgRoW1cgxpu15xw4v
         bzXQyf+wQMeBSbsY6zo8KJdpinjeo9S9yxCxwMe4rIc3geGblNMeD9q6/krPPtmDHrcC
         ZwU05Gky4ecKf79lr48TtiIcecYw9YIETjfCn5tWTODPkBbpKUBIstfskxANIV8JrsB1
         gjEzeM/lTTSXG0C7VV567yxGEYscPyvKZaV7dYTh6xyEpmz00sTtgVRbatiX9i6zgh+I
         xxdA==
X-Forwarded-Encrypted: i=1; AJvYcCUvt86aJpdS8kauWr51hViY/EvLtvWo9pNgOGfcYslUpcm2l3gdcjH62WqY5X/iYQ1IxxkhbtLj37t+QcJD@vger.kernel.org
X-Gm-Message-State: AOJu0YyvErwHhAN6Z0DXhReYhDistEcLyWSiJtpxoJuVQhLZFL5K9cdu
	lK1/5jLAUtmQiqtf4r33Ng0wo3mSfykOgqR4S6uO5hT6ttOgvXZkGsucTjdWqfAI5HjvjDc74K3
	9GCfkJzgAOxkD18g6g/GCBpw9F4yeUM/FfNiEmbWfXajKsYI9U/Es43ujGce30pYv
X-Gm-Gg: ASbGnctIkwVtf70oublSgGhszGhxYUpbpDloMP+k16/J4dJ2RBZdmTy0b8aCFeikLSL
	sNTsho3fUksqCmxq69gWUyY/a+24kxl8iQYxbhhhBwlh0rpy0QnITyDd9dz6k0alPTv7rbKEM+T
	tEgqPaBZuUWB4eHu28bP02ohrS/9ufk0Zsen35s6RpBzhQHOv7YNHtPQ3K+EGxXH7NvX99TS+QZ
	pCkrDmiYBeW4GR6XnWnOW7Y8BiC3nCRcqIu8aTbrLJY5bDLFGRvahPxZwJcm5FLGRYLlrQZ5DV6
	6qCWecbe6ijf1Y3sXqOpwTAdpMM4z1qnYmVOy2oWQFcNKjHeavP7/HDOU8ZaL710v7k=
X-Received: by 2002:a05:622a:2cd:b0:474:efa8:3607 with SMTP id d75a77b69052e-48c30d83db9mr29110331cf.1.1746271049028;
        Sat, 03 May 2025 04:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsRcL4YTCQDoV6ZBGi3Z/iVL1bqcsqXiphj3Oul4isaynD9De8sYSJHbL7Ynpk4VynGPsXYQ==
X-Received: by 2002:a05:622a:2cd:b0:474:efa8:3607 with SMTP id d75a77b69052e-48c30d83db9mr29110181cf.1.1746271048650;
        Sat, 03 May 2025 04:17:28 -0700 (PDT)
Received: from [192.168.65.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c024asm178441566b.117.2025.05.03.04.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 04:17:28 -0700 (PDT)
Message-ID: <c55d718f-00fa-442a-b67b-9a678556a2a7@oss.qualcomm.com>
Date: Sat, 3 May 2025 13:17:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <2kmnhxj3je366livo67btpbmjiyeyx4q23of42ng4co6xngemj@kitsdtqepgce>
 <e0916f4b-d2be-46a7-889f-2eebd12b74d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0916f4b-d2be-46a7-889f-2eebd12b74d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815fb56 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=dnXBaztP67eYbQVX14EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: JgMSMi0MZtWdd1Bx8q4wthVQ1v4mUsFH
X-Proofpoint-GUID: JgMSMi0MZtWdd1Bx8q4wthVQ1v4mUsFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDEwMSBTYWx0ZWRfX8gRMSsD/7MoN
 neu9ZQDNOKWziKeG399199fCQ9q83PPQxdFPYOH+exz2K8dYFp7f05lceYSZuxE9vNQLrI2g1aQ
 uj3B5SEL1nhuX3oSqEHdIvLfG9qJi4K98+K0E9o6wEH0A6fAbaKoE6bvykuXhVFw+QTJK71NCQd
 kCnhO88ICMMYBqHF5rfVjBq+W9pcWLEFu7hvPzWLr2VYNX83XtstKylE8BxOBb+fJIlPqPcZ5v4
 UB7R9/97lN8wfA8CN1JFh2G3l6olm51RLzGmNinAnN56ynCsgEH7Pb9q9tG/P2VrN9wC3A76IiQ
 XYvNiWZ4gEQ7KrUUTcnUBAnwdolW1DoUmh1k1FTiENhoBwk+zOgpPkwnd1Vt1w1wH3uyj9WQZoQ
 FNM31q5QUuRN3jdA47BWTMP4m5tw1mShEJxJ4mt7MfsUIy6+uG7oAItTx0rdyRdOCAKA17j0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030101

On 5/3/25 1:11 PM, Viken Dadhaniya wrote:
> 
> 
> On 3/6/2025 4:57 AM, Bjorn Andersson wrote:
>> On Mon, Mar 03, 2025 at 06:13:46PM +0530, Viken Dadhaniya wrote:
>>> Load the firmware to QUP SE based on the 'firmware-name' property specified

[...]

>>> +    u32 magic;
>>
>> What endian is that u32? Please be specific.
> 
> I didn't understand your comment. Could you please help me understand what is required here?

External data can be of different endianness than the running OS.
This should either be __le32 or __be32.

Konrad

