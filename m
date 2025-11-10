Return-Path: <linux-arm-msm+bounces-81096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB4C484E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0F13A54FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FE92BD5BD;
	Mon, 10 Nov 2025 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTRkEkpy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bit4ocRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A9B2BCF46
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795312; cv=none; b=mHgU/4HgSNh9E20v9PSAHBoTZDbn+TbvexIQdRn2g17ATK06wnyRsPoEl4+fJyN9jNfKQIhwzBWZtIakqaLIepcn0lZKR+KB7y91LzFmSkYmIoZVRT0RNw/TETfBkQTrqUEhKJeApuydL1o32fsDTEKnmvmXXO1p+JnX31ajU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795312; c=relaxed/simple;
	bh=oOyxVfvfN2aRyBhPTf8mwV/DdTCr77BufMFYqC2fNCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReM6qFka7KGOnRG/C/Eyni3nl4/HJq5kd1Qo1xo6A98LOYmn1SYsi5HcysAv2dLtr69q7MubDVcWoHDLIqQ5vTsKvw0S30/TZyXeFSg6GROKhTD5X0U8jvrZIUu4qcVoUdmNZLcQSGFBAHqw1Hf2O/7NFGtn4jchFc1uWNDBFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTRkEkpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bit4ocRV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACN3933307000
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KzEs6QNzdu2qhytoCaWZmKH/MfHn62bBmZSzoL1GAIY=; b=ZTRkEkpyQ7iLYLgt
	qDVsqFH8TuTytvJhA44WRofEY6PBkIhpGlUf0J84hEpxvdCDSf/285d4P0LLnmRQ
	OomSLvt1DEmF414KzoyWR6g3rXb+Eu/59P7O2bUvxtxji/1uJL14sRS/kLwXlf1t
	QqYA0gEPP439zPTXFcCPoINFRd7EHHmZKqVMK95Ou1YBmo/+Wo5r/qLY1K5+8g+6
	udshw6HQf1j2Yp2Rt7Tbz4ZTg+qBmkCGwlgat2hRmbr9kiY3+YsrgdNaE0TDOi1B
	NHI7f5rJJNzRXaq2zlY9zEwv8FUD75CZgvyKVy69vytG9Sk8IQCpQ9xqb6N9kXI7
	I6QQTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q8whm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 17:21:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2964dfacb68so10882515ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762795310; x=1763400110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzEs6QNzdu2qhytoCaWZmKH/MfHn62bBmZSzoL1GAIY=;
        b=Bit4ocRVDSlvLZ/1Yo8bF+J24api2iA048nUIjdZf4DjQP3ezXYOVuMTmsPFZakCDe
         wUvDDjwD6qHr2WrfFpTYdUqcmPdQbZ80ETfe3QaXDWbKNUUWQsnCGZYRwl81yHzU1lJX
         IL77GUU+3Nh2IW3wd4utYVh7IFYWW6rpxIkVrq8hrNS75aHurJ+APM9DDDL2EK8uxqBj
         5StQA/6MeAE7CFJLnqXjv+8zhkFYZOc1/DC8a7EhCPo4AGyBOYvXVXrCKpp7nPTXqozh
         U7fnE+yh3As3S07zkubdCT8fpeSCH2B9WUKSq8gPnG+5Q3XybLHt8YJBDf7+E3SZs+kQ
         mSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795310; x=1763400110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzEs6QNzdu2qhytoCaWZmKH/MfHn62bBmZSzoL1GAIY=;
        b=cZ5cu3cKINNKC6t/qN3iM3hHDUrgZ4JSAveHGT26fhBfu/BrGNxHD50pDjw5pw0Gq9
         9jlVxlyCBFAWSoVbpdpKi7xM+OLk4kHhHOFhXygMqgVstaYnLqw91XiixonlQmQ4hMtG
         GDRz+QVl5FJt/7FIwOWEiDZxIRbHLxIiUAnjGMwr08u3xycl1obkfSm0F3tEV8bu+K4U
         OE9yKLes0LrTQn+lsipq4CpM61K5NlOb7CtiQbGYNO0UiZAfYErVm/gpCwvfRW8jfoLb
         e33KyKYQZ6nGQuEi6RupVFucM3lHNzNPBtpQ2r59aHc1WkGlNFNdQqN7MRflLrkRvJtW
         u7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwGa63OkSlG+MvVm5re3Ndi8C8Wo49SxBh6z8rdXG2aBAB7zID88cYB7Qgnlt/XGncsV3Tj5AEj4BdnI2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59qMQ4FttaEOJMFFCy+BnUvAejzUKZlQ4Cbc3OViWMhNEHKtu
	ir7FmM/M6BwhkE3lyGlx+7bh/Keqq4C17XGLqTk8KdJuoo90edh10z6YMmPs84RzTt2rFpubsSH
	CcfGtQtJHxk1N4Lhxt5eNG9g2kwbKW4bWJuujw8NgFxe7E1EKbkFnQuN/fIF7eSuna6Zn
X-Gm-Gg: ASbGncvzy/uT2n1yOeEJMzKfnJ3N22qg16VNOxltkRCnHMSHfFWW/YeFCKSgN8Ko3bA
	SkXLdmJudktBKmBBR1b+ZiAWSAFMxNU51JRkbWSGbxdaIs1NECInCA4TqSlzYQVS8zJzj3KuvbY
	yxGHcePGoKBdmhnHPkeeJV8opqneEWSm4kssJqjIsedY12PntUdfK8csKNvRraa6jm9PvPh6XnH
	+Yi4gBG0CuG0POc3lUj0yMGNSPK1mQcIYE5NzyM53kua75AUfdG+axhAmHifn3/C4Ff6jpaZRik
	0NN7mIIBX86/inwvSkmrXz/ppsv+IP2+NnhClVuUxlokyB83gi0jChesos3Zd7apfI8IqWgdhfI
	G05nuuLXOoPr3TX1eolMCoWQnNRpYXQZi3NDGgPIHW3pniocYkD7657pOrql0oA==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr65139985ad.7.1762795309743;
        Mon, 10 Nov 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELGhkx48AwbIGq6vB2KJ644Ff+ve66z22iNyFkftsJjOkeg8StfG0sIWyldz8RRpbhI3STtQ==
X-Received: by 2002:a17:902:dace:b0:290:af0d:9381 with SMTP id d9443c01a7336-297e56cf5d7mr65139755ad.7.1762795309239;
        Mon, 10 Nov 2025 09:21:49 -0800 (PST)
Received: from [10.110.83.178] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682bfsm155611875ad.4.2025.11.10.09.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:21:48 -0800 (PST)
Message-ID: <33fcfc82-14c9-49fb-89b7-657b7ac640a2@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 09:21:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251109-av1d_stateful_v3-v6-0-4a9bde86025a@oss.qualcomm.com>
 <20251109-av1d_stateful_v3-v6-1-4a9bde86025a@oss.qualcomm.com>
 <2a458127834680ea8e4bc74639536a20494f1357.camel@collabora.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <2a458127834680ea8e4bc74639536a20494f1357.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69121f2e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=lfnHfZgCvS1hSVXH-IcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0NyBTYWx0ZWRfX+qZE6j3AJ1HO
 XkQ84amp+A70azLCczA42p/XWhVQ/4Kf7My/Fq6bUvioii2D7ftHPklji6T/KyTMtaFiGApal8M
 uUXlXm7V5cWvAIjeU04IuQE9vsj8YNNCpb7h0cD3V4dmR/Ir8fGL6PEveP0JQErJj0N7R5i2Jhs
 DNhP0J7BjXEA9Oi8kwWkhetVljuGO1GvMpp/+ocKelzwVP7C4W/WgPNVdw06imyPMO884ZeGyo2
 j/c+PM0ubscop3YFosgXPle/1UQejLbrghrwtEvJo/H+/w1HfSh/bO7pGdo+LPClVogZKaA8Hna
 LDret0wgBEi4sxlbe701/Szs/hUKqM9R8gzdaTFUQeTHFu+W3UtXE7P8QDM9WZOMfhHlrK3rJbM
 JGbJk5o+U16eZHql126d3M23k/JbUQ==
X-Proofpoint-GUID: 8kveQXQ3nCpNMgcE_iWNBFp-0VvRcovZ
X-Proofpoint-ORIG-GUID: 8kveQXQ3nCpNMgcE_iWNBFp-0VvRcovZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100147


On 11/10/2025 5:59 AM, Nicolas Dufresne wrote:
> Le dimanche 09 novembre 2025 à 21:05 -0800, Deepa Guthyappa Madivalara a écrit :
>> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
>> Video4Linux2(V4L2) API. This format is intended for AV1
>> bitstreams in stateful decoding/encoding workflows.
>> The fourcc code 'AV10' is used to distinguish
>> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
>> which is used for stateless AV1 decoder implementation.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>>   include/uapi/linux/videodev2.h                              | 1 +
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> index c7efb0465db6480fe35be8557728c196e0e530f4..6ca63f35b801b8aae142b69eddfaa549a5568a3f 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
>> @@ -275,6 +275,14 @@ Compressed Formats
>>           of macroblocks to decode a full corresponding frame to the matching
>>           capture buffer.
>>   
>> +    * .. _V4L2-PIX-FMT-AV1:
>> +
>> +      - ``V4L2_PIX_FMT_AV1``
>> +      - 'AV01'
>> +      - AV1 compressed video frame. This format is adapted for implementing AV1
>> +        pipeline. The decoder implements stateful video decoder and expects one
>> +        Temporal Unit per buffer from OBU Stream.
> This should be something like, "one temporal unit per buffer in OBU stream
> format."
>
> Nicolas
Updated in v7. Thank you.
>> +        The encoder generates one Temporal Unit per buffer.
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>>   #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>>   #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
>> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>>   #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>>   #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>>   #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

