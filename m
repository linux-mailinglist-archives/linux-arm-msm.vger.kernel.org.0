Return-Path: <linux-arm-msm+bounces-70846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFDB35763
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BC2D3A8A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 08:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86562FC864;
	Tue, 26 Aug 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6Q/yNoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7D2FB632
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197610; cv=none; b=OqLeZksygW/MaBK8W9+Oc75xh03ZlN7tv8KMwSI2NSgtwhFAnZVpZIJr0NEslThOuyE9bzETjOOeKZp74I6R7bwxK3uDbaeOXfhgIKDYfis6K45d8OAsiyYsgiNdFYnn5Sd3SC4Aw15AumYtxYMDJMF5EqZYP47swmXWl/CaNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197610; c=relaxed/simple;
	bh=l0kbiIGF1pDSwWfvhUdw7e1i+RQ9T4G2DNY6m3SB5ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEH1N+WgGj1tmkqpjuR2104sbqYWYx3IsjBUaEEd9DqtMQNXi80z6k+ioebG1uEr2EXD5Lpowhh3pS2lycBxmIccxKMjLMpcwEy7JHzOrfo8eNGz3Ur+IOIg3h9ubPu1RQHP0XsJSUPSP/3Io7zR69DpsBC+MdhvV5nQEG9OWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6Q/yNoJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q44I1Q010931
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZzBwPQpsFm5dOpqRIWUvHHP01zFw0ebgHPUha5E/DY=; b=k6Q/yNoJIikDIO/9
	5ZhlsK16bE9KEph72O3PEOvWqU0nt4xcUl4N+XIYuJUfaJy3CZboulsq8Pk98i/N
	8OZRUfbpIDYQVlGDDhHTtVyZFjCodvmOOgYp/BvSOMzAACIZVWx4fkrT77WYqkQd
	vZ6EJ2kpOIl/mseEMvI2Q4E4NLz1Qop0y0LMFTwHcqO9ThnjUxQaH1bluaYE1NXh
	cqG7PGa4bz0sDPpOxXcSX6a2DyUda6lFBsQeh5DQ408FU+2MKP9Aon8roI3m6k6a
	1zim5/VsW5m8+3Akx+V0Pj5juxCzvv35WUn7YB9MroT2U/vp0xGaiD4pH5iWahJc
	we4p9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unqyuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 08:40:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2465bc6da05so46878855ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 01:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197604; x=1756802404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZzBwPQpsFm5dOpqRIWUvHHP01zFw0ebgHPUha5E/DY=;
        b=s5wtwjX95n3k+7MM8UBl6Xe3vWx+wlhhTrTRUCQHJcCrq9+16b/swU1VGWPfT5HcnZ
         /+BkVP7T+3y/PQLMjuBScR2Ru+EgDzwiYc0U7WHwJfUqt32PsZf48v40VewwG40fcvWx
         Z+Cb4JxMD9tPx0odnCRn0yVzGbLSu13ldFmRay1UPhJ+KrCI7PqMfFAPGJa6k+8ubv6P
         E/Z5qPp8gPhyBDOCrK44BRLhMf7jraqixel1dLJ/9s2oKjnPNGyE0/1Y3ljTBfisNiJU
         QPuXGpzB+3fDwfLh4mAopQIdior68uT31w9+5oUgJgDju0EXZLUEadyZBF8Qf5trAT9F
         MqHg==
X-Forwarded-Encrypted: i=1; AJvYcCWHHFIULBFMWJaDRsHLCpaR8nvRwP92DLtLEyM754kTJ/uXiwTxpiJBYh6YxmVlIdaetKwTSIX1vaNZeIp5@vger.kernel.org
X-Gm-Message-State: AOJu0YxHvFPZPDuusomCCka1M5bZQwlR8963YjS3P3GmgfU71iBtHm1V
	/q/g0gWvql4TNPlNQXmhHaQ2L9KtQrcilTg1lzZIrsnOD7dsnURKkmEJ63NfTuFYG0tTQNj6eV5
	JE875jjgP1Jld+MT77mVzBpKW/U11S2/sCPr5V48tEXFcv0whJ+OM4eNID76pRQeouuc8
X-Gm-Gg: ASbGncsc46P9up58rUo0l50MPP6otgabs/icnZf2HvfZfoAsVSZJ6dJWvtg0c4UbUfa
	dVZeZgdS3Q5vp4NVyhFqrAfRx3hxVM6pB1A5Lpu4Mha4LdqKg8j4kv5ev8Wtl64U+2nC9GSVIzs
	hPiu/j8TbWo3dD+0TqQXZeOafOAuwEh328W9kmpeC9EY5zC5A8e1lFfdLp/EzLAMhYyfjq3zwKT
	5jDWX7bL0IyTKcYHJHEtD+au1+i+27v4XW6GieF7J4A/d823rwi6ds+om5RtZc00BB36OBKAMgx
	8nZdz+VQ+OYhrXzj/24r5rrUQT6Zu0WsMIS7Qrxawwum81LcTusDmKoxGo7E+CH07sv3UDuCkfG
	yeLkSWfzw
X-Received: by 2002:a17:903:37c4:b0:246:76da:80ea with SMTP id d9443c01a7336-24676da82b5mr136669465ad.30.1756197604128;
        Tue, 26 Aug 2025 01:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFps5spYMgMSBOykW3IsGvhVvZ5qGTh7lw6hM84N5G9hXec38uZg+X3bGMa48Hor3TRcNwCfw==
X-Received: by 2002:a17:903:37c4:b0:246:76da:80ea with SMTP id d9443c01a7336-24676da82b5mr136669095ad.30.1756197603599;
        Tue, 26 Aug 2025 01:40:03 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688645e1sm89184635ad.79.2025.08.26.01.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 01:40:03 -0700 (PDT)
Message-ID: <8753d857-5d72-493b-8c39-8caa84e0ba16@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:09:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom-qmp-usb: fix NULL pointer dereference in PM
 callbacks
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Poovendhan Selvaraj <quic_poovendh@quicinc.com>,
        stable@vger.kernel.org
References: <20250825-qmp-null-deref-on-pm-v1-0-bbd3ca330849@oss.qualcomm.com>
 <20250825-qmp-null-deref-on-pm-v1-1-bbd3ca330849@oss.qualcomm.com>
 <sxqgnmj4bawj7n6kan7tiutb5ynhxz6cgbtpbz2xx4ixodtdw6@q2ftbnpjouvb>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <sxqgnmj4bawj7n6kan7tiutb5ynhxz6cgbtpbz2xx4ixodtdw6@q2ftbnpjouvb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B7TYXP0I7YgQghlQYHShHojrqZ6IbNeo
X-Proofpoint-ORIG-GUID: B7TYXP0I7YgQghlQYHShHojrqZ6IbNeo
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ad72e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5K2DVmaXFLzhwRWEU4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXz2Gnmg/h1mw8
 Aqk5ZldgVd4CZiKNjlqm9rkA4q2EX09qDCr68rV4x+69B1NZE4fNUu2aPSGJU6UAuwueNLTzwst
 4DG6f03lnr2z57UtwfgYg8xcbx4+JM2dP4VNROzQBeYTfn9tR7lj/a1UeLTX1ZZeI/t2wZ884Er
 0XiXmlse7e1YnqKbHqbWPR+ch6CSbsgx8wmVtyH3xexBLVrfgGloqSybx2Jfu7qpq8jAV5HCVHC
 pPVa2f0AY9/hOYo7HuJpBcvYgvGbNzUa+zVgrMqkMzJZ2c/Dp9CcE50KwEHsodSd765z1CH4Y8V
 NveidBvkIqmos218JUzpOWWiRKvqw9D7YplR+u+8paVMnPmlic1G0nAjhpaLue/TcXGj7prfzQN
 RbZ+Yj9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031


On 8/26/2025 8:20 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 05:22:02PM +0530, Kathiravan Thirumoorthy wrote:
>> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>>
>> The pm ops are enabled before qmp phy create which causes
>> a NULL pointer dereference when accessing qmp->phy->init_count
>> in the qmp_usb_runtime_suspend.
>>
> How does that happen? Do we end up in the error path inbetween the
> devm_pm_runtime_enable()? Or does it happen by some other means?


qmp_usb_probe() is scheduled out per the below stack (collected from the 
RAM dump),


Stack trace of the kmodloader process:
     [<0x408def88>] __schedule+0x348/0x55c
     [<0x408df1f8>] schedule+0x5c/0x98
     [<0x4052c318>] rpm_resume+0x150/0x404
     [<0x4052d4e4>] pm_runtime_forbid+0x54/0x60
     [<0x629c47f0>] qmp_usb_probe+0x3c4/0x5d0 [phy_qcom_qmp_usb.ko]

 From the above snippet, we can see that the phy-create has not happened 
yet as the probe is still in pm_runtime_forbid() and qmp->phy is NULL. 
Meanwhile, qmp_usb_runtime_suspend() is called, causing the NULL pointer 
de-reference issue. Since the issue is not easily reproducible, we are 
not able to find out who/why the suspend was called.


>
> This would be quite useful information for others to know if they hit
> the same or just a similar problem.
>
>> So if qmp->phy is NULL, bail out early in suspend / resume callbacks
>> to avoid the NULL pointer dereference in qmp_usb_runtime_suspend and
>> qmp_usb_runtime_resume.
>>
>> Below is the stacktrace for reference:
>>
>> [<818381a0>] (qmp_usb_runtime_suspend [phy_qcom_qmp_usb]) from [<4051d1d8>] (__rpm_callback+0x3c/0x110)
>> [<4051d1d8>] (__rpm_callback) from [<4051d2fc>] (rpm_callback+0x50/0x54)
>> [<4051d2fc>] (rpm_callback) from [<4051d940>] (rpm_suspend+0x23c/0x428)
>> [<4051d940>] (rpm_suspend) from [<4051e808>] (pm_runtime_work+0x74/0x8c)
>> [<4051e808>] (pm_runtime_work) from [<401311f4>] (process_scheduled_works+0x1d0/0x2c8)
>> [<401311f4>] (process_scheduled_works) from [<40131d48>] (worker_thread+0x260/0x2e4)
>> [<40131d48>] (worker_thread) from [<40138970>] (kthread+0x118/0x12c)
>> [<40138970>] (kthread) from [<4010013c>] (ret_from_fork+0x14/0x38)
>>
>> Cc: stable@vger.kernel.org # v6.0
>> Fixes: 65753f38f530 ("phy: qcom-qmp-usb: drop multi-PHY support")
> Has this been a reproducible issue for last 3 years? I think the fixes
> makes sense in that it introduced the indirection, but when did the
> issue actually show up?


After migrating the QSDK Linux from 5.4 to 6.6, we are started seeing 
this issue randomly. We didn't had a chance to test in the other kernel 
versions.


>
> Regards,
> Bjorn
>
>> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>> index ed646a7e705ba3259708775ed5fedbbbada13735..cd04e8f22a0fe81b086b308d02713222aa95cae3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>> @@ -1940,7 +1940,7 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
>>   
>>   	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
>>   
>> -	if (!qmp->phy->init_count) {
>> +	if (!qmp->phy || !qmp->phy->init_count) {
>>   		dev_vdbg(dev, "PHY not initialized, bailing out\n");
>>   		return 0;
>>   	}
>> @@ -1960,7 +1960,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
>>   
>>   	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
>>   
>> -	if (!qmp->phy->init_count) {
>> +	if (!qmp->phy || !qmp->phy->init_count) {
>>   		dev_vdbg(dev, "PHY not initialized, bailing out\n");
>>   		return 0;
>>   	}
>>
>> -- 
>> 2.34.1
>>

