Return-Path: <linux-arm-msm+bounces-78725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93635C060C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 13:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E003A04B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 11:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129F5146585;
	Fri, 24 Oct 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xoxyv3vF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C52A1BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305849; cv=none; b=X9xoMC/a1BkI0fmLLWjfQvpAY+oeUG40O80HYeFDgXAOMYUG/CMY26Ns1gpf9A1PbCBU/J2NZS0BF9T9D2cJkmElgbiKgTd1QphA0n57xykYIUwV7O5ma1ARjXPt2g/qX8Uei4xFr4ixgkAlZA5h59edvILj2yRk4W0LAkXx0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305849; c=relaxed/simple;
	bh=AegDV7IseewiNZScqyTokamJL+JGOkRVJ0CsWicKgK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urwt1xZrwMCz2nHj35R83m6+jzf3hYR7+5ESaJWbeLXBDOCm4/TYmqSh3aDMGVF6QiPpnYglNN0let/a93mTnKue/s9wdqiwpGZDhMFNDg6ve+QTSWkI6CkJx7GYITqmmhkg9UmScW/cUV5kh3qp9qIgh8hcRI3oSRgQjyYjdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xoxyv3vF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FKuJ006157
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 11:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbfGbR0kcMmEjjS0vTIRsRdJzggRoz88OyC/T39B8BY=; b=Xoxyv3vFFcGRreoB
	Jpg4cG2pZknuWhO+R4y+49fe5zhstgEZ1O/Nl4aAQ1SyyynWhuxjWSUEV18+PkdZ
	YS5/0b8fUgUoVwLHGfhW/+eU65abRj85AOeeu4IzFfKaQbhvpLBB4I5Or4qW98MO
	Bdx+sWS9fY+qOJ8wnQ9uP0QRo0+LB8pXvli/BIT7YMRVmsPv6cC28CtAWLO2V2Zl
	mniJZBtycbAyBUN7A2abuMTjxW3WgPLBE8fNV+gNeMRhec6yZk2qm/7j6KDzLlQl
	KMdu6d1XJ8nluVnNutl47kpX3PBrBsxUMloJZqc9QqqLtS4PoaN1Jc8pRFy+er94
	dxDh0g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344bw9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 11:37:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781171fe1c5so1619820b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305846; x=1761910646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbfGbR0kcMmEjjS0vTIRsRdJzggRoz88OyC/T39B8BY=;
        b=aFXKTIweRYYbWFyRxvFpbJQMpZannwzgaTFmt3sru2n1cTZjET93id3/1iwUqifJu0
         lZMwo49DD9cjInBRfMRB6qX48bQ82uH05JZYVP63tatOLNcdZZV14+lDJ75JrwcmvCd4
         k+DgcARn4l/ZZpypUF+9u+XxX7Sfy4H1NgEJu+mJ0NzmD47yVOKNhTDOKz5vikQyPh6N
         epJj8jCClqK151ycSA/1srrasub9esohQmZJ+HBbO+rganjGeAr9d8+b9JQ5SseP7rtb
         6ZRXnJMYWI1SJRTnYof+rIy55p7hL4l5/9BSS3kF/0SrXdDIqZbp/ep73RpBoniuickK
         AwIA==
X-Forwarded-Encrypted: i=1; AJvYcCWp/PUBnAa6oxvWueTBExBRpmD0wMTCjISOa7pB0l1oTkXmR/ij9QINLV6fT1HeRPEbtdvZgFt2k0HFO8+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6f8iwWu6ngPyl+LwjrZYY/N+JCPAiX5IbK7HNlr5yLnGsk0E
	bEHJGqSEPv7QyE+NJJY2eFoqGXdolHjoHwguvtOgJEwc3TGK4/vbqcCj86mZG5AksXDtxBUpHSj
	c5EKnSX2Ep+XXrjTgo5LkpWVuKooZ3vz0QtXLjPKjybG0UHd+eGqKsmjUFMBQyeeWoDpn
X-Gm-Gg: ASbGncuRc8Ff9BpxiDgjybNFV758NiMotGlnKAKsWdYy3LPCgKFd1U3Jzz4103J4ijI
	VmEIB71MXR6MPhnOc1xHEAkJpOB39wBeidcTTuPnh/8VjxCOxy3i6ulnaRzz/1xKHKU7r8wIZk4
	Y/xJciUQn5iVQ9MNxDyUFFR3vI/Q8v+QktzcPK0ErOfYkP4eqiuFf5T5qJwYqITVsWa0lz/ZzIF
	rCnnQ9GcnowTVB3+qp/uO0fODq3WQ5RGXcxy3ukGNNZBvFppyxanZz6FHam+G2oJQwURR666uNC
	ar1810z2Li3griGWSzQtCRPktko0xwB0uqxc4Q8bF3ux1PC8rJBXs0hzJXnxNs6CIrIgcWeNx2m
	9rDHz/81pt8ajIpXAzPEz6xnnhBzgbz4=
X-Received: by 2002:aa7:9290:0:b0:7a2:6db4:4c7c with SMTP id d2e1a72fcca58-7a26db44dbdmr7396053b3a.30.1761305845895;
        Fri, 24 Oct 2025 04:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMJ9ddkiXbFe6TKK3Y2/fvEFeNAy844DzrGqnMtKaMiv58hmthIdtxkrHb9kI/TP2dxoiy9w==
X-Received: by 2002:aa7:9290:0:b0:7a2:6db4:4c7c with SMTP id d2e1a72fcca58-7a26db44dbdmr7396019b3a.30.1761305845379;
        Fri, 24 Oct 2025 04:37:25 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb0c93sm5573663b3a.59.2025.10.24.04.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 04:37:24 -0700 (PDT)
Message-ID: <f2ea3da2-4582-a2d7-9a90-8050b3e8a27f@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:07:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to
 QUPv3 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
 <9b887bc5-eaa4-4271-8770-3458efb528bf@oss.qualcomm.com>
 <f016d47f-919c-2944-ab8f-68e450e5836a@oss.qualcomm.com>
 <be816a6d-c4e6-4cf1-b5dd-fd59515a42ef@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <be816a6d-c4e6-4cf1-b5dd-fd59515a42ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: p4-VX-DhgpUzX0oQrApFjicVdxWMqdZz
X-Proofpoint-ORIG-GUID: p4-VX-DhgpUzX0oQrApFjicVdxWMqdZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXxedWFD8AP9v2
 k7F0guyItcyHVVZ5NyI+hLSHAy0nHyRay6r3CbvYKSNF5CWS1A5lAsiMKbIo09vbfVkX4dgtn/2
 mnsBQYCuzsv16G4HPoZBUA5h7QZUgYQmc6IiGc6Vt3s9VZ1eKXF6ZDyqY166tssX4gJ9zxhkW8e
 saFTzmTxhkfLZYDT177tR7VDLM/4EgR/DeOyfIOym78ShCGab0FFHpaJb4lJaQuVo6lJN22cbob
 VZBiHZHjVLz5PLqZUuyp45D7eSdOKbT9ewnrPuSu/rAqfJrhnc0KIz5YsKuFC5t5kFzJhPyYzqR
 Us274drlObpzCgadFdOQRp7BudVDLrVvJdS5Yo/eof/wSdJvi0l9iRy3EvnS8xOj99Nz4AEuD2Q
 jrID8KuztxReYsILPj7AgVouFjOOJg==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fb64f6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2qUNLLk1E6tSnZkWjjAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023



On 10/22/2025 10:30 PM, Konrad Dybcio wrote:
> On 9/26/25 8:43 AM, Viken Dadhaniya wrote:
>>
>>
>> On 9/25/2025 2:22 PM, Konrad Dybcio wrote:
>>> On 9/25/25 6:26 AM, Viken Dadhaniya wrote:
>>>> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
>>>> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
>>>> ensures secure SE assignment and access control, it limits flexibility for
>>>> developers who need to enable various protocols on different SEs.
>>>>
>>>> Add the firmware-name property to QUPv3 nodes in the device tree to enable
>>>> firmware loading from the Linux environment. Handle SE assignments and
>>>> access control permissions directly within Linux, removing the dependency
>>>> on TrustZone.
>>>>
>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> ---
>>>
>>> Viken, you've posted a lot of patches like these lately for
>>> specific boards.
>>>
>>> Should we instead push this to the SoC DTSI, to limit the boilerplate?
>>
>> The firmware load from Linux feature is applicable only to devkit boards
>> (RB3 Gen2 and EVK), and therefore, it is being added exclusively to the
>> board-specific device tree files.
> 
> Do we expect GENI_SE_INVALID_PROTO to ever show up on hardware that
> can't make use of fw loading though?

If TZ (TrustZone) does not load firmware for any SE, the SE protocol status will
remain GENI_SE_INVALID_PROTO. In such cases, Linux can load the firmware to
initialize the SE and set the required protocol.

> 
>>> If I recall correctly, you said these ELFs are not vendor-signed, so
>>> it should be OK to have them be assigned globally
>>>
>>
>> This feature is intended solely for use with the development kit and is not
>> intended for commercialization. Therefore, vendor sign-off is currently not
>> applicable.
> 
> Well you conveniently never really mentioned this in the driver patchset..
> 
> Konrad

