Return-Path: <linux-arm-msm+bounces-76669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBFBC960F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E2FE19E24FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF90A2E92C3;
	Thu,  9 Oct 2025 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+SFdL/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE972E7F02
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018009; cv=none; b=I/oz18/kKCyb40MavqXCfC+K2jUoehjxxI7Wy2Y1GshtxLf1UiJzTAiWifvyqCNBT7fd6zjGMwmOuxtqkn5YIuKpTeQyjSoTeF1qSOJZUGSh34TmqYdh9GOES3ihZz7x0crmjomJdVoVXX/w2DvElwPYXsdAEynwKDC5/YQ0wAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018009; c=relaxed/simple;
	bh=iIw1YS7FRzuqX/b7vQs43cPHzleNifKAIIPkz1lng6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHvDCvgF4yUmVzTeRbJxbxI12NDJaoYSymFG+JPHyj2Ov0cGIKaK+WiaDwNgfbrVgtHxSIcK1UBCSWVSxpAyZdT+KvJICpdKAuquA/3rvC9cwULtFETkV+ik2/PjIr46sA4VpM99PZcJdRbvFrOIel/C06c7eHctiCsukJnRDKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+SFdL/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eh9T022547
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 13:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuuZDigaf9RBnx4G6sw5Ulge8sPDtaQLp412MRxS0FM=; b=d+SFdL/T6zA9cB86
	RK8cDWqG2mNhGBSC41SFjWKXylVfHXYfSBoMwXvQC/K1bkjb1ov99JbIbPzX7v46
	YrAN0tI4F0eCR+v8XOx4/zy+bEcF5w4zD3nJgqUHA7wjdc6Rwz7SQs6ThzMDuGtq
	Gpgky+blaXEq7G+G0r89LOlwPSSynd8Hgyi2JXkrhR79PkACWA5ieqLZslgafF3+
	ieWtm0to1Big1kZQ89jQSaOFWNB0P1qGgmaWBjai+K+YZzamiFUooe4K7FJOLyOv
	80Vf2rTUQXPi4lt4RzkPIsB3F42y6bq87shRNjLgwTACdd9JG0CQrqY2AguSJGaj
	RFn/Bw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sk11s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 13:53:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2681642efd9so13253815ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018005; x=1760622805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuuZDigaf9RBnx4G6sw5Ulge8sPDtaQLp412MRxS0FM=;
        b=mVNguFFgEq3iBO5RswQw1xoXRJW6tahshXOl8VZpJu/9J1rwulwVAjm7giKK39xIM0
         JJ3E1G/oqOR9haluhOb0gjAgekR4iIPknHQ09J6eCQr2ypiY1/RgcUYxDURnYl7Vg52K
         00Wi6YCbIqmAEp2tbmYofSpdWA7EqxuK9yMHDXlXvDl9Z9f254eR5W4LMcWg/7uRCnO8
         LaXi5xlFftvO0oaDiO9fZm12ktCcr+Kr6j2AWY68GY07Oie5pmYGkMrB93YLRsdVl/NR
         Q1UDM5rTUcTj+BCclxMvcE5eLQ3MbYLM1FfOr6NOsPn9sCtfhDJgCdaq570f41Jcl+et
         tz8g==
X-Forwarded-Encrypted: i=1; AJvYcCWGYiVIK6LXzcET1Jue1yeq/dkrtAphP3q4R/noEGCs7qX/RfdZYOHgN9Qx1MdtPjZgARtNu/nXQtJx/O7v@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoEJVKQmSflVNCaoKT/jgOeK+7OLiBtH8ryav9dGhkOfkJCQs
	5oDBk13U177M9EJzGKnsae8XN11IzVBmVNzgN1k0LS/wWpOZi9HVMLnkMW8D6G6C1NtIvj1bHXR
	S+R0Uvv9YYCRW8jIEhnUqmNsIcBtLoqhgBYgpMQ4xUXjeL/06X21C8WjeTv3aX2UYB21M
X-Gm-Gg: ASbGncvuhbvZ8aem44uHCeYcaR1GSRUTCJg7LJiDLiFSpcadYb5oWSl9yq/nBdxFcyZ
	m6NO+eXvaXcKXf5m1GZNJOBnjNI86vkXm/yqIRVpE+dzAab3jiwYO3xLKLDklWF09kovP7N06bc
	iOhAmPa9JCNWpiJx629mta/izel6LZGfWhHVKV/6XnMU3egDIw/VdYllFlAyqZfYx/IAY0I389k
	LWE9eovdbcBeYUlO4o+A5pVBHdvvxwmnUYrU7kxjBoZ+BFDAgQYAdO4H/+ZHVcUg2oywoky9A7v
	9zAQM/Iobm+9z2AskoH3M06QQkfBu3J0PfCL9SpVfyngoinlnVSAzoYzLYVB60y6VwmZ7jq05kn
	NrA==
X-Received: by 2002:a17:903:3d0e:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-2902734491dmr99554605ad.33.1760018005412;
        Thu, 09 Oct 2025 06:53:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6HcauBvRWZI0Kn+0ktenPuR1vVtsIpDUIB5D3Em9yQLlvyjz3pjpSZ/KfzXun9PXoWkHbCA==
X-Received: by 2002:a17:903:3d0e:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-2902734491dmr99554055ad.33.1760018004872;
        Thu, 09 Oct 2025 06:53:24 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36116sm29906145ad.93.2025.10.09.06.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:53:24 -0700 (PDT)
Message-ID: <e9e353e5-76b4-49a1-e845-c8fb3be91a62@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 19:23:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 15/25] media: qcom: iris: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-16-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251008175052.19925-16-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AwopYNEn61Aiqy9hDaa8arpCeCcpovVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/30UzQ0HSh5/
 904C5PNk1kZ7ZAPSluS1hnEsw96dJyw2iHo4glpueG4/RslqSJ5QS62rkJrG4u3QoHNghhVpWEV
 ftELnQ0Id0410UUDhbRDVRmJlAP9wZpwNQ9e7e8ptDOjcql0d+txC092QAhrjLpZmUHzlrtppEo
 MBMUtWPkZ1xrzsPAzvzz3SqDSlVkfgzdgDuEGDXs5F41vwdMBR+eg4r4Pr5795q1l90CFUGiapD
 of6WYs0frUkqovh1RARuS9SeFcxqCAl7q4VtSIJonAlh33/dE7nbz/bIgghcEaL24khU/sodrgr
 e/ZxtVhg2JTOY8bV/fiaYEoRIX57d6dAQclZ7KnFr2ddNQFD2XpaNlZqOwFF2l4YBZq5Sr6x8p7
 5UDOhZwZAg9p+tiFUnYV9M1JxmOXZg==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7be56 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=d3DCbir4PBIb6Zx2eVkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: AwopYNEn61Aiqy9hDaa8arpCeCcpovVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/8/2025 11:20 PM, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index d670b51c5839..1e9ffdbb6e18 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -191,8 +191,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>  	u32 codec_align;
>  
>  	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>  
>  	if (vb2_is_busy(q))
>  		return -EBUSY;

The same change would be required for iris_venc.c as well which is part of
linux-next[1]

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/platform/qcom/iris/iris_venc.c#n271

Thanks,
Dikshita




