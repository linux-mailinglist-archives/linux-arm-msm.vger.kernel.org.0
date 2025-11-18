Return-Path: <linux-arm-msm+bounces-82310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1010C698FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 28E9C28BA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368BF54652;
	Tue, 18 Nov 2025 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXsOXp37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWg8qzmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968841E9B3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471808; cv=none; b=IzqhWAO1VN1aUL0RRk5zw84b1osw0zNoh7GBHqkESVHPljiVh68O142DJj5ZsoxuQ4S461Bpofui4Zin1P5CUIB7P1HpvyIcUmx6e3bxr2473G+24RqDvzShI6SBJiTgdhzBE804s/1N+arSB8PZnbYlr6hemnsap70Yd71/XoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471808; c=relaxed/simple;
	bh=IYyCQBbQx5iNoD9ar31eDdTc6JzOFM0fqyyF2d5D2ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+J7GeYcS/UV5J3Eo2VfTbKxrTCcTpOVX5RHxkxgPlYjTA3cRxq1uugYcDcsp5JO5yLLOGpuAlS9e7uqrJnr6x/0J0BV9wxezlxbiuyhOJhJrsWxHTAI4NbMLXxfmJlsGOljXX84UA9H1QekJMn8W3BpNE1pKFNFFBhBq9tko9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXsOXp37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWg8qzmL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8l7rD2755129
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YSs840Tv6aayGg2mERf7onDh3YO3dD48rnX/9yjp7o=; b=RXsOXp37RSTC97vQ
	Juhe4elufpGNs11EZb8u6A4tv4dm+cx9wJgFcf5zwzCRKJfk/OODh4TuaPBcwrrj
	HJGAu4oJUY6+qk0H7IqUXgi6hfNuN1CWRDgyiKtgrbL/ZeV8RkKXFoqmnGmUUAcK
	yqPrM5vCR8HPP1SqLDCLYL7BqLJUWkQEPHu+M6MzGIb50uNRRCC3gksvbodGnMvs
	OQXABlSofd/BP+lEuZmzhVzUcg0w7XB35adEhbrmxClxvFsEVY4A35qBqR8MYAgW
	4weDDjb+gM/SvLc4subdYr/s4W1uVRVbHniK8YxpQ2W+G9zoZWvdfLI0NO2e44ZR
	vCzMgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj0r9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:16:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso26562801cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763471805; x=1764076605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0YSs840Tv6aayGg2mERf7onDh3YO3dD48rnX/9yjp7o=;
        b=AWg8qzmLQGJD38AUUpjpJduSpFLW/ZBJeaqBupIinmt1tz1bj4QHKBRaGIBdLPjT/O
         0K7ewlqTBdRDxrG+FgswQSZ27ALZBmUUusUcgIe+7YmBs3uV7XtNEJgvHm3Z1IQtPa8h
         UZfl+wakMVN/Lv/YAm9202ZvAgmwMa5T3Tal4rZNJP+O2AhcPUhjvQ2X9JdIe23a/kmq
         kJeD+cv/ULm1K5wR8JNUosQqXTPH1AhSKPe3VjrdfN51p9SWgW9+Q8NIEUtQUx3LO/OB
         NMO738VLB864IN6oDsmPOAMBTralHtVnlLKlTajcU/6NK2IAlcYjy/WPdNnYO2oo7sLF
         NWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763471805; x=1764076605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YSs840Tv6aayGg2mERf7onDh3YO3dD48rnX/9yjp7o=;
        b=ENo3ppHEy9wQvzQmMwmvodxDh/qEx666ocSb9vA0q36RRDGdNdWXJCtYFgKPsSIBM5
         lOvEivd8OE0Ns4UViZgUjdXXQiwmLOkBt9gXivCbebUugo6oe30xRB/O/sjl9BoKHuf0
         eECMY/Y3maDuyXfSwmUn4ywodgDf3Ax5Bl6ne6khIzQQJo3R8oDCG7EAbcrtC+4A7O81
         ZfMFp+aFFQPVU5nq/XNWYyVMw5xx6+O38Qr/49PoXCyWk5wiI8wmo/DQulHvhyy3L/PQ
         rYISop1t9ykm6ivav/W6yyMvbrhgSnlxxKX1Oj9WheRDvD+QvxFpUUVrRcmOvof3nCnB
         4D9g==
X-Forwarded-Encrypted: i=1; AJvYcCUpsTIhO0rtPh2Scp158/XZfcKmHt3NUO4dg7cYXQoWoIaM6kcq92UfPsBH4zp1T7913wf3eP2TZbUaONkp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1bS19xbIZT6GiP5NG2L5LOVaAqoKKjTqXeIyxZpNy6jzH9AqP
	t0sL9jTCix9+up3EzKSerZ/h6X26lox1CU1DdQB2AsUsbUAS++012bcQ8Ces4J613M2TgYPsltS
	UfvUjbyaRM+QBglnpcwNiriok2MZ9DYa5+X735v73FPyKpzPGJ3hs/cCiU2gj2YhjtshW
X-Gm-Gg: ASbGnctS4ym8iykm/gmj03vpKeeAx+McE2RmB/n0sFFNQY+kAS5XeLhb3DAhX2ABzQO
	Evqm5NO8+eeQ5LxlDhLYgFcI17M+ZBO4Yx36xTr76+XBNi+ykgOSv56jTVqIkeN06RkBqqTG2sr
	uQZq2mTF4drhD7b/BYVAUNvLvXA/S7c3JL2b8R6Hib7of9x88zYvy+T6ZttoHPmH490l7T1Qnx6
	NEDSWwR25oXq3f8PZVK4jxwWBP8P/4uc7+To39RCdwxwYL69fVsNSNwyqLIwMi3B5kWH6hiCCwY
	M+hNPHdVNR12lQG5G7Hv8+LSK10kiB/WoicOxnSC0vGIC0eQw3+MCjjjloGNcco6ZZJgjOPLl7u
	2c1dUi+JpJEjfhQiDwM4a0A5F77M8qArSNDMWIb3lMRyDlU6+gRGo+632jmeBTy/xEtk=
X-Received: by 2002:a05:622a:148a:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee313e2b25mr24446391cf.2.1763471804613;
        Tue, 18 Nov 2025 05:16:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFshTGk6lqIuLNizEgCY3WNoeQjl06HSDq6hGVEM6YywvaCRzNbnZt8BmoRY3rV8STR1AEZRw==
X-Received: by 2002:a05:622a:148a:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee313e2b25mr24446041cf.2.1763471804127;
        Tue, 18 Nov 2025 05:16:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7359bfb238sm1268467766b.14.2025.11.18.05.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:16:43 -0800 (PST)
Message-ID: <c89a2cae-ae96-46ee-a990-0c0ef13fe4de@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
 <d9af64c8-f0b0-4e2d-b182-824078f5d185@oss.qualcomm.com>
 <9c10881d-d5c4-4e60-8960-2ead76c63a2d@kernel.org>
 <d5sn56mlwaae2hou7t6pr24h2pojvjcv4ufsxg4lbbnk6vlpfi@xc5e5uekofbt>
 <c966f8a6-2dd1-4e73-9016-c6b08d7e0337@kernel.org>
 <l4ay27t4jbycohdsf4epxftq43kceuzymb6l2tx42lxyol3btk@vsof3bbmvrrl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l4ay27t4jbycohdsf4epxftq43kceuzymb6l2tx42lxyol3btk@vsof3bbmvrrl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fo0xw5-J3B96hiI64WTIejoBYjKK6AcT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwNiBTYWx0ZWRfX658AeXLXJ7U+
 Z59sVimzYWKeHLdmLShUs0re7OPsnD5yxfhjXWvBFpWCS4uPPMabDFAQoqqaRz9YuGl1Fz6xlWD
 SZNmIw0D0Os2f67fq6jswWQ63at1bnDARTiijBcgsOEjdxWXXQmogqL3QQKe2q2w7x0/yMIMXNg
 LZMcr+ZBQap3OB9L2diin4sJvcUlH5Rzk6+bKalZeFv8yVhaY1jtl0d9GcSOfYWYHfUaprJbKZc
 lhewUvoJ84uh/PO0YfKzn7+Yz2fgtLSO6gZQola7g7P9t7FL2zr5EEteQLnxeQ4p1/165bVbaRc
 d9gVMr9ij8y/4e7dWYpe5CWQFMiiZdjhAptlFRxpulFLr/74w1Do6Izho+QFF1OTBTXzjZL9e/2
 +WDdmVZpsB66c09Vh4tnU9rFLYch4A==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c71bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Mqc5ooSUfjBGwrODpf4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fo0xw5-J3B96hiI64WTIejoBYjKK6AcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180106

On 11/18/25 1:52 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 01:32:51PM +0100, Krzysztof Kozlowski wrote:
>> On 18/11/2025 13:25, Dmitry Baryshkov wrote:
>>> On Tue, Nov 18, 2025 at 12:39:51PM +0100, Krzysztof Kozlowski wrote:
>>>> On 17/11/2025 12:35, Konrad Dybcio wrote:
>>>>> On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
>>>>>> Make use of the __cleanup() attribute for device_node pointers to simplify
>>>>>> resource management and remove explicit of_node_put() calls.
>>>>>>
>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> This is obviously wrong and not helpful patch.
>>>
>>> Describing why it is wrong would be helpful (or having a pointer to an
>>> explanation). Bear in mind people who read email archives and find this
>>> very brief note.
>>
>> I gave some rationale in other patches, but summarizing:
>> 1. It is against cleanup.h - author did not bother to read it - which
>> clearly asks for constructor with declaration. This was discussed many
>> times in the list, including many bugs and explicit checkpatch warning
>> (on LKML) because people don't bother to read cleanup.h.

Looks like I didn't read it either.. now that I did, I see that
_free(x) = NULL is somewhat of an anti-pattern, but none of these
patches seem to introduce any bugs related to it

>> 2. It makes simple get+put code complicated, not simpler.

Here I tend to disagree.. 

>> 3. It grows the scope of OF reference without benefits.

This makes sense

Ultimately as you've noticed, this is mostly a cosmetic change and
I don't mind it going either way

Konrad

>> 4. This driver was already reviewed and simplified so author should go
>> back and think why this was left alone (would save a lot of trouble).
> 
> Thanks!
> 

