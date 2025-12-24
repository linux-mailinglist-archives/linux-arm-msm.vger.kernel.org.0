Return-Path: <linux-arm-msm+bounces-86563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AECAECDC105
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E291A303A0B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B97531D380;
	Wed, 24 Dec 2025 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSFXgeTQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYtLwVz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA06306D3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573990; cv=none; b=E0S/sh67Vj/d7ndL1F5d8n49/fGYTC9jBYtp0wBtjUZGondJpFvBJhZc+qwAFaUeURrTLzz+DqaNXnUbMyyWFCMWvXD3dAAMRijHjpSQVHHQA58moGqps047ykGVVfd2o1YyWA/chBUWRE0ioUcsetLoi/W+ohrumjy11eJEIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573990; c=relaxed/simple;
	bh=rVelJD6U08k2g5EbxP79rz96OkNIYvjTufWPCeoLZbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5plpqwb4EomSCBMg8S17Mj7sIKiIKCXvjZNCGl1vaJpKc7OLvj23hOxFyr0uZygxqCQg5vc8v+bO3KMjHERwgYpTLcMWVewTTKHLpgiJ8MlfT2xXrIo4zm42gaIqFZmgvNF+EbaY8gHd5hHmR9gHpwcPZoxsQOHw8MrKBJNPXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSFXgeTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYtLwVz8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wNFj3796691
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65ij+2/DAmNHoc4dyJwup6v//8+Tuz1DKXtAGu3ATBE=; b=kSFXgeTQ88GSv3mU
	uqASodlori7Mlj0Gh8UPHbtfBnLUaWzzsUj91N5dWGbQ6YJ7Uil5cAXrw1KnjlsT
	DgtrxJoSPgRIj2wTLE05pnRxntxhqcKEoNYGLgAej/ICxb6g4G7xwVfTrZQxMQ38
	G5+4KESX0bR7y8TX+CPMaGA1l8orbveilfi3X0ir8hT+MNbiF7GyoNRUy1sXAP56
	U8X9YeyPWB7KHD0ATIzIoOn18vi46XdXbDqX+3wXyYNzX1MNTB6vAGQOTF3VtCQr
	Zq/uEGkp0ZjKnTgwx7GqmHY5yTWuS16BvWvTsXRAW8qRkmOImaGYLQsHpYW4fvVL
	oa5Ajg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68yu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:59:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc2a04abc5aso5252326a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573987; x=1767178787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65ij+2/DAmNHoc4dyJwup6v//8+Tuz1DKXtAGu3ATBE=;
        b=OYtLwVz8xPpNRfp6Dnk8Br8b/ammnKAHcgtcfgGuXxaxymKcOwdz/K3yekZcGXRUih
         /ny5KSGmqbpypY2o7+IwBwOUfgRyTtBcFNKD+9gdwu52+X8bfH2xb9/3gkROg2etySsS
         Hjy0x+L9BohhVkrZoIskBFdcIg1BPGUQRDtnIXtB5BOkLYyW0qb7TTWnyrQHBqGK0xWY
         1dRyzum8PxGsAGows0PVtEcElUiAcToCr4iEEYqN7qkibUUBUzBwEVLMvC3PKD6ZhesJ
         nXrxvpYVJwTBeoRtErlhNq3CLJt9lkVIjXmIsiYENyK1t+eKXGhfCqQJm1jLOxIypDj2
         RkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573987; x=1767178787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65ij+2/DAmNHoc4dyJwup6v//8+Tuz1DKXtAGu3ATBE=;
        b=lUSsQ0Q/YFgQ3t2DmECFcBXYcWW9h1RTAEd2gEbDLV+EGTKsbb84HNOM/p++8SnM7h
         6+lwFNHT18stBQfKecU3Bblqvvzqk/cSC8s+id2RtdAP9FI1QFK8uB4b9RAa4AuCJnop
         5Jm68zGsnMdeg/Rtdo0IFokmnfJiGwFZl77v1BdCB32V1beeSQ7+5WClbbDqy0Fai0ai
         XyzOyxkTt1a6BS9H4CPc1fLt15U7M8HoYRO7d54qZPlnlYHvm5tOgq11HMYN7vRsBWWQ
         /5GfB3ugm7kJVRu4OSZXkUuuLLDd+T3IwlBwuq8pvAIf6g6l4AemXFmRJ0tj9HKa+q3a
         ovPg==
X-Forwarded-Encrypted: i=1; AJvYcCUxw7HcpptSpcJCiHxZkfD5dy82XH/3vpTUe3f9ECdlBulku2oTpeeBmJGU+81jPtDgiPoU8+cRwmFtQIca@vger.kernel.org
X-Gm-Message-State: AOJu0YwwhTYFrXvWPuTV/b4JlVqjuZdktFwxPqlzKnFiAEaHogWkruB7
	i/NwR5oHLnDioqi6h0jeTsQnO34Afspn6FGBrNV/eTYO5bUmyvMo9f6d8WiUNdS2tKmPuDOuUGE
	JUahhWuGfupFE84TTdx8eerx1kJLlao7m8wt4Cqh/obvNFaod64lsF/Iy4733CgmfaJUA
X-Gm-Gg: AY/fxX7qH3gLwsiRQJQeu15Fj1T99fPmqAjda1lDl0vb3fPbkZBln6MLx74xpCr22LI
	4YhkOj0KMr7IubMS5gXTDmu7uRAOrCIouVAFSMQA28tTOq8HKTUrON73+AG4YbvWH0kVqOLmCoP
	qxwmbS7LNsPLMTB+3AIEqneOKKdSx00aoQyq1gdtY0knzTl1a7eK0YBTOoeVckq1yB2rsUsH8Ev
	nRat9T79rLLZN70Pkgg/kojuRHLZuc+qD2dxhCyKWoY3mZmoUixXQWu/Vd6mO5BY505gZHQw9Uj
	BJyOR9J3rSPA9SxoXyklpj95Wj+5WOzQZYMB3kLXhGxQ2WHZd4surv4hZ/JdhHaaQOrplrwNTBw
	MTjqY9xGVuJvUnRbMvfF9ufUA17XjPR3CjhJB
X-Received: by 2002:a05:6a20:e290:b0:35f:6e12:184c with SMTP id adf61e73a8af0-376a9ace741mr16490464637.60.1766573987352;
        Wed, 24 Dec 2025 02:59:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDxjHcmbAfU0vMSZnnELdYkr52FpZ+BCX/CkrCd0ClqFv8mPu7xlW3LaO3oV2R81ZNpYlPOg==
X-Received: by 2002:a05:6a20:e290:b0:35f:6e12:184c with SMTP id adf61e73a8af0-376a9ace741mr16490450637.60.1766573986843;
        Wed, 24 Dec 2025 02:59:46 -0800 (PST)
Received: from [192.168.1.5] ([27.57.93.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34eacbca905sm5971094a91.5.2025.12.24.02.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 02:59:46 -0800 (PST)
Message-ID: <87b300a0-7ff6-4506-a27a-7a30e77c2bf6@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 16:29:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on qcs8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
 <n7ucdvjlvst23zbbcwenp7umhn4wgsznqp23scpknwqnd6tcep@i6lhp7va325w>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <n7ucdvjlvst23zbbcwenp7umhn4wgsznqp23scpknwqnd6tcep@i6lhp7va325w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qptjTeNw5dENbKnMmROJ-Fxpsyt3qleR
X-Proofpoint-ORIG-GUID: qptjTeNw5dENbKnMmROJ-Fxpsyt3qleR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NCBTYWx0ZWRfX9quKTm9s0FJp
 pMimyl0rp7eT1xBNdRNbQghlCZT7nmuBYJ9SLEc2NM4Y8WBn3g7/HEvVQMsu2xosjDvBLYfQSXI
 sLVx/l5LqU+6ywbsq/VqqQz6WUAkq4qC0h18+ye+4YyC2wdTQXOycZussUsVxNE8Lo6lQZGL2xx
 qKw/PdnsBmf7tgcZAPzCde3mBclBvYV8aUyICgTnlSbK993nVN2uddBXsxs9zcgNonOBljEh6Le
 CzZDQ9lnDnFXNMt5YxTxEnQMqVeX2AvMJFuG8sgGON67OV14V3Baof/T9ROth8p/PPTXP12c6Fz
 e+UzRo+R+zlAc02zriZJ0Ev+KWO0ZVtlaKlIIKlgfq9QSl5oXz1jq85FESJ7lkOkji3mIiBGf1m
 HMov16VSR6v/soaMV1Y56l7gcDHM0Fl4rMG9OT+bpLMoq15btrunABE49d9WsThx5F8f+BADKDF
 QZegcUPIx88gyXrs84Q==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bc7a4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=luqpl2TCSyK2LuNNAmtdDg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=izIGmOzjKg6u1_hBuywA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240094



On 12/24/2025 1:25 AM, Dmitry Baryshkov wrote:
> On Fri, Nov 28, 2025 at 08:31:04PM +0530, Odelu Kukatla wrote:
>> Add 'clocks' property to enable QoS configuration. This property
>> enables the necessary clocks for QoS configuration.
>>
>> QoS configuration is essential for ensuring that latency sensitive
>> components such as CPUs and multimedia engines receive prioritized
>> access to memory and interconnect resources. This helps to manage
>> bandwidth and latency across subsystems, improving system responsiveness
>> and performance in concurrent workloads.
>>
>> Both 'reg' and 'clocks' properties are optional. If either is missing,
>> QoS configuration will be skipped. This behavior is controlled by the
>> 'qos_requires_clocks' flag in the driver, which ensures that QoS
>> configuration is bypassed when required clocks are not defined.
>>
>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> ---
>>  .../interconnect/qcom,qcs8300-rpmh.yaml       | 53 ++++++++++++++++---
>>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> As a generic feedback for Qualcomm interconnect drivers (please pass it
> through the team):
> 
> Please ensure that QoS-related clocks are defined in the first driver
> submission. DT bindings should describe the hardware and it's not that
> the hardware has changed between the time the first patches were
> submitted and this patchset.
> 
> I see a typical pattern that QoS support is being submitted several
> months later. Why is it so? Why can't QoS be a part of the _same_
> patchset?
> 

Hi Dmitry,
Thanks for feedback. we are ensuring that QoS-related clocks are defined
in the first driver submission like recently for Glymur/Kaanapali, there
were part of first driver submission.
QCS8300 and QCS615 are the only chip-sets, we are sending QoS patches
separately.

Thanks,
Odelu



