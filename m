Return-Path: <linux-arm-msm+bounces-65812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEDB0B694
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 17:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ACA61899F39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 15:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7A7261F;
	Sun, 20 Jul 2025 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFjXZ81q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446421E633C
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753024222; cv=none; b=UZuv7aWNKHozs8cYgTUZRIFwD9QcFhq2ifJCvb9tbV1xvISBvid+dPgIykY1XT++7IKm0eAkYIx7OEmhKpWfRiTK27xDZgYEyKi8HNDiFcq/HVHIdSkKFOc+DX2ynZJe7yECXYae+PVIkQ/H6jKwaLRtMbIgOe32f1ThU/4oxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753024222; c=relaxed/simple;
	bh=mZot4AA9OBRbAVdYUyvlatmAoO6uLc0Fq85bLmE2k3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyak3/nyQpXF3z57atquErRqwjq35HO/uHcUIfPWz3SjO54HX+ts4cR0ORaNz9rLDHCc74jOVBA21817bZzNmsucYDfQM+StBY+NWo9MztM3mgM/nZcY+iDn2+gLzzvErX8eAeRnczYNC5+fOZrK8oWjPN8p1EuBMJm+13Fl5Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFjXZ81q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9SlqJ000892
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 15:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKLtgtQX3iZ3UpPIp7o+/+MXGoHWHRgcps7bsXffPNs=; b=VFjXZ81qMdksJ9qg
	sO7UskCLArVv9U2QTu7Vj37DVJ3oKuJKcOHiXxfInJxzkNsDBqAxcgmLMu8XjW0g
	CO5olz9qOFp7fvh6lpJzIo1im9/4wSGz2hDrSAvxdgi+OfhWNS3/T/NkFb31R012
	sPDMyUraXprrNWFz6eSSGWvDN1uYUWLLEqf47s33VFOkY3P8t/+GArA7MstFOJyO
	rbobxXnbS6cAd8soW2pWTpCaEWZsrckDzg56qktvqdqRy2b1njFKKMvsNL3pYBrc
	yJC6tv88ECRMwqUuWGlKDqowV4JPi+BcNCOKn20tI6ueHR76xTEzQXPjdh9keLpS
	DL6z1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459jbvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 15:10:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349fe994a9so28963695ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 08:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753024218; x=1753629018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKLtgtQX3iZ3UpPIp7o+/+MXGoHWHRgcps7bsXffPNs=;
        b=wpWS6qBiAOvB2HZL3/IdxVJAMeiB5m8XRNi9ZwTiWpDmjsbSEFPvYQRezl5yVp6NTp
         v8h51j9VvQwg2vVjvGZYfsduWQYj1WtpQ38ULSXBrLaxZhUIqx6c3qLLOr1Pv8Fw2iBI
         NusWW4Xgn1MitbvoAWzKpI6jKVEqoUXXpYo2nC3FakQJindyRiLFVqJw1Ibb2O3B9io8
         F9ysBHivwKIMRxgwOrXG7oEd/Zl/P+fbF74uJRrXgJeJk2XAymy4vyQRa3CeuL4cfFtG
         8x/op5++HuqFd7KiEutuwEL9p2WV/HalD2EqJ1SwQTklh9Cchns4o2CrmofV7aBBq57B
         /Obg==
X-Forwarded-Encrypted: i=1; AJvYcCVTtjRCYyae+H2Q1ISgpmd2czcUrra9q2CYDz/g2YiRHNcyclTS2a3BIJGSLuFtUyhKSeM7tCDXal2IkWUA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy+i8V7N6f+jJ/vEhASlpJEVlYljZdW5UoBm801uPUkzbcC4tI
	034+9AgbWj2qaqo66Y6saiNvAFaqafFE8LV8rhqp5dkRZ0S+AvA7EeqMxd1aV4MMsXmfv4LqTGO
	AIxKjvEacuAu8U+n+VjOMuO+AOzz1bh/v1+Up+qu+BKHOra0u3+zJBZ1vhSlLkrE1kp+F
X-Gm-Gg: ASbGncveLW9EBZvPCbTdqh6tPEIB2rk8mIURCrcQLa9j5Mg47TDM4rDptwnZx/381Ax
	8uJwTNYosWjVEGsLjp7Gf+GqYUH+E/5KrsU9bZPh1QDf9mms7+7s+RBruWsIpeyKPwFCU7DdgqA
	xT3YpqnoY8JA02tiJ1us0qoNIt+gcP+WAJnKFgLVwZwycSxb/4HiR1i7AUzpysnnV/rfwvJjRAS
	3pu9gQFCA2kdPcoO3SKiSnYG/W/yab/LwfbyXN61t6ZnwhTwf4S5xmrsg4h+NtE1l/WbaMcJfUl
	ISr1AqL7QJn2yD2P7KzlQYG+AF5a+XfttkMp+63v/Q9VDYkPHzA8Ksa05Y46ddzUjcZL8P/3Q/q
	KSaTnHQ==
X-Received: by 2002:a17:903:3bc5:b0:235:6e7:8df2 with SMTP id d9443c01a7336-23e2575a8d6mr239688615ad.41.1753024218458;
        Sun, 20 Jul 2025 08:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkSMhA+5+f/w8vyXIDaab6OyFxzkO8tWGVOAjJDo7yRKJkElqAEiK3qX38BKPQSY5MIO0xrw==
X-Received: by 2002:a17:903:3bc5:b0:235:6e7:8df2 with SMTP id d9443c01a7336-23e2575a8d6mr239688385ad.41.1753024218015;
        Sun, 20 Jul 2025 08:10:18 -0700 (PDT)
Received: from [192.168.0.168] ([49.43.231.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d1fb6sm42918305ad.160.2025.07.20.08.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 08:10:17 -0700 (PDT)
Message-ID: <877bba2a-b41c-4350-92b0-5904626b181e@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 20:40:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: add glymur interconnect provider
 driver
To: Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: lumag@kernel.org, a39.skl@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        odelu.kukatla@oss.qualcomm.com, mike.tipton@oss.qualcomm.com
References: <20250716151535.4054172-1-pankaj.patil@oss.qualcomm.com>
 <20250716151535.4054172-3-pankaj.patil@oss.qualcomm.com>
 <y5mqsl7ix7y54v54hltt54n5f3ofzg33lkgon4aoayy2nnkojk@r4qlsjd5wdqg>
 <0a1ff771-17c5-44d1-88da-5dd54c303d14@oss.qualcomm.com>
 <ffc17695-25e1-44d4-843d-d06d17e8da32@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <ffc17695-25e1-44d4-843d-d06d17e8da32@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FGgxCfM6ogxjDEMndrdNNKqBgy6RtKL4
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687d06db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=zhpjAwSWsGC/MCksz6s7dw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eYMzjZcO36U7msNfEToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FGgxCfM6ogxjDEMndrdNNKqBgy6RtKL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE0NiBTYWx0ZWRfXyOIZvKujpwBg
 LxiqTrmeBrnHkrY+cBFiMU5DHxrLqjNyltlf20PLKjOnxAy49fc1spJSTHvP+brl6esplivgCDU
 lGqVJCzrLzhA1Vx5f6pl+UNLTMbL9KfDEJ3rM3OvJY+1cFtdbve6+cccLbcOol/8RZhgZEp3/jn
 BU+RqhXG5Nr7PsAxNEPO//OBawQfVdJwNMVKLvofO8tJdnzexR/0YHaQWpfcyfSXgRS6+TrGxZ9
 y0kqutuyDFEuHOe+YbrA7ByEgB2glSYw3DKqKkxGXxlkxiweJCCAvVbfCgxuncs1cN4cG4DUPh7
 UB8nWWBZeYYmC96UNVHUi2C/cdYJqQVfhlykIn5WXiI4TGmSNHmfHAC8q2jNOJKw0kCr9W854vA
 U1hZlNXwkBRPnAjapfC4QuVP7IZWsfvK964Zar7tY0421IZBr7uKrd5R6pEm6kzDihlvE9Gm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200146



On 7/20/2025 8:32 PM, Georgi Djakov wrote:
> On 7/20/25 4:19 PM, Raviteja Laggyshetty wrote:
>>
>> On 7/16/2025 8:58 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 16, 2025 at 08:45:35PM +0530, Pankaj Patil wrote:
>>>> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>>>
>>>> Add driver for the Qualcomm interconnect buses found in glymur
>>>> based platforms. The topology consists of several NoCs that are
>>>> controlled by a remote processor that collects the aggregated
>>>> bandwidth for each master-slave pairs.
>>> I'd kindly ask to rebase on top of [1] unless Georgi says otherwise.
>>
>> I think you intend to rebase on top of [1], but forgot to mention the link.
>>
>> Please provide the link.
> 
> Rebasing on linux-next is usually fine. But why not use dynamic ids?

Sure Georgi, will make use of dynamic IDs, also will rebase on top of linux-next.

Thanks,
Raviteja.

> 
> Thanks,
> Georgi
> 
>>
>>
>> Thanks,
>>
>> Raviteja.
>>
>>>
>>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>> ---
>>>>   drivers/interconnect/qcom/Kconfig  |    9 +
>>>>   drivers/interconnect/qcom/Makefile |    2 +
>>>>   drivers/interconnect/qcom/glymur.c | 2259 ++++++++++++++++++++++++++++
>>>>   drivers/interconnect/qcom/glymur.h |  185 +++
>>>>   4 files changed, 2455 insertions(+)
>>>>   create mode 100644 drivers/interconnect/qcom/glymur.c
>>>>   create mode 100644 drivers/interconnect/qcom/glymur.h
>>>>


