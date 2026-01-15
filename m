Return-Path: <linux-arm-msm+bounces-89088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B53D21E6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 01:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C0B8300C9AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 00:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F751E5714;
	Thu, 15 Jan 2026 00:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4G4IRrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXGha1kI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250261D61A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438300; cv=none; b=G8jtI6CgAKdm4qXToNO7yIibk8nsCEDJAChngV3QPLuKb4pLudYo+WQTGwkdDpxQ0r0IUz91CEiCPwNAzIZX4VG0pELIrBQ9nabOlJ/1zVcjHI6EgdjZ2MOe52MBGo+wsLjHSAJRW8YK4N6KwkUlDjJghwaF6lcmUiwP7y4XLVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438300; c=relaxed/simple;
	bh=tdavTPbGpOyoV5PY/t3L4yLl1qvW4Cih3sS13k9Y0t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJRDM2/ZHitWEfDoOiE+jnwizai2OI54J5DM5AwflNrHQRuYQ945pN0py1VB5PHdT9+kNZLdbTLJ/EIqlirLeOJcnU8sHozjPYXr5tp6hB2/1B85oJG7+szlyI4QZczg2yIyDxux3Zb3BiVW2CkQDBbUy5IWiv0FJqceYbM2Dg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4G4IRrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXGha1kI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EMe2CK1001233
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxQq/pwXprxuVXwGkak/rWDrhplBBLx+dD+T6FfFFzw=; b=h4G4IRrxnTlRoZPV
	JaVH85XmwxnmlM/ixxLwK2SqvW8umtQ/tm05ooV4ND7w0LRGSO4BEbXzFMFlIUa/
	FssS7TSNwRmUxXgeNYjKwYOYskReSbFDH5oecp0GfGQzNu5dFIfWp+L1gGxk98BI
	+ALSkqgjCfEIjA5mEt1Zc8O1WpBPiWoGh3qmzvL1oxSFTw7LbxGFM3QEQV7RsbJk
	SO29lRKFj3CQoQoIIYr5HUrc73guNaF9iUhnSJJll2G+FFFfq2nSuH1LT4B3FzlI
	PXXRFnFByikc0JaUUfvSpc7CW4g8yB5F+yXzlapfwF7M1W9CaysjWeH880502l46
	wsUkAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbt532-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:51:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b1fb72541fso78498eec.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768438297; x=1769043097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxQq/pwXprxuVXwGkak/rWDrhplBBLx+dD+T6FfFFzw=;
        b=cXGha1kIv7ZkrC+yI9+BgohnNHfN99N1SLgIPLgEdMfq6Oz26Q82S2VCXRHXDUGyGw
         tIblVbW6p6PB/My34USBxA6kpjYyoCvyWpr3idyogflKmBqFLg/Ol4MnaoipkYAm1tSB
         /GZH0Nmd9S63NRQ0lUs+59V6wyqXIJT5c0HjJn4zurtJPKMhER6ZLSS8R67lcfFqfo/I
         wI+P6pIyjw0Fuu476cNxi6tXHm8DxWw0eVunPbMx+0m6wEXkrbF7p7TIZhaebSv1TtE2
         rPRKbXNcmJmW9xdDlMxLPYibXIhxjHh33APbU3D/tbQ1j/w+hji/jP5zcN6sBXf1XWY2
         kRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768438297; x=1769043097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxQq/pwXprxuVXwGkak/rWDrhplBBLx+dD+T6FfFFzw=;
        b=KZR1wyc49ZhRV+bZKSOkbjeWp9NtyNy1aMIITaoNymwYGrilDUf7r6NKIR7FOuIG7Z
         ngRSCKDFxjELXDi+lMI4H+dJ8lqbNmCIXNucDE66IDOxDtdj+exuTn5y4RWzSPyLIeNA
         KNYXXBPXaX1LRc25kmA8nmczjgNeNN9Qj+G3muPI1BLn1ZxbYYmbUSlkNM8CQ0L8WcIF
         uKb3YJOqievTwkRmH/w+zPYoote6HfVziOGLRjBgssZq9nrybsOF0QVkg4RKa+w2L6v8
         HlvKHOiS1PC8srghmcuPaTDu84AMeX7hJOCzHqa7I0v3WJemO54bslZABo+iCStdzBXU
         rVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvk1CPf/3zQX1lPBInQM9UMXQ5ckAcaTd5A2XFwe4l1YW0TpqHbo0btaON4OSPIDZcAgp7Ojtju6BYab/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxYAXPjnbDXkgltq11kwY+bYvoicJLATs4jrghb4ync4VFOcxy+
	EwdbgawLoe2V//SiFk4gTvvXoYsJoC8puq7xN+aEwNIh+I/e5RIzERTLkip/GOU8YHMHkLjt9TZ
	ia5WirpzMVL3A7wN4y9ZyEXx+SkLs/PNTAngnLht2GBNXtG4EGKFpqqA6K13TKFJF39DS
X-Gm-Gg: AY/fxX6rOFoB/KSwoMMloLdIsilO4pTvNk5s8zsSinw4Heftr2maFOnvUjByAF5OB7k
	E2OjftPDDaoqkUotCEd/j2n6dZ5xH96vKHQhEPJBa8/20WVTdx6eW4Lp1GaxBXoju8AH6jf8Joo
	ssDS4v4N0IMmFTTnDRbtpcR5z1LPjMwLNSkIN2YU+aQIsavNaMQY+3KPmPp5FSeWohEzn52ToBD
	zUe7JAab6HEqJyLYEsw1r/YioYqboafgxKctrdU3oluOAVgkdKAYp4AFGLwP+ArnRCtlPNBbT6U
	tJw5Iue444c7qqB54pFqutNBoWIiRbMStrG0gz38K0PR1hR30krh7YW8nZHG81BRGTrvFTbCDCW
	yCZqYsWARGHWElw+mofeblgiy4SOzvo3TxGqFRqbB6hAblyPFPqcj4DN7YJKXKaKjK4nsf+Zg
X-Received: by 2002:a05:7300:ad28:b0:2ae:5549:2c86 with SMTP id 5a478bee46e88-2b48709d3bfmr2687509eec.5.1768438296197;
        Wed, 14 Jan 2026 16:51:36 -0800 (PST)
X-Received: by 2002:a05:7300:ad28:b0:2ae:5549:2c86 with SMTP id 5a478bee46e88-2b48709d3bfmr2687486eec.5.1768438295595;
        Wed, 14 Jan 2026 16:51:35 -0800 (PST)
Received: from [10.110.121.92] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707da231sm23017954eec.34.2026.01.14.16.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 16:51:35 -0800 (PST)
Message-ID: <a27eb754-3989-4f28-badf-43b502a53e7d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:51:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
 <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
 <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <08ff44d8907c72b7599fa4599477d78bcecb440a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69683a19 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sEXkrLmidTYQQ7fN55sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: j23xu7F2KPi1oYTWRUVdF07YFK0ykm40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAwMiBTYWx0ZWRfXxXXe6x6s1ze3
 rx3KPz2hvE807K8rahcgoWjBHyXNFjD9YPCs90lfN4p6/ThTTfmEWzCGQ8yry844Gy2Hs4XEmLV
 /SgSU+z4c5kCPtxQOLuONRuBr9CSPfz6lzwqy5FewT5L7Lx/5Dur2+PHvoUTocZQf3KAGh58+A8
 f7HwC0GPmcAhEhTTbc5KNu8Pm1pUyp1df18eheVJNE7+k3BcnbpelLO8tsZdWUZWQc2XtHqf6YF
 IfYozVdflu07Tl/rovZ603Fy591ZphwDE7VK5VMvyShR0R67yIYqe3QTMgEhtlwzlJw/RgdTJy9
 sXpYeedSYDxH31zAKtFDpUDyHYwlz//7IZFHbYfvDAgRLVPbyPim1a8zMY59+rGNUfA6lw0J+3O
 0S+KoW4fsYSiY0Uh5UTgKVF84kxEvBjKIEIcB88j+rp89sMrvxDdhTlVhAD16NNZ4boEQL6Ciq+
 U+jevrP3F9iMsG6jwJw==
X-Proofpoint-GUID: j23xu7F2KPi1oYTWRUVdF07YFK0ykm40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_07,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150002


On 1/14/2026 8:14 AM, Nicolas Dufresne wrote:
> Hi,
>
> Le mardi 13 janvier 2026 à 12:33 -0800, Deepa Guthyappa Madivalara a écrit :
>> Add compound control, V4L2_CID_MPEG_VIDEO_ENC_ROI, for
>> video encoder Region of Interest to allow applications to specify
>> different quality levels for specific regions in video frames. Define
>> struct v4l2_ctrl_enc_roi_params to hold up to 10 rectangular ROI,
>> regions and their corresponding delta_qp value (v4l2_roi_param)
>> that adjust quantization relative to the frame's base value.
>>
>> This enables use cases like prioritizing quality for faces in video
>> conferencing or important objects in surveillance footage while reducing
>> bitrate for less critical areas.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/ext-ctrls-codec.rst         |  7 +++++++
>>   include/media/v4l2-ctrls.h                              |  1 +
>>   include/uapi/linux/v4l2-controls.h                      |  1 +
>>   include/uapi/linux/videodev2.h                          | 17 +++++++++++++++++
>>   4 files changed, 26 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index c8890cb5e00ac05649e6c344c2a6b938b2ec1b24..0eecb46bb356c01411dfc313b92376593bcd86f6 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1668,6 +1668,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW custom range.
>>       Applicable to encoders
>>   
>> +``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
>> +    Defines the control id to configure specific delta QP for one or more
>> +    rectangular regions of interest. The struct v4l2_ctrl_enc_roi_params
>> +    is defined to hold up to 10 v4l2_rect regions and their corresponding
>> +    delta_qp with a range of -31 to 30.
>> +    Applicable to encoders
> Any justification for this range ? Also, I believe I've seen hardware support
> both delta and absolute values. Since it meant to be generic, some research is
> needed. If we delibaritly ignore absolute, perhaps the CID should be named
> accordingly ? Something like V4L2_CID_MPEG_VIDEO_ENC__DELTAQP_ROI ?
>
>> +
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 31fc1bee3797bfe532931889188c8f7a9dedad39..c44fad7f51db45a437dd3287aa16830585ac42f3 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -91,6 +91,7 @@ union v4l2_ctrl_ptr {
>>   	struct v4l2_ctrl_av1_frame *p_av1_frame;
>>   	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
>>   	struct v4l2_rect *p_rect;
>> +	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
>>   	void *p;
>>   	const void *p_const;
>>   };
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..5f2621365593ee19a7792fb25ea29acf6a7860f1 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -918,6 +918,7 @@ enum v4l2_mpeg_video_av1_level {
>>   };
>>   
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ENC_ROI  (V4L2_CID_CODEC_BASE + 658)
>>   
>>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index add08188f06890182a5c399a223c1ab0a546cae1..18a5ae34842721c2647a7a76365e4d299d2b8a44 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1909,6 +1909,7 @@ struct v4l2_ext_control {
>>   		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
>>   		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
>>   		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_mastering_display;
>> +		struct v4l2_ctrl_enc_roi_params __user *p_enc_roi_params;
>>   		void __user *ptr;
>>   	} __attribute__ ((packed));
>>   } __attribute__ ((packed));
>> @@ -1990,6 +1991,8 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>>   	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>>   	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
>> +
>> +	V4L2_CTRL_TYPE_ENC_ROI_PARAMS	    = 0x284,
>>   };
>>   
>>   /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
>> @@ -2540,6 +2543,20 @@ struct v4l2_streamparm {
>>   	} parm;
>>   };
>>   
>> +/* Roi format
>> + */
>> +#define VIDEO_MAX_ROI_REGIONS         10
> Let's not hardcode hardware spececific constraints in the API. We have dynamic
> arrays now in compount controls, and you can define the maximum dimension and
> all.
>
>
>> +
>> +struct v4l2_roi_param {
>> +	struct v4l2_rect roi_rect;
>> +	__s32 delta_qp;
>> +};
>> +
>> +struct v4l2_ctrl_enc_roi_params {
>> +	__u32 num_roi_regions;
> With the dynamic arrays, this will not be needed.
>
> cheers,
> Nicolas
Sure, I will explore more on this.
>> +	struct v4l2_roi_param roi_params[VIDEO_MAX_ROI_REGIONS];
>> +};
>> +
>>   /*
>>    *	E V E N T S
>>    */

