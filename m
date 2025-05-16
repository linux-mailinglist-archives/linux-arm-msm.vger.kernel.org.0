Return-Path: <linux-arm-msm+bounces-58159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FBAB934E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 02:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6D2189DC10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 00:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54C28F5E;
	Fri, 16 May 2025 00:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoarfBbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8D44B1E50
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 00:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356494; cv=none; b=lzr5T8NRw4ae5NXpwE6DGxCom80jIdiF4FsivILC5bVF536dmw4xG+qD//IfU/z+Y90Cnx8MgF2O2pyTIZ44KIYK5JPu2jszXXq5NGPNXxlB0qBoFReiwK4rtVD3sA44v2MH9FJCF3iStK7ybqoJNT98UPzCsZ00PWI87cC4Www=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356494; c=relaxed/simple;
	bh=3wIUKWTrTNwPNjT23Pty+AAKX8fHLi6iY8Q9CEOL+O0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F455Hw1Mq30zCg/cl/v3e5jyBMq7yKRx8XLIfzKAmTRosSZOfKanrHwJ3NXuRRYCLpCcXzr+1e7a7bwwv2jFW9eXIGTP9Mdv7bVmDUSoA6CVyOUj5W6Ky+QtjBmOt5U6zVTM+H9rkaO2VvdRU8AhjG+CZt8jSZz0D9mvFy1q12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoarfBbP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEOA009131
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 00:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJwe0WaTATjPuDQBRpYRk46bCtNvD5nI4hYmgIuJ90M=; b=aoarfBbPpBtN8svj
	4epA/14KwUKec8F93WrbzmB9VNHXsMWyZyJYJvAmjmWE3C3cFDvoIxX130g9bC3K
	5hIgnTbhZns/4STZmAD7SGzUN0uYGUIuRu3vlL/CVK7Y7p9V7Op8a7xtBH67lWVf
	GvESWPew7YPB3PloZSVZ75GUIqxUEPtJz9O/Vza6n6QM4n5kvhD52o9jPAiACobW
	t2NAcmjCMT8TQOZnIh4sc3lfdmtDtT2WcLcCrsz9pHnjVRvHstHzNhD0g6nK/BAP
	07ELv9TW6ZGz03+tVwYEiiLPxAYGrzJudZYeMPUgJwnAXUoBCiQ69EOm0yO9WRel
	YgVZvw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex83y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 00:48:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e4fe0c08so554805a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747356491; x=1747961291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJwe0WaTATjPuDQBRpYRk46bCtNvD5nI4hYmgIuJ90M=;
        b=JLiIlRNBVEzIOZDL7YhrIGhxggDUxgZU7rhodgkMALICxe8bWttEJZrQWces6lIE2m
         kjSSVZnj3yz8afLi6PnhC2MBTTPm8XZMKSbl4KsRJtfuBEPFt2MYX5n781kJO1q9YUhn
         UBJ7Q8hfmWiogd71VTKUuMW0J0+oQ5mwLCKEWSJo1kwzdm2Rqv61NIpdUvxge0m+htXX
         Nor01iZybAy3DtQzBOCx+XW5OfMtZQ9X5ap4w7/JijgDP6gRhkDtVJacLGcKgDO6HK6u
         LsLL2dn3RSF7oVT9K8Ya0/CDiOlO5hQxgEx6Iq+O8/redKaGjMGNkzHYSgXRWg2bIxqn
         PxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwreRKlmslyBoOL78tv4w1iAPwQITee4itduhALpgSWxThkXoj09AXvhKtMddyWoWYgcAfg1UTqL0G1Qns@vger.kernel.org
X-Gm-Message-State: AOJu0Yxohouv3PgQFGFTBQleqEQYxxcVzUzFQgVuogtjfPpYQT3gfB+4
	VHqLT1FhmpUnEMWiW+oT1E5IA0PXxKv87m0LbXRdWS2V7Vinu/bkfYDDDTep4DYgCVbhR1uQIUN
	S+8XwniXN++iEnqDumxufZc5rjWtK58TfddpHTHbOzKA5FcJD0gdVsgW5jE3j+HwInjXD
X-Gm-Gg: ASbGncuZoaCJA9eVSmmiDpkTPxHt3s29ZTr94Fnc+edUAZRAXf3BW+dtEByhGjh/Ki7
	YdRxbllSV1LGZYiNzQsttNZ6UeSlqGNu1yHzwE9bSvQD6E5JG+fA54LUyurKWvnsf+1HUUzuEx6
	sUclVV3PgS1+YmSop6nCRR/X+uURfiPHUsLMr55rbytZ2KCq+fMF0E+gicb2iom4VCxQH1YHI57
	3wCv4oYRp23Pe5bJIgLIDwBVHO0BNZyLx1mH9w3xjjG+Ck14UAtBrF00kL09Syw9zL+2E3o6uy4
	X419UCjISGbuB8h4B34TNhDsyJ+QLHeeEakiGWOQaNaumTzfa1ZAZVQVKIVhRL557YSC/w==
X-Received: by 2002:a05:6a20:9143:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-216219f8d84mr2191395637.36.1747356491306;
        Thu, 15 May 2025 17:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElOJZvNSsuOCJC5gbWoMAaCBBEQUY+Qd1QGBRr8weuXx6OAJxIlMvUCJtTtrI6xCzlhuO7Gg==
X-Received: by 2002:a05:6a20:9143:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-216219f8d84mr2191369637.36.1747356490958;
        Thu, 15 May 2025 17:48:10 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9877056sm420384b3a.143.2025.05.15.17.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 17:48:10 -0700 (PDT)
Message-ID: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:48:09 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwNSBTYWx0ZWRfX1gHYpcyLM48Z
 /xmKSQo6kiVjBwEM8/97U4r8Zl5UU8Mu0mgDyqXUEIVL1Apl3PqsYNfUS+IZ2cQ/vXoR5ar8OHk
 6yDXjgzEQYNcvSEmrFDdNyDeuZA5BXp2nK1bqjsR8qPKLOzxqV43/U8hTp8+8dE13ppZsxz8Em4
 Y+VGCnbiZG/l3HgDXEqMkhL1A/ycPFTwMXTz1zMnk2NYtPoXsWctcb6AGhUtxjfVQdAdSJ4VeQr
 qmACU9gC8xCth+FC8odVIQcEqGUIgJeP2jWbDPbanrytvWPR2mx0TcequcMXGFTJWtssnS+O940
 /NO2GQBp+Fd0uUmzv5ciC0+e1XrJKIrZsaasWyzDhRSTNQFV0RlMFkzQEaEYeS0Bv74TZ19FTrx
 TIzjFjD0lBziYigph+meyzMBFIXiziqVnwuyhneTxtQlJFbKi2w30R394T5El4IMn/XFkPit
X-Proofpoint-ORIG-GUID: nBORggu8UtL99fnJS3-R7Owd-k67QemR
X-Proofpoint-GUID: nBORggu8UtL99fnJS3-R7Owd-k67QemR
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68268b4c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TtJqN5EYLmW1Dglx0zoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160005



On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> On Thu, 15 May 2025 at 02:52, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> Since the max mixer width is not a strict hardware limit, use the actual
> 
> Is it? What is the actual max width that the mixer can support?

Hi Dmitry,

By hardware limit, I mean restrictions based on the size of buffers 
within the hardware block itself.

PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a 
max supported width based on the size of their hardware buffers. On the 
other hand, LM doesn't so it isn't necessarily restricted by a max width.

I can clarify this in the commit message and cover letter.

Thanks,

Jessica Zhang

> 
>> hardware limit (the writeback maxlinewidth) to filter modes.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> index 8ff496082902..0a198896f656 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>>          struct msm_drm_private *priv = dev->dev_private;
>>          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>
>> -       /*
>> -        * We should ideally be limiting the modes only to the maxlinewidth but
>> -        * on some chipsets this will allow even 4k modes to be added which will
>> -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
>> -        * and source split support added lets limit the modes based on max_mixer_width
>> -        * as 4K modes can then be supported.
>> -        */
>> -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
>> +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
>>                          dev->mode_config.max_height);
>>   }
>>
>>
>> --
>> 2.49.0
>>


