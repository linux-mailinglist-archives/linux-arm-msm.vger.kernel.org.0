Return-Path: <linux-arm-msm+bounces-56533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF108AA76B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 642AF5A127E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06CC25D1F8;
	Fri,  2 May 2025 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzOEDFEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FE0146A68
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202109; cv=none; b=O4PWwQTr9g2b/nD9cl+8ejMhqyHVtdBHLoO8revwEAhZhUY3uJR0rOj4/P4lfDIc0uQkbG5Th/oZvfyV7OJn4grjHSFTd6emszTx5KtmNHhudP5c5pf2w+Wtgsk4iqutZfAb26iXXhuD433XQZ1kBDbcfkNDt2nvQ+nAuNv9WI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202109; c=relaxed/simple;
	bh=Aiw78cv/p68kfnHm9huW2dP7/SF2x9C9ceZ11r4BIG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prEBNnXH8qpWDM4qRqWjUMJmaDzcU482zAOjDw8dRl3v1TKpQ2x5mMVS+d0AlJaY/DfU79E8OJYb55pVO+UfowP7eDrUovZueC/sfcCjGe+zK0m8LOBx7p8uSOhyEm9XHL2HAsoWOShGbaZ8WyumBp+XPkw44Rq+zSF+0QOxMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzOEDFEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DbLqR025490
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 16:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCURuZphALca4oH54vQyehTX8P10HSrIKR7pzdxmoGo=; b=kzOEDFEzns8z6IKY
	VXiK3lU2R9FtEJXfIuXSeIuGjANAeIHkUaH7UZMchouRAl0MGM3yKdgFztz5vDVT
	cNrs06uZmUz4e4TVMRxwr4Erx7nVYobpvfzA5WtxA2d9Mq2KKQroX/rR7wnnjkKn
	8jLcSfrAwYqko1uSWk6ZTc2VGsADLOS3ofRt0ghC2q+rZJKNkvIP4SiurWTN+qt2
	ToJglBlsn069C2iZLRd/pIFNWUvzGjP2+4MNrHYclV0V54gf7hUXWocfzSNn7BRO
	bTKfxhvRRdBLyGU40DJ9CUDcDWQQK4dfDgLDOB6MKJ3eYLH71SadEwdhJTVcHg5K
	7Qgm1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u80tnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 16:08:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b22717f1so1874283b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202106; x=1746806906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCURuZphALca4oH54vQyehTX8P10HSrIKR7pzdxmoGo=;
        b=XSW2cjl7PtRw9B4WkwvidO4AciI7m9s35r1zJqrGuvVG9sGdlLT9f0K7xwOfolfMDy
         AbyGmDIX+/3d4+f1NQJ2/5DYMW+0nEPD/6rYM3zZQfSL7ptCILDqME6n298cYnn0tlei
         zB13xymmRSi465FHp1/DAuOV8305rJhbYVGX4hRWailzEnI+Z0cdPrfYtIoN2nXzkqJt
         UQkR55EpvBpVHuzbseu9a6wuMPHLe7Hyin53m5R/DjoEaKiwx9t0qfebpsCyhB6xQVLP
         Y4g4iQn6r13XcnzlFLtaqAxaxBBCWmQ4hjV2cP8Shd0WL7Q0vaDyPAEMBB7Ao/L5j7D7
         cbUg==
X-Gm-Message-State: AOJu0YweU4pNv3//4sTWExeYrzImLNmlpQC8R31EvssX8a5Xv7+wukxf
	1sfrU4ff6dHRNfkLZ8eZvVkCQPCcc5FbNtCTpvtPuU5CbBNpi/x2k+UvqjpE/c/Bm7jf64cCaTx
	eZ728fpRMYr+KMgo1P3TELJ4Kk0/ueOt++W7tPV/KHCe1+jOgEeN/hQv/z2DIik31
X-Gm-Gg: ASbGncs0+Ilxb2longkpuPEncIKUt3NAnBUlgpKMLmtkkCXiQA4CGJ9dmVEFa8yjBHN
	fLpi28nMslH7eNWRi08/RK9RoUaHzDOtjhJbxeW7WOK5WOEyLkw2KKfTiWcTQ+hP9rdR3xCt8pZ
	QcIsGR74Zd+ce2M2eHIxlH9xqT19r3bHMP6vPYEw55M/7T/LgpGHTcFZwYrun+QRntEGmonBcYm
	tvrvt+bzTF/7goN+fdXY7kxlKlGGSZ8ZeUhlkRo11m+DjJJe1i4kI9ORHSi9o3Ofz3sX3M4dsWp
	gDsntuXGk5Z69O3+3GK4QBCb7zfKedgm2F5f3qhTYLeNv5BIX13h
X-Received: by 2002:a05:6a21:2d0a:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20bd7662d30mr9078750637.10.1746202106419;
        Fri, 02 May 2025 09:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFngvS5zV7065QKg5lJ9bJgIZHUtGEmOAi1Tej78hd+AnKg2zkgE5D/a4yAbK+mQc/qiES88A==
X-Received: by 2002:a05:6a21:2d0a:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-20bd7662d30mr9078706637.10.1746202106026;
        Fri, 02 May 2025 09:08:26 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3922041sm956661a12.2.2025.05.02.09.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:08:25 -0700 (PDT)
Message-ID: <83c427de-c678-4408-9b04-2f3d2eef9fac@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f8b57c99-2f6a-496b-a6fe-3e2aa6b0b989@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6814edfb cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=9TRSRwEFIUlA1hFsN1MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: lB0_KIvzbO3lcLXcNjsoyCg9xZ1ht2BE
X-Proofpoint-ORIG-GUID: lB0_KIvzbO3lcLXcNjsoyCg9xZ1ht2BE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyOSBTYWx0ZWRfX7K92C6LXR2TO ZWKCUsA5sfERXiD89NATs+8Rv8t6yz5w++OLm+gk3a6c0y4lF3+3VNEJkyLXAvTW/AcwiCBt104 oi/uTEMscg0GSwhjTS+A0n7Z1adZJ8lZg7UeAfQeBOFkTm23M9l4AtdbK+R7hI5W77XcAvkFzgD
 /OJ+fx6ynJgyVqCxXop7DbLfWMaydy6gHg2dCnhmfxQckRigfD4RHrjg34GQnig9Gi3UqPjK1Ff +urEQ6CNEvQvBPDttS2PW51XHON5MzK37hgT4k72XEttqZLed1dWbPGAJB9kxuhACMrq5JiCRMP t4q/bqD5qbiDG03kVDhbEvI8FaMqe6hqHcyqnVphLMKFItPQvdzuQZ+GVHvgtWrbG66v9EXZJka
 acxAVbWuME1j1ssb8SQCMvilq3+MDvcrltmbNQPX5FJIAB6o8hgXQojRe2+ePJ+ZeyeWKydU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=953 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020129


On 5/2/2025 7:03 PM, Guenter Roeck wrote:
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device 
>> *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_restart_reason(wdt, data);
>> +    if (ret == -ENODEV) {
>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    } else if (ret) {
>> +        return ret;
>> +    }
>
> Seems odd to me that there is now a function 
> qcom_wdt_get_restart_reason()
> but it doesn't handle all means to get the restart reason. Maybe I 
> missed it,
> but what is the reason for that ? Why not move reading WDT_STS into
> qcom_wdt_get_restart_reason() as well ?


No specific reason as such. I was little hesitant use "goto" statements 
and such as. So I thought this would be little cleaner approach. Please 
let me know if I have consolidate everything under 
qcom_wdt_get_restart_reason().


>
> Guenter
>
>
>>         /*
>>        * If 'timeout-sec' unspecified in devicetree, assume a 30 second

