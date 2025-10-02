Return-Path: <linux-arm-msm+bounces-75856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6CBB58BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 00:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B403E483516
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 22:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C50283680;
	Thu,  2 Oct 2025 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6GN9X5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A816132F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 22:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444380; cv=none; b=sLaXa1WpB1m7wkUyXoeqrAQ+a4efqImJNkVBbYN0DUIFyx0AvfH7gTAQ5tTVo0yI07fDKPgE5SYU+Zoh9Pt91kSV/pHwxlryomygcjPE+4cWnHsQSUffnbU4Pi3MM94J+AGr9LP/MvyclgrIuKI3C5dJNPABn1IRVSD9Ezhq4Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444380; c=relaxed/simple;
	bh=qGBvGVUOR2k1VrExAC7p734oLxaKwcZqmNkNFkXFeTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9+3OaFbs9DLxjThZCYv74mdR/tfnkD2jpA/DrCiEbD5SirXdsoiN8toBzcOagNcnGLJGuRnt+HQbmB4t/MEeDXOz8aeKInmzkhknq6sH6YUMGVHw+Ezd3lVyKi56z5KGvw3bIuKZfEFfmvxRXrZqw3MAVXxFGQmxvniQgQm7Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6GN9X5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929FbSp031243
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 22:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FpwK6wbpl1nHk+Rk54AADbhqSQ/2kNSwRaAd3k0SSc4=; b=g6GN9X5E+IsJIiUT
	c3GcgC/AxotYGLwrKIZYP/4wdgzr2atBF4oD5A9TTnRqNSiKdjVC003noX/XXP7I
	W2mOfIAxHn25XRRLM00aNyYC+EswzahZVc1nMDn2xmVO00SgGvnDb9H6a+5Gh3cl
	UIAznHf0Bib0xFuiy37rsWZ/jSVXz6PB5u6C7vz2fR1POplJ3qB2UQFzdXMXCDqx
	PHECk2c17/tWPTZFi2iqy5LrA7eI58kF5ZBEHDfBG29tSlJTVwTxQWTov7edkvIj
	XkxDuNQ7nvNs7Bni1SQu4Gtklb6ymKoHuzm1sbGmf+N8KrOyjc6CTob2vxCK+A+O
	lmvoDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr95yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 22:32:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3306bae2119so617507a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 15:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444376; x=1760049176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpwK6wbpl1nHk+Rk54AADbhqSQ/2kNSwRaAd3k0SSc4=;
        b=vEljJ2hTZIinC6LLe+405537qirVc2UujLTViu6Ac7k41sFu+Y6kwngGTE5jXxiJvW
         HD51/l2PKbECpU5N1vRyuGraZXR4fUI4TNC/2cZvB1+/wfEzQEbtrEwY3p7CRVqM/NpN
         ffO3zell4PyGyhFFKuQH0BAwybVm8Cherb7R+wX6N4x3d1jNb8f2fQMA+oCtLsHnHOtV
         A4TiEjwHNM8ZP6zZuRe/WDah1REjd2Nzyzdpkpe4GdW+nIzHP4QyUcy0C+4RKMuJoONh
         LAj8UKf6oVJxNZUYQXK92V3SaLRvPUgfEudYNJ9KtNRtdI5QXhNOpBuRMjGLgaNuBV6X
         6TEw==
X-Forwarded-Encrypted: i=1; AJvYcCWG2z22NQxxnign0PdAB2vVfH6Duz4yfO0tKyOwUb9wprfGBc+RT2e1Gmz/cfEyresfJTnAFyQf3u3GsLI3@vger.kernel.org
X-Gm-Message-State: AOJu0YyF46o1wKNFe+ZfeZA8AkAB398ufvKnjeRAtIHxsijO7HWYDFVv
	j61KEUADz3d7x4XXR1pQKCQVM5xsQbMzrusNaTACfQnziSFEBnTWVJum9GjPEfz/elZ5T9qpKv5
	BwMDXViZl0ppeq/Vh+/LPPZUNA2xWdpKqQ+qQF45Jg4mXugro6jhXDkAgF6Td+440FZ3q
X-Gm-Gg: ASbGncvr/K/A3PYpXSPbXUUl6rgh2oHqSSOtFrlqSQDCqFcjVa3oE6pZKX55UL7VdY+
	1mFyq6qcoXE7N890EyhHI9YVfXK5xGA1IUvQKtoJXM4Y77wPCTkq4BEbtoan4e7+y/0rYiueZOX
	iwEMT2EsrFhC4D3zLnEOsN5CrKZWOC/nGR5gYl24065RhzagskQ7va4SyEP4mYanZuIsU6eav56
	Rdt72ZzrkRL3COmxX20rtkVmRF5oLvCK+mOg99B6a2ttcmSKBdkHx91fRfGG5TncxOr01ahNCfM
	xfEqPdlXqBKRPYi1d3FyHjwhQdYTLv5iKWhh1yKMYcNfBG/Xq6aRAD3UWKW6dlyqZPZZh+aBxqR
	SSU8w00n23y0Jq6nrgzHrdg4JPm9WIhDV
X-Received: by 2002:a17:90b:1b07:b0:335:2eee:19d7 with SMTP id 98e67ed59e1d1-339c27f147cmr548593a91.5.1759444376142;
        Thu, 02 Oct 2025 15:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv7Ezyd2UUjO1KmLcKNimDDT7YbIHUc7nq44OqeXFnjgQivLtCpsrlpOrl4tDqUhXI5zl9oQ==
X-Received: by 2002:a17:90b:1b07:b0:335:2eee:19d7 with SMTP id 98e67ed59e1d1-339c27f147cmr548575a91.5.1759444375693;
        Thu, 02 Oct 2025 15:32:55 -0700 (PDT)
Received: from [10.71.110.242] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399cdef492sm4222624a91.4.2025.10.02.15.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 15:32:55 -0700 (PDT)
Message-ID: <ad9c79bd-b3ea-4dac-96c5-f264eaf91dcc@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 15:32:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1 in
 v4l_fill_fmtdesc()
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
 <20251001-av1_irisdecoder-v1-2-9fb08f3b96a0@oss.qualcomm.com>
 <544147436308901fba85d6de48380c0c1eea7c67.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <544147436308901fba85d6de48380c0c1eea7c67.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tqhc5zn9cMDi1lFUqlYabvGGQCOBGMpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXzyuQ/XEHhq2E
 nDu5hXcw9PVrMcNmWPfI0wL5dSJPRQv1+i3qOC/AdvoKf3cYXV5YhsL6ilF5I+4/nrjeVu6LWwH
 dAP56Md9a48q29yaoh2stXq+RSkzvjiK28ZfLOSjvIKzR/Q+UvF+Q13tmqcHhMPi+OLOBn8uEpI
 WTEKXYPIIBseZEqdKES6PiBu8dl4rlp++9gbBcA2Lk7bz4/toezVyG74AnMxLE/GhzHY36yI/Nv
 DCa/6dz3HzF2ORff4sdSJzaxiVz3+86MeoquThWl6Ap/ih5IQZKHy3lsEWly4hHxJMiibLbaFUt
 XD4CKfNX2xfolMlv73q0XX3DKI3fxvBMveuVNWnt3hYXexneXNXB3/ujC7NWNLBrL83IZ/xUjIT
 9DPBTQqF3OWALTUZmHP7ZVhBUqtt8A==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68defd99 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=fpfRSM_o4ZOcEIIQWIgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Tqhc5zn9cMDi1lFUqlYabvGGQCOBGMpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017


On 10/2/2025 12:43 PM, Nicolas Dufresne wrote:
> Le mercredi 01 octobre 2025 à 12:00 -0700, Deepa Guthyappa Madivalara a écrit :
>> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
>> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
>> core/v4l2-ioctl.c
>> index
>> 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..d3ee7736b74b0f277d3208782e3ac3282eca
>> 1e6b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-
>> bit Format"; break;
>>   		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed
>> JPEG"; break;
>>   		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
>> +		case V4L2_PIX_FMT_AV1:		descr = "AV1"; break;
> Perhaps "AV1 OBU stream", so its clear its no Annex B ?

Sure, makes it more clear. I will update this as well in the next patch.

Regards,
deepa

>>   		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile
>> Mode"; break;
>>   		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit
>> Raster Mode"; break;
>>   		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed
>> Format"; break;

