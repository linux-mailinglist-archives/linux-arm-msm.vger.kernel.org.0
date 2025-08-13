Return-Path: <linux-arm-msm+bounces-69076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E82B2570B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46DFA5A23D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D492FB96D;
	Wed, 13 Aug 2025 22:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvOe4hR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6A2FB991
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125757; cv=none; b=YYRXSiCeibf68+gaVfLYlxppjGXqxo0QpE2MsNxPamzo9QdH6ACjnqO2hDvvhIL30mB8djNwGJRwMQ68tu0pXup7YIrQ+cPdzUXhN8fluVNv4F0i9PhJYGqYyI0MYyk7qTevyCZFdRaB2/UOk8cmvVWESclYFI7I3B6IL8la5u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125757; c=relaxed/simple;
	bh=jAnNKoc8OIVx+dw7TrFVfvfY8lmRFsZzlTTw/qR/0dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qAACSfT84KviGkwynPyLmCSUB4f7ZsxIUwjoPvBrz63sAo5+rkdif50BpHpOZv+3L0Ifoo/bivivrfJeXYHmBotDK8ZMVzvJpuNA1UF0gwmQOO5dd5LgP33EBPY1jF8VuFTbNzoQ9jWVclisk/Xqv9puxm4hPtXG+aon51XoPyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvOe4hR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM9pK021243
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8e0ZVNprxYNA0/9coeslBrJajBup8IpRB7mgWlinU3I=; b=kvOe4hR389WJMGpr
	pSwX613gEZv7psgmjtiDKWNew9mN/oaXMWt7VZsUGZ0BYhGuur1Tz3LOgjc4ZcK8
	/ynBUUlLlkC9ecKh/1uPZUlS49gpcuwVRp1AIl8jtwpxIE2wI758QNLtqcuIMjqI
	u5Iu1TIo6URF61zeq0ZC83H3d+6cTgEDcqZXQq6s97Yqr1aWTmz2quWNfvCk2QFF
	euT8hKEvGddJZWYZKTRwNVXCQURNZieBYj52C5lJvsE4tofLzHsd4HIGpe++dhTC
	2hnP3czq2OO5mp5AJoSFJhPJvDbMPVyR6GLoI3PXpoxprIRy8abBaUsC7jdJ9wdQ
	0fkCvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9swqvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:55:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445812598bso6030245ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125754; x=1755730554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8e0ZVNprxYNA0/9coeslBrJajBup8IpRB7mgWlinU3I=;
        b=qRTDdGp0vfRhOqNpUFKS0Yg7viiZZHR2k1XwK1rd8ww8v4j535cgiG2wZ6e9b4ak6X
         vDdNaNeWEr5JR2aX9vqSzesdvDkSAqtQr1Ba05br97Dz+3ClXQfAXEGQNGpF2mkIOcnq
         s1EcYi4tIv4Uvye2KLMhN1UJCM6Ln5wRnHEqew7g73TelS0jRgpV+4mFCc0KvHRvOu2v
         0/G27JYFnFa0f4fHfBzitqunkIcC9sAZozu9yWRkHsY91WJmUhMzYd/ia/spykxDTSIw
         G611RIq6/zxV8wrrjgEe7hUL60XyLOZu6nsNwYDEVQ+IJj6jH69+XnFEDzXyUCKsBNop
         bDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9G7ICZMqXaFvZMklsGHFDgfflVXsd0clOJVJtF/RXw7t1XLmSxrGx7uUr433Dkr0I1pBGPEXS8YxDV+IO@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQ8JDkviJ/VeOsxHTt58/xik+bLn9djrGM5AahOKS0JQwRR2v
	IZR+HLzlvg8tG+eBzM9Kj2hQIZUQzFIbbfQFjGddtUEwyVcShQFU17bC+CVgEubeBnCbaKxZEH9
	VwZKkcX0Vzxe7zKzLcGPpEaHK8XvZP8+LpiisW5i/bHddtt2t/l7v57JCC33aDMY6qHg=
X-Gm-Gg: ASbGncvXYF6qtKGVjItwa6yNiU08ezeddQV4L3iAgHzqhOVWL/Xltm3+bewR+KX68Mh
	+axo0LhwNkCvqVTBfK/4BDBgWVlbjX8Jqazj72/kIFLnmz/w2FiXdB9UO+c9GYkelMXM8uz/+6E
	s0Q5nX8FGSJnd4s6qJ59ykri4pG2ggSlgp+S3iRecIXIrGH2lJdwu923qzwe9Amornwu7G48ez/
	tg09FbX2qUBEOVv3AkrtliRUSkSYb3AbswBYm9GviDPSGZ0osJNhnW6tXG1QdipOR7OtDV8ftSk
	+ymG4LTHqr40xu5r340lmapAU5TzpJ/FZ9rRtofYO2lJOHAsTQezI8ScOxoIszJgEI6jLOVAj4t
	iZ7xz+59Jcm5oijLeXMfYwXrF95xtnXMi7Hqjig==
X-Received: by 2002:a17:902:ef48:b0:243:38d:b3c5 with SMTP id d9443c01a7336-244586d6812mr11282905ad.47.1755125754315;
        Wed, 13 Aug 2025 15:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyZkPhdjRr1DNqf2XUlzMie+QCuji1zBonY4NxpkKvkrR7x/LGRt8rtlqOJlwD4OUaeYUew==
X-Received: by 2002:a17:902:ef48:b0:243:38d:b3c5 with SMTP id d9443c01a7336-244586d6812mr11282655ad.47.1755125753877;
        Wed, 13 Aug 2025 15:55:53 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2429b4ca995sm202959025ad.177.2025.08.13.15.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:55:53 -0700 (PDT)
Message-ID: <1874e02d-993f-483b-bcb7-dba7c0611376@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 08:55:45 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
 <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
 <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
 <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d17fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=T0n-DW2OHO-Z3PBZrcMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: us6uWwMGWxfB0pkL9mjmdlZ4wRa0hibj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX6cQ1nTRtPXtX
 yNDe07BqksRxT0bSj7t6m6umpM/aO9X7g1GaXXye2r+wc+R7C+2zNaytNJ8tRZvkIlmKupDe/dh
 Oe8/icImYVc2m8EUBqdG+3n1jEE9Pe49lGC2sRh8bk07nU2R7o3UMTQLbmjiZaRfiI50EgIpK6L
 6T6uOsUxHNTOK7R7mlx6noFmF9FLmQfiIBrUxNl0pZgkFsbfOg9FlIEu7a/78+LyDAxuFHrxmgz
 8PGLWe7/5O8dUYeWX5NmSlqNogNCBjlEpYjU3ON4wvRZvaK5RAiDXTP+V88UE3sT/w42qUVCyP+
 H65ckN6GnJYI8uswtdLQu0cw6yN2eUF8wGK1e8ylft1fXC6SOG50Y8Phfh1AgGaBNBG1YtuACUS
 FBkgXdWh
X-Proofpoint-GUID: us6uWwMGWxfB0pkL9mjmdlZ4wRa0hibj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015



On 8/14/2025 8:52 AM, Konrad Dybcio wrote:
> On 8/13/25 11:37 PM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>>>> the secure world, accessed via objects. A QTEE client can invoke these
>>>> objects to request services. Similarly, QTEE can request services from
>>>> the nonsecure world using objects exported to the secure world.
>>>>
>>>> Add low-level primitives to facilitate the invocation of objects hosted
>>>> in QTEE, as well as those hosted in the nonsecure world.
>>>>
>>>> If support for object invocation is available, the qcom_scm allocates
>>>> a dedicated child platform device. The driver for this device communicates
>>>> with QTEE using low-level primitives.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>>  /**
>>>>   * qcom_scm_is_available() - Checks if SCM is available
>>>>   */
>>>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>>>  	ret = qcom_scm_qseecom_init(scm);
>>>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>>>  
>>>> +	/*
>>>> +	 * Initialize the QTEE object interface.
>>>> +	 *
>>>> +	 * This only represents the availability for QTEE object invocation
>>>> +	 * and callback support. On failure, ignore the result. Any subsystem
>>>> +	 * depending on it may fail if it tries to access this interface.
>>>> +	 */
>>>> +	ret = qcom_scm_qtee_init(scm);
>>>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
>>>
>>> This will throw a WARN on *a lot* of platforms, ranging from
>>> Chromebooks running TF-A (with a reduced SMC handler), through
>>> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
>>>
>>
>> Are you suggesting I remove the WARN? If so, how should the user be notified?
>> Should the error simply be ignored?
> 
> I suggest using dev_info/dev_notice, WARN prints multiple dozen lines
> and taints the kernel
> 
> Konrad

Ack.

Amir


