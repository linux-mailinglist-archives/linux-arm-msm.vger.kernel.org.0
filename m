Return-Path: <linux-arm-msm+bounces-82357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B7FC6A465
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4DB70383996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CF13587C3;
	Tue, 18 Nov 2025 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOHeNtMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMvF1L9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1993A3624C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479122; cv=none; b=et6uFL6S/s7Tf6IucyiQjQeKHDSoBwIPv828NHYlI0LLpfOSD52v6GflMTDtMHlNWoCqUxCoxUqcJq8Ffd7tWEz5Lj6BO9W4vyU/qGgUBfncPGY9iAv1TtkQ/IrnuLXQUp9rN1tWDFGOQqPUhSg6oRIepsMyFQfFI1yZYEBY9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479122; c=relaxed/simple;
	bh=Gpc8AO/IwVgbJhDACf3tqhXIOKnF1kwq15XSr1OW7tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hh1fCKnTF+hGUcZxKTu5xHF4ToWCO6JJWqT/zVBGhrxwNGfg5y5e1YsZR82Skhpesn1tFkJq1lfuOWl3xAGWtAQsDfPHcVAcgf1H7udekmBAu9e53D581zx6a6nWAMcm/mQsZN1yy/BR3Gcu0ASjFEFNhMOsdiIBTnorJWNXdYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOHeNtMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMvF1L9+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIEeoar2343406
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C15Cd9BIgdY3KE5bqUCAig00grelyWdsLExE6aMv7Uc=; b=QOHeNtMZLQE9qtUJ
	H2vno/A1r0Hrz+WN1/QhmYSDdLUu2z5ur8exaTog2bl6o8Hoe/RsXndG4ToUXdVi
	GcZR8oR3HDCxxSL9dF1bfSu65EJKuguG1e23PCUEBhS0lsRvmhnIHxzKxThEHeRn
	+DlFfFcqknj9dOPVO27yCQ/yHcjMNZ6BTGBaPMdSpBIgIfFzblw+bgmgWgCJZAhF
	YOLo+Y7xWiq5FxuR9zQGa/IjcoopKM9pE6QR+WU65owMtkQW1CAbilIjLaFXktnK
	0hWiIOA45EE7RkMT6ZtaL6UpOrIEU2ib+QyizYsNmS26QXoviiDiuEMJ135XMTlP
	Evi+Bg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrn1f8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:18:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956a694b47so64139895ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763479119; x=1764083919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C15Cd9BIgdY3KE5bqUCAig00grelyWdsLExE6aMv7Uc=;
        b=BMvF1L9+NVgd5mV+Y7mn4AkWrNylM4KuWPyEI9xWS+yWUp1fttbIngT8t/BzJQvO0V
         dUgQMWtr57v3J7KqtfvT8N3UBASza+CwgtR5g861WrE3pofzws93ioRck9IltMlcT0RR
         XXbgL+L6ukWPW6OsoF0fv0t+WDcrJc/7tKEXj1F6Bss0Uw/jP7ZgUZ9P78s5hdZ4Ji0K
         JLtrEfZsDOTtEdu08KU7CVGTtyWb0NQCuovhXc5vozY7f6E/5725K3tm+oqVsSBnbNDK
         +LmK7Usz7z33jzBeEeaxPZDgZLk+6CMQ5WVt8jSj+5EjrRiwqGWHb3s52k0Jg2Sem270
         qoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479119; x=1764083919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C15Cd9BIgdY3KE5bqUCAig00grelyWdsLExE6aMv7Uc=;
        b=xMO7MZRyFVGOvYgJg9uSH0tydM/xr2ne8Y9LDZ+4ATUSVwvrvblPrmmqNj8XepWyF5
         WKgvP64rBziPWTo5gYZzyWE3gL4F8GqIvpAUZ9Z5MMrLKiLSAqpaowm7B9QRKe6Kv04f
         3JcQWNc396iSwlfy+4euDzB957Wyj5cePWgsRCYEiW4rllaz66hzNTY/unV45WP62cDm
         2WusVSqpu7/+19DrieD7EYxpk8W13G74nQ166s7NElaggwIGGDjKoHiV1D3rEs7fTsrL
         SPNiYyN8RgIfa9wzIp6VT0ghxbcgrcdHlwUQxulL9CViBZSSKjGdEtrWB0aRa3Fun2u2
         7R+g==
X-Forwarded-Encrypted: i=1; AJvYcCU6z50tD3BtfvuRv0AAZd92Bosk5WGdjLiaFFj6wo/iWJC/hVxm7Or8lhqPrpR+VtbKMj65cQdH4F9OdYC5@vger.kernel.org
X-Gm-Message-State: AOJu0YzitXGmXpbI2CWVs6WNi811sniv6U3msRljH1Ncfv5KUjRGbe7A
	fzri+NSzCM5EYh7G9IHLP9NmzemSFkxn0pMQpdja3aJSaUc7ZkIQVO6JDRoftVRRgR9RtjsNYSk
	aoQvUmVn85PgpdJbyMN73+i15vAIN4q0mBd97XMG7MfL+Vb7lP6FQfNIwlNluPaHU0zzY
X-Gm-Gg: ASbGncsL96OkkrdMgpPr55Osnk+HeMWQpx/qs2EvZZ4ibQTPLpDOpG9uU04yukX0WEI
	jk5AtaQQBa5htdB2IJAw8+U4tZbZCvtN+Pjtmb0dx2KZK+JVpI9XbJ/IDijWviddFKvaVpxDMjS
	t8ixCSpdzJIwKhidPEiU++YFgkbNND1R8KqWEvQenwsX5EOQtMFYE8a2u9T6HMrdkTO4GrR/rPU
	F3LILjpw7iB5piwVijFz6nIBckW1Z8qQIcjz9AKKsy+DwwwICoordmcMDfAXd0NPoJmOR55IXl9
	SCC/9rpnYA6e9/2B4hw3zaV6PDlgN4rahHwULWceNTt2EUwuKWua4uYdf89k3IVWXeWJmhp002y
	77k8B84taRx7my2s4qoDf44avuuYeyYeIO0bVu10ENfUYLCeugzw3mw==
X-Received: by 2002:a17:903:1b10:b0:296:3f23:b93b with SMTP id d9443c01a7336-2986a6b7b8emr190624265ad.2.1763479118831;
        Tue, 18 Nov 2025 07:18:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh8pEfpZapLZo4Spzf3qXPEohV/hKDW57IhNxEJCgoiEZ++gOu97KBbpW3vM5hwpFmn8OREA==
X-Received: by 2002:a17:903:1b10:b0:296:3f23:b93b with SMTP id d9443c01a7336-2986a6b7b8emr190623825ad.2.1763479118289;
        Tue, 18 Nov 2025 07:18:38 -0800 (PST)
Received: from [192.168.1.9] ([122.164.83.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0e15sm177923855ad.60.2025.11.18.07.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:18:37 -0800 (PST)
Message-ID: <e6d26f57-1871-48f0-9db5-8f2b21fb3635@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 20:48:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
 <d9af64c8-f0b0-4e2d-b182-824078f5d185@oss.qualcomm.com>
 <9c10881d-d5c4-4e60-8960-2ead76c63a2d@kernel.org>
 <d5sn56mlwaae2hou7t6pr24h2pojvjcv4ufsxg4lbbnk6vlpfi@xc5e5uekofbt>
 <c966f8a6-2dd1-4e73-9016-c6b08d7e0337@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c966f8a6-2dd1-4e73-9016-c6b08d7e0337@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8f16WStVkRrvtr18eGl0jz_USkhcAQB_
X-Proofpoint-ORIG-GUID: 8f16WStVkRrvtr18eGl0jz_USkhcAQB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMyBTYWx0ZWRfX22DU2sAOGc6p
 61DOkg/HjHCMNRuIZnt9uDqfHQwiqFMwGfrJHSZV31eWUHLQInacYi5jQFobsjmRsYpux7M8qpN
 9JVvgydOiTdJpmuQhz+GWTtMWE9ISXywMR7oEsm57JUDNni/sPpjqzop//scgXPJt2fAOT6btM/
 rVFa4W1Chtylys3+3WrxJPa8khJpIX030msYuZHXJReeHoV79orr40GrQxQGQjJG9WGUtMi9LMq
 tJCOYkIcM0KmkNL3tv3Kf+Il0au7h0MLcYX0Av/i5dzZOysTEC2yvC6WlHV8bHkgrMMj6tGJk4C
 SWR9REhwx9GOvSR14Kbu0xMnTPuIo7ZHg1O/sUFO86/3m8rFPB8qMZQsNKXEjvtgVNMB8NDbkCd
 g5TJhuwGUTFZQtE1Qg1agfvcWl2pgw==
X-Authority-Analysis: v=2.4 cv=L+kQguT8 c=1 sm=1 tr=0 ts=691c8e4f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=a3gljYgooLRA4er/6UIzuQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rzkHM0hXlX4qtSzQHzcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180123


On 11/18/2025 6:02 PM, Krzysztof Kozlowski wrote:
> On 18/11/2025 13:25, Dmitry Baryshkov wrote:
>> On Tue, Nov 18, 2025 at 12:39:51PM +0100, Krzysztof Kozlowski wrote:
>>> On 17/11/2025 12:35, Konrad Dybcio wrote:
>>>> On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
>>>>> Make use of the __cleanup() attribute for device_node pointers to simplify
>>>>> resource management and remove explicit of_node_put() calls.
>>>>>
>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>> ---
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> This is obviously wrong and not helpful patch.
>> Describing why it is wrong would be helpful (or having a pointer to an
>> explanation). Bear in mind people who read email archives and find this
>> very brief note.
> I gave some rationale in other patches, but summarizing:
> 1. It is against cleanup.h - author did not bother to read it - which
> clearly asks for constructor with declaration.

Thanks for pointing this out. I understood that w/o NULL initialization 
we will be freeing some dangling pointers but looks like there are other 
cases also. I agree that I overlooked the details in cleanup.h.Apologies 
for the oversight and for taking up everyone’s time. Will take care of 
this going forward!

> This was discussed many
> times in the list, including many bugs and explicit checkpatch warning
> (on LKML) because people don't bother to read cleanup.h.
>
> 2. It makes simple get+put code complicated, not simpler.
>
> 3. It grows the scope of OF reference without benefits.
>
> 4. This driver was already reviewed and simplified so author should go
> back and think why this was left alone (would save a lot of trouble).
>
> Best regards,
> Krzysztof

