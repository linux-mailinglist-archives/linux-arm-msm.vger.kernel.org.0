Return-Path: <linux-arm-msm+bounces-68921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D145B244B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8570A6221AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607202F0C49;
	Wed, 13 Aug 2025 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvmcbCWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD72F067D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075184; cv=none; b=Ttb2D32skkUjrwrLy/ZqdkKqlz3l/92nhqDlnyMVDY49Qm3CBSezYhT9r3Es/lvY5mEyi6fCTCr6GSvUjXVSmotewATMcyVnsX5sE0PkYrfb65kcO5OIzyVhX7ero7Q1ZqAKW10Sg01C0yuTQPO5pseL6b2K+ryLUC8Vo7e3Lb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075184; c=relaxed/simple;
	bh=/nWGnuLz8bSTiV54QYHa4YnVrXXOf49FUZEV9LWvDuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OelAbkNhSwN6Ionwb6dVkgcBjNHJGEk0ucBS8HUuIVr9Yckfl0iVtHFzS9xdk2hmEe/D+3NNlCL7LWEBp22hsIX8sPE1FEco52sw9GCna3ylaxNAIdbqoWIg80ZnZDA/t561ufatDOF05tqlcL2J00lXzPZmgFb+4dqFO1u7bk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvmcbCWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mLF5028913
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9I9QSWKO9WKgP+L4OBxwHd20RgzZG4/nTzLn+kT15Y0=; b=XvmcbCWwrg/kT9k8
	wGSGOmLnofHeBoIqxwpqa+iJsi/PDWBjNa1cPgF54g+lfCeDM+Kok2R34Tj2b1uG
	8edMTMdy2N4LIGpzcBQl+/2PFZpMd6nSGOQ72kk6VDCZVNzRCeY0TrycjaXkS4Dy
	wM5mli3YbxhvaFjp/F3I0wCQVMto5lz8rX+NHOrZzX5nAb1a4TOEKwZ+44H2EVdx
	oTbKI0swDmhRqKKxT7stU4Nd9u2Qbixt0WpKzA8aIqpvgkccGJj9Z8EU1IIZq7w2
	zRmd71+j05KdI86uHMj1pk6U7y0fUcBIOAUfsBeSojh7/hfdHdUiuIU5w7v9/6nw
	bUT9vQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4b540-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 08:53:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-243049e6e1dso23892045ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 01:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075181; x=1755679981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9I9QSWKO9WKgP+L4OBxwHd20RgzZG4/nTzLn+kT15Y0=;
        b=WxtDwNFlQv8cdweh5tyFeAoODwTic0ZSirGfGtT6fzYoz0J9g80UkMXXc1pJqk8coP
         DK7WJw9Os3z/lfZmMdlYfEQ4ag9U4LHlg3F6VDhFZ3Rgx4uouUJpKL0BM5Wt/aG3k1aB
         4yLIL/ysnpdgrZTqMEJbg5gmBPETwx5u2E8UBORokqOo/nqfcwvpYfJ2r12NsDTnaMbB
         W+2k0RCZ9P5+cTaUls9xBbO5izxNmhmoaK4U80bnItAyy1ZwAzMhROKxDFWqcrb6Hd+o
         SMCNizeljjcKiKEp9cBzXprp2TwOhFgVPqErc3COOnqQZXSpdVS76bqTJBWFlsjo7GQw
         xxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeM5pzcWtn3WBowk0Fb5muGJuenMBd28bS5XE1fLD5/GD3AOHFnqgc5oNONOpmp26UFgQuHdlVQkp82n4F@vger.kernel.org
X-Gm-Message-State: AOJu0YwFYchwKRlmOjMhZa+PpFCjXh7QiExb4Pi4X4hjuly0l2nInokm
	XPuP1BrVKaJtyhHRJYKInHDuL40Ai7gDtnlE2C1nDDM79Q7076vErbfDanh0knlo2dsD7Xk/Va1
	FJ5N9/IF9QKl2lece+rRewUBHjshJy1K+mx5mhEncKv/SuEIbc7QOlX++6vKi8Xiu20SU
X-Gm-Gg: ASbGncujTTJHHysctcVykMnxllsoIXiagB60mI/pd4wIoC6jEBzPhm5YislmFud+aA/
	4k4WxYfTbseu8G4V6uukkBhhnEDw0+PDVhpTA7Wh3uw4ok4fcHMJN32zJGK9ob+//e5AGkbJH9v
	sDIhFJEQ66R28F6ifisuXU86cncgTJq1mqkVnqcxNVXLibuR5SqU8PiX/Yo4qGN3UIzUHsHNX44
	1kn3wgPYQzizdCKJfdLbXQymg5e2lPECNI0UiP2h3iFBfNEGh1yRysybmck02BAY2aibGRoJqXn
	9zPAHzxk+JwJJSmx3Hy6pRj8zrcs9/JJwJW37mr2fdCTqb9CnxxF2CbhBUmGrEzF/WL/3dY=
X-Received: by 2002:a17:902:ce8c:b0:242:e38c:89db with SMTP id d9443c01a7336-2430d1a1147mr33332675ad.35.1755075181352;
        Wed, 13 Aug 2025 01:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGLSOP/FvFnYj/RP7XAOC5Mu8yzgYaPF1YVSYkxCnWRayhD2gjF9Jt89SDe8nILhRAk4g0Vg==
X-Received: by 2002:a17:902:ce8c:b0:242:e38c:89db with SMTP id d9443c01a7336-2430d1a1147mr33332375ad.35.1755075180941;
        Wed, 13 Aug 2025 01:53:00 -0700 (PDT)
Received: from [10.92.180.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aa9055sm321924635ad.150.2025.08.13.01.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 01:53:00 -0700 (PDT)
Message-ID: <8f85dbfa-59ad-4501-9dce-57f607d6b8dd@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 14:22:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Flatten usb controller nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250728035812.2762957-1-krishna.kurapati@oss.qualcomm.com>
 <175496788918.165980.17430518825409421820.b4-ty@kernel.org>
 <dcd42e01-d14c-4e52-97f7-c1aedc81653b@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <dcd42e01-d14c-4e52-97f7-c1aedc81653b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX6ue+hhjCFm0S
 IkpWNgwaY8drto/KpydPoIqH75vKh3EAHxdIEGm9uodlQEuFZI2xyl9NWMTEsz8Qa7UNlyLONIf
 auytiXguXrXjfnSwG0cikHeQPmcZmTVC1UEmt6TLte7EaMJemW0Sfrb6eKyejVNlrgCfrFgVJzv
 vXkmT0g+xnJH3DswqrRJE803E2e95XWK6EHH1QrKIRr3KbtCeOO+Osx7ZXcs82S7fVSQGgeuP+i
 v+XylnQysosHeIJrnzcjfGj+U9uqm2tZVIjGmuGNNXsf8sgnRmj8uioXiWHYj9IsJE75ETHpCMg
 xXSJEICJM8XpKVgCyxiFsxXMUMMQPHqWxNjY5y4FAZM5NJFTZJvWCc0ubqr8JLqq5hvUMqQsX71
 OdjVF/+A
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689c526e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=bQzb5bde77GAewmGxgwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: eTeG0G4Kvf0WVGzM1JsgCvSXRhH4ZfBK
X-Proofpoint-GUID: eTeG0G4Kvf0WVGzM1JsgCvSXRhH4ZfBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027



On 8/13/2025 12:59 PM, Krzysztof Kozlowski wrote:
> On 12/08/2025 05:04, Bjorn Andersson wrote:
>>
>> On Mon, 28 Jul 2025 09:28:12 +0530, Krishna Kurapati wrote:
>>> Flatten usb controller nodes and update to using latest bindings
>>> and flattened driver approach.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/1] arm64: dts: qcom: sc7280: Flatten usb controller nodes
>>        commit: d72cb0551d113a0a42e12dcdfdad78ade2c63f50
> 
> Was this patch ever checked against bindings?
> 

Hi Krzysztof,

  Yes, I did a DTBS check before sending the patch out.

Regards,
Krishna,

