Return-Path: <linux-arm-msm+bounces-85038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6FCB59D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 12:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02B023007244
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50629308F2A;
	Thu, 11 Dec 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LafOdTpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHy4N4Ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D23081B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765451720; cv=none; b=aF/pBK4PdDRaigor+/vQ5AhQGkGrRYJkP+yTm2gZlwLccSVFAM3zlkt2Zpdq4TvlceAC4BfhSXXtzk5woQP8m7Qp8dPks6Xsd2XsCWBH6fthi2H2+XpU9JHEgoI626GzQJ04fVWbLhT61N8myZ1pEY95MX0/YPIBtVg6s2sO7+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765451720; c=relaxed/simple;
	bh=/56wEk5oxEdRpR/Ikz/xEIcyk13lQGme/dBT8/AmeL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNdFXYaHUu9DryMbPEl6jNzf4sQqwdh2SlOCqvtFWPBxOKffubiPdGDsTdGxvBsQP0AVI/shHuKXNqKZziYlWEPV2wQcMtAu4jkahjWc+SbXs0ZoVdO5PNAhg9W+mok6AQamHnh7zNfxa6HflHlq5alYeZgF8Jr6NtXwhyhbNSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LafOdTpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHy4N4Ay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXu6v1025202
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSDJIkZ/kgfJ8nsQAmHNJO7omg5kFKu9jW53R8INz8o=; b=LafOdTpUWSCnkeU4
	KaqxXVqjj1esztqoK4zfXE7sYpRKHrU83H5DXg1Aa/z7IPDfb0VNbLbrRc5Lcvbs
	6SKbNnb2Xmj9Rs276veTvXH7Rsd5UKaFZIZTnPped/ypSxlaAoXR15G2TmHWyMKI
	vSbeWJzDP7shIofnCNKTKJCgvvCKXocg88PSOMINVgdefDgG2NRGa6QBlj/Wi0xT
	jOByL/yTpYQvcgCwQsEkg4ahZe4hCmyBtNUr4mw86r2WJZbwNxendm1Bco0jDqXm
	eXfMBagoEIrGpNfmX31hC94H6VrgUKKbu6RCYiNiGr+iTIIE11xW8u84+VPf8+Ls
	HYIBRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpagwet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:15:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29557f43d56so11876005ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765451717; x=1766056517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSDJIkZ/kgfJ8nsQAmHNJO7omg5kFKu9jW53R8INz8o=;
        b=eHy4N4Ay1CGaGuEgas8CO6Azgi9hG1lJcKSB+lvGp+TL+C+4t+W0D7Pa6LlBLvqJQs
         S3KeJ9jw9TcXBCU2FZmgc7r/1NGLh3vdMwcvEdoIAC2iNvU1fFGWgQAwZYYOy3qIWzyz
         26MB7LiofE18ypdZY66AmIP6hMiGOXj7jQQhWMU0qHDwKhriXJHwjy5Ypl16Qjp96tB4
         E1Ok5p+/DpV+fVDa0oU8zUuCo7okuG4OsXaVpxu5L6jHX1Euk24ixW01ZCC7BB4ab0ZW
         /8k5OHxvaU5OmGCU/c0Spgiqpmn7SeOUDdwRyTI9F7qqqL6i+ISHffCh6uhGsPlCCzZ/
         5bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765451717; x=1766056517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSDJIkZ/kgfJ8nsQAmHNJO7omg5kFKu9jW53R8INz8o=;
        b=o+tgMdnFCtx2tZ5qS3b/5OMPjfJTmkn4tXHRB5LfK5DWv7Q9ARM6zW79fOW0WgcXQ5
         Lh34JiSMGzRqTfJbwgD8mY1MzC96kkYOy8ovJehnJRPMyYRwaPGyjG7DP/2l0Y0B4uyj
         vRAIrvMbepdzLzgL8qj8+sHhg7etTLGxAbhm4xym5LPbTeGWRgMkOqIG5VX5nQngtxJF
         ylmcH/gsP2dzu4VBWPqQSNzCMoXi8zQROotzTqZVOQ1A8jSNTMrTwDpBYboGwpHvFlyD
         VaXXJv6XStN/5OZx/zPsD7Paa0zRScLNcIMbam1gkoEQKzzw5P1yNxt7qB/EzCUFm1F+
         VjYA==
X-Forwarded-Encrypted: i=1; AJvYcCXlvp+08NCBi7rg0LCXL/sdgJx80A6SjS7m0SouTdaiGlQ9sHy16IzBSgZe4PypPvPvRSNstsr7Zr5PvuH4@vger.kernel.org
X-Gm-Message-State: AOJu0YzdI09EmRpniV1IFn4X2J3OHdATKm64b2jUITh4k1m8EuI2G6zE
	gG/POmVomhP1juEg79toIpSZ4QI4eeAWk+mv9tco/1ObOj/oGvcgLC23C3yITDJdXUCj10QA95T
	6xEqBhbD5EN+GtFWYcmtBfEQxQ+LYNY3AWv6dvVz3+A5YNfo92UgACYB4a1CEb7Ib3Q2P
X-Gm-Gg: AY/fxX7tAhMw0m65Mzx6k3JTbvt2XRVlQKucCU28Y0FoU1iq8zNrNi7Qx8FHgPZiWUi
	QJxJSa+bNu7ZTd1R/iNzH8+3o34RO3IQtdp0zcWY+qWKSRntxXuD6cTTjmSaSTgmdbfv/O4BPVG
	qWN5lORrEGtP1w2etYUvH3cwFKKrIxTLlrKov/YM77WuVT5Vj+ofyNDvGYABHY7rCxJZKZ3jQcI
	prB7qSHu/1FxpmbxPnZDIRPZo4bbGFVJtaPaX6drCr59K9C3CmPzQtRsRVik7k4EzQ3EV0b/dMy
	UePTb/A/KBoKHLvMhP2XHzc0ztbelhiiulu0bTS5jb2ckCLQ8P5jyBMxHt7OhqyAToRzVYlS9O/
	jPxg1vykaQqSGlqj0p78cMtHdoOSTOwO40/IXuCwU
X-Received: by 2002:a17:903:3c48:b0:295:2c8e:8e56 with SMTP id d9443c01a7336-29ec27cfbe5mr58575325ad.44.1765451717230;
        Thu, 11 Dec 2025 03:15:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgUIcpWiaiYMypabn/hvz2jnePYWRhJX3RCHZIaHrdNJOAfL/GGmE34tidBCTZqvbSQ4OOmQ==
X-Received: by 2002:a17:903:3c48:b0:295:2c8e:8e56 with SMTP id d9443c01a7336-29ec27cfbe5mr58575105ad.44.1765451716781;
        Thu, 11 Dec 2025 03:15:16 -0800 (PST)
Received: from [10.217.199.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ac2sm21778355ad.49.2025.12.11.03.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 03:15:16 -0800 (PST)
Message-ID: <f370e56b-21e7-49a7-944d-b7c10b3ea628@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 16:45:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Enable cpufreq cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251208114558.2343462-1-gaurav.kohli@oss.qualcomm.com>
 <a3mzhjs3kl7yfrar3gh6p3benvfa5bx22xwuznaqlhyytlyxkj@r5p3vfd3ykde>
 <87454dcd-9eac-47a9-9d0f-e2e10791bc6d@oss.qualcomm.com>
 <ufngcyzhuisms6sljw5xcex3pyddf56ml244wbjn2ih6c42jgq@al4gsoxoin4d>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ufngcyzhuisms6sljw5xcex3pyddf56ml244wbjn2ih6c42jgq@al4gsoxoin4d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rP4Y1yx2EfbTm1u69hN1YWmdpAZdZ9rE
X-Proofpoint-GUID: rP4Y1yx2EfbTm1u69hN1YWmdpAZdZ9rE
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693aa7c6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1ojdLv5BI_bAC9Rt_YYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA4NiBTYWx0ZWRfX2RDTn6IlQmaC
 aNdYTeXJfIEj3IeZTa38hExjQq8F07yjdDR+u4u1YiJFA44Tz5otIgDkXTPCIEd3vFCf/U9junE
 U193th0x7oX+f6UUy4jEnltEL81tzCAX54Ciw662mGEg2k8mpRfzr6JStrMxKk+wm3gzhJWIFD9
 hasWNFIJJWeBkfPog6uAO6kkcSdOD9GSwDrtAlZDGInWYj3FkRF4ugSgz54ePTLxJjmZABGeFoc
 18NkpDVRqwJ+S2Rpr6AIAsQO62hKUgHA0t/MXZFktRXFjSAMWVnKH7Yry6sf27HL201FpyPJkU8
 6BNssGXJhmAsCwwn4a+SqhTWbHn2J8YITEbsURYLzcRd2pLih/Is027q+mBkdYePOgE/B435MRf
 ESxf+Fl5myFywTyOf1Gr/Ag5x8/s4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110086


On 12/10/2025 1:45 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 10, 2025 at 12:37:05PM +0530, Gaurav Kohli wrote:
>> On 12/10/2025 1:38 AM, Dmitry Baryshkov wrote:
>>> Are there any cooling maps to be defined?
>>
>> We need it to configure from userspace daemon.
> You are describing behaviour. Please describe the hardware instead.


you mean without defining cooling map for cpu, we should not add 
cooling-cells to cpu?

thanks
Gaurav



