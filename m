Return-Path: <linux-arm-msm+bounces-82790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 106FBC7826A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id BFE1F31F87
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F396623E325;
	Fri, 21 Nov 2025 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjPQYdI5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GN4aIJzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DA33509C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717106; cv=none; b=pNd8w8h0qBvlocDanqwlASMX8YklzpWshAONMWAmfcaM9cp/46mVEYW3qUV7UuwtUlWd1xoqLf46i+LN/fvXfiTi0eK4DPJtp/ESLW6lESOmFdyiqlEhsAso1UeP35nBn29K7SpbJL/+IQZEx/xk+hKxT+M42hwTLk1ds6siHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717106; c=relaxed/simple;
	bh=gsdZ6xbv9Cyfi+y2E/VsxrCC9Lqq9dgIT+zem2MyMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6gIfUdUw3UCeneXqi9aJBQYwSmmoeL19MuiChCJUYSsHPENzXtDhrkSwRKg+em5yZDdziwEBxzg4gwmhBbrNf5a5cMIasK1eyD12A+12XQwjqgfROMnO5LGI/KSN5iJwnAdtDjMp0Fke81N/5zxt2eWhbrO+Qre3STLuTHlaDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjPQYdI5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GN4aIJzS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7cBwP1390827
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OY9gCklX9RzrnV3x7HnYpoTHmlnzERhBDDj9r0QWu78=; b=RjPQYdI5oC28UEc3
	g01k8hKJJiy72s77SzIvpIQg1ae0l6SpeWTydGoLcj7qFnTdPH0qi0XFyMfVQptU
	/b32THotCO/uyeq+uTF3lW4hTO5kcDf1BJbgd5c7yW/7bNIiW0FX0C6X6edF5FaM
	eKTYDptzzd6OoKm7Ee277AUP0rQTg66EM/7lb61GSiXmVgQMaqSk503nOeilDj7i
	LZEpXYGEn8JUt307IQwb5HYCxBsi5ZlipUQ+RzMGiK1pky3GPjkUpifHoHJ0FSis
	tbuzZVnECRjrIUf6siusGBvU0B7cnKGHySXtahIugCpiwCh7lASlGrr0QXOZsxi8
	v0grFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb531w52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:25:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so73272485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763717103; x=1764321903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OY9gCklX9RzrnV3x7HnYpoTHmlnzERhBDDj9r0QWu78=;
        b=GN4aIJzSYBBtYRANAXvlxjym9SrZD6+tYcRRu6fX9bkBNWKxdExLwUxA6uVZsh2a3b
         qU41Wb6RyntJI4xUS27UUk0LYTHWMUK2Zb1QmFDU5lQ3vGUbEI9iHVW21y7V+5jhtrfS
         0cyiEwI7CRZBNGvwjp0VjEJvPweU3OjPNgWxwZwQdjmx/gEEgXX3oKfEZ3Bmo0QsBfIw
         q86aheog5vKiMjwEOfNjDNSxLYHNekrbZyHaQnkOyD6L7hmdknzzX2vnnQU+EQpzt4Ih
         gvQ0jdGPX2cReRkBIcXlX7bNRghii44OeqWVV48XPM2MQ0+4oE2K1rKi95hxePqlXdRk
         ZAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717103; x=1764321903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OY9gCklX9RzrnV3x7HnYpoTHmlnzERhBDDj9r0QWu78=;
        b=ocK+7EOn71CkJzG8OmlWr7wwVj//SXFqqgqo0X+hlF7nXgSLZcsGOJ52jK/Gs6gQRy
         nY4fmceIeHo90Fu+Rui8oKzu1Hm+o3uKm2VnrYI6mfUlaHZ2sJF/qx/a0l1DpZWSLUy6
         DMDSsG4MqP2+LMOFg8q0vM9SM9Q9l3EjYn40v6Hqao1V1hbOvg5CCiCTtBtgEmvMPuzj
         WhSngE0DCrihMOkNAFk/sdWj1mm+QhTeoD/taHaZdTZiPmMCFFzGINkzd9UyEVh+LG31
         xFyGsdUCfvhyhZPeNxnGh4E6LJTaQBWZY/kg8uyXj5q8oklKj84Vj15GA8ppS9RLem+J
         fhKw==
X-Gm-Message-State: AOJu0Yyajfsds2PW+E7WFrueLeBi+SktFFhQqd+7G2ss6/4/MzJ2bSb4
	up8FD742MsiSiluOxbMqFB5cJvRaqoKlnFnWCpaeGFAMUtz//dAsLFCuIzgiKJKWBJy+CouGfUh
	XuMdLiPAhjdyPhL2n9LM9xWwB9EPTWK2DmPlaTjtAXppbziO8HG1YZpXR2LvsJ3XP/chX
X-Gm-Gg: ASbGncuWsayPhzBl08HUO2R1cGw/c0bKflfK/3PVIWdJ1OhbBQ3MdWr0XCBwtaZUzVI
	cdsL5S0aY1ct+4zGpvMPE4ZpOL1c2CU9TRsqB0k2bvTFvyUq/GsWkM8fZeH5/RHlsgPlKEzy01G
	tFaFatKZbobkQn+GxeCX6Df6d3M2QYzQAEeg+uaHtdFSlwH6fNy0/UHkZWf81Iq4vp7k4ZEsIv2
	6TRKmj/Y+kHcMR3oAwD3LwjDiezxqu2DtXPBzlTNEUvs0/oFzqkout5zIoyx3SgolaXVPNDISeO
	LnkFQqBNclla69Z3TpXeKiZNU4oEhkIiFsAG6YphuWx6M3kwq1/HUs0gkcDxtwe7oXE3Y8Jd3VS
	q5UZvc74Zm4prCVMj8BZnxmWmqTbG2Fo6UbRuE3kH7cPDZwKdyif/tRLzdktwosFApeg=
X-Received: by 2002:a05:622a:10e:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee5b45a447mr5375561cf.0.1763717103422;
        Fri, 21 Nov 2025 01:25:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0PtTMkeHh6/jxvqRkxOMG6l6+T2GPgQqU/JL4i/JhUsbC2FNlBFHwF+G0ckqOATSIi3Lfeg==
X-Received: by 2002:a05:622a:10e:b0:4ee:1f0c:c19d with SMTP id d75a77b69052e-4ee5b45a447mr5375451cf.0.1763717103003;
        Fri, 21 Nov 2025 01:25:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ce15e7sm422756566b.8.2025.11.21.01.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:25:02 -0800 (PST)
Message-ID: <09087adc-3ea0-4c4d-b04d-728e9a976632@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 10:25:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] soc: qcom: smem: better track SMEM uninitialized
 state
To: Christian Marangi <ansuelsmth@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
References: <aSAnR3ECa04CoPqp@stanley.mountain>
 <69202917.7b0a0220.234ce9.9e36@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <69202917.7b0a0220.234ce9.9e36@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CXRSSkTrxoGYai7PK8m_kT_kSwoFFxAz
X-Proofpoint-ORIG-GUID: CXRSSkTrxoGYai7PK8m_kT_kSwoFFxAz
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=69202ff0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=tYhy-bNDvUHfcXA0Vc0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3MCBTYWx0ZWRfXw4ud3xJtPvGx
 uTBxFM1DOSzCn4z125FXH0t4c3iMohiJ+J2f89dt8YL8qEXhqOnbZ2J9/gUYcVagZmsP+VqEafK
 jWVM1TXewabThEBSdZre/Z9Bz0ixhF1Biky19An3HQ9eWcqcbs2UAaRTUy+/TS8vUpcYWgni1FP
 BUV9sJcP3RBI5i9pp8jTKRQF1KQZs1rs1CJaS1yfro5ECyxyMemUY3sS/Fm1KoQJ9LfYTvrXb58
 9rgXJvJFktni/xkzCEKmC6TeapVv0YlgvEsvuLue9n9oWJgBHpjpeith/CZ30j+nDB5JrXgMBqd
 nlmUpT804iinPBNGTzkH33eScMl+jphSgUJn/ZYqeA7OkC5fRuWmOTS9KyuUX9OrTfjQPzAGD2H
 yzTKjJ7B4baTvAxxXcW1/+WByAyLhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210070

On 11/21/25 9:55 AM, Christian Marangi wrote:
> On Fri, Nov 21, 2025 at 11:48:07AM +0300, Dan Carpenter wrote:
>> Hello Christian Marangi,
>>
>> Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM
>> uninitialized state") from Oct 31, 2025 (linux-next), leads to the
>> following Smatch static checker warning:
>>
>> 	drivers/soc/qcom/smem.c:519 qcom_smem_alloc()
>> 	warn: '__smem' can also be NULL
>>
>> drivers/soc/qcom/smem.c
>>     509 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>>     510 {
>>     511         struct smem_partition *part;
>>     512         unsigned long flags;
>>     513         int ret;
>>     514 
>>     515         if (IS_ERR(__smem))
>>     516                 return PTR_ERR(__smem);
>>
>> We recently changed this from being NULL at the start to being -EPROBE_DEFER
>> but the qcom_smem_remove() function still sets it to NULL and the
>> qcom_smem_is_available() still expects it to be NULL at the start so it
>> needs to be updated as well.
>>
>>     517 
>>     518         if (item < SMEM_ITEM_LAST_FIXED) {
>> --> 519                 dev_err(__smem->dev,
>>     520                         "Rejecting allocation of static entry %d\n", item);
>>     521                 return -EINVAL;
>>     522         }
>>
> 
> Hi,
> 
> I remember editing qcom_smem_is_available but probably it got lost when
> amending the changes.
> 
> Creating a fix patch just now. Can you help me with what link I should
> put in the Closes tag?

All messages sent to any of the major lists are logged on lore.kernel.org

You can use the search box there (the main page will search *list names*
by default although there's a "search all inboxes button" button too)

Alternatively you can do lore.kernel.org/listname/msgid

where the msgid you should be able to get from your email client (if you
use Thunderbird there's an extension called 'Copy Message ID' that adds
a button for this in the reading view)

so, this one becomes:
https://lore.kernel.org/linux-arm-msm/aSAnR3ECa04CoPqp@stanley.mountain/

Konrad

