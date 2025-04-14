Return-Path: <linux-arm-msm+bounces-54145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D83A8770F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 06:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D5F33AED48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 04:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA4019CC0A;
	Mon, 14 Apr 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VanVoaNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024C11401C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744606033; cv=none; b=d8ouJumPOAXR5rcjN8CliW/lnS8B+cq+KMzc8gLUG+ToBnWO1oZjqVSu9/G5nxk6ZQtcCWKYhlz+lVUhzqOak/1x4+GLujiotwKQHyU6Mye5bhbsAYfYIodTTmFqqqzFqZ31/mFXg04doPyxdwb9mkrANBpEN1fJoQ4hts621C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744606033; c=relaxed/simple;
	bh=Lzn3nHg6frC70bwlGUP9NFlYU6/Ims181gO24nFkAeA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=L+O5ypriXUjEWj24H9sV3Meq4pDKxcmN/b1RaTPZRKt2BAYp6Fvk7X+C98aXnSzYEjpEEt33BtKxVOCXI8nJPHkveGB2QtPKAxyhPWQaxme1DXMAVF32pk+HpBjMqLYV9XWmw8zzXTLmEAwnVEs6UCIz/RvcjWDPajoS/IXWbOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VanVoaNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E0Nji7028329
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6LHPGzKPTme7TI+asF2UgD5YaL0iWt97fab/CoRnI0=; b=VanVoaNycbpUTBNM
	dc7qcCbPBr1jrTZCRwy4kjtcwAUVShM2Cfalrhp39gh5DTz2IGv3V565CbsWTqaz
	1tnOKpeRjPbME5WndUinzXjWLmuRdQ5tr0T+UGGhmz8/sBMJt8qCI7ls/kkZnNM8
	PSOC8l/OCPUDEmrTpvPkXhWzztvgmZ61DkPiqykCzDi4pWs84oH/PhzlTJfQv5va
	F9O8ez0rpEaLViiww/mVhaEGM302joHI38LuEdE19gA8MD9BU2gYppgp2ZngTk9f
	pCfYPVxQPzqanJmxqLqLXJnpHcKqQGHmDmnL4K7V+s9dB60MuC9cwYXRfhMIzT19
	U0+95w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wb9en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:47:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so3489067a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 21:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744606029; x=1745210829;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6LHPGzKPTme7TI+asF2UgD5YaL0iWt97fab/CoRnI0=;
        b=C65VrvKiVF+KM5B8zi8NL3so6QM9yO5QcRjdhBW1mDKH9dcUpC9HIudSAzX2OJT3y4
         nXB/uGNMYyggkDO4Nei1tNVzQ1/3T1KHXTbuPNJ1SObxZ5ecofsVP0e0cgH6PfyU9x6u
         /UGA8OkuvxPC8hWA6HWlxkWxqZG2Tbmzc9/BokuG4bZHhSGPSH0rddJ0tLyigUEtUpIL
         ooVYD9rVusdJ8EUvZpC0aQ/ePJjPM3MLWwiaWvoN4u6lszoTVG7vAvoAWAW2BIitOhKq
         2HrHmNDkQqewgLULVDQbadJeVB0zCIOlxAznRKtx13gDn+FW4TQEvUtJqnLjuJ8lZd6r
         SCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYAcT0YNFQJQMe/C30U8msHktG/SUHfNz7cMFNRbGou6Y6ncSN5HnMbFULehtcCDZXSmyzbYzJ1D0i2LJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwOahmTSX2/NeKc/H9NjmuPNwlAS1K1lIxPrebzG4omrhx21ttF
	goSd8GkBO1Pc1rcIW5XxhBaTQuviJAdz0LUpfhLDLbWKctL53EWvwWxW7JiSKDAyigFSD4r+FF6
	IiIXcuDSJj3cJsQwRWpvnRP1obrpRDJHRv7RsXJKQh4IWEaf4DGH8e3aVsBzWDhtm
X-Gm-Gg: ASbGncv6MJrmuBnLcYd5L4Y57nISXx2hRVlz79VpO7RYVJ2h3cyTax3x6+sB+jllzGS
	4KAZnHnRn3KR/BpLUfxAtK6Cc9qUN+4LyYY3QiXi2ohwaWTNIBPt+1hk6rKbA+JJk+m4+9g0wxU
	qC0Vxrl/vyBGr+XObAl4qOoh/z8Vz9TiiOQEJTqJRnMkQ/vfEBzugdeI7CcpllpdZ7uO8lLFKs3
	93NMppkgfbQB1rSfDCNBSBOrXRLs1CyEvBP8NIL1L1IBq7gZqeOmanoN+yeX4XoVWn0k1dl9dCo
	bIvOhUa2ppqECsOmRQmckC7vDNp7AwkPfoGtw1A=
X-Received: by 2002:a17:90b:5845:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-30823672b9bmr13074697a91.23.1744606029145;
        Sun, 13 Apr 2025 21:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENsOydhWzBxYmE9zqg+BUpla0g1wkLIqAB06iaNVVVSJnMKCP1JKLevtKvj7kV9klIR7euew==
X-Received: by 2002:a17:90b:5845:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-30823672b9bmr13074666a91.23.1744606028211;
        Sun, 13 Apr 2025 21:47:08 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm90866115ad.148.2025.04.13.21.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 21:47:07 -0700 (PDT)
Message-ID: <8451d951-4876-4dbf-9a64-6284f4b194f8@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 10:17:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-3-gokul.sriram.p@oss.qualcomm.com>
 <6b33d7ea-4ad5-454f-bd26-0ef961cf7ae3@kernel.org>
 <91bba481-5871-48dc-a7d6-86f3bcb60d0d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <91bba481-5871-48dc-a7d6-86f3bcb60d0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fc934e cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=I_bNZBVWta6x9M9XHmAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: YaiZjklBhRl-7JP-vMcLpnvedB9YxYzV
X-Proofpoint-GUID: YaiZjklBhRl-7JP-vMcLpnvedB9YxYzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=832 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140033


On 4/4/2025 12:38 PM, Gokul Sriram P wrote:
> On 4/3/2025 7:51 PM, Krzysztof Kozlowski wrote:
>> On 03/04/2025 14:02, Gokul Sriram Palanisamy wrote:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Q6 reserved region
>>> +      - description: Q6 dtb reserved region
>>> +
>>> +  qcom,q6-dtb-info:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> NAK, you added new properties which invalidates review. You must drop
>> review after making such significant changes (3 new properties? Several
>> other changed).
>> See submitting patches.
>>
>> Anyway, NAK for the property, you don't get DTB info from DTB.
> Sorry for the confusion. My bad, this Q6 DTB loading from rproc is a new
> topic.
> The HW/FW has not changed, will revert.
> I will repost V5 with just the comments from V3 addressed and introduce
> the changes
> required for Q6 DTB in a separate series. Is that fine ?
Hi Krzysztof,

while posting v5 with changes to dt-bindings in v4 reverted and retain
it the same as in v3, can I keep your reviewed-by ?

Regards,

Gokul


