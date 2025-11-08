Return-Path: <linux-arm-msm+bounces-80825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99149C426C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 05:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B5164E0356
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 04:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F247283FC8;
	Sat,  8 Nov 2025 04:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guTEOfAc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV5y/qqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D62C21F3
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 04:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762575966; cv=none; b=AVIbv3uNr8hdqF8Ch3wMy9yg/u43wmunIVMumeny9W7ywIw6+giV4UnJgsGVlQc1e6htFtYBpGpVu14COL+tEBioiI+L6pThOq2MLLODD+CbhDKlwgA3vNsMAsOMimpfPZUw375Qx13FFdOPxy2JNxvoBfa+HBAtxXPKDeXnE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762575966; c=relaxed/simple;
	bh=fBX/EJs5joZGPJFdETzjuI1Y7qiWu9nuWEX9gT1W8A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0px5xV840esoCpJ1pEZ7dEZRV21Kfi5EPJyzbx0bw49EfsiHWoHH+jrSNpFwLQl6H5DTW0XVIf1c0mRyMUJ2sHwREhrsWgWfserpv7bm6zjWs0YxVfV+JUR2YrDk+OIOb4eGBIWTSrCJRrWTXBQXohLGOv/MHODD0c1f0rh77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guTEOfAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV5y/qqQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A82g2XS913235
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 04:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4eafeo/cDkStxOwKYqMpoULM2ZZTyXtqjZbO2Myv4U=; b=guTEOfAc+WGT7RKb
	9qsp3dfp9rSCJDAu+CrWx3CLWeUG/Atj+WQzwU+2Wj4mbLbWi4OmUX5NegGgjONt
	bsFGQ9jU+x85FcWdBmdCZwE4VJr9itubCESbWW4o5pxuX3ZSy2nFyjrQPhJ6sTvb
	5Opj1soKnJTsJvl77OGfl/Ei31Syyck9LGFRy6OrZIgZqXwhwa3zUv/Didwss6qB
	YdoIRRmFLTlivSSw3MdX+cJHea9ElN4jpUHUnDo2AJa/QKRw/99EwcW4BdaF/9BP
	aTT06NmtL9mexXRDcrpPaGiq/bQrCp/GQiPo28eGuu9/5mdckbM1hnKOZaWR+0Wj
	p4NCvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9vv585ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 04:26:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e89544d7so718685ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 20:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762575962; x=1763180762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4eafeo/cDkStxOwKYqMpoULM2ZZTyXtqjZbO2Myv4U=;
        b=kV5y/qqQhHKdSTSMKPApZp6y6FZO4D226ZxUYqIrem0it99nmT0V0HQKim3dlexRJv
         xI+kiESOt0WJY25jWzDakugQwLEk0esHUf6pE2XvNmPZhO8LDD20IrmeWQrjO4JpEj03
         uefocWn0z07BzxjD/rgqlZeLBJf5/gZM6s/MzTXL3EXa9MoPLpl8KG6Hkd+jnJ88FPFJ
         OwZkfrlqDY3VNq/5a+HtEewVk4rqgp3CH+kHPeFqW9aoJ01aiGh8yI/MCWmJXC8dpw9w
         In9Ne18rF7juywjLSaZdjzSwBEWW0FmKMCHR1n+9iig/7snVN3RE7yXXmOn08A4+mnOb
         quWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762575962; x=1763180762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4eafeo/cDkStxOwKYqMpoULM2ZZTyXtqjZbO2Myv4U=;
        b=bRPRxDzIrLRREs5CXunh44gM5j2OtLvsESzrOLOWfyKZVRG9qdv2H/1GItJYPGKhsl
         CiD6PlEB9qo+9ShIftvdjl4u3cyMP+Nwamf+1/1AhyGG1mG13XXvu+pyGMdpAJSqRx4u
         b166e36NOXf4Xr48PTBR7yc9CCnrstm8zLLdjAxqWhR3qys8v7ObHwCLqOWPetH5EBEg
         5vhpdE3sL20ojVj/zDs5JnHJuRKQDTDEw/xmmdXLdb+6c5Ry6vGR7jF+pxnIX8SoF1Kq
         C4BTiDvYevxIT5pN3X1RgWWGKkQyBO/F1nQlEwnwUgQgXf9uFHLYzkPSgFjNSs9Z5ees
         idkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbsSVquFrvIvgDYTBCYzXDlwoGXDuxKghryZFY9Hc6qDYo2Ka3z6cIk1fRCQVobgyix5SAAzLE2QUHGqAD@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBwPSsbipDrgo4kYl7fbZQVpst7hYEPRglLlP4xHu8Vml/jic
	S4vA4lWHUfMOg/e3IV4fDUDLHh1C4BkHOmllWEE0zWO0kz89r8BjSlfYIKG+3XpQkipocAQ3jH3
	TjpFCyWdoAZ/wf4vuyHp6RFk10CYQpT4bzMIwSug/bBlZljGAs2TK7No96mPKlmvXPrYu
X-Gm-Gg: ASbGncvw0TwfxX69VG714/282jHAR2VKQkrDr5JbeuA5uiE9HJ7MSqnSYdAHcZ1o0J/
	q0wEss2JXwZuw9PoAAZ/b5wvJ7LvsCdTqBItVX8LAx5I8ge9sf0MJRWF7V633rQKyyu1DOJcKY9
	DFjmUgPyHy+bSj/Z0QCONUmBJV9la4ElAEO1MVuHHCiJJR7OUWmgsLdPNK248aDyOUV+rFT3fDN
	e6plEtRnZRHbvDYSj+piil47ttyBZM/vcMuhpZGofBbgLXcrZLDuZUVIR6JQGgovb+MPlLfwxNd
	4WktY3fnH/44gXZ7A4kgNhEsdPrCiTMrpFbOy3tTo+/7MUGbhdpk/exc3WlqR9CSafuD4SmwIX2
	YA6IqBIgDTFKR5jbYYH7/QTkgHIUKyHUftNYtDwcDhK1FvM9IbJlDxbFlYnteSg==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr9501535ad.7.1762575962479;
        Fri, 07 Nov 2025 20:26:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZCYViCjmme+RoZrjnoSFrEcEMevTTK+inj7z0qoPap9TRFowi1pucgYzEx3c9t+JNgJBGbw==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr9501475ad.7.1762575962004;
        Fri, 07 Nov 2025 20:26:02 -0800 (PST)
Received: from [10.110.21.199] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509683easm75314795ad.15.2025.11.07.20.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 20:26:01 -0800 (PST)
Message-ID: <6b46213f-63a9-4553-b128-e90cc992599a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 20:25:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
 <20251103-av1d_stateful_v3-v4-2-33cc1eaa83f2@oss.qualcomm.com>
 <43938312-ae0a-4a29-9fab-9cb3920b8335@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <43938312-ae0a-4a29-9fab-9cb3920b8335@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FlGbPgwD9GxoRy8M3Ub__aebnRceh_ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAzMyBTYWx0ZWRfX5Ftm5+qdnbn+
 b2gZ/1mHTSEJ0VJah4LKGfZnvmh9tsp07vyFs0bCdXTSRKZC+B/v496CU52gdy5IqocyuRWJ6dM
 xFdc7vHasxbG7f4l7zdhcre9ZE7U/Iw4iPmJ3Fwcpg0DS7f9qFHH/KLZ1wagmg869wZDzpalCJe
 pMWgmHppppI18Y6vHi8hjyIku44u7QsGiTz0854bUUA/ofwgIg4CIg4JWJsCDP8zbEwyOIjePPs
 ZhKG2XpBSIKJYXsFL9uybxQ+IpYb6+zYvw5/a8Hp2mQQZGwY69T0iw1pE2jyDygAkMW6ciIrhwL
 dcsPAqA5874jYJoq/2Uco7XO/tlM5pjlqLXw7URvWY4TiFryoKNsETaymqXoxvf5xr2Q2EWEul/
 iVpsOJw4QeZguUdqP3c5M7HJ5ZyWWg==
X-Proofpoint-ORIG-GUID: FlGbPgwD9GxoRy8M3Ub__aebnRceh_ng
X-Authority-Analysis: v=2.4 cv=PZnyRyhd c=1 sm=1 tr=0 ts=690ec65b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=SCSBcTUyTCozYamH7nIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080033


On 11/7/2025 1:25 AM, Hans Verkuil wrote:
> On 03/11/2025 14:24, Deepa Guthyappa Madivalara wrote:
>> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
>> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>>   		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>>   		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
>> +		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
> stream -> Stream
>
> Regards,
>
> 	Hans
updated in v4
>>   		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>>   		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>>   		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
>>

