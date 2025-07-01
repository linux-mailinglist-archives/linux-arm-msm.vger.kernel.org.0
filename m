Return-Path: <linux-arm-msm+bounces-63219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC65AEF93B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 14:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C04D3AAEE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201562741B0;
	Tue,  1 Jul 2025 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQo39pa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D681E515
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374362; cv=none; b=SBA8RI4sapq9Zoc/C+1MZCpdi5uAE1oCq6VWmDhjgU6BE7h5giaFvcnVr/E/aBLnuUnPpxgkbiC2GHcRb2UYuGxeyB25+BhlqlhY6BtsreUKjAaNqxRHx+7JpdKYlQilh+wMKsTRzaD8azAWhAaTcOxmXT+wxfDUTyxIk3Ft17s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374362; c=relaxed/simple;
	bh=s6Km9kqmH3MHprC9cKJQioWs2nxJ+6oprPbTLVcSgX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOloRnmmsGZdQH5VQem8FWfWmmHYLjx/jSb5jDaWLK+iOeGv+aBVd27+6MrrVsLmtocWNAC5g9fiJCVHH51EH9DpbV92Bdj+fc3a2g8Ku/X+QQ1BQMxVDEnYz8kcckAieBsilQZwdiZzmZasVHYBaTEf/ZlLmc+Q4IjGJdyPBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQo39pa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561AUMXa001184
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 12:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1cPDedYpfvPf50klVd2ABP2QmrtcRgKhFzFC6BNJEE=; b=mQo39pa/TId2IopA
	/ihw15S24Zv6MgtdIVTD4bFPyOQgyHt0ycTmPcyhtkEWFTir1eh4tgUnp19+W9mt
	tTgXMCRICO/yVkwxQz7lJFX5EhjfgUeUEG1k/8tx0p2xbHQeB1nFrrPjnkqeOj91
	+MBPrB+9frrqDu+5nufol6ft7Kru3GgZBh7m0weXNcpm5+MDfoBoU+8V3VNdH16G
	aPQpVrBDeLwkz3qVIl14gxqYaalfJ5YLJEZRInqA+Az+buNpsThHwK2AGUip/Ada
	qSiCloT3fYGNflm9YqxHbynMUm3gs/CiuDfq8Qx4nNViLxPQXrPOjseJtpDvCYiZ
	iIO65g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm8w4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 12:52:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso11813876d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 05:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374357; x=1751979157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1cPDedYpfvPf50klVd2ABP2QmrtcRgKhFzFC6BNJEE=;
        b=AjMe18nyizfaWCBcbb6d9xLRk4SkqQ+DpQHGBT6EkuQin/Nbri/EvUb6aCLjNJz2y+
         uNMaGIRGTW3ClepdoPGovRhZfN4cLaNAn8FcAbvm70Wyv9a/ny/C6b/6DNbOXU80T+13
         z8cDs6L8PVFbkLto4Xm6t5UW7aCClS7J7T4RAKg4LsFKOUgs290M5Hzwbt78gp0Hx/Mz
         9Ke9vi4qesksF3Xf8ckn1sPd0HyVARzDNcqbMCHvdrxuJKRWpeJYAmgP95e+8WClKKfg
         v9aevQ6aFxb+FrH7XTG1Lv/WRW6+fSdv0f4lBG7EPn9xPMawjkfiXdhMxBDMu19jVwjC
         lN6A==
X-Gm-Message-State: AOJu0YzNH1JEOJq61Ldml6deMVLkmyHrqTgM/QUkBvwh7tqXi0+1P5z+
	41N62mu12EM+MyIa75Y99GWoVtwbzh8VObV/oj9K0frlUixbKP4Hfe/Z3ViO9/Ud3VR/DL48sLB
	ifpbhbpfQ07E9j/g7BXdZAWQqK46nV8WKO+lkaxKoWNThxsA34Ajwz4EsZhE/9RFdqohE
X-Gm-Gg: ASbGnctLmneupdtL6dFUWI5TE5FneE4Bcd2GdGjRJiLPQTR5FAyXN52AmafXhg0o43b
	OLIW3XaPzh9LEkFl6lyWBrW3qdw3yk0JD/R9Rw794DKvoUZa5D7R1AIhD3C3Z69RF8Se8qlsf4w
	fnEXUk/yBj5KV2Dw3Z1m+9Uq9wZVM6dowgIr3A2CT/LMs6eICYj1/lEdzRfS8IcKVsx6cfjZ3ve
	ukgQjysNXIhYR3UYkOSqtf0jjkdm3vaE7FxD97fYifm7EL5dvubctOjtCq7rcPXR5c8gELoDc0Y
	5QkEEQlkcCyiF4NVMip9eBPuukHffhZPNcn+0rG1b/yBQQ/dHMqIICicnR5Ui/CAcDDhlBRdelc
	qJGYrIj2f
X-Received: by 2002:a05:620a:1a0a:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d467737358mr162009685a.10.1751374357174;
        Tue, 01 Jul 2025 05:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Wskn5IkTC5clDFY3RNbkUQKyYUech94l/I/soWezJlddzlgn13MTDenGfT9lXqHy6X8jOg==
X-Received: by 2002:a05:620a:1a0a:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d467737358mr162008385a.10.1751374356706;
        Tue, 01 Jul 2025 05:52:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ff8b3sm7562620a12.67.2025.07.01.05.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:52:36 -0700 (PDT)
Message-ID: <64441b8a-2769-479f-8894-05c4580c96a2@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:52:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qup: jump out of the loop in case of timeout
To: Yang Xiwen <forbidden405@outlook.com>, Andi Shyti
 <andi.shyti@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>
 <SEYPR02MB55575E3DE3A107D36F5393AD9644A@SEYPR02MB5557.apcprd02.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SEYPR02MB55575E3DE3A107D36F5393AD9644A@SEYPR02MB5557.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6863da16 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=UqCG9HQmAAAA:8 a=VwQbUJbxAAAA:8
 a=r0m3sDERyDekZ1TgD0UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: QhtYabd-T8p96Ybt1uhHEMIpPLxBIwrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4MSBTYWx0ZWRfX08gdDeVjcYZs
 BeBH+Q94C7DEGXX23c0DXHDRASLJ66IdEECwIOO0gYlA/vxc22VEyQWNeC0ybCPUag02VKLpOgo
 5VNjToYypBevS0UJRZ/0cWrJJ1KGhDmht9/0zWabrdhVVaG9pe6+aEcpEUJOtB/Exzn/c+5u5P2
 op9jiSP73oDc9D8VOQ1jOdSPnw8SYgSnekHbiwYCD4bA8SeaPewEfwsonIf1hAjBtiQ+1K8prVF
 xO2d71359jzHMV0jFWuimZr4pPMmX7McCTMyJcdMsPbtBLFsFK/Swfu4pSVDoD0GiQhprpICf+P
 8nnI6TfCC5yo1nq5RuR3vB/QTHYElMMwTyGw+D7MUYCpexaGuJEuKYXBebe9E4a7jKggjUyFKC6
 PaYTyQKJ8lOivJcfU1m2xpNk7jNQk2qa5zm7qAvAvIiLI//VAtnBoWYLj7/DDBz04Rx2wr0I
X-Proofpoint-GUID: QhtYabd-T8p96Ybt1uhHEMIpPLxBIwrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010081



On 28-Jun-25 17:58, Yang Xiwen wrote:
> On 6/16/2025 12:01 AM, Yang Xiwen via B4 Relay wrote:
>> From: Yang Xiwen <forbidden405@outlook.com>
>>
>> Original logic only sets the return value but doesn't jump out of the
>> loop if the bus is kept active by a client. This is not expected. A
>> malicious or buggy i2c client can hang the kernel in this case and
>> should be avoided. This is observed during a long time test with a
>> PCA953x GPIO extender.
>>
>> Fix it by changing the logic to not only sets the return value, but also
>> jumps out of the loop and return to the caller with -ETIMEDOUT.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
>> ---
>>   drivers/i2c/busses/i2c-qup.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
>> index 3a36d682ed57..5b053e51f4c9 100644
>> --- a/drivers/i2c/busses/i2c-qup.c
>> +++ b/drivers/i2c/busses/i2c-qup.c
>> @@ -452,8 +452,10 @@ static int qup_i2c_bus_active(struct qup_i2c_dev *qup, int len)
>>           if (!(status & I2C_STATUS_BUS_ACTIVE))
>>               break;
>>   -        if (time_after(jiffies, timeout))
>> +        if (time_after(jiffies, timeout)) {
>>               ret = -ETIMEDOUT;
>> +            break;
>> +        }
>>             usleep_range(len, len * 2);
>>       }
>>
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250615-qca-i2c-d41bb61aa59e
>>
>> Best regards,
> 
> Ping for review. The original logic error is very clear. This patch is also very small and can be reviewed in a short time.
> 
> If it insists on waiting for the bit to clear, it should not return -ETIMEDOUT then.

'return -ETIMEDOUT' makes sense here, AFAICT

Konrad

