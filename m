Return-Path: <linux-arm-msm+bounces-86276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79329CD7D70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 03:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6141307104C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 02:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25522AE68;
	Tue, 23 Dec 2025 02:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcDQ9qRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYF25XG4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC10238C3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766455986; cv=none; b=b4L6ALNjUvev4l42p0npPJ4zFXaCWdVlti8v8bueU5xexgvLLK37VVeTz0XwMGxIBEFVJrIdSINg9YwAqFnnAw/9g8l9A2KAm3aZu9WV597KzNoGHc/fEU0D9bd+QivrdpwKalcdFsZG1dY/x76wys/i7JbAWjf1G4j8W1FCspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766455986; c=relaxed/simple;
	bh=sU6llapwLiYZF8tL0069BDflbpS9qkot5XILKfjfems=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnEHnS8WCcZM6KEDjLO7x55+yoXxukMiLc6nWTUvwDpjidRo7VySlMzymIG44OraWykRVCqTMC9NYaO6OyWYApguE+t8MJiXV07ZrvnYfI7uf0ZMO+bXmsMKlTgGnMqw6xE9YtITOap4sYpUM9N8PuKC0B7ljDw4V1BYiULZpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcDQ9qRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYF25XG4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEBxsA2198819
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1rA82QE4jXgcwD3wcsNDUDYnq/GTgvfToStJYGuPgM=; b=pcDQ9qRqxUK9wybG
	j4H4xrVqqxgqV+7OM3w9QCLkFDutBZ9zqd75bNeAPosApFNefEmfncNCGUh1tVSq
	Z/iumb8XkPbBAvY+FOshj+3GGSHKmOSpte9UEFcEn6n8DFfDmPY7kQvWhqTNdytg
	F1ZiWAKeSOsjCnJ/Ipjrv0qqyderFe8bwqvLj+rsm0LqTZuQ+mZsFkrkNYXGGdz+
	QZ1QfDgsDrwhaq/p607HWOnmFBS01YhizJu215TcJIMNjPZk6/bV6GVuKBdnySk/
	8/US7KUvYZaYwUgPiUS6ByJc7YfkeC0bySeJ7zmCZQ5DdgwJqzsl3bGFL4D31FAS
	QQGYwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwtbs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:13:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so8538897b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766455983; x=1767060783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1rA82QE4jXgcwD3wcsNDUDYnq/GTgvfToStJYGuPgM=;
        b=QYF25XG4cDicP1QHB8apKyQ2YMKGisZ9m5UstIbvjkMF7lfC+ZDEnc0633atEoyIBt
         LI10+FSwVVUKK+CnQKxrod68tCnJdGJU+oKrd+ynrllGtz0cfIdbmdjLNJ5daBtg5bFM
         0PqAO8/z4nCE3JBAV2RYPGYADR5+UDrSE7t2U+eW35YUzwN+SNayhHavjtsddsqgPUp6
         w/O2NjhtpRRjXTfy4W2mhtEgkOkbtfddtOp/filTRc7+qp1Zk6ke9NeWVyBQ+rFv/Zyh
         B94Bbq3td9GAIdCD40JqA9pj0SNg5Ssuel3i7CnIp3x3O6kwL0ttmruPF+6Gj9lbL6VE
         DrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766455983; x=1767060783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1rA82QE4jXgcwD3wcsNDUDYnq/GTgvfToStJYGuPgM=;
        b=jy1ti532YViktdqdykPLq6dSYH3pGHcYE0bV1/cYy6HvhOT80jDZ2Lok/rE6ZKcuKa
         zSJcXLAlxCeTl3zQBiPGy5GwMYIarbwVQp+ehK29veinND8CeOBLI7MLiDVoEji/FoNl
         XuvHr8gu5e33QHsq7Pmq89ypTFrLfNbLfyfxIE2vdE6gzKeBy9G2y1C+7pQLabUPxaVe
         K3msjAxs9pw6UYQBptEOe2iWfy5C8HNh0YxKDXXJLBn+LOVatfy74VkJXg4ekpmfusxw
         HPTEf/X6xl52DQvuk3pakFAgW/ix3XOnuxMXnJm87ZuJ7MsOSVbEAm6N9Dl98tdZmLB4
         8U2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVq05vAVB9zvVyLcs2ZbZW2+G50qTHYwhYeons0MpuznaYg+eVavHsEejpb1TmFlEnChY7RNUm6Kzf+D9SQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj/qWY6eelDeZYyKv0RXYR63j9YCCMD5zhsOfQpcAfG5rbWi9m
	UVhfgyMSwngPRjXJmSSAUzYdCbq6dfTgraXIVUJIxmXaznfnl6MIYnVJ1PIdIiqIGumCR/VFA3q
	Til4HRk54FuVC8gjfbufGd6IgTkCmwynCTl95vEo/mCDUtBQnbIKJViFiud0UwAnnLgszKb28az
	MMyPo=
X-Gm-Gg: AY/fxX7jWJcwKJ93bNYcQQ+lLG56pAA16EGiZndLji/JQ76CT0AIqqtaV9SfvHeOKEw
	fijJkPHQDPuAQ+oizItdHi4l62iePI1qHTlvhaWo9RskiLI4pUX2X8A2GYCWMUBzxBbigDXonxv
	UuJAOQeKt+oQDQtcwLiSd6uqUMIvwWmGLT8UTn9IG3MrxiUiiJ60VkV/qs41nfXiCoak+qi5mHR
	ZlrIyzC+bibB2X5tlzFzP1A1jino6vGptxN1Gf0WovrREzKucHSBH0MH5YDoNqH3GZqx7PQymBg
	cuEivUNxWNjzwukqIDu2VtfUF1/pU7gKa2adU7sXNmhumigjN6BHGPYhSlwyu98qCAPUoL7Wogs
	d+8677Jyhv+pBe1xAwkKxFlEkTUTBalUARN4Msd+euC/kpBCAqTfkm7SxJzlTWogUiqoXilpAVe
	Qa
X-Received: by 2002:a05:6a00:ab0d:b0:7ab:78be:3212 with SMTP id d2e1a72fcca58-7ff65d7e735mr10841928b3a.19.1766455982585;
        Mon, 22 Dec 2025 18:13:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqY2u9Cc4PP3gmsSnCQi6YrzHeTT9+q58yMBkEYgqgiQHSArGEyKDtwjaBWFsuYaiUx62HMg==
X-Received: by 2002:a05:6a00:ab0d:b0:7ab:78be:3212 with SMTP id d2e1a72fcca58-7ff65d7e735mr10841915b3a.19.1766455982101;
        Mon, 22 Dec 2025 18:13:02 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f258sm11649868b3a.47.2025.12.22.18.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:13:01 -0800 (PST)
Message-ID: <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:12:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6949fab0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8S1x9iRXHCQAEbiqu74A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNiBTYWx0ZWRfX9ywzBGzPzkUL
 uEUb7K/fkWju25o1s507eLoIlbQ29wwMcLlLkKt5SxBaNMYq9XqPkGQg/e44fVOQnZ9x4qcrf8z
 im36+CItFe3YtQkODoCYe/IbRgjqld34LQJG9plIlK+n202ypVKjxZMEEQtf+CHluy5ZSVRhdtx
 oghpIltX1OkeHUcrMSoxoBdttS5Cy5HElra8p/sgO7UqJPTr1wMU5HSFgWtXdcE6QD1BlNzrUlD
 Vu1rtWYGrkrtIsgFGSGbbVET9VCYiwjfm0Kvz3mx/S4x3qQ1ZpdzqGm12yT4Ql/UdDIkAcRRlD0
 LYQMaqP51m6LsekC/S3TD1Fpcr4Vc3+jz7/TdeYIAYgxnND1YF0RZBQDvuBIwmWXfn5JicuAWHv
 Dg4XJFnDKgdPIzlJr+RaTKZ4nmqeZNdmpoPDmUrnlibWP0/qmL2ferXJE4qNp6SFnP6RlBkwAbC
 oDCydFe0zZPlbx+e18A==
X-Proofpoint-GUID: KQ_BD2XUopfNfzH9_v1Z1_vsdCY5Jusx
X-Proofpoint-ORIG-GUID: KQ_BD2XUopfNfzH9_v1Z1_vsdCY5Jusx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230016



On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Introduce the device tree, DT bindings, and driver modifications required
>> to bring up the PURWA-IOT-EVK evaluation board.
>>
>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
>> the IQ-X SoC series. Consequently, the two common files in this series are
>> prefixed with 'iq-x-iot' to reflect this relationship.
>>
>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
>> except for differences in the BOM. As a result, most of the DTS can be
>> shared between them.
>>
>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
>> the PURWA-IOT-EVK carrier board.
>>
>> Hardware delta between Hamoa and Purwa:
>> - Display: Purwa’s display uses a different number of clocks, and its
>>    frequency differs from Hamoa.
>> - GPU: Purwa requires a separate firmware compared to Hamoa.
> 
> Is it just a separate firmware, or does it use a different _GPU_?

It uses a different GPU.

> 
>> - USB0: Purwa uses a PS8833 retimer, while Hamoa uses an FSUSB42 as the
>>    SBU switch.
>>
> 

-- 
Best Regards,
Yijie


