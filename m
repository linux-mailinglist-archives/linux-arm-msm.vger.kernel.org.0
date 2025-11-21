Return-Path: <linux-arm-msm+bounces-82821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C627C78AC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A79F73651DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5283451AE;
	Fri, 21 Nov 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3a4AKv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPeqxWdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317A33BBAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723013; cv=none; b=EEzTICTB++r8haUCGJLIsyz9zDUeLjBDq+agY7O8EMSPyfD3F1mLooCT6MgtdTOU54fDBmysNsrEUM6sMKkdGIG7rgg6XWNrVahAK0Xbt3miZBq3Q2359bfVh+fxGLcIPzm7hiiTp1ey9WNhmMtuw4XWAhZDmnw8vs5urM/QxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723013; c=relaxed/simple;
	bh=0Wxlvaw9WFLZNvIYpHr/qB58/q4xsqqklo1RMia6WQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+nOWVw2YiFQZT/ARK9ss9LAEuRM3kDDXaku75pZ95xmWkpe5JVYHegyfjvehxPXMYQpSgAoePkYW11JCsC3uHr43hvTDoMzC6h0BHWN6fMi1tQxJBICY20CtZnagxZZ0l2biyO1LfXhcChE3IADcr2cfY0MOQZYO2/oE2gkhfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3a4AKv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPeqxWdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL54B9e2841459
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AawzoGbQ3sxjSr7BFD6zRgn15GV1Py1XyCIh84Y7TtM=; b=b3a4AKv2EBZP+eQd
	nxcorQrsxzkylM2qpzoc0Ez9QMxSLec3rCb00h1qYVgBvL75+97/XLA27LptqPu/
	ZD4/W6KfKHcBcDCwXcICOoCwNazhK72c1ADKWB4TwxFvPNHxwwAZ5NrUYtxyPdDY
	jM3wh1uYARR/gSk7JG7UP3PGTn/0wvGTS+Y/2ISljOd7PdMh9uKO9GH/eAvDWf6b
	tcEJErNcdUg0qcekXSmxGXyzUkMawN9chWHgIlRP2wuplv4DKriFLeYdzr+UZv4Z
	oA3VDXR0/SZ9EQyT9iMquj+XLAxJPTg82AOcWaAZ1JOMzTIyzsc5pHsh7Q5D0gcC
	MxKZog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvh6ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:03:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso4466141a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763723009; x=1764327809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AawzoGbQ3sxjSr7BFD6zRgn15GV1Py1XyCIh84Y7TtM=;
        b=TPeqxWdXbFAZ+2Aw1JyWEF2KYlpEDg3R3lvGLzDsJAbJLlvjOeLQGqyBmUPAamKopM
         6rRayQbm37W9bvj35LK9hpbSnXZHMG1dTYez28eiFSIVPHIY1hXfnKJ22vrK4dnkqzEi
         P5GR5EFbEGe0OnDMR9ts5K5qr8ad1OkVmbCAGvciRH0FItv4E8A/3bOjczie94auCe69
         zOQsY0ftZQnDOljsuOSuGvF8y+vrs/4q0Ibpf0wMSEK/sIVzogh2Em2vGo89a+bxEXv2
         uu3gfW17Zf6MtpqLxf2TxehTPS7l+G1AvhDse1swx9CQqVyQepnBcO2zxRfHu0krKoNq
         ZB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763723009; x=1764327809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AawzoGbQ3sxjSr7BFD6zRgn15GV1Py1XyCIh84Y7TtM=;
        b=jW+Jz9sLE8gIrlhMPjNxxOh3ScdQ8V4+BdAkXkf2cXGIj6fJo+TF23EGwV2w5mdx6j
         DUnMl1sbwid/SD8aNhEMJ865fZL2u8gwPik+fccRNRoRi4eH0szoRTCdgnzmB6wg33ku
         srxFUMZ5gDGKUIFsMt3Im0G7Frfo0nVvyddz2cxe987YrEk5ujUwut5XudA02o4Est+e
         6RT0GviqxNrc2mPSZfSCkSlj8Pjg4lwtwf8684EqhGo4OyDJDzeqiYqVk6Q1iY4GYIhL
         uR5kOz9w3LKfHZDsB/TH7l6kynSKnMPcAkX/WWQ4iM4RCNmcy4GRoeO7bHxJBwORYidn
         +rxg==
X-Forwarded-Encrypted: i=1; AJvYcCWBBn9L6INiHfh5LNSuJxn1WNh2gKkUS2Xgi4EYGHsIFseByS217jV/pCxCFhbtM3vT+hsToEahXHnKd136@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kiP2mXzSf+BAIrQKwOxb+IfM0V+cMXq7UkB1eXNXV5V9Xxtw
	OukeuGtRD/hyd1if3LrwC6xNJeRDtSdGH6svgdRkdtOaFFiUs3RWMdsbI7Gx332SmVLZqxSAhEN
	pbCQ3GfKuZVq0jFiRGPd2lySsNXlGNVG+s4nAqGiIqbN65bzefoR17OXBFpwb1mCI7YET
X-Gm-Gg: ASbGnctu+F3a1Lt5C8+kie48Hbe9ZA7TYBb8mPaJOn9O10ZYsdmzXM17ErwwF0vYO23
	ICp9LR07RtLlzgTysCAo0bSuwPHHpuHoBXPv38wwnLkwlpoofhhIsPshX4QjQ2v8Rgkvgc5Nqq6
	5Jp+vWqrRotpOabY6RYGChN7gJLHH3iUFBOVi6S+PPtiV7xDpgYyYIgPFDZ7hM7BAdrkr+jROxH
	6qnlbVeB5/GzSKouI5K0LjG0erBBej1vUNeSsW2AACNb4O7om2uMZS3GAkU0KP7Lln2JtcHO969
	VDtTQR0d6aAnLOGr++0DtbFoW11hPZEILoe+iIGCaWURv8TvyuVxbvqXwaKfq+/VwAnoOYOo9MC
	5O3CKMyFNhPnaGbGsCvlB62mfAGpeV+wUqg3sdwymaQ==
X-Received: by 2002:a17:902:e5c8:b0:295:8db9:3059 with SMTP id d9443c01a7336-29b6c6871c4mr24294975ad.38.1763723009095;
        Fri, 21 Nov 2025 03:03:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFssmAAgNqx3cFqkWBPGTYyU1z4iaiIlYfUVAjKOZCMcB9qH2Wy5nM97YxkTiUjfRqEnDCkA==
X-Received: by 2002:a17:902:e5c8:b0:295:8db9:3059 with SMTP id d9443c01a7336-29b6c6871c4mr24294575ad.38.1763723008634;
        Fri, 21 Nov 2025 03:03:28 -0800 (PST)
Received: from [10.204.101.42] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075afsm53464635ad.4.2025.11.21.03.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:03:28 -0800 (PST)
Message-ID: <ccecc20e-0f5f-439b-861e-8313d76b0db6@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao>
 <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
 <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
 <CqumdLRBMbxjJJOg6C6EeqguhrWjaK5WBB4UMhO2Fv6xoQk9TRSK-DINrfI91fM-Z6RL4XA9c41Wyf4e5gICnQ==@protonmail.internalid>
 <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
 <e01513fb-8ed8-4d4b-9111-bbf8ac4cce89@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <e01513fb-8ed8-4d4b-9111-bbf8ac4cce89@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tqphgnggvkm_q71Qa37JQXFRNbzsAHRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX95LnWmr+f2xk
 iTj0y20E9shwXNKs1+nPVmXvQ4ZNenb5Dt/u3nJ5m2oKAQOOHbg0lbQxmOl/wjGNs+m3mzwjuun
 Dh096cTihiWvSwXy65kk0h2cOADM+ybg1ZLrNucEWabde4W5breuoFz/iUc3c0LC1PVtrhZQAVo
 YPS/oyCrPR1vM5wV13TFfJp/oKGbTyp/2+aLs8/r3G2xzGHmgVh/oPCW4jvQhjIHlJ+XCpliRMT
 cF6KLijf9hhEuDw1KQ+4PF+gM2TQew62KWsD4W5ilJpoRntASE7aRD0/CkuD+m93teYec88jZrY
 iAj4EFnbjqo8BbSMryOdC8hbBhpDwMNfzITgBXIm8b7dqdXTam5gPwdaDN2on2bNdX//lCsqMpf
 igXcI5v4XmJseN7k5o6yRftsCO3aMQ==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69204702 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2T7qbGGHlNX9R9Jok6gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Tqphgnggvkm_q71Qa37JQXFRNbzsAHRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084


On 11/20/2025 3:19 PM, Bryan O'Donoghue wrote:
> On 12/11/2025 05:09, Vikash Garodia wrote:
>>> One additional bonus is that fluster runs several process in parallel
>>> by default, catching issues caused by several decode threads running
>>> in parallel.
>>>
>> multi process issue is due to below [1] (tried it on lemans). Due to
>> higher concurrency, we can see that the DMA buffer is mapped into
>> un-addressable range (0-0x25800000) i.e 0x24b00000, and leading to
>> global fault. This was the reason i was keeping 2 memory-region in
>> kaanapali binding, to restrict certain ranges of IOVA.
> 
> If that is currently true then we should restrict concurrent sessions 
> entirely unless/until it can be safely supported.
> 

I would prefer to fix it than disable the feature. I would raising a fix 
for it.

Also, to keep it clear, this is nothing to do with this patch series. 
The issue about non usable IOVA range has been there for qcom vpu, it 
not newly introduced in iris driver. It was not exposed in venus and it 
is seen now in iris with concurrency when IOVA falls into that non 
addressable range.

Regards,
Vikash

