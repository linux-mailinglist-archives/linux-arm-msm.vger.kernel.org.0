Return-Path: <linux-arm-msm+bounces-83770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE9C91E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96BB6352C98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC2C325720;
	Fri, 28 Nov 2025 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZCG08Xz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gdr01x8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DBA324B1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330681; cv=none; b=CkZmGT8ddNwb8OpdqKfB4jGgJp9Iz3YKtG2BMY3SEPqQ3QA0ft6nFkS+P+Vd8TnXiFozAEU0/2gurkbspX5VWMcQfXkq1zgu0pKvw7SHbR21QfbOWAoOtiHENhH9KYEhrZPVByc2RIUKRuDOAQvmiZcZc0dXJxGUgQz3wk3oR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330681; c=relaxed/simple;
	bh=ZLhllka4vtBAO5wU0rFMjOl8mSaCS5yAAwncApdCxok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APDP8kjYT1oR6YGiaGqBVH+l41qmur19misEWsf2NX0wMs5IxfQUIOdLMQRpqrpju+qZfSLO9Orp8/SbJEW5HNIlPkJc0uoXGcK+DnouHkuXgG/8N7lYOe0krYv6h3ac1LFv7L2oWA9UEiSFHSDMEP1W56ScPMD8RVaF0g5QRM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZCG08Xz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gdr01x8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8O5rH3476512
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Y4HkwU6VB0BlJn1ldJPRjT9M9YiOglI+VBFFOqOkV0=; b=jZCG08XzGLgRZ0k4
	XmRxd8ceviz3iln2b7gLfOCn5DgP8ZXNB9KaLti5cNCazH4f8CkDnfbj2giOZQnY
	IYHoJjUplrpPIRPkZ+41mJmG1N5R8Mr9Ea0rwX/jZk15OrQuSFhWIAiWWWxUNT8h
	n1SiLOGz9i1Gxu+RYFxi1210byXtVppg2a0qJ28gQ9+PxHbc38Dzjllul49cyAdg
	86GYK4G9qE7Sv5TPzn+H3wwE6dPJ5HyKSR6E5uwS3pAaQTRCi4ZVEkQaDRHh0eX7
	p2CD+sUc/OCu2x9raF6y3PJvgO8BBVQrpGi5oncZjJ0YP8gmi+8E4Ko49IJJBwcG
	2hMLjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpua8jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:51:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so6235721cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764330678; x=1764935478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Y4HkwU6VB0BlJn1ldJPRjT9M9YiOglI+VBFFOqOkV0=;
        b=Gdr01x8YnQ9kNb6CHWP21mf7YDJi8DyjtCEN4axvBzlYSnvp6oUJVd+L+2q+kobeta
         0I83SNz+HPheZoTp7tYztnr6OiufPXrF+4zl7pejCbE26aA2UO4wnz5wSX12eEvl252P
         0PqC+sXKh4RV2uA7GAe+Sk5c/znliYuLOD2HIGwKil43+5+tbxhV4ZzICNPWdaLDBjBM
         PVi6jfyUv8/RXVXEQnpS5DKzv6uq1MZPziOZJcxrN5srJVkAJJO1b7uAO8JDacwzJjqa
         T1k9/5tgiXQ9fJaJvygxvgS4gd0kOEn6ji25tet2AfURHwsIPnFhUFX35zIubM/HpuSc
         y8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330678; x=1764935478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Y4HkwU6VB0BlJn1ldJPRjT9M9YiOglI+VBFFOqOkV0=;
        b=QxDYM91HVYfh8JyfF1R/4tBPLxUEwzsrXIMeGV8wwotayznbEbtLdE4Wc+63nQ6ml/
         Src89DejzAwCHu+LjzZ9aGADT+01Nzk1edFZ5SOUB2IaBLBQ5rJROXY7vnDMvmggqrgn
         wYnszHH0OBZX7X+r9LOBzk5tk+5i2M/ELVUZtGgcObzcY6tz4gcprM9r5SKzTlVRin6s
         p9RZ4w60c7aZGYRn5Enhphh98VrlH6lvyytM9CGRRVUPFdop33y7w2i3siH3LuxkMP3t
         33sVhTSMQtOSUT7sk67ORa1htln7BMugQa9X7qNia7Mp/P+A86wRV5Uce7byefcla0xt
         gc1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzlbQzozjrhi35Bp9Z3/Rjb9oLK+2AJyQucgOKTyQ9gXRlo1i/BMs3mHML/L1/CIfzOHqvJ9Fo+6LCh6dS@vger.kernel.org
X-Gm-Message-State: AOJu0YzWbxDqCXR1DRKdAHLWVhO8OaF7hbSjhHIj3Q54v0ffRIntngtl
	PxSz9v42d2b6GQMLUE53To44NHfBTnP/un/cKrIfNVWw57lG1eij/neMir5w3EbliQ8lNOux1NK
	0tgEnQj2Yv7u0gxjyqO7WQnXvedsrG8x1P2OkNlX63SLDTxFPQlbQEnilrIbFbyt+1HtYAUvn5e
	yc
X-Gm-Gg: ASbGncvrcLm+hAY5NRA2Wmn7Ujj6hb78afHrkP/nDYw1QN7tezWqJyAVxznHhS+Dhwc
	jGoy3SUxIUGKlqTiusrQZMrCYSo+dOzdTJGJXB1gcV31aML3yTjUrB5w/azgZGikPZRwtQOOtQA
	7kzKEMpdte1rFrb35kfRFV+ctO1zHkvWu/tYlL5GU4szxhdVC0jSp/5Km8E2zgwK9iP2hEMT+jd
	WIsRV5zjAIN/PTxVWSQp1NKoxXJR6hukEoV69tzDy3GnrhT4jzq4sePad6gRp2xm0No/cUTMV4G
	WQQAdA9qAbjkT+jJXwFtc7BKpjhwAD6UeaY+HUSERGrKotJ6g6w4rzp6LEekR0ShlYlLTq7ZtaY
	ekV7YMTIub4stFC/OdnFDo+WWHyuheJCqZN1QDR4gGciI6O7Zdutr645iszNNCIUqJQA=
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr280595881cf.7.1764330677661;
        Fri, 28 Nov 2025 03:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMxKtaanSk+Q3URUf82to+nSciPHkyfagFqfh5vwhL9TZt0ajEjveHRGIRZfNRyTIsK7Pk/Q==
X-Received: by 2002:ac8:5acf:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee5890bf69mr280595521cf.7.1764330677271;
        Fri, 28 Nov 2025 03:51:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm444341966b.7.2025.11.28.03.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:51:16 -0800 (PST)
Message-ID: <60fe241d-276f-489e-9c74-677dd154b454@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:51:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
 <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 76bu3rhkrbJkAnRc8UPqCNQvVMF896aJ
X-Proofpoint-ORIG-GUID: 76bu3rhkrbJkAnRc8UPqCNQvVMF896aJ
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=69298cb7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yc56PbwcTNiI4aD9GBsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4NiBTYWx0ZWRfX8sSxsNCABvYn
 sjAcGGRepDdAiuzrBJDBqggZm58RAr0St3sGTRjv2+FKGT7u3yBQIqpVmUGD6lawQDUV90cGOID
 ZiNj7vK1zHaBUDQEv5Lg5ZswGhkTMvLruEjrFL96nBogkUuxRuzY7tzvBxspT8V1YTitm0P9QjV
 9e9AuJZByVThzEKdDU4FOOJWDq3fbdvWggw6ldzEhCAL4slTJR8/3husrDVQ5Al5Wv3rfnygk5Z
 kqj8mi0kcnylYn1tjADpdYPXSDGvMZE54xuxqpT1lh1QCFtJclReCV+UP2T58VOtdTsPpC4+77O
 Tb0++G3o8NDZez4Idmt6DPmiJ9Zjr5XWWu9HisvGlgljUbI/T/4vvOruJkjA2/H4t4xIw1ped0J
 uzDS6PnR2LqiHIlie5o3VkvazYMveQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280086

On 11/28/25 6:05 AM, Ekansh Gupta wrote:
> Current FastRPC message context uses a 12-bit mask where the upper
> 8 bits represent the context ID from idr_alloc_cyclic and the lower
> 4 bits represent the PD type.

<newline>

> This layout works for normal FastRPC
> calls but fails for polling mode because DSP expects a 16-bit context
> with an additional async mode bit. 

<newline>

> To enable polling mode support
> from DSP(DSP writes to poll memory), DSP expects a 16-bit context
> where the upper 8 bits are context ID, the lower 4 bits are PD type
> and the 5th bit from the end denotes async mode(not yet upstreamed).

<newline>

so we get

1
5	       0
CCCCCCCCxxxAPPPP

where C is context ID, A is is_async, and P is PD type

are the x bits reserved, or do they serve some purpose?

> If this bit is set, DSP disables polling. With the current design,
> odd context IDs set this bit, causing DSP to skip poll memory updates.

<newline>

> Update the context mask to ensure a hole which won't get populated,

"to avoid erroneously setting that bit"

> ensuring polling mode works as expected. This is not a bug and the
> change is added to support polling mode.

I think the main question that remains unanswered here is that you alter
the non-polling mode mask to become compliant with what polling-mode
expects.

Is that intended? Will this still work fine without patch 4 and the
new FASTRPC_IOCTL_SET_OPTION?

Konrad

