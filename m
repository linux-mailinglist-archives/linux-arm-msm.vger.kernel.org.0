Return-Path: <linux-arm-msm+bounces-81198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099EC4C6A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 09:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2803A7715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644D1322523;
	Tue, 11 Nov 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+D8nEqF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cH4EDZrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A479D31DD91
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762849807; cv=none; b=BnKtLtQtMaWPGz/nIRzkz9/QHBPVo5RjjpIqYgxddgSgYtjW3PyPfYgUWfHiwQ2XaHTmNSe50iIjdNiJ9avaaacX26yQr/lPDHWYwgEX8auxhDSb459/Xs8r6YuXRqdv9+JO51yVmz2sqbwz/64HnPlLdY4KFrkr/B93kpS+puM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762849807; c=relaxed/simple;
	bh=IFjVXyWDgG00crKvCM2l2nnLUPzhXwIEDzrUmmqin44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwU5LeBCEyyQKj5YzJ0hZyfpws4AoJ6LoZ3NeDsrAwIKF+sArd9wUDRC/AEtzpHxj8dcFIocFCHWY56w1tqysath2jL+TGKYB6oILIug0cxi1UIsfewn3XeqtBxJO60tvIJFf/042E216NMoAIxZbNxw8ktq+Oc495Z6Z9rr6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+D8nEqF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cH4EDZrM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB5Mtrq1479926
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 08:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxkzJvIRec0YRU/t8Nf6/urFDe3bQa7PQHKJ01H3THU=; b=a+D8nEqFR0XCgf/F
	rAEeFaa/GGms5nRtDZn5aRhvFxsnXN0ZLTxSygSV2T7Hf/8xVVHmykRjAD/bn/TA
	wuWhpAs2VSRU2lVIqAQmGI/SC9TLcsR9Tp2vQUV+wzJFJTlsQcLwJeZtjTmUaWit
	wHJ1831gxRU5z33+lQ+f+nczpN6WCFRFliqz9cUMYv4nNKeS++DVPzF5Lhm9Gkjx
	sf/2n9nm7nfZ41jJ25g6UXGeHE80VC0oyugOzNVlncor+8jQN209Ko1yKiSsky/n
	Hh04Xy6aW0eP/NyF4iClSA4ZN0UpjbENnEKxI2KJLfNbJlxbqEPzqdxCYIkTTRIG
	kA0iLA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxxu8g9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 08:30:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ae1d154993so778495b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 00:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762849803; x=1763454603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxkzJvIRec0YRU/t8Nf6/urFDe3bQa7PQHKJ01H3THU=;
        b=cH4EDZrMjCMkIxkble0phvPh5vE6iN3YlV1m9dGyOV1oKCT/xUEJ6ipMbkTXWFlzjx
         Ffg3Tk7ll71Ti1zR22BSoiTRnijQmzZdwIPp8EiqB4nL9FJWx8eNPvddm1efxw7nsLEO
         hPlyM6Zsjnx8ZSeaFLeBvn6vL7V3r5GbAfKch+U7WQbQerA4/8d+VNpW/5Y1GvxLGupL
         t89MZKxPUX7hc1yBS++iYsRpiKeVpjvp1I01grNvt7z+uVkiqGy6sunwSRIoMOdQweza
         ILbwNNVcn4jCNzz+XvWJSX3WXuOHqhFkPVu3piVkeiQxLznPQ8R1R/lX2IaTBP7NP2+C
         PDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762849803; x=1763454603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxkzJvIRec0YRU/t8Nf6/urFDe3bQa7PQHKJ01H3THU=;
        b=swTx7Ra4GzIIU7b3RYUr+XUN1kkfCLocIxAGjd8iR1/n7bh5tS8MPTD3IK3eRowi9k
         banvuFuh8ot0X8ykIT9Fee6G6SxZorz1KbutqNkaIl355SFn8ReFp1bweKzA31+sGtY1
         be2gGwn4l/j+nA0ln5FuTIvbPH6NVuz+8vPmG5TY135lCA2FqTGigmLR4mYBtVCaO7zU
         kDl2mF+u37UucusBM2zXe8Sk0PrU+739DysKzn++bZm9b97/j1uglciEweyyxGra2+6O
         n83+LwuSZLzOtY5DnHbyiK06Jjna1MhJ4DwBYnNZC5POXq1xNd8tJEWTCQFTMpvY4A7h
         z8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeCud/LhPGIundAJH93kI607TiomTdZFpJ2CaRZVsDAv7t50uSc1Ra7hZPqjus9nrua2GYYZ0cNhLQ6Fg4@vger.kernel.org
X-Gm-Message-State: AOJu0YznEVsfc2EyMz+nHtgsMmfUvBs1L6iboOrq2QzNAXbSYWmA/XFi
	qxjqcQG6QsUVXhKFWlUqMhYQ5wxd7s7u4Smw541WVhPx1lYv3IB8XoaXZj1nGds4GWFPT+KTtKt
	VNx+0kM35DbW1DCK2rCGkQN5B02tpp6kCDGJLVwLJPXl/DHWjWrTfS9DayXqjz016ZGsB
X-Gm-Gg: ASbGnct+WRsaLSUozLzPOpmCyEz2kwiu/gPfjIDuyWuWn5X+atbGsXNiHD5e6mzcJF1
	HuCjC3RmA351gAjo2pHOE5jfQrjBmZvrXIUwbZEIyXO81UunSX+9B98bYd0iq4OEwpXKJ1POngp
	kCwCIjTgil9Ly5RdIw4IDa7fCTrHUhFxRwyWP6/tXkiCq5uD9rEN4gjvRQBnVYLkkAj25YMv/69
	8AWwyQ6/Jx8ZuSPCR4XGF0FpHYQVY+vRhZVh1SsKMuBnIAjnGaidSqHgAsKoFRB3jkyA/jQzOMx
	oX0a2771ws9UrjnXaausF0Nx7HV1oP2NflQZYMu4zX04AYc6M355A9j2edvG4AZZKyLdsyFrF7H
	DjCWfLTS91NCRn7ckVqEJhF9X4Iyy+0Ni06J9n8l8/E4=
X-Received: by 2002:a05:6a20:430c:b0:342:a261:e2c9 with SMTP id adf61e73a8af0-3579a57ad80mr3102823637.8.1762849803173;
        Tue, 11 Nov 2025 00:30:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuhb2GGhvE8OZGJfSKk9DDBi2oTQ4tUBBW8s8pA3ACUuriomTebsLbkZBpIa15zbib8ASJvw==
X-Received: by 2002:a05:6a20:430c:b0:342:a261:e2c9 with SMTP id adf61e73a8af0-3579a57ad80mr3102772637.8.1762849802611;
        Tue, 11 Nov 2025 00:30:02 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e791sm14749002b3a.7.2025.11.11.00.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 00:30:02 -0800 (PST)
Message-ID: <5b1f8204-1f49-4061-aa4e-f6dfe5ae2a0a@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 13:59:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <9d80b581-5d3f-4b95-91e7-c73c113b0976@oss.qualcomm.com>
 <c2o4iouc6sm7frcq64jmvxopv3eqvrjxievwwhiwqw6ptwfok3@4qmpfy4yij4m>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c2o4iouc6sm7frcq64jmvxopv3eqvrjxievwwhiwqw6ptwfok3@4qmpfy4yij4m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA2NiBTYWx0ZWRfXwBi3AQvGswP1
 AN1ncjFAQ4il0aN/yNpUo67KyJeASrQaFrlWpMEoUUsL+DJ6LN80P0KXrrsq79pcX4U3oe4sIM1
 jv+9gYDQwv3Z0urXdmtXLk2kEHdS27DkjEwhLIOzAGrZ+kJ5DbHpbY2oS7E5RiMTn/b0ov4uWEJ
 nY9+o++ZYnMCBvQQY+ewGeZBJywNt2r0xVJJ2mJkLxK1gs7mu5QgdfJWIpUTP++Kzz7YUvp9xNq
 mPJXL+8o3RwQRxpIo+C3cpz0kGA2hlsHTlfDq+tg6yuXv2jfGcCbF6I2qhig6RgB0vLriAOoJ1a
 Fx3Ry3pp/b92hPc+pMIOYCkCxYuDmB5jfqvL66RnXi42KzVRYNfrGz0M0Gt2bYXsaIbWJ86Vu1E
 ifaTmqI4fFnsvstq8z+nZzduZQrQfw==
X-Proofpoint-GUID: SMasfhHMg9t_3938J--pUUPvAe-C9mJ6
X-Proofpoint-ORIG-GUID: SMasfhHMg9t_3938J--pUUPvAe-C9mJ6
X-Authority-Analysis: v=2.4 cv=TfObdBQh c=1 sm=1 tr=0 ts=6912f40c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OHlQOMkkIfFZTL2-Co4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110066


On 11/7/2025 1:54 AM, Bjorn Andersson wrote:
> On Tue, Nov 04, 2025 at 03:58:27PM +0100, Konrad Dybcio wrote:
>> On 11/4/25 3:52 PM, Krzysztof Kozlowski wrote:
>>> On 04/11/2025 15:38, Konrad Dybcio wrote:
>>>> On 11/4/25 3:37 PM, Krzysztof Kozlowski wrote:
>>>>> On 04/11/2025 15:35, Konrad Dybcio wrote:
>>>>>> On 11/4/25 3:26 PM, Krzysztof Kozlowski wrote:
>>>>>>> This I got, but nothing here explains why you need generic compatible.
>>>>>>> To re-iterate: there was no generic compatible before, now there is.
>>>>>>> Writing bindings and numerous reviews from DT maintainers ask not to use
>>>>>>> generic compatibles.
>>>>>> OK so let's not worry about a generic compatible. IMEM exists since
>>>>>> MSM8974 and it only had major hw updates with SM8550. They don't
>>>>>> impact the software interface though, so qcom,msm8974-imem is OK.
>>>>>>
>>>>>> There's a separate control/status register address space for each
>>>>>> instance of this IP (usually far apart from the actual SRAM pool),
>>>>>> which Linux doesn't have to care about.
>>>>> Just use qcom,kaanapali-imem - that's the first device here without syscons.
>>>> So we don't want to move the existing ones over?
>>> This was never discussed and this patch did not do it. You cannot move
>>> them, that's ABI.
>> I see, I implicitly assumed this would be a sweeping change.
>>
>> So should the Kaanapali submitters simply send a version of this
>> patch with:
>>
>> - oneOf:
>>    - const: qcom,kaanapali-imem
>>    - items:
>>      # existing big list
>>
>> ?
> We have 33 cases of "this is just a generic Qualcomm IMEM block", could
> we just make it "qcom,imem" until there's actually a sign that it's not
> a platform-independent block?


Any conclusion / further feedback on this would be helpful to move 
things forward. Thanks in advance.


>
> Regards,
> Bjorn
>
>> I'm not a huge fan of using kaanapali as the fallback-going-forward
>> since it's literally the newest platform on the shelves (or perhaps
>> not even on the shelves yet..) so it's going to look funny when
>> someone comes up with support for another 2013 soc.. but perhaps
>> that's just how things are supposed to be
>>
>> Konrad

