Return-Path: <linux-arm-msm+bounces-80331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D813C31B68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 16:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3FF1883D95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 15:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D679B32F764;
	Tue,  4 Nov 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIevfssQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWVluKmZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542993328FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268316; cv=none; b=kqcsq07vcTT3msB8U3t2fOhB65D2XmuXt2iTnhzAWI24r1IUKRwPA3H/rFfceHxUkK7Ax7OlCUv+wG0Q8zIV9pg5ZUN1vMBZI4//tk+KsSblN27VErODQGS4CnfV+PtK5HJujv4sjUL3iWKS+SDs8tO38v6pZQySfk4uXqJhEZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268316; c=relaxed/simple;
	bh=UWXnRIELy2WQt96jSHrYhMbGqGyPPSqNnNhK2I0eXJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dr64eN8qEE9NT3xLRTRjBxrVazQobY5lkCwV2zED1+nbrWLOKDaml1yy1JsrBLWs83sRzyPSWKRgHzg0cbmRilL76wgrrDoGUIwS88iVwB+/734g8Yna2gbmKycQcgttIEiWB6q/xDNQGJvstzvmOUsoMnKSVHWg/tLC/OJoL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIevfssQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWVluKmZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CgChE2007770
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 14:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XU6Ehmk7tMO57YbmkIPe+IDBaadKcLopPQR+KEF5PvM=; b=cIevfssQS0bvbG5Q
	DI3cc+NGaBcDaLzv5s4p60JAJWBB6NpBBH/pCkmgDaBt16V0xvsMK68rUBd9BPSu
	Y0zeSYGO278oOz/Htk868kPuO3TZC8AzbuSLEk0OP6cxxlyDXTt2PdQIyMkpj7i+
	GDqumX1ij04PgOX2CY2D1OtPv4zicy/wGJdAGvxmhFEbS34hyYqkYBzdj7sHgbcg
	K0sIx5lNq/20NTICzppQLoJeV2A636er92mN5m0M35XXCTVxI6H9JB9Zwy2/E6Ng
	BR+gFPGT4aDxGe8M+BZqFkG9uvHY03QPc5nzS/60ENTeJpPy6hLmX+Q9R82vuXWv
	URrquA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jhcrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:58:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so19715685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762268312; x=1762873112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU6Ehmk7tMO57YbmkIPe+IDBaadKcLopPQR+KEF5PvM=;
        b=YWVluKmZE9Y5yeMqbj0A5mviQSl6vXsmVF+eJrcly3C5gREjpTcJ6KRUPiOJxV1kCF
         Hmyq/COWKgpBsVTpv3wrxgnUstjQPJiAALTOYTiEeDuKoUcp+wz7j0k/CE/xSjiThEmc
         EaTKtWeNSuzTsbrDWLRkuPrP/tM1IpBBWuLtpadOie2HSYK6xMgQUlCSyCS2U56ijkFb
         z1zADDjJIrrmVvPgAGh7Tibb3s29QQSCwc3MHGpJrygmV0Arw/Tex6aOSDoyavH32H5L
         I1eBxHkN3+EhoL7kwVWcqtR22A+TlSemEQq6etGntA1dxeyoUGaQ1g97H2RPaRwEFtnn
         jluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268312; x=1762873112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XU6Ehmk7tMO57YbmkIPe+IDBaadKcLopPQR+KEF5PvM=;
        b=BFJbk6XFcYyeHDT+13T1YLGwoEjghkJIjR+j0qRadpO2/srLWnnuaB3iCE4koZOefP
         9Prwi1dVXwGb+vaWKUXqik1pEBPmPJ3Nx8I5n6A6NRZz5vAGb/RSdqwXRN5iRCtlAbl1
         oso9DvtMbNkFMftmrYRxXavrL98E2mTYTdJqrdUc7OhVmTDWxTzrSeQzu+erQ91/4hgh
         U9zjSVoO1MqphqtDryL0yy1nRShFhDfUryCE/68jTjdRCyY8834D4wqbNVAIEzShA/Oa
         YxR2SYhnq/ZLmxNwmATgyhgNNwMaiuFfnAlhMNbvDYYjkLKO5X5IDJaLQu+KP5PjlVqC
         aq4w==
X-Forwarded-Encrypted: i=1; AJvYcCUeM8Ygf6ynQU7LxfiHXQP+9BN1Yj8Ez4qjiHxKLXWcdAUhR/vQq1+hRyFZm6LaHZxBnI3Getmq736VA7t3@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOqpg5HIuHMECMdMhUkkUQarotBjm/YA4z/ZNexw9NFWWuHnD
	hhDkAvTZVIlp+CEFu9CF4aNocpu7C6GTMNoUvk/AeZrk6hQ/YGwPVL8JyBVwL095pU+kGeOn64n
	yzojY3nPt1Hb2fCjOYrW5SjdGuM2hOlRBffjmFxsnrehDMWTDKu5Xhhgle4wbjo2gGv9y
X-Gm-Gg: ASbGncs42al+tUusngy3qOJkNd8A37wkXHW4SJqiasM+nGWim3nnoiM1vULIE4frIYe
	o070L3VrvH8myhxAKllf90PmYbvqQmwzCaPCVtytd9Ck2zklqReqKwepAElGfpcxhd4DJaasaHn
	2GiZ+Rl8F5CLwC9Wpu8e/EUHvoga5moSmbCtYdpDsWfJSzi7O64vPetgQsOd7Jn1rjcgEXyA3a1
	FEYkj8ydavNTxMFfpQwy9c6g3vJbPDsGMMnTT2qSw4sdfz/ipk6gHN8XJcl7vx1uGhwAoz58nmO
	3HmCj1NZQR4wUilv1q0FaTR7rGRDgiewDQws51DjnKIg+Jez7ILLeEKCNBA1viZl41xHceAYwhU
	RyQQ86A9wNVhEeyU8fyDmik+76N1jOXyhzEco641qw0mi+nTBbSyhDJ6l
X-Received: by 2002:a05:620a:46a8:b0:8a3:d644:6930 with SMTP id af79cd13be357-8ab99979355mr1478798085a.5.1762268312284;
        Tue, 04 Nov 2025 06:58:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmHPArzeeY6S6vA/qOz2t22T/NjXHvYbIKjw4w2P+c7dmzZPPCuH7Gx17ZDGuqAZsfcXpd8g==
X-Received: by 2002:a05:620a:46a8:b0:8a3:d644:6930 with SMTP id af79cd13be357-8ab99979355mr1478795585a.5.1762268311824;
        Tue, 04 Nov 2025 06:58:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d3a3082sm230640666b.11.2025.11.04.06.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:58:31 -0800 (PST)
Message-ID: <9d80b581-5d3f-4b95-91e7-c73c113b0976@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:58:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
 <20251104-glaring-rebel-pillbug-a467ca@kuoka>
 <790ca394-cee2-412b-97d8-c6416b843010@oss.qualcomm.com>
 <b6717831-1840-4b9a-aade-ab2248e3f75d@kernel.org>
 <9ee07db9-508e-4c08-8f79-6ccfd9b646ab@oss.qualcomm.com>
 <6af33c1b-5b95-4efc-b429-5bfb9ee7caeb@kernel.org>
 <8cf870a8-706d-4514-a87a-a69b64521ab5@oss.qualcomm.com>
 <f539b21b-cfe8-4055-9620-4d5d8d108098@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f539b21b-cfe8-4055-9620-4d5d8d108098@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEyNSBTYWx0ZWRfXwS37JF99Xt3C
 9j7F60oyU9NCSqH/7eycuo6QZkuor5B2DZH8SCNCrVc0B10Bp2LqXI0odRdWJs0QLJ1wr/AZ1aT
 EBd2vS9M6aA8CPoZtZJyhiTeQ7bBLVdZdGPLhTPy//LQYW8PjXoRAT8ucht5T57rFy3T3ed6p0M
 IkrVOTqC+8Iwlvd6u8vvuqOaBfKAkxDcNJ+iNevZHdudaisiLp+Jun5be6oqmrS4ikcXFMkVtF8
 GTu071pZ8B7Mx0iw0nB/ZoN3wbAs02+S6ni39zEm3A/fJ0dngSEbfou9uH1BCOs6ec+hVy/vIzx
 rexwExJfKszsxDOBmBrdy6tjWrkcXVzRqhM4DhxOnbaQT854fNa+xoPsGfWmdcmrGv49PXs3yIY
 EhhQVtYX/0a/T6OqiCo+4/V8St9kDg==
X-Proofpoint-ORIG-GUID: S6jSQqHCiVuiyd-jICPkqSn3q93CyIFu
X-Proofpoint-GUID: S6jSQqHCiVuiyd-jICPkqSn3q93CyIFu
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=690a1499 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5iiKZxNyi93qT-c_jNQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040125

On 11/4/25 3:52 PM, Krzysztof Kozlowski wrote:
> On 04/11/2025 15:38, Konrad Dybcio wrote:
>> On 11/4/25 3:37 PM, Krzysztof Kozlowski wrote:
>>> On 04/11/2025 15:35, Konrad Dybcio wrote:
>>>> On 11/4/25 3:26 PM, Krzysztof Kozlowski wrote:
>>>>> This I got, but nothing here explains why you need generic compatible.
>>>>> To re-iterate: there was no generic compatible before, now there is.
>>>>> Writing bindings and numerous reviews from DT maintainers ask not to use
>>>>> generic compatibles.
>>>>
>>>> OK so let's not worry about a generic compatible. IMEM exists since
>>>> MSM8974 and it only had major hw updates with SM8550. They don't
>>>> impact the software interface though, so qcom,msm8974-imem is OK.
>>>>
>>>> There's a separate control/status register address space for each
>>>> instance of this IP (usually far apart from the actual SRAM pool),
>>>> which Linux doesn't have to care about.
>>>
>>> Just use qcom,kaanapali-imem - that's the first device here without syscons.
>>
>> So we don't want to move the existing ones over?
> 
> This was never discussed and this patch did not do it. You cannot move
> them, that's ABI.

I see, I implicitly assumed this would be a sweeping change.

So should the Kaanapali submitters simply send a version of this
patch with:

- oneOf:
  - const: qcom,kaanapali-imem
  - items:
    # existing big list

?

I'm not a huge fan of using kaanapali as the fallback-going-forward
since it's literally the newest platform on the shelves (or perhaps
not even on the shelves yet..) so it's going to look funny when
someone comes up with support for another 2013 soc.. but perhaps
that's just how things are supposed to be

Konrad

