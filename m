Return-Path: <linux-arm-msm+bounces-79767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C1C2274E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 22:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EDA64EF0C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4177E330B1E;
	Thu, 30 Oct 2025 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXuJG2No";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwhgd4RT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337F28312D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860800; cv=none; b=ld+T7JVP7HZ+Q9zrWsysUSdF7vsobD8QlPq+3/Luxuuez0JvMjPjQlD1zHtnXu6IJC//x8h0mnO/RAld+BsfPe4OAwsv4vOWyK59sJVyZ4XPdPpHnEa55+HhjYhk/4eh508M9NcsU785jKWtXfaLQ8GtF09zkRT39bZBVYf5IV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860800; c=relaxed/simple;
	bh=9iy3WYYWQj4OFJDP7O7hwwFZEy7svX6PlMzByPxJP8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9u8WJj+FaaoLvcjartx2K938qvd/xUELbxtB3linUxXZvd19mB+MbHPBC/450wMeI5SJ0ge1/YT279Om4NlIMwdOvVnft00sDRgT9wUAl5TIQMxTnkMaLXVxblk2cXmyTDCOwmv8cQZRUQYazJFvUWWUubYA983Y8J1AJTTLws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXuJG2No; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwhgd4RT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKescv3808770
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVDX3iOuXAA8cHJyPrUycviFCZvCGXFR5o+pvr9LcSk=; b=NXuJG2NoEi5QuVXp
	s6/XKwFhbmebVRSNjoxnblPxGW0sPWG2U55fnfTxU4GgMipAcDQMPkfBYPfau2hY
	02vWXPjImV9oR0Bf+kheZFqfTvQ904WBTKV5HlJB4WUuGv+gX0ucp7dhSkUl60RP
	ari+H9PhudqZi8CcxLZrSiRAEmev1gtVz78ZehV92tBTbc32YxoyAPbzISlO6+25
	G+kNZKtLG+MkSH44xncsnArOhI5YuljkJxm7pHDliM05TLluC7v+m2UDWUxnBZ7z
	kKiYVK0aQHNYMznuOs4EriB6WsvW0xlBlL0um1KLHhqX0KSQ3KcxTNAkNHksrSFK
	zFKMFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv9shb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:46:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso33560711cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761860797; x=1762465597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVDX3iOuXAA8cHJyPrUycviFCZvCGXFR5o+pvr9LcSk=;
        b=cwhgd4RTZLBkZ85dRzkRdXqE/HkuQ136OAYcolIg05QVezswmriP5E/VyEWqDyRtzj
         k/UiEzHDZpvQMMMedZFt3sCO207pMv5MDZvCZiZh/2CNRNY0MDGiKNxF6pZXdb/lp6x+
         gGwHkK7n2EJRpnxp6unKEXlYzpe1e+Q+KaBaVfC/II6kc/vQL7QwrF5xw45OtO13hlBq
         Ql/B2WpGmHH681CDDn4bN033hSAhxqrDi2mhsIc1I1yw0QBDt3LAJQmkL/Qoi5u13hwN
         IW5V3U7MHGS3dxrWgDLjSqR9NQYTFrJYgalF7ri7qc0VLNwE70frwy8LLfIhVw5Q2oOT
         NfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860797; x=1762465597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVDX3iOuXAA8cHJyPrUycviFCZvCGXFR5o+pvr9LcSk=;
        b=a/Y4sYTGtX0STn6iP31wwbIRWn5X7CilDjTPmYAhOBO6yyDPqwcmuvv9GIGkDTOQTS
         ccy/C6uvVDAR366Yd94IwuuUXZTmsHZc+gwU0AUcDD3Mr+eOk98Yg9fRHaENJe8YQZtJ
         rwuN9ERE3KtwWpBLBcOOARSGLLuBXV6AjbtRVnzcHtfE3ZO8+3+0cX5wEMtAjzsTP94S
         CEU3XcZsS2n7N+BlS5ree1VFzNDI/SBnT/hjBDzgm1lCa1f2lFtm4JMk3vcpzW5Zm+N/
         ePSPfetukOMzYnxuvsEfudjbGmnc7knrxzgR5hPSVEtsBJcDnlddpmnQGt8dkwqEK3EC
         394A==
X-Forwarded-Encrypted: i=1; AJvYcCV0h0VyoBubLAwSJg7uIDYXapxy3hGiR3AS/QLx0dGh7dlOl99SGCUHK4SVljETbbjcUMFJAo8c0VArYnCU@vger.kernel.org
X-Gm-Message-State: AOJu0Yylo5GnWH5lcFJ+G+xuN8pIe8pvoIBu2HPtuTPrc3wrPuMsBZv1
	h1siZ7Z1kYWA9Uq4jXgeKAj+BbpuzuFom2ZsXhkEr1QKDcgOzrIuk+92rfVgmpi0GRq1ci2eJWw
	bexoJKHFN/z2hTK17eDyyggTxufNm9YfwtXRMULtva9or6O51ygXIwItzX6raXLTTpoGL
X-Gm-Gg: ASbGncu7PMEKnhZYpyrJeUJp+QoMp5rj5yqA8iTV1a8auqy0Prmm40IktM7R9FlxOgD
	IgnX9jSDSfPGoxO2mzavX/0StDLjHy0coRR+bxQBQCfCDlB637KEWI+eSi9TvNVNKaWXEL5WW+M
	R62gF6RcOaumrnF6Gdj/85N3Ag1zPyWikZqSRzx9jH2l9vTVKE3ndkDeTW5KQ4MyV9pkvkyNA/+
	N0MdVIimxBGY8Z8drcI0tZwunY4o7B3lxZYou+qzW5jVMwpdLwN7noK/QuWoVZwlzn5TmkD8p9s
	Cl9V+RHn+angYGwaeIjTpe0oFxmlpqXp4CK1cVCNdsGXM16EnkG3S607SpvuxN43wjDqQ1SREI8
	TBi4GZ8/E5/uFfygO9PIE7DqENg==
X-Received: by 2002:a05:622a:2510:b0:4d8:1f72:ba60 with SMTP id d75a77b69052e-4ed30d5e031mr16451811cf.14.1761860796868;
        Thu, 30 Oct 2025 14:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnuDE06delvSf/YiMnURg7d6uZPSXU8wi15UKKa4OnmjQ0HS415wTaSDpjJ2fhr2dxUh3ZIw==
X-Received: by 2002:a05:622a:2510:b0:4d8:1f72:ba60 with SMTP id d75a77b69052e-4ed30d5e031mr16451641cf.14.1761860796450;
        Thu, 30 Oct 2025 14:46:36 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm34634222f8f.21.2025.10.30.14.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:46:36 -0700 (PDT)
Message-ID: <38e7060a-4f17-401e-bb3b-d4ba0a88d6a7@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 21:46:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add sm6115
 LPASS TX
To: Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alexey.klimov@linaro.org
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-3-srinivas.kandagatla@oss.qualcomm.com>
 <20251030181102.GA128512-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251030181102.GA128512-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -SDUS9ZdgU_0aKUpf2GFHPkh-XvIa3Hm
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6903dcbd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jP17tGJVULRfIL2J_joA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -SDUS9ZdgU_0aKUpf2GFHPkh-XvIa3Hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NCBTYWx0ZWRfX1PArB+/e6hEM
 ReXkVtQ1gJEfx/nqJFlcpoca1Ys2AfPemuYYRLHSR9m6am7M+AnY1oGyFxg8ZhZ8NohE/dbzffQ
 lgkEtkCBCKMLc2mNH5FvnaiB3YGv7N+rjC78i0Ylc8K04I98ebS4DujklAozP2biLJCjDZ02/9O
 hQmh74SdVcChen91rxpbMf2TP+SLgxyv6mY8NSqwm+dkIQUwv8pWa1tkATbNTnwpKcrPghBh4V4
 icOd3iaZpZoMsLIz6ZJrj0CZ6gjAzZUjwzHuiOmNkf9Q2YdwlRPK5LD7Z/Uqfik9ph3yXvtHf32
 LD92/iZWYwKztOt7pen6Dpx33TnNxo89QNpV0n8NeKVN1CtsSmzijqOj/vM9G8b5sDc/lcn/HWB
 utTDHnTMJs+AZYJYuqwkmLr0ktQqGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300184



On 10/30/25 6:11 PM, Rob Herring wrote:
> On Wed, Oct 29, 2025 at 04:00:59PM +0000, Srinivas Kandagatla wrote:
>> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
>> TX macro codec, which looks like compatible with SM8450.
> 
> Add? Looks like it was already added.
Yes, true, I should reword it correctly. May something like update the
bindings to be more accurate.

Will do it in v2.



--srini>
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml       | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> index e5e65e226a02..8dd8005d73d6 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> @@ -14,7 +14,6 @@ properties:
>>      oneOf:
>>        - enum:
>>            - qcom,sc7280-lpass-tx-macro
>> -          - qcom,sm6115-lpass-tx-macro
>>            - qcom,sm8250-lpass-tx-macro
>>            - qcom,sm8450-lpass-tx-macro
>>            - qcom,sm8550-lpass-tx-macro
>> @@ -26,6 +25,10 @@ properties:
>>                - qcom,sm8750-lpass-tx-macro
>>                - qcom,x1e80100-lpass-tx-macro
>>            - const: qcom,sm8550-lpass-tx-macro
>> +      - items:
>> +          - enum:
>> +              - qcom,sm6115-lpass-tx-macro
>> +          - const: qcom,sm8450-lpass-tx-macro
>>  
>>    reg:
>>      maxItems: 1
>> -- 
>> 2.51.0
>>


