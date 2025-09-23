Return-Path: <linux-arm-msm+bounces-74549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A1B97C2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 00:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3547F2A555A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 22:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED5730F922;
	Tue, 23 Sep 2025 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcQai+j0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5182FFDF3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758668335; cv=none; b=n09VNdzWGLZMFovdSMQNIY0R2WdJNQsMbsE0hqyQRdy4ZzDnsadzqu9w6WlaknTS5AlrLh4AYholhtlmJREpoO5NNOkp7xZu5R8CIaTsGf7SGer7PjNkvLWhOf5RpIlAukAhdTt4TUsglVWPe8niAZJ48hxSUXCAzt8Z/bTdDC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758668335; c=relaxed/simple;
	bh=jJCqJvo9Wg7KsNH+Nl6zXRZB5rkkcGtreL82+aY3PHI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gc9v22++sZEtY2/zxk1oKgGjfg/e4En1UfjZ1DUyMQFTog5USWmsH+j5vxbEsoVTvnyRNqmhMP+4lPc4nXSWYFKUNuVXIhiCg0pqBRmj/JnKvI10Ar00XerMAmzrrL4L1vJqBPuOsemjwrUiK7bkTkbkzV61hZtQ+NPJpfCU79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcQai+j0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFOti3004583
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lmv3cG7vx0Ui6SQJVFVyi0/fmzwzzBeQW90PDkfU/OA=; b=WcQai+j0BCi8zFxi
	lUVpKNh8+whPNoxfUZKF6x6lfpg19BQSRbU+VGCMcLb9Iec0kDt6x0eIj3ahlrO6
	5OGA4AJ0dlpJ4ej5W3PUBYp+2z88ocBM8qvTuR34paxqWwilZPS/Wp+2La2o3EYT
	xKQ37A9vxiBACXVEazlnCy0+qr2Xh7NtSvk0Y76r2E1YXaQYYSyOmcdfgoDG24HD
	pXho47cy1yEI+m7ZYSERv3BgAb8sWOFD8g4/0qOI4e2t2WmDeAqzEdp+/E68pH+2
	hA80bK8SnWXSniCRgZLx6yi9QE2Cp574dc1yfFk0L5i5inHdQWS4vDKHhlg14XJ5
	YUnHiA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmntkxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:58:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f29b9e2aaso5362594b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758668331; x=1759273131;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lmv3cG7vx0Ui6SQJVFVyi0/fmzwzzBeQW90PDkfU/OA=;
        b=gWlVUFiOif+J1P2pT9ZNyL017BqZMB6P9OiAXAILMU3VOZRRJPpJGx9gNdDSMRY3CA
         nmYYEGnqXrzs5vvf+2UqtcvPcMtDnQVT1/U/M7lfhVb2lEqW5bn1KW9cz0e4anIi/2jw
         AuiHU3MOd0CrKJCEwuBRTONThJPau8tYukmLdHNX6efNxU93W+0hVbpICD9iS2fq7B6T
         bLHAHVMIw6fXySLhLaZXQ+F1iAS8ueDxatdT+zsdWBdMB9UGYlsD3Bv7RaD6O640NiKF
         ZAjwP/EFKobkLazhUptggKQyQaL3oofOumpQkXVRTNuDyDT+v3ELn5v9AMDDGAnkR65H
         7AiA==
X-Forwarded-Encrypted: i=1; AJvYcCXRy80xX29AoqhiN9aBh7fLS2LEHcbW15mW9HpqSyXId6n+M0AFe4W9SNb9mAzTBuKvord/HyTn0S4awuFp@vger.kernel.org
X-Gm-Message-State: AOJu0YwXdQ6PwQ3Gc+AP7LlQN9CfrIHiMp136CbLds/0VxSPPwmizHJw
	dczGke2gMqKBSzVwa70iIetFqIPp3LAfqWKUjYJVx7Cc9XUAZqXoR6Na0R5GmU3/4KHy/lZAOrk
	BHWjxdtAq3Rnc1LHROvmlisuJtwPXYcnWaYqyuBqVMHy6+5wAqfZMv8gIeT9ZJ6iH2zw=
X-Gm-Gg: ASbGncvp9+J07hupMoZLmWgLIQtQASa4Ls4ePWY3uR0UCHd5EUkhg94WipyE8KDK4BL
	rF3WLl+y7wDxRePEwM7ZcMMOTTUJ0BDAC6mGgfMI0g0xDgXffVaPA/RuwTuvH55j4/j1B2bvBbU
	djitJh5YePhaX+6mSyHplD72zx64n4dco66YCe+g7ygLdy5FZVHhIPQFaw3cHX+ghynq7xuD3cw
	14g70NOtrzYcKml1O7PpwTcXz0D8jmeqOGPOF7oLSZYbeQu0qtkAbeBwTVP+AQzmeFFdGSGqUUr
	WY7rOYeyZfnuOCWK/hUBcJtEB00gwLf+CqE0LMYe/Rh1ipbRpgD4HA6xxCns47ECdDeIp5d8lBX
	Gx8djMulUTLNb5XWIYfQaVNXpmapUkhGxpC3pkg==
X-Received: by 2002:a05:6a00:2e1f:b0:77f:2de7:eef3 with SMTP id d2e1a72fcca58-77f53897e35mr4420492b3a.5.1758668331359;
        Tue, 23 Sep 2025 15:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjDeSBvGVZUvhY8zB60DnQEjp9FD0V/JdWnCIwcciYRqCGw1BY9RbrvCylUoL7xIUUp1UWmw==
X-Received: by 2002:a05:6a00:2e1f:b0:77f:2de7:eef3 with SMTP id d2e1a72fcca58-77f53897e35mr4420479b3a.5.1758668330964;
        Tue, 23 Sep 2025 15:58:50 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec40263sm16712568b3a.80.2025.09.23.15.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 15:58:50 -0700 (PDT)
Message-ID: <bb776102-310b-4a84-943a-86d4138592d8@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 08:58:45 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aMvV4kK386Sni10i@stanley.mountain>
 <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d3262c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=mbIkYJv0h8CN-5O4jtMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oxc1Qu7nhzAzN6ZEMYhnf95K2oH8AqCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX9mOSTQe883zB
 XzJX5FNtxOcwwcf+GZbM3hjOZWwWT5oH/54AG2CpO9U3FvI8zBPCbHCa4HSVFuA8yhJfG/ySyn+
 Ynx6E1NIhEKawKiYJrp5uN7GNueoACVtvc+IydVKtDq2jsGPSAYV6akpY1xJI00xgQ/ziy/mphM
 Dyz+EaAII+KrgsOF3avbHlrR//TXZjeUdOo3/iele8mBABIgcxu+wzDwoCb30V06s5BAbHA0OpV
 39i5PCiKCUYDhwb7WNM6BWv2qIMr5PIHFnIrZm/A7cbTUYcwnjPVl0JamHhYvVWzoEAC76ertni
 wfq1CZPL+hI2SAdqvdV1Z+RgCJiBLLpOiqU8iLyab13grCYHvyW58dlGby1EPG5xy1fKGD1eqFh
 jkEPeo6h
X-Proofpoint-GUID: oxc1Qu7nhzAzN6ZEMYhnf95K2oH8AqCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000



On 9/24/2025 8:48 AM, Amirreza Zarrabi wrote:
> On 9/18/2025 7:50 PM, Dan Carpenter wrote:
>> Re-order these checks to check if "i" is a valid array index before using
>> it.  This prevents a potential off by one read access.
>>
>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>  drivers/tee/qcomtee/call.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> index cc17a48d0ab7..ac134452cc9c 100644
>> --- a/drivers/tee/qcomtee/call.c
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>>  	}
>>  
>>  	/* Release any IO and OO objects not processed. */
>> -	for (; u[i].type && i < num_params; i++) {
>> +	for (; i < num_params && u[i].type; i++) {
>>  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>>  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
>>  			qcomtee_object_put(u[i].o);
> 
> This is not required, considering the sequence of clean up, this
> would never happen. `i` at least have been accessed once in the
> switch above.
> 
> Regards,
> Amir
> 
>

Also, size of u is always num_params + 1 for the ending 0.
(basically means `i < num_params` can be removed).

Anyway, it does not hurt :).

Regards,
Amir


