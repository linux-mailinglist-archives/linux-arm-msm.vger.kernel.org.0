Return-Path: <linux-arm-msm+bounces-58594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 230ABABCEC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207991B63E70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 05:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9462B2571B9;
	Tue, 20 May 2025 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pa0orcc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13E1E51FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 05:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720237; cv=none; b=FNruJ/zAEVwNOSVrVmEds7ntMXhAYX0Aj6ulqlzlTCBd4pG80HaJJxYmeomKN8VmV+5fkoMUcbPBnwplZ1gPEo8TIUwexFav1lU6mBRBJbjdXVQt3QsVAgTWOgRm3N3YQR9HevYzbKGPICx/CKis3WeeobkcFkJ2FizB+0GdY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720237; c=relaxed/simple;
	bh=KyK6TkIDOqoAf2nGdGYf5nH04CfJe0exGvpmgXebnc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgqvHsfeziVcznkUo0O9CCJzjWj5F/p4NUSO8+c2uQp+GvZVk01Qa3NByDqMFB1dzfu1DmZCHI9EB03PCF8IPg8Zd/qD/FeIX86bVfuKNeLG+1RAqGeNypvP0RyzIaiqdWfg6wvCWaWM2bq8WPSSrA3nCxih+jOcSj9/J73g7Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pa0orcc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JHmmbW027166
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 05:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km24dUIRiYW8aOGNbg1DsjspZziPv5hT8ihdXJjpuKI=; b=Pa0orcc2Ha5EfEbi
	f/iYtzOr3XM0A1KpPbUB24rqCz3gAsFgWyZmdcpZT6cd/liO2Gv8te56Bw7bQNBv
	2l4aUUVEUxr2PmqmH+Fsvlm7ohGu4u3iz6DZHdxCEEXWeGypY3t4ehMHZOeG1NRt
	RtVaBlL7lDOjLI+CCUVDXm91nsAMI8hyatiRHI+8buvFcs6+zQNX55IXRj/KA+aF
	ilZrxqeMdSHHEWtHAM7P24wEqAqquUovnXcQoRwDzwAJ8Z30/LPVP8kgVDW7vZDX
	d5T9NPuNX7ISmOapXs2ohqtF/VmT1GxfC8nQfba7RbrA/gxYcSwN8+tvuwQrM3Jf
	W6qTYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9xn40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 05:50:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e896e116fso3026966a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 22:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720234; x=1748325034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Km24dUIRiYW8aOGNbg1DsjspZziPv5hT8ihdXJjpuKI=;
        b=nyo4stKb77XsbtenTyEXoKSa+f5j18BZyFtFJv+IuqnNIbW5GWALqfuKvovIlGQzzz
         T6s6Alq4iTMCZYjmV4qaMm3Q+RcRtUBrsUM/WvMUVsUxPP+QLRWqvUuHnXYbctFCnz2Y
         VGrnWhiTbAYY/jjd5UpZ5VUiYovIHN40bevEXQH6XEKEyOlkxXOuOHXcoFm/Bf+kbJhV
         MROo5+nOYkjL5CIJAMQrVQJbF88MtZSl3DB2SDcfdzEX6aIFKa3XsVsKkXDoATifJYFR
         SOBbKmE32mXXsLGPo5ZSTWUbYM+QwB/yCyvBMorMVIWSU1GO3njiytf8wqvYD6v0/+en
         Lv9A==
X-Forwarded-Encrypted: i=1; AJvYcCVHi+sHl9FyT4WlJWcesJIorbXBT/jHTg5P1Y+H6dDFRGElDLrmrnqSNWeI/5T7Q3eHU2OBa+86fiTQ+ezP@vger.kernel.org
X-Gm-Message-State: AOJu0YysQMjMfSvl+8fX0lyhyFuXMaZX2vn5Wq5RozxWgQJ7hZ0lqk2G
	eCEbKRgc5hYRaLE08wW0SxokIShRL/NfhiLS9b0uVRjYBl642bA8DFVP9rJkFE+6dqNPtt4HJAd
	EuqOiTuHuzIe7vJsFj8lsXNrrfSDwvrWm38SinJSMUEkPa2GUlkMTMXl3MUSEnVYgqPtN
X-Gm-Gg: ASbGncsqWF2U59kagJjE+WQWlTIAGGQkMXT47eGvx92+8WMBrvoQRIz099RMF8fSN60
	Vq7ICKEYKE6abOnB/YJ/CWZ3men4Vgc7D4JZgIiKpa42fU1XztG97yyLfqmFwedpCUVZekHLRko
	7julKGbWp2hqNK0v0q7n3ltCkuSRckdFFnlLwcxyxT5YWlO5rh8S5YNL4T57ugGPFRo1DQ6VPcg
	rLPAGiGSP85Vi3rHvXAzzpl5NNKB+r1y6K7egKIxi49qFhHZ1wrGa4YDFK0XYGvfcfISFeKJ2U1
	62cHwWheEqAKMD1tsb3YNG2abWftiP06GUxeJw==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr22720474a91.13.1747720233941;
        Mon, 19 May 2025 22:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBZXuHT9cFq7ul2z/CNCiWSV/jZQ/+36VmU/IwET4aSX4ZC+a5hPtAj6e+8aiVHHcONSHRaA==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr22720448a91.13.1747720233503;
        Mon, 19 May 2025 22:50:33 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d80sm772308a91.4.2025.05.19.22.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 22:50:33 -0700 (PDT)
Message-ID: <af7d73b8-6907-4520-bf92-bff2065a5ac6@oss.qualcomm.com>
Date: Tue, 20 May 2025 11:20:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Fix channel resource access in
 device_open
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
 <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MsPB0fZ66Gj5V8UrMFrXC2oA7u1ay7Yt
X-Proofpoint-ORIG-GUID: MsPB0fZ66Gj5V8UrMFrXC2oA7u1ay7Yt
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682c182a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ormgAfd318N_yApGj20A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0NiBTYWx0ZWRfXwwaah01S6FHi
 Miio34RrECMUxMQCoWUlaMcokIqP7l7dng63AoRg5hYCDJTRHpUThJARvPcl2Y8oNGmnpCkdvb4
 3bHjwPxQpa1VZQWDr0RzSDrtWNh1HjAhKm34v+KJwzP6izy/AKY/y6/YJChztSUKW5YD9g6d41X
 Uu5QZ25G40RqjBhTibyXXkR2811/HGGHeNSM4wdpdTN3EaZITnr216358qDofog0H5V8i8ylcNu
 vInl6Cgu8l5qaQBuGWqi0FfqrtGgCLwMHT8vkB21BDqUu/Qo3c+b+eFulphmIjw1ZwAlDKx7FKh
 zDpIPhEP+kfpQ7tiV5UYXLaJYuKAVzN5v9dTyk5TixaGtNQYIEKlD2hETlymK+dSMaLILLa9EBV
 F/JcvgkFdsZiaHFnvdusajI8J9j3a32HtX2v5JgXSsxBuwDlhn6wtTFAH7GmCwUsJdiseQ10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200046



On 5/18/2025 4:33 PM, Dmitry Baryshkov wrote:
> On Sat, May 17, 2025 at 12:54:32PM +0530, Ekansh Gupta wrote:
>> During rpmsg_probe, fastrpc device nodes are created first, then
>> channel specific resources are initialized, followed by
>> of_platform_populate, which triggers context bank probing. This
>> sequence can cause issues as applications might open the device
>> node before channel resources are initialized or the session is
>> available, leading to problems. For example, spin_lock is initialized
>> after the device node creation, but it is used in device_open,
>> potentially before initialization. Add a check in device_open for
>> rpdev and update rpdev at the end of rpmsg_probe to resources are
>> available before applications allocate sessions.
> Can we fix this by registering the device node after initializing
> channel resources?
Ack.

Thanks.
>
>> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 7b7a22c91fe4..40c7fa048ba7 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	fdevice = miscdev_to_fdevice(filp->private_data);
>>  	cctx = fdevice->cctx;
>>  
>> +	if (!cctx->rpdev)
>> +		return -ENODEV;
>> +
>>  	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>>  	if (!fl)
>>  		return -ENOMEM;
>> @@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	spin_lock_init(&data->lock);
>>  	idr_init(&data->ctx_idr);
>>  	data->domain_id = domain_id;
>> -	data->rpdev = rpdev;
>>  
>>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>>  	if (err)
>>  		goto populate_error;
>>  
>> +	data->rpdev = rpdev;
>> +
>>  	return 0;
>>  
>>  populate_error:
>> -- 
>> 2.34.1
>>


