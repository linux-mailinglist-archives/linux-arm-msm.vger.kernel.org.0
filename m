Return-Path: <linux-arm-msm+bounces-84634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE3CAC467
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 08:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A1D43002930
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 07:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753332264DB;
	Mon,  8 Dec 2025 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwASOPEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZS7ncGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666D2144C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765177718; cv=none; b=emlUc7DNj07qQxT/IRiH68WhXw/JQsvP30t6gdcYLm6BlPgY2R3e2wNVVIglg86bpug/4eNOrVKCa+ntCEX1wW5PEfVZQQb51njTbHji3KWUX5nDfZEMXgOfywGuVYnHtSM6+kf/g9CO2w71tLZ5owFCq3lvZvbBrH/Y+2teO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765177718; c=relaxed/simple;
	bh=5U2nNP5dftyA1Sa5T+0/5H6exPE6lgE+igrrarCHk5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ge+tajJzY/uKhQ9AZAL1LKffOT2J0vZa0dnJw/53mtGyEik1ys9Lv2HlJLffEpbOe+rYw18hVEC3wrtTOs3X+kBlubtngpScy8PTu6HW2Gx85oIesIdDcaxjRJQYDtzKIlWJqWNybdGZ1ZyvRKypWjZgcJnyHGSEc11bVbcA8Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwASOPEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZS7ncGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MiYt73453547
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 07:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrCzWgsdVcK5TFuDMmWYSL7yv1kb6wtdUuJ1kXKqm/g=; b=pwASOPEIrrF3p0aX
	5ITlcVDt7cXftYiKmAp2paITDAGHdirBQAsnPbpVBbY/AEPqJv9+lZQmndBQ2ku2
	QwpeJ8JND29WMnkDwz5dx+FZKWBjzNYXhC1MPexsdM6IVnFTN+zdz5r5KQcyFZ27
	ysJZsbNYwR4rPzvYY35Tu4puJlCdoghJGXoXQVsG28Z9ZRmxtA17yxgCqDXmSfHW
	0I1sEL5KG8/ihYEBMKeV0CD0UtHv457CuPZJV8agkDbFavDARVT47WW5XL2MbIHe
	avSUFDpr5CwsId2sEYnxqxEc0Lzc5v5Gc3VjE7vlk3EAS9zSdh1lS5dBHgyFar4U
	Ks3DOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9upv8fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 07:08:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b8973c4608so10669372b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 23:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765177715; x=1765782515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrCzWgsdVcK5TFuDMmWYSL7yv1kb6wtdUuJ1kXKqm/g=;
        b=QZS7ncGJZome0SkpE3OT6RaK2BVQ5LT8DRVVfuZ+09Z01SmYO9//TRm46PnrkwLfJv
         g5bt9j6BoB14M5goOdgBQ/4GqXZvYeJAj4k8sc5bFVXCtwMTKRR7Y17U4CjtsH/pH7VB
         peq0Z0DwaL1ZzZUFCzPjV22iWPSHzakmeM33LTiW//di6GRqcXPSuWS5q7kayKevo27Z
         EwnimOSt48TTAbalUwhk9S5MJFKfQQJ1uRO7b/nprtZ13h4SS3cz41Cb060Nn2E/iFYH
         X1lgM/VBaFFGOSP0aEs/PbxL1VFZBwtqry8sHT6e61gFV+y+ME/04YfZicD6HGaJAqZ7
         IBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765177715; x=1765782515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrCzWgsdVcK5TFuDMmWYSL7yv1kb6wtdUuJ1kXKqm/g=;
        b=ASrULZxWfFMm523DiB3s2++2OOScuwyHbD/TFrCLV5f0K7hLlK3TIzBuj0NlS7vZtr
         qNxC7PuEPirRw2J5AAISm3DFLXvGmKq+1HkF1ZxV6Tc0DdnC/ai7m+ClHLDqP00+YvM7
         g0u4TVu2Spr6E3mz9dBgyFvahTc088lMsqeOCGHRrXXxzUpTJxCLpskUZbEfWaGmt8bI
         QKiVagZqXwHzoAfGbtpgfoWWAXQM6AvmK000Fl8JTSgAId/Smu/LtUwCpyBfNzdIJFQZ
         1JQ28b90qY6xNvB/7QrYngmKcUXkdYU4g82YfCoEmL6QLmkl0wiBFPgUuQBXgYUfFoWd
         4aBg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1zccanT7D3I0vnH2POzZgrGVoclalHsbVQ5XEY6S+LE63Sx6NTaw27UEb7xxj/hitJLhrcXdKI8mJ9lD@vger.kernel.org
X-Gm-Message-State: AOJu0YwaL9JwYs7xnAythx7axAYBSMYNcsObB6KUP3bALsAgFAQ3eZgN
	asZI204/SAVnJEK4cOFgfvwV2Tm3IplbhwHYfKUcqwzcg9E6USXHKnDwshwgoWfDFwhKOD3Ckex
	sir7ldxBUqkOqZiJMXyYCUErz9sQdPGIuIIOF7xtuqQGZ3xwuaRnv7b4BtdXXqqrb6mgG
X-Gm-Gg: ASbGncvTovjpRwoMpPgZkTENV2pv2nYiyXBH0gk7+Y3DJ0eN86bRBKp413U0bphkK7w
	R5+j0U9fz1bJrCrchO6awArgvKbzeHj8wS3Xc40uXdR35sAmT5OpmAat+ZGwcY9RhdMyWzMZVSY
	IDyM/0xL0QOtBm3gQFDjnFoupR0DqlbJB2medcJzOCV5YKt/sch2f9drRJ8FSOXzipEk0oRMfXF
	F86TD6yR0THBgB4rrrH49z9HpGknMPYlbLE0YDnVwkB+4WoyieFGIfXHpYjhOgfqWFkI/OUiCDq
	Hw3PdB0rP4inY3wgaznnUDMEPQyGwBaZuDdhWTH1OTDG0qEQ5eDtKHvBsju5KIAsb3iZu2QesD3
	yf887cprCoN6LWIaNqblzVPlZfe17JbAAOB8K6+qv
X-Received: by 2002:a05:6a00:1a90:b0:7ad:386e:3b6d with SMTP id d2e1a72fcca58-7e8c3628762mr5743420b3a.21.1765177714711;
        Sun, 07 Dec 2025 23:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGWRBD4V8JHyA/GcqxpCyzDbxDkWZj0rh1476foDQID2Nz2CNPRb5T/1mOwu9CQt2+VHqTTw==
X-Received: by 2002:a05:6a00:1a90:b0:7ad:386e:3b6d with SMTP id d2e1a72fcca58-7e8c3628762mr5743404b3a.21.1765177714267;
        Sun, 07 Dec 2025 23:08:34 -0800 (PST)
Received: from [10.204.86.50] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c17esm11991962b3a.34.2025.12.07.23.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 23:08:33 -0800 (PST)
Message-ID: <2c7d183d-1e1d-4789-b799-5b0f02c4921c@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 12:38:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
 <xefaz7ljox5drnf7gl4aymwp3cygc4fhxb3mksarqpjxm3ozrh@co4e4okm6hzf>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <xefaz7ljox5drnf7gl4aymwp3cygc4fhxb3mksarqpjxm3ozrh@co4e4okm6hzf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7dsha1BKB02z27w7fboUcYE6-jUHoicq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1OSBTYWx0ZWRfXx8galkhGkhp+
 LF5sZKZ6NaSmrudpTNi1wgcvihqOV2rysbixYrgSIyRI2v8zI6u+7eXZf/ykLUej2myMAJ/i/KO
 /22JQBtPwNa7HJu4T92MnOO/kaDFHR9sprmEgBG6ZaSl++iWf7MnwIRFfn753BT4Su7yqxEyhrB
 Pa09Y3cNGZVBu05keV6XR15ffxrr3NVIOEsIwjDLZ/emzG/F+em87zW+GgBxMRM3/uVOJr0UnyD
 8iNTjYEsl9tSupx5gA3ayqHJ57iraE/q3autDstcXgkWxl4zvr9NyBxGW8l5u8hzbPRzXHeEepJ
 TLBMz3hUqSoMpBGwlGQKu47dHjjX9h0i600umhJuz24YjWtHPMDwayQi3WiTlH/20uerWEHdcRf
 RWLWRj9bwuof3uE7IeKnTdZg4CtVjw==
X-Proofpoint-ORIG-GUID: 7dsha1BKB02z27w7fboUcYE6-jUHoicq
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=69367973 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TGxxbsFBFhonqYEHZgkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080059



On 12/6/2025 7:56 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 02, 2025 at 11:36:26AM +0530, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
> 
> Please _start_ by describing the problem or the issue the patch is
> trying to solve.
> 

ACK

Thanks,
Pallavi

>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------
>>   1 file changed, 41 insertions(+), 36 deletions(-)
>>
> 


