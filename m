Return-Path: <linux-arm-msm+bounces-78016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BBBF192B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 454363A8626
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D78B31B10F;
	Mon, 20 Oct 2025 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRK+lxCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CC31AF15
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967542; cv=none; b=dNiQZKVThtmJWWr4m0MJwioIOvPg8aeT7nkE9kuydfWWgj9TpaJm22uOvyGWY0xG9jNlt2oFPQLi6npHc/F912v26e9K8sbU3MPhjN/Ph4IvU0DUtkqYRBjS9QTN4wv6pSEMHqpI8FFVKKJA7YJxE4wD/zU1QnM6odW9O7CNjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967542; c=relaxed/simple;
	bh=hwv1YfCnFLJpiuuZikVWZGq9I06wdk0G95/RZY/REng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sk2yWPuJmaZaMJcIsmTCKCsUr4sXWlNEn3pwhvz5Z+W11JIKA30eduOppCK0ZrRlmADEXgySgBI6eJmClbKTQyaztDROIL3Bwgs9dPeWWwsbC+CMr9+qSutpquEzJ/ap/0dMeGlJT0G33foARWu9WgRxIm5pw9/2/nmximzLoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRK+lxCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBia3M010739
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rw+jplN5LBufA5sJ53Ja3QfxZgNTjgPwrhBg8ayk9cc=; b=NRK+lxCEXOnGVjaR
	Bdkq+7+VYBbQ6v5mKKjTffuGlZJlV+EwDIo21orJK9DVLqaG7SXZY1fb4mGvsKkE
	eoLJVxTH2tNdox2QLsPaKlEu5kdcJbpwWv3KK9LxAJdknjDZ8P2SSo6fGE4NXRzO
	ZZQ9RzJ+V2pz6AXzFgHuQXMWBp/8YerJVUGgb6soOtNT1Zfp9Vwnab7mTHguNESt
	8vLgNJrEDENfZPDaWVPQr9+E6xr5nzhhdPoH5qNIa937ikVD2eqfXruEpIRV4jy8
	KPpaXU7J6NRz2JHX0aMfGYlTZpcoLISQfH53sHmZoVfqoz0Pqb8I533BCoqJ6nVT
	zhFzEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7vy1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 13:38:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28a5b8b12bbso110337295ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 06:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967538; x=1761572338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw+jplN5LBufA5sJ53Ja3QfxZgNTjgPwrhBg8ayk9cc=;
        b=f+5GCuePzJTfSyMZaL6MBzCAOgptgYnjsN/d3NJ184nz2Sq/n2V47ngA5kIc/NUyg9
         xMWsipqupqvv1WC/n2uNqZU/9SdEnQeXqqjY+K1GBruLgjoTOyziwNXXbQr7FyGNJc5D
         O7J+IgPhP6TEdTKrtzLUrzskYgDBXmLs0OL0rWxf336fpn187Q9lmrhDwQJFLOpgx/Tp
         1qqyoaWhvgsBAAipFpSCcqA9LEN8rAx5cnWmQeE9GcUiYAnO6J0tX3XxPll+x6XRpKYv
         6r1kLjNyPNQotG43cAqixwEIS9jzph8k2AYK4rY/UhoUeUT2tjYEskx+2rrqgNww+D2/
         OP2A==
X-Forwarded-Encrypted: i=1; AJvYcCV3SGzMNum0KJlj9zCsFe8R0FUOUa5yLhzUn69R185KqEinTewoUFIZ13EgJy2gH6wcFZO4OajtajMUyGIB@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgmCTq8SLxqCOZQ8yPSQoXzb/5M7jyyWsj8Lr0YbamBVhbWOf
	5uRiAwVDko0TMXqatFul6W2xhh81g7oO09kXgH36EaPeKN5HLXV5VxelQeNCwavXmFSWEinasNe
	XcL9bICpU8dbaNxFWvcFOHIl72LCMNaLiSSr/fVkvGBRXYYxJH+Kw6anAFSaC0KmRVv0C
X-Gm-Gg: ASbGncvCxBfho9O8Gv6WzJX6pslvI5W1qoS/vSO/nqfrRrf69D+xAXbnXuEVJJyLjOX
	PJvqVojyA3RGff1VGdR8G81+deXN7Pt/1U0sdy2RHZZOjmeECjf+wNlXOvp9qqHiwFiJBY/cz9E
	6jbtKM3u7cEgbiU9ZGzNdd1vFnTQn7bc96LFRtU5B89gKypf1Ar6ThzCPZZmrn8X46aSeHYlf4X
	jQPFC8koo9iYRrOxvu9h43ZZ8/908kUxeL5DMTM30IIUQBlPxYZrXi0ht97ljlGMDUI2qxxuAar
	edUaTepHmNseONY4qU68JDzViTsu0v/PAPICvXEkekXTLZ3FWnlbr7Rt4kknqvz1xR6F/aPKKhr
	GA8mJIPSjItprqfHtcWS/n9eTr3W6GJt34SS7fhlfjlTA6na1eFZCpHPYvEVAzk/cg5g=
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr165399275ad.12.1760967537859;
        Mon, 20 Oct 2025 06:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRNEXbflozLjWkDnbjGXkqNc04PBYLwxX4FkeZGUAQM1MSVdWu/MYBIBj3FuVvicz/eZI0Kg==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr165398655ad.12.1760967537285;
        Mon, 20 Oct 2025 06:38:57 -0700 (PDT)
Received: from ?IPV6:2603:8001:8403:ab62:4d1e:2cd3:d939:feed? ([2603:8001:8403:ab62:4d1e:2cd3:d939:feed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df9351fsm8007642a91.16.2025.10.20.06.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:38:56 -0700 (PDT)
Message-ID: <e6830a20-7c58-4799-ab38-53c1276cccb4@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 06:38:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
 <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
 <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX+V2RqtATiMVB
 KgjE47qA1lWIyNNW6jmp1t99KUI3q+Tf6hRPFKQTNxpOYuRssVQsUDg0AYagbSHSIY16ouiF7NH
 v+9Cl2poDTMillDxUa4XMAivQnseIYkzevlobeJOD1YuQ7Wg8bsomfJ3ddXcIg/+JPylHW/lZ8L
 8yC+xmPcnNqB3YNele/muLx1SKxA9UhHFInVyCAp4rAjLrqfeYt8pHZSSda6N6xJ7cz1iuH+hl6
 gBKi7aLa7D3Z4yp5jw18Tl5jEojDSXveRlGPDZM+fiQW0M41oI1hbvmPZkP6vWVbZfPAg7FuiQk
 RuUsd8suqvjYdGSaeHzevqTAokEY2esa5adzyU4lKwUfGDE1zozRNq2lPpZhmiLLn+/ABjkCvgW
 78d5fD12YMcJPVwFD8ypHTxpZSo7IA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f63b73 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6xprqeDdnALSCdrIqMcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: aniFCAy9FlDS6Lqe3vxCL9-2FDL5OYCB
X-Proofpoint-ORIG-GUID: aniFCAy9FlDS6Lqe3vxCL9-2FDL5OYCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015


On 10/19/2025 11:45 PM, Hangxiang Ma wrote:
> On 10/16/2025 4:55 PM, Bryan O'Donoghue wrote:
>> On 15/10/2025 03:56, Hangxiang Ma wrote:
>>> +static const struct resources_icc icc_res_kaanapali[] = {
>>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>>> +    {
>>> +        .name = "ahb",
>>> +        .icc_bw_tbl.avg = 925857,
>>> +        .icc_bw_tbl.peak = 925857,
>>> +    },
>>
>> Looking at other implementations I realise we've been adding avg and 
>> peak without too much review however, wouldn't 925857 / 2 => 462928 
>> be a better value for the average ?
>>
>> ---
>> bod
>
> Ack. Thanks.
Just adding my thoughts on this, as you know the peak/avg bandwidth 
should primarily depends on the sensor data rate and additionally, the 
average BW vote should depend on the buffer sizes in the NIUs/NOCs and 
(although irrelevant here) whether it's an RT or NRT module (file system 
reads/writes from the NRT modules can be averaged and controlled 
better). Fundamentally, the votes from all modules go into the 
calculation of the DDR clock. The current driver does not take into 
account anything. So either way, it is not ideal I think. We can discuss 
and come up with a cleaner approach in a different patch series covering 
all chip sets. Thanks.
>
> ---
> Hangxiang
>

