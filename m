Return-Path: <linux-arm-msm+bounces-79673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AEBC1FC03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A7E04EB191
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E15C355818;
	Thu, 30 Oct 2025 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nThFwbBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjkMlq0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9396C35581B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822668; cv=none; b=WXtsvBR7u8C1TVR3w3xpp20s8l07ewicgKOCCt/j4EBh0zY/kze/WHtR0t0go8OE6KiCTpV70UWcIMsli7DcrXXlflJz1kCP8rnAYJzxYqHDmSjV3fRGvUaXEHdPNvdd5qVI7F0HnaGvI8SzluDuihWTZPKOzyUEqoibkB8nmcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822668; c=relaxed/simple;
	bh=fmpYylNuAJmlqFeElJjlI/TjczZxhu6sPCw11kOv1FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4eMJ2il9V/8gWGBcWQbHrLsh47cA/fMJb+x4nAylBWG4ZEhxt8s1FMcRvLV7lBWS7Q9WtbYxGANfEFUUC50g6fWxpy+nwszj1WNonA6MXWeoCTeVELryMMnYX2M57M5m+zutGB65dgiN+hRKleGrOwLzSN6Zx3n6WdE8jWtE4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nThFwbBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjkMlq0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7YWcN1598987
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMFfKO0Arp0PpNimZso6vlYJl8HCzGUjKA9UJmqi2NU=; b=nThFwbBZy2cQM/W5
	oRoiDY405VdGO2Vkvb0AqjtIBcZu3hq3bA7hygdxWe/1gfZoUKEdVlKA1StohLJL
	Y9KfWfAI4DqspPbqqQjwPb4NHlZZbmF23wOrbExYNBssSiS0lvxJiymZXPOLSW0c
	gIc65glDS7BG/jfdZo5+xPpvNpVvj3LxVOn7XyUPKI9BDMss8nusbEWJb37fZGEO
	b+uLw8yt1mMCdFZAS59gVplKL5LxyfwjAQe1dVvwSCcjOZS0WONJMAZCgRjSHBbj
	UxfNul8NOMp5PBARG4N9KyKhwMzs0fxXr25QSVGguRU3QCAHUn61AdI3zfl6DRP7
	+LpeTQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7t7jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:11:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-826b30ed087so2624946d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822665; x=1762427465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMFfKO0Arp0PpNimZso6vlYJl8HCzGUjKA9UJmqi2NU=;
        b=BjkMlq0Pa0KbLz/8LjaW1A1EJJLx/SMCMQN65a4c2Ei6nwsSujnOM4qMJveu/SvzE8
         TG21lsT0RXpzp2N5QBDpLB5dL8y+S7BFg2RlqCkvHyjVRI9OJaSCh2lZPi6hKxmVJggD
         3Ml5edZNVo14xHgyhdwAcVaHL6ruc9YsoPGJTc7oqsh5dnhEGNo95udAZAPNA5KMPqif
         hq0U5+nl+XIBIvGfLLRzfE6YnuCVmI/qT5+ndpj6eSKHnTnSd5KPZFWcdah8/XTS33RK
         MbHZ0ltSwOcckNJKci+XRJNzgXYfuJh6oEvStEk3k1rRRrGDCqZr8uyElMXRtrzMSuT+
         askw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822665; x=1762427465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMFfKO0Arp0PpNimZso6vlYJl8HCzGUjKA9UJmqi2NU=;
        b=C19eMFJWFWQv1zSdK1/EczsW+idrg9R4nVPx/nAYCZ6MwumBeTODLHnlGD8tXMVygH
         uV0iPNEqk68v6s2DAzJBe/abYAiQw8uBELpkmBKDP3fYxXYHtMDJLUyFG48xRqEk59xD
         M2nwSZisv2Vt8i7edoNLi23+ifQ0S8g5ojiOBSuAjdT0T5EGJJ1iVRQ2OLt5cRdb81Jb
         FW7qRM78e9J7mJidgW1BWx1yNK5yeO6e8ra+tNzE344ixtvble+oqu4KEWFXCQToGWNg
         i1MMGBMzNsThnoDnBvd06uTV4z7HbfOfhS54GcP0v76EZo1vVP29IJXqdzv/JE70ek9n
         EpjA==
X-Gm-Message-State: AOJu0YxCtlSP2v0q1F5yLvFLA8DT4pPCZ4x2aESOk27+bhthjnXmKrmE
	VbZ/BQV888OSsPl7AwEqmM0wKXr+fh42LBLmHKlSBaJvQp9Fzu93Qx4h+9emF50sb6pNLPCecJ5
	rHNHoHg3RngbiY1n+L97dvj5HscwfBE0lkIcvHDQbYVR7dF3pPcLQWDXB6yHD07Z0VJ9k
X-Gm-Gg: ASbGncujLGnNeB2xQhyxdmsPVrmpOQwRltOmGqiNS++CmpIZEeT8Gr/zyQ3KeDYs/Qy
	4Gp1NhvUkYV2XbsUtkOfM9cvutH6IUnvKw0shL8QXB6Jktfh2nH7NitVRbv3YQyu7ZxgODzwkzZ
	oXYxAf/CRYE6/MhPzrxWBbOINK+lDexh2WEMd54wK3yZvmX3ss+N6NA2/sZ1pK/CMIDmCZvrfV0
	ycrKxWHY+ncJJmGANvW7ghAJnFaa9FlFlLj/QgycuST10BX4BATF1VUEe0nccWRNpj4I+A5MZLD
	SwTsGnXTYt9HXgVAM4NRj7D2hqv9++UPlPsjQ6VjzB4RwGKioSZ0I3AIzHYnFH4FKHyYly2pRDA
	nboKnQFYrWsxlxNXtlRxqatWfNB7+/Rem0cdFx5N3HpcTqtawyqbp9zCJ
X-Received: by 2002:a05:622a:93:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4ed15b96605mr49602951cf.6.1761822664419;
        Thu, 30 Oct 2025 04:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpFUZiuil/RskYfXLfvvpxx+bsyR91O1/o4OpX8j5gRqT/vHxdsw9YMsVYiyR8GLWNDVwovQ==
X-Received: by 2002:a05:622a:93:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4ed15b96605mr49602671cf.6.1761822663942;
        Thu, 30 Oct 2025 04:11:03 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7efd116asm14888487a12.33.2025.10.30.04.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:11:03 -0700 (PDT)
Message-ID: <98da2c17-764d-43db-9b13-d950078ba41c@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:11:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
 <102d9042-49cb-4aff-8b93-a882ed8da27c@oss.qualcomm.com>
 <e308a74f-1724-48d4-9d1a-fba6d06a29aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e308a74f-1724-48d4-9d1a-fba6d06a29aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=690347c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YgdUf8-DBacfkLe4iqcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Upoh1BhRdECgavMuxZQptd1F-UclwT0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfXzJx4EzX/p9Ht
 d9Eovk52aNYbPJmVsTjsGq/Q37wFWWYBTr18bnIg9gRMaCNk0ROm6UzAwHDaBl8MtBL7SaOVOwM
 ViOdL/+wtsC2iyDMikSXr/uYhc19YRHxKSaGRC2rZ6aa9JGDj1v2B0XZMktK2tEIazBGgtADcjM
 hdmmilaLCQEFbMvsUxxLeSdMaTRJUpYhDBQSrzPswusFYlxE+Cct7o2BdkTHCykXxNvtpAnE/YV
 Dm9yyfMcC9gWZL1BzXPrsa2OutyzkFZ90hsZfzHYvQnMjW6LJdvfNODffMa8cVWjHDPiYgnkmwx
 g26tD/pPTUYD37v2L2rect614vg/11Rhs3lxDwDtVFSA0W2LcPBeTyMemXiByCMSZcNYKibDgxF
 y7CWfLcnNWIDO5C5f/Q4Fp7/kVkhUQ==
X-Proofpoint-GUID: Upoh1BhRdECgavMuxZQptd1F-UclwT0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090

On 10/30/25 7:24 AM, Taniya Das wrote:
> 
> 
> On 10/24/2025 2:09 PM, Konrad Dybcio wrote:
>> On 10/24/25 6:24 AM, Taniya Das wrote:
>>> Add the newly introduced 'mem_enable_mask' to the memory control branch
>>> clocks of ECPRI clock controller to align to the new mem_ops handling.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> This probably fixes some ugly issue, could you please mention what
>> the impact/problem is?
>>
> Konrad, this isn’t an issue. Previously, the ECPRI clock controller’s
> mem_ops clocks used the mem_enable_ack_mask bit directly for both
> setting and polling. However, this approach didn’t apply to newer
> mem_ops clocks.

Right, the videocc patch you attached makes use of this. I didn't notice
previously.

> Based on the feedback from v2, I’ve refactored the mem_ops code to
> handle these cases more cleanly, which required updating the ECPRI
> clocks as well.

Please split the changes into:

1. add new struct fields, explaining the reason for the change
2. update the ECPRI driver (so that when the next patch lands the func
  isn't broken)
3. use the new fields in clk-branch.c now that all users (just qdu1000) have
   the required data filled in

So that the platform remains functional at any point in time (which is a
policy because it impacts bisect)

1&2 can be potentially squashed, potayto/potahto

Konrad

