Return-Path: <linux-arm-msm+bounces-51439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE90A6165B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE3E43A81B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EFE202F67;
	Fri, 14 Mar 2025 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5v7137f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33BF802
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970160; cv=none; b=lgJQwY4SjQ1XMzYhTQo40RUFakQ3nQsiOye/q+tv6ATQMxYbYI6/ARdyRLElEGg85D5U5bRacfQsThKcsa+ltBNFYNXCIqsDNb0TxKA/H5Mr/1jdU1KR7/r3M3ak28bkvckijZLEkhV1ZIEG16FsYB3H0ZVnzSPLL/hym0r7kW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970160; c=relaxed/simple;
	bh=sobfFLy7ZVGdn+lj5W62t6j0hO6dH00+jkRkQGeOpWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CV5c4EyT3WHYR9veR8acO5u0q+XTvtbgn5Q+aeJy2ITuwPDaBNkom4DpO6Fyxl3K5B8C71S4rBRKz8tCDvAgeMXrCpBdVA/O0MQZI2gdJVBnlOLlr9chK6palxmx1KCdgDWYkWYPE5MxW65SoBJPW31v2aeyK92z2TVnWj8S9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5v7137f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E9hMZ0027243
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66loOkDic1IZ2k77pHK2vLxKaOEydAAzgkXK/7t4FW0=; b=n5v7137f3IHVIGGp
	yiC4rhZu7wcsxwksSSRL5t7jBcnMe6f9pac4lUOQAI/NRvA6oCEfkgz4Z//+4U3T
	t+zxYjDbEYPY99Glo4wEl6HJNIDRex4FYGS4IYf12raoAOgx28Ho9YeauArMv5+U
	VFmueiXFrOYW2dfwAxsAUaKuEuTLeuT0mMEf8NBIUm55pmlVjKVxA0Ht8mq6Zqn9
	1wdn591QH0ChxQ21wpomFADt+I8eK2+KU18DdN1BolnBNQIOKh2BiXj1BX2Mki/Y
	Z0hFSwAGxsXYHmi0DtkKeXHwRmtbmArVDmna7LITNnGXlp+8BhoYoTf9DbgUIBj5
	swboDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c6732shj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:35:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a7aceeaso39319955ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970157; x=1742574957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66loOkDic1IZ2k77pHK2vLxKaOEydAAzgkXK/7t4FW0=;
        b=bukDDvLRp1DaMFo0Pagmzz9PBXdq2B/Y/GM0RkFJ1LEeU3OoaHmCvu6VWQw6Vx+ZXU
         sHTbIDPswbJUPqyTFAIF/tft9gczplulRH30twG8LrBjYRWEwdn5pyEMzch9xCP8wIA7
         Oz9ZvkaPGSLhbWCXj77beswArC82JA7CsfbDuycXrzhj7Jxp5fGBZE0H7JWDZZhmcxu4
         3gT3seB1d43+GVMQaN4nG5crHqUOhR4thQIYJpLtEokw8uoW+CCXdiGxPXajibOM0U77
         F9mO4W1lsuSD2GfKSvjdzyxCpR41J8yZeG0ppHR0KA45TNxBV0l847zfBi1JwMfMHmLr
         lyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMZ3Ly3eWoVMdgCahTzLvSvCv0HD5vyOz8Pkg1Qdvd/2DoAR/3gmHr6oOa6Kk1TyDkOu5BwDGCOdsxATqe@vger.kernel.org
X-Gm-Message-State: AOJu0YyPiXi3SzT9ohZbRSSFvlXFNGBQpzBtnHJCPc5KQq+vlobfNrr9
	q6nzDN8PaykPSy5mBp2PSinO3/sts4nlC/hVSambhASRHprYZ7QIjJdYvZDWq63rzz3JwYaC7pT
	QIYvmZ/hP7J8SEcan/P2ldGPxIfVtYQcrspsFOdz88Fs4wkTjLtOYuCq3JddP5kYc
X-Gm-Gg: ASbGnctYgEAtOnx9ooi1DrLgay5aBMlukF8Kx6nXhbVh+rMrlENj0rU6ZskJrS5f06v
	sWKKhXDNjHs8W1jV/mGRrpycI6SijzXXdYsj9J0I8r7cfIwLvYXMqQBv4btwGjBCASBuXlIN7Zx
	iho6eH6B5pU4GlTL059gE0bKLiPIiydLNiQzrFWzZhJIEyFI6FZHVjXtwD5wOytoOaFtob1bg+q
	HOF5I64MnhLJmXHFDJvhF1xHD4HVBs3bHiZ6MzvirffKhRL3LDwLYVS0UxOUBw3Yz4ed7A0+opS
	bavyV/5GGeF7Qvw6a3ABI7OZJ0a5PthLOnVHBnx8d+gzPYAheEoG2Rx2taq8emzoZw==
X-Received: by 2002:a05:6a00:3cd6:b0:736:b402:533a with SMTP id d2e1a72fcca58-7372236e186mr3540561b3a.1.1741970157007;
        Fri, 14 Mar 2025 09:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM0l+UMyivRuTO7apt/Js32jvVewReToEC4sv6nQd34HYx9P8BQzmnqHeE+/2ENj30ipXECg==
X-Received: by 2002:a05:6a00:3cd6:b0:736:b402:533a with SMTP id d2e1a72fcca58-7372236e186mr3540538b3a.1.1741970156607;
        Fri, 14 Mar 2025 09:35:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167d931sm3172137b3a.99.2025.03.14.09.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 09:35:56 -0700 (PDT)
Message-ID: <64b20037-d067-4c0c-adaf-454a68c46d1d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:35:54 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d45aed cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jm2NUAHTRls9H0omj-oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _4lGYOHJ9Peovz1k6HzS2wv693_xnGhD
X-Proofpoint-ORIG-GUID: _4lGYOHJ9Peovz1k6HzS2wv693_xnGhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140130

On 3/6/2025 10:19 AM, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> When slicing a BO, we need to iterate through the BO's sgt to find the
> right pieces to construct the slice. Some of the data types chosen for
> this process are incorrectly too small, and can overflow. This can
> result in the incorrect slice construction, which can lead to data
> corruption in workload execution.
> 
> The device can only handle 32-bit sized transfers, and the scatterlist
> struct only supports 32-bit buffer sizes, so our upper limit for an
> individual transfer is an unsigned int. Using an int is incorrect due to
> the reservation of the sign bit. Upgrade the length of a scatterlist
> entry and the offsets into a scatterlist entry to unsigned int for a
> correct representation.
> 
> While each transfer may be limited to 32-bits, the overall BO may exceed
> that size. For counting the total length of the BO, we need a type that
> can represent the largest allocation possible on the system. That is the
> definition of size_t, so use it.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-fixes

-Jeff

