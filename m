Return-Path: <linux-arm-msm+bounces-76603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC3BC8744
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5522D19E68BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D42B2DC774;
	Thu,  9 Oct 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwYe9X3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42EC2D8DB5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760005238; cv=none; b=Jcujl5S+Ef/Muta3J1+0wMubfJzwwVkJiJxUPXdhDo6aBnXuu9vb5mzIPAd0bhLB6h1R6AL3G2li6WRMuWmdcEdyrkCWoIME53/dZEtcjp+iNmQdCmHPHAxtAEBNOrqAAfpO6aqoog26rTr3QlK4T7pnC+7qYTFdtPyuyoDpsN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760005238; c=relaxed/simple;
	bh=K37MmL7/1knWfZpqAjC7VyGj0WgB4toUK/rvH/6AVuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzHIxgvgnCQepiCQ0cAt02vnzHokoDoJBhJfKAlR8wNE4FPR3n8F04nSk94XBxd3J/lYo5/W1XuDp+qlSyZt6kr63LPJWiakSI3hB73QOquSB4hZhtUYPNUDM1X/hgG5lf5Khv9M2ac2BD+SZb1R5h4agV7v4kmXZuAsqIIzCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwYe9X3k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EQHb004530
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 10:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McJC3WBPnlc0I1un1QBKJblLnyeXwKFcDmt3ARASHhI=; b=VwYe9X3kQKCE0VY2
	B/LrpVNIHSQGg5AxMmVc26f+09QYFl7rWkQSs6Y/lMziXa+Fqs98PItIuvvUj0Xe
	fdbrUl6UC46jLOBti5mJnzyOI3Dj9IBeOH+6aT62VqsxY0z5Z+khuJYjiHjyTgQ7
	90UDTnhUuN+Q2zez8sbu376yVWWbC2WIgKnBPEJG0TqWz51STKXaKl5LKFL/XCc/
	wbKq1+AOZyPn737ktZ4F0ju8C70u+j5zQGsUnZ3HG541hLLEx1Q3rocOj8DvTQwa
	lIFTOn/Ft5FxPlXbTmDDM9oj1fjek/naJDNaqXWZ94oexi81ur3lVXGxVoFDEqLK
	9ueulg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j2ct3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 10:20:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3305c08d975so1517507a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760005235; x=1760610035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=McJC3WBPnlc0I1un1QBKJblLnyeXwKFcDmt3ARASHhI=;
        b=g9CFVqgEQbDODGau/npd1D5EDIgqm01J5v5XL0hemYZKsYHC/Slhl5KzgxmN1T3GLC
         YMsQBTwNbRkwHdcs7GJKkpMSRbG9n6OVE9b+7/Rk7kBeSI6k01PUUIgA64qJVnbJxhTk
         NGTNhZ1fA1Po/DVl7jk8C38TOvdNq+megDoQb9hlGO2apnbvWuTxhymB0xpZ/35qvwYP
         QoFf+vj8avIBief6rmoEeWZdRARxu+BJMCmtCCPN5rX+U3hdiCj6S/Y+4r3hvTd0Eat0
         cmZnWMPRGdqqOEOrBmDa0zxpWNBbsPOlhUl2ncYmBZNyPo8G35rVCuTgYwSWYjnAyKPG
         nClw==
X-Forwarded-Encrypted: i=1; AJvYcCUwdrk0M/R09Ep8xHquCxSAAttw+3lK1z8zkfrRJUXUXLJQUX5bpIzn9mcUc+38Naa9ZugDeLXVgEBj2Lz2@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCKicfOsTsyCp0uQVpdy/gKtF0ZQYLoLYkiT9inoMOUyrUsX3
	eiV+43v56ajMcgy8ni2d0xDDI4zsMCphRw+vagFO8LW66NsFlGUY+C9I6myhDK4YUP/nsfpx7vx
	D0mMYkXfkYHjU5/Bs2BZdIocu56xhplnHqi/R+8WMotFAVXHVoLZD43TIgGRNIAmLhTm1
X-Gm-Gg: ASbGncuUjpSc8gqxcNFCM1xCMYjTNSZPJ/nyb686n/FD3cJh8Mc1M72uXl3uYxCJkI2
	dli/yAJZULwBYW5pA7aY5AvxJIzl+LFb+n38EDcbQXra9IGaKEVq0cyVLeqrx/VZjH8enlXLO0D
	MocUG+T5Sr68oMU9kjOEIp+EoigjTOhRPP9aTaL+DMBtyUACGNhe5BPHFwXKWuOpVvnfPeoThFa
	ccPuPPwkBeo6h0Y7P6jD9dqWsgrOA3ApskGM0ZmT/25GEtxkogvx6Xbusk8OrQEk0XL8tr2XjtK
	cK7ACuQVi6qrEDd14srHJ4BV/3wut9GaOQDC2BYDP2ywsGXzyoQwG5UBSFw8/OsnMbV6nGtMzgc
	LV95eqV9FdeNUdhWz8hMIaBdMuwtIA4tfas9AoQjVDjvFNVLKP9PIOs/b17oUVcA=
X-Received: by 2002:a17:90b:224a:b0:332:3515:3049 with SMTP id 98e67ed59e1d1-33b5112504amr8841818a91.4.1760005234829;
        Thu, 09 Oct 2025 03:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjmkHk+Xpo0FMp+98rv204MUsFrcQiQ5EbgjRmNJOiLVFcIkJzOGaBvbgkVK5j/k+/+gSQ3A==
X-Received: by 2002:a17:90b:224a:b0:332:3515:3049 with SMTP id 98e67ed59e1d1-33b5112504amr8841784a91.4.1760005234244;
        Thu, 09 Oct 2025 03:20:34 -0700 (PDT)
Received: from [10.190.201.224] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f729c3sm20743077a12.46.2025.10.09.03.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:20:33 -0700 (PDT)
Message-ID: <f681829c-1cec-40aa-a5ac-8fc8a2d8ea8e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:50:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,pas: Document SoCCP PAS for
 Glymur
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jingyi.wang@oss.qualcomm.com, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250925002034.856692-1-sibi.sankar@oss.qualcomm.com>
 <ydfiugeifs5c6v7dzms5tlkkmhf26q42pav2ugfuxjytugr5nc@ppxoiize27ug>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <ydfiugeifs5c6v7dzms5tlkkmhf26q42pav2ugfuxjytugr5nc@ppxoiize27ug>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ka9JLx6GB80ce4_FXw7DHAcH93TV89Fq
X-Proofpoint-ORIG-GUID: Ka9JLx6GB80ce4_FXw7DHAcH93TV89Fq
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e78c73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TLHODx2UBI06x3BL434A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0LKYt4k0b4TO
 JTEn5au+A8qwiWC1uC6RKYe1bR8Vfkn2o9IjYLuadSylandnJjAWIIfGrPLW3sNu8YE8TFO3+Yc
 5A+Nbx7lcGgFHSG74tOphIX3W8PDLyXz1x2F5SWBpDqUOeRiIoa68D1wkB4PAxIO7rhjS3TWcG7
 1h+t00Ecf14uLzffGzD6FrDJZcLWogwHN0hYPXEt66s2P2ndadlO0VCz8Yw2wcY9mrjvsF8tDWS
 bsOQJ7h0K0dpwEKM9Tc64DGm5OfwD3xn3urGe0uOhEBJ+8Hx789MaXqnLHm3MAlRPr5/WWcnmdG
 nBFYS+cG/o7NUwn1OwXfZQpaSV59EEg8dxmSMy4/oyJpSgS53Na5Iy01dodlsFutAHvFKaokWQU
 CX6r1rENkw/X+3808C3BnE1RNfOXGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 9/25/2025 10:52 PM, Bjorn Andersson wrote:
> On Thu, Sep 25, 2025 at 05:50:34AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur SoC SoCCP (SoC Control Processor)
>> PAS which is fully compatible with Kaanapali.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>
>> Dependencies:
>> [1] Add initial remoteproc support for Kaanapali SoC
>> https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
> Please don't send out patches that depend on other patches sent out the
> same day. This just assumes that the maintainer will keep track of
> dependencies and figure out when a future version of that dependency
> meets the needs of this version.
>
> Work with Jingyi to handle dependencies on your side.

Hey Bjorn,

Thanks for taking time to review the series :)

Ack, will make sure it's included in the other series.

>
>> This patch depends on patch 4/5 of ^^ series
>>
>> [2] Add support for remoteproc early attach
>> https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t
> This is the same link as above and what you call "early attach" that
> series calls "late attach".

Ack, my bad will stick with late attach.


-Sibi Sankar

>
> Thanks,
> Bjorn
>
>>   .../bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml    | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
>> index 79f678f5f7d9..8089e0869ed2 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
>> @@ -17,8 +17,13 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,kaanapali-soccp-pas
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-soccp-pas
>> +          - const: qcom,kaanapali-soccp-pas
>> +      - enum:
>> +          - qcom,kaanapali-soccp-pas
>>   
>>     reg:
>>       maxItems: 1
>> -- 
>> 2.34.1
>>

