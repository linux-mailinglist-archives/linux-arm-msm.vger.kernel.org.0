Return-Path: <linux-arm-msm+bounces-84859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EDCB1B1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 03:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF4603038F66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FDC7E105;
	Wed, 10 Dec 2025 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYVv8sqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhgud5Ys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE37EEBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765332713; cv=none; b=X/urV24ShPfVp/itivcpbiHtLH000P+zV1AgUYqaEpA6EOwWMs4gPeRZ+ynTg/ofYj/3wsdxh/o4k8eOVnu5miq3jT/EO41GFXMoK+Q3102IC6eQPiwpvVPMqtRDe0RqAMvb3eL+sS/PoKk4PfNc0cwFpGBsrFUXQ04BSxE8Q28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765332713; c=relaxed/simple;
	bh=xnH/dYr6Tbcz5LyRL8zwdXYLOF1pAKGeDZXraGcxNOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uap8TsgtRsT9EiMZVbNntKSDhO90GwZuHIMVCL5pxdDc2j4D4eeZ2M3jZ6VC9rQpG5xYM88BL9ooxPQ/wdz59gKqEomcVjJPEOrsKdk+15Z3T1JsgLihHZ7ndB/iRFeyPfMVkUBp5Hx6dhajEVgiXeYva3Cvw8AeM3feuxU1JlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYVv8sqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhgud5Ys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0O9jJ1722105
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 02:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPbqbtc7HcYJPrik81jdvnPoUbNPmJIJ/+tZEL/7JcU=; b=YYVv8sqE9Xs5AcEq
	Qk163CgGQWGEM6fhbsXe+TSe8GBJImGlDFT32xL18bEE5bab8XWUmsjBAT3sZUTu
	EPcbyrMi+wO/Jl/Rgpu1O+juIfhfw1/IoDJBRn5REgBGzeOsmi/6P4Q9YBl3Plv+
	L9mjZriao9cTOBftIC6oE/YM8U+oRONGRStcEeiX4cuAwfRoeE1qmIApE9Qx7pLD
	wExfVBZYXTIWrMCq1hDEAjXoDk+KW4DE2eCuJPE7UQw6VFxU34RI7uTG7hPPCQmy
	Hl0JeHs01tO8f47dZK7Deh/lsmEafDUoA9uPSnAl1H0MzO6165+5FGIVeE79kXgW
	RzLDSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu59jb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 02:11:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299d221b749so118935015ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 18:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765332709; x=1765937509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPbqbtc7HcYJPrik81jdvnPoUbNPmJIJ/+tZEL/7JcU=;
        b=Zhgud5YsSrZ+z4NaLSvKJ1n3jGRva5r1Wfx4y6DNqGCm3X3SmPd1eaPwb6jwDNeBUj
         gUKkYWo0XnYnx7KO6Q7FBqnbYXmS4pHbYDtkrvDkpxBHsHe3er8D/7asJ/rvuIlGnKR8
         lNtwsXe60ncz4s0z7bTHkgk9DP8z3qAbZ1aL8OzOr1EBNNC3HQARbSlT10nQr4mjWCqo
         tD9ry/4kwLRTrHDOJyV3y3K2N2opwD80mlaIueZp8l8Y1q2qK2p96Xk57fa61fHEntdI
         M8n25oT7UVu8VfIDha8kX+sZ3y9BOFMGCt+sIdhB14lCP/crFRUC5DY51WIpmDrWuF4J
         dE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765332709; x=1765937509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPbqbtc7HcYJPrik81jdvnPoUbNPmJIJ/+tZEL/7JcU=;
        b=tVb5QZLbjk6cyrE1X3chs3PXMnxpA870bn2ssR5eVYD+E2zujC8CCe28pmf1odxGbr
         RArpHuipf0SU/OC+segimCy3bvCOdRV/6Q6B3Z+p26omEKCFDccCb4wEo9O0UbYIzE5A
         0V+X4bZSlG4ffBLCw7mH0ywvfdeVlrDZFWKT825hzooyBlO3iPT+hGTZF46uj2JZF8S3
         5N9E7WbPnzY+Kglp8quqgD5ScDEol2ue47VBsfDw3AJY11JiWpXUtlVtWeed9gqsfd8f
         LiWW2PFOCGH6iw9YJ2c8hhqAYRhhS23eEAo+19k6tOXEJLrm8jGZdXPGWNmqqoVpiAcH
         +pdw==
X-Forwarded-Encrypted: i=1; AJvYcCUHxnQ13o4UQKvXk4J/1UWOqkKMQ0UW+nWO8vtPoK9JQTDNQgBo373fL0BW20JqFKVo2GRGqmmh9elQbW3W@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjqv2qV8ywhz+wwLzu9rcUojf/lOtzLQgrWdF9DuJuWG2o+Tmn
	so11lVUDuk9NS0z6XDnz6laWF+VlwESwzdzBAdecwjJjXQQVMIMUGBVs6R3nC7fYUx7JU8aBmKA
	ZYSbJnqp1nJ8YqnG+8mUp22GMaLTI4/GZCYvbKwFdKUXYUHsFZ6o+z6a6STYemKo9JxrIdxV67b
	AN
X-Gm-Gg: AY/fxX7LVowGq3W7iVxHgkNccXR9bNPFXGjrR/1ChijvtctQ2o0BOalNbvjDR3QHSYt
	wEB1M0jffo0Dgll5f/wIFj0ffCToGmVfvnQBbdPr1NR6dn7jVsAdfphiuzzhZq5ovwyObBjhu21
	onknNzxVDEiV4VrsLTecji3e00XKPgW62ohTbivwbNXlGV78Rk+k00LIlb0wfzUGczHJ/Cd6yO0
	/hLxkabALHPj1yRhVVHwc504EMbelUefQDjxY87mlIfwDM0LEmkLgBtJRvVGlwObZwGiUAy43kh
	BSligIl6HXbzTQUGw8isFwH9SLv45KW6XzW+C/cRJzOmXmQfBWVr6K57vIvNKcdJqY/uJSRegNa
	5cT/+xhE4u+qT/L9/1y57QwPGsEZe/rFkOLNIrM/rArZRoTj8BvJTmZ6bluORm1WlOeRKVmcV8m
	IXlJICCQ==
X-Received: by 2002:a17:903:2311:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-29ec25a7010mr7459025ad.38.1765332709205;
        Tue, 09 Dec 2025 18:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXspY0nDKRpyjv6slIy3q0/KUNCNs3aIMdRf45UIyhjR+Tt32D1VTq2WRYPh0TFXFVXlD6hA==
X-Received: by 2002:a17:903:2311:b0:295:9cb5:ae07 with SMTP id d9443c01a7336-29ec25a7010mr7458745ad.38.1765332708664;
        Tue, 09 Dec 2025 18:11:48 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm168140965ad.58.2025.12.09.18.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 18:11:48 -0800 (PST)
Message-ID: <f5aaa9e3-a709-421a-917a-34b25c58fae7@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:11:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: vdec: fix error state assignment for
 zero bytesused
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com>
 <bqu2hcyy6nbjlzcrowcq4i4bwdycfidgl5l4ocbr4rcanhsi3l@lsyb6h3sn55b>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <bqu2hcyy6nbjlzcrowcq4i4bwdycfidgl5l4ocbr4rcanhsi3l@lsyb6h3sn55b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I8TKTDotAcECPfaQb9WZ67giQQFge6nw
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938d6e6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l48zq0wRcjR2jSCBNtYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: I8TKTDotAcECPfaQb9WZ67giQQFge6nw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAxNyBTYWx0ZWRfXwT0R7oERD9v4
 B1ZkO9UDAObOSRaK1uqeGXlP/4o5GnbIODSIaAF2wEH0XPAhFBCB48LSOXOAnxX3Zh7tZbYfgM4
 domtjo90HkIVHlWHgoMcScdgVaYdIBhdGVHjeF5ovw8JI1oOExYO6zkgZlTb9WNKYzZzYv9VSba
 fWuclXVviVlWNTgVYNPBPpIEdnsMxkR106swTbDOXZejr9Db4HOFBemlPbaQ6Jf1mzWpf2qZ2Bi
 D0UqB/A7ISg7R8l7oDFHIINmymSAXOhNVdHm6y4omufIz4YSgwZge0CQAJGEnyIRZwME+/qOrTi
 5NuTg3YjEuf6SnyHRup2iVagPfcs53LN1XHcBraw4zPyis8ZEMgSb3tK2b7jXExH8v/GKjpqi/m
 55Mdl3aj/5CvoWwQLNErP4qzqhr6JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100017


On 12/10/2025 7:11 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 09:03:42AM +0530, Renjiang Han wrote:
>> When hfi_session_flush is issued, all queued buffers are returned to
>> the V4L2 driver. Some of these buffers are not processed and have
>> bytesused = 0. Currently, the driver marks such buffers as error even
>> during drain operations, which can incorrectly flag EOS buffers.
>>
>> This patch moves the zero-bytesused check inside the non-EOS branch
> Documentation/process/submitting-patches.rst, "This patch".
OK, thanks for your reminder. I will update it.
>
>> so that only capture buffers with zero payload (and not EOS) are
>> marked with VB2_BUF_STATE_ERROR.
>>
>> Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
>>
>> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> No empty lines between tags.
OK, thanks for your comment. I will update it.
>
>> ---
>> This patch refines the error state assignment logic in the Venus vdec
>> driver for Qualcomm platforms. Specifically, it ensures that the buffer
>> state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
>> with zero bytesused, preventing false error reporting during drain
>> operations.
>> ---
>> Changes in v2:
>> - 1. Update commit message.
>> - 2. Add a Fixes tag.
>> - Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
>> ---
>>   drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>>   				inst->drain_active = false;
>>   				inst->codec_state = VENUS_DEC_STATE_STOPPED;
>>   			}
>> +		} else {
>> +			if (!bytesused)
>> +				state = VB2_BUF_STATE_ERROR;
>>   		}
>> -
>> -		if (!bytesused)
>> -			state = VB2_BUF_STATE_ERROR;
>>   	} else {
>>   		vbuf->sequence = inst->sequence_out++;
>>   	}
>>
>> ---
>> base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
>> change-id: 20251126-fix-error-state-24183a8538cd
>>
>> Best regards,
>> -- 
>> Renjiang Han <renjiang.han@oss.qualcomm.com>
>>
-- 
Best regards,
Renjiang Han


