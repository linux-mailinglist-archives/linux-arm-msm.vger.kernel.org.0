Return-Path: <linux-arm-msm+bounces-79771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C5C22CB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 01:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8F944F1878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 00:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901BB1E5B63;
	Fri, 31 Oct 2025 00:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/iPZChc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0BC1E51EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761870671; cv=none; b=YQDPao2iZtlN+wCWDf3jU9YxbOpxWgHVfrZsnnyU8UY9NJHoDjbtQiBP/4HVkjapADDRn9oSCS4vfrMYi+xCYf1JIL/06JEsNbDt93dYuZSSoeO7tKlhyVHXNtpqtp2q8WsKlZM+zrgj5yK5tVTRzHenM6gmTWiKC1K93LZmfnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761870671; c=relaxed/simple;
	bh=KMzDRKv5vA7T7CtnN1YiylERwCfSkYzsAuzyPy6DuS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRiON6b7IKgtb0mMfRqHEvfGCKjW3JQGEiWYJrGeL3gwfOBFoyRDOs03mr87sqXcXzhAEKigoFZQjXkd6hCTwzyTfdFtJMIxuPJe+e5HOuQzqBKITdtSG6nBhUcdKf8P8S4QuRZa4noiAaLoD84W7ZPw5VybjN5QB7zXt9oAUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/iPZChc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-474975af41dso11832645e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761870667; x=1762475467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQyM+gpE1/R8XB7auHos6sn8eyFYyrQM/uv08lULwXc=;
        b=A/iPZChchR43f4h7UeGjo2dAGs1KBe9fc6oP9w6W1oJWCBBQXsxSdpyugvLTzY87sk
         O9NLOvtYWWc/DIMaW1tqBhPTT1IlBOTtIa4yN26p0DdX1nNrIv5Rz87en4leoeYGnEBp
         EEr1pD+kpp5zVxE3VEw8WimXA9P6cpC9fZ0o09+ftNbWp6KPgskct2DpcX9KnXag4/9f
         od47Zd2y0CZ1P0LjxruKRAg8M8fIKFxzcDJAItnzZ8K6DytU0LNc31X1pB93HT2RW0Qd
         Sw6MeqLR/qyP/UPR27hl3ngZppBGc6M+iUoGRfFBHVK8P8pCglwIJxk57pYYP4bFsLZ+
         9NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761870667; x=1762475467;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQyM+gpE1/R8XB7auHos6sn8eyFYyrQM/uv08lULwXc=;
        b=JVNKz4SUkxt3miwkJdGL1Xguk0Y2xFjkHT9W7dtJZ9YuGSDRv/DukPPn+uRqgvzwik
         xRROLntFUjYCy2b9/p3ydgcNhuBxVgfr0wPyMPVhGTRV/JPQP6FElPQLMd96/kuqptE4
         RYi82enTP5LZLNCQuS12cv4m72XmhhewI+oJFlLwfpK1cBRuKfHy/EKneNzs7riXAnMC
         EAga8NA9NCGpFD7TJxvtLLa3eiyYOzvH40IMsfcJwCtLzoAt7aZS5gxEcN/aaoykXi3I
         KJ2o0P3YI4izoC0mvAHNEl0OrAeEJTSbpGFrjyxa2y4kV3LBZ6QSmAJ4ARrK2EC4CSQH
         es4A==
X-Forwarded-Encrypted: i=1; AJvYcCXoD23irLbARFO+HVXlyKBq5a6wccZHMhl6BwUjYk+WC0ya1TQ/2i+poUNm7Imq489y+g0URoMywr2qs1lU@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHHhivWZYQk49R/VmtH4GZPrq2ndICygWlH4Or0miihQcWRYh
	tEdwOk22mwiYsC0zCm0dypYaEEEbtDJdq7Z5QjU6t3sVPLGnLHpHRT8mZKocLSLbT0k=
X-Gm-Gg: ASbGncuj/IKBmivppeLjZDW7CKRS4IAv31IZ4MlTxktPRezz3bb3ZWTFK7u2YS1hHPO
	b1VRLhyvw/+AqPPon+EH8HujY8lma4fu1uicxdw0PqyMtmT24gmhvwXZ54BB6XmFH5fKVP1P7/i
	9A5zWXp4iSihPGy3iRku67me0521BiSW00VD7+g6E6FCaAryK6OwxP6hcjsy2xXYPkoEm3v2kpF
	E0nNp78TIrnCZ/YK182d4Rx6pAeoFJGfVatbwxKaV/N92appsfHcaIkpeeC380dzYVJ58+vhaDK
	oqCzB89iY1bY2t/KXzA76VopsTkpebe5G6baIHfCBf58O48EystgT2VaGBJKfM7EQTOCbvH5CG1
	YwzvoKrsOOwN2T74dJNW+S6W17/MFy/MIcql3O6N4cJVzEwEjSFt3dtJxnNqB+Mgj8J3iDqFw4h
	7I9NVY67w4exT04vRaE1mVXziy+7KaVylnWDULInTxYFyQbr1gm9Qa
X-Google-Smtp-Source: AGHT+IHXcj8ihCaJ0joDQKKDFiMlVz4FGEpmj/DtV4mCnROhkUQEtdynsk+5jYqiPYBn1KFHIFfjeQ==
X-Received: by 2002:a05:600d:6352:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-4773163825dmr4196955e9.18.1761870667522;
        Thu, 30 Oct 2025 17:31:07 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e1d8bsm286786f8f.25.2025.10.30.17.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 17:31:06 -0700 (PDT)
Message-ID: <85217da4-3ba5-491f-a771-40c95a31f1f3@linaro.org>
Date: Fri, 31 Oct 2025 00:31:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <_CZHQqm9UaYWFVQTen8I6llGxozVDgeSVxCp_HGBttKghQ3or75NV-dfyGOXiKF-bPIDdgsTtNtKJjED0nko8w==@protonmail.internalid>
 <20251030-av1d_stateful_v3-v3-1-a1184de52fc4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251030-av1d_stateful_v3-v3-1-a1184de52fc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 07:00, Deepa Guthyappa Madivalara wrote:
> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> Video4Linux2(V4L2) API. This format is intended for AV1
> bitstreams in stateful decoding/encoding workflows.
> The fourcc code 'AV10' is used to distinguish
> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> which is used for stateless AV1 decoder implementation.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>   include/uapi/linux/videodev2.h                              | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -275,6 +275,14 @@ Compressed Formats
>           of macroblocks to decode a full corresponding frame to the matching
>           capture buffer.
> 
> +    * .. _V4L2-PIX-FMT-AV1:
> +
> +      - ``V4L2_PIX_FMT_AV1``
> +      - 'AV01'
> +      - AV1 compressed video frame. This format is adapted for implementing AV1
> +        pipeline. The decoder implements stateful video decoder and expects one
> +        Temporal Unit per buffer from OBU-stream or AnnexB.
> +        The encoder generates one Temporal Unit per buffer.
>   .. raw:: latex
> 
>       \normalsize
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
> 
> --
> 2.34.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

