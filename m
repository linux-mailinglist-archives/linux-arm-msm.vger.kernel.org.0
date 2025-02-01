Return-Path: <linux-arm-msm+bounces-46643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F2A249E9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E301884BFA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A46D1C32FE;
	Sat,  1 Feb 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMayfFx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE71C4A0E
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738424103; cv=none; b=cLjqpbQab5oufqmxFkg9W9EBpaMfZxCCQDJIHf9t6Bjp1HQbd321gI6HU8Kc9oZrjtD5bJkd34Rgx9qFck/3mrLfLAyhfN9L3jxO55jq1k8hpVT8lz+tXzL1Prvti8O0GGVVkeKz4B+Kdv5gXfAuBbh0hjgrNPOUyXlDAPaqehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738424103; c=relaxed/simple;
	bh=bFAlX9Yw3zAId4rQvxlQtWfQn87XYaykSHeA0KAMUz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mt7mIOX80RKq+eVsD6fvqlw/SEb5s58PejhtXH5e4Z7CSuMPEvGPNmaCwXx/91OxA5UHxu5/OXS4il3ZYyFpZioYNOiOqvudX39o6Pxnqnm2KzmM7vc4fZjY4MvGi0zwgCsOwWbP3NWRs5wSEmS3EK5d3gNkmYWY95nIfLdbg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMayfFx8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511ENiaw001918
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Feb 2025 15:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrIrvnnRIyc/5mFkHnsqUBBHTVd65NqEjNn8jUu18Sw=; b=VMayfFx8FntlmzV3
	uPSCFPGIQrwVmxhkauAST3rLjpqa5JzsyYgcui99R6LNd/LuzsBKCq0eLyJPsF+5
	6ngzyk7aJjOqDCYlw6TXyVvJCCv5N1dcradV+cWfUBq6CBR5ylf/RkbFgGR5iMYT
	tQkuOyQeDK8CNgwqQnX/+dtaLfsHpeITMW4fhcDzkg7DduAak4AwpCQXJ1M43RrM
	f+FPmRESNg3L4wQ+oXZ9xFFt5iBqTOqxb6jp+aBYE4yXQv0s0TgrleXHrvO0nTKI
	ffpS+BMTXQzlANZ/Z1k6N1uCSPHJtO6K3oH5YllRnUXlVluTIj802XBjaeHZxkZA
	yohOpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6s12fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 15:35:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f85325c3so49457385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 07:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738424099; x=1739028899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrIrvnnRIyc/5mFkHnsqUBBHTVd65NqEjNn8jUu18Sw=;
        b=Y/VWAJ8fJoXsKxtjIWZ5KHWvBY00RwKUiST21EvR6+FJRlFiTs/22+oniTPXXCWSZ5
         e2IWsMSREefZ6QcMqP4tHftYXSPrutJfPUFEAccZUxidUCDFbTTRCD+YH/FUGvMas7Lk
         C2Y94NQ0X7ptK+gcDcsfHw9/poKxI38o1gl6jRCa4Xcgkt9zq4yRWZXTV7znlyu8sPgB
         uyKesu73//r4gKCv7vjLwdrsmOzCXSdVKlAmg9H7ZS8meI0YFSPz16clx/sdWK6F/I31
         xy93mUI+tRcgVePrlO7OBV/ccNZ+aY1lah+EcFFYQP2WDPOEOdsRGMJnCwHNxTl0miWj
         ZEfg==
X-Forwarded-Encrypted: i=1; AJvYcCX9neTxBycE0qyxh+fHixTSdnooCvMJNSAl3zeehLww4N0g+u4+Rfm4Q4CZQsM5NqW7jFGs8gK8PtFauvYF@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRo8Q7BghX/fFhVMX4EBja300H+HNQnc6I7JzoCdU9gyGnqtV
	YtMmDOAO/SZxAQ0brXsL5dc7TsBBNoJ9uxQgRLDlCb6XTxMA7wUMdKwEVRJ1GjaXZcgEZhzpEWR
	KNTxXvmyOpzUJhKrvzGgPOTZFpHwA1qTU5fXkcQseF4fsbtQDoAhrdRMJfePP6QsO
X-Gm-Gg: ASbGncuuQFTUTlOZ8IlalEbw+QiGupat69jjWStYhhwj71//xTDko/7iPxS7HR2uCUd
	DscQKgZ3kHGkX4v8i4njTxuXiScRrHf06bk99g+qcNMWTxRvJ7S4AAd1st94aTu6SxVCiGkofOl
	VpUxeD2UXwHuMZ0R+9u7kXPoNh3uW/i/W05N64grytk05ppQYo0jUDApJTIWtEX7hltHzn3Eb6r
	vR8ubM/8H+xeNBam+SA5ZB+fcjNNKvgzbsFzkF7w0v8nNyP4ZKUOI8Jgc1CeEm2OGjvubn4uOZA
	bYRA8aWxFZnzuF61r07HlzDqlGVzZzTofbKd4jpKVhuJg4u8GLT2o+yJ3Po=
X-Received: by 2002:a05:620a:394b:b0:7be:3cf2:5b46 with SMTP id af79cd13be357-7bffcd08abcmr854076285a.8.1738424099477;
        Sat, 01 Feb 2025 07:34:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFirUnyGDgs8wPVUM3euWC3sTxD2Z//mPAJqoUOuR3NowkG8sTRXo2rMo1sVSLvEobVTe0hVQ==
X-Received: by 2002:a05:620a:394b:b0:7be:3cf2:5b46 with SMTP id af79cd13be357-7bffcd08abcmr854074185a.8.1738424099055;
        Sat, 01 Feb 2025 07:34:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a8005sm454195066b.32.2025.02.01.07.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:34:58 -0800 (PST)
Message-ID: <018281e0-001a-4587-b775-a9df6e54f75e@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:34:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 0/3] platform: arm64: Huawei Matebook E Go
 embedded controller
To: Pengyu Luo <mitltlatltl@gmail.com>, krzk@kernel.org
Cc: andersson@kernel.org, bryan.odonoghue@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, robh@kernel.org
References: <33f8a68f-46d8-472f-8061-52800e5bd014@kernel.org>
 <20250201073838.3278-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250201073838.3278-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nz3z1wjUaQM6l2KUc2CpKtZ6Dc8ACMN0
X-Proofpoint-GUID: nz3z1wjUaQM6l2KUc2CpKtZ6Dc8ACMN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010135

On 1.02.2025 8:38 AM, Pengyu Luo wrote:
> On Sat, Feb 1, 2025 at 5:20 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 31/01/2025 10:21, Pengyu Luo wrote:
>>> This adds binding, drivers and the DT support for the Huawei Matebook E Go
>>> (sc8280xp-based) Embedded Controller which is also found in Huawei Matebook
>>> E Go LTE (sc8180x-based), but I don't have the sc8180x one to perform
>>> tests, so this series enable support for sc8280xp variant only, this series
>>> provides the following features:
>>>
>>> - battery and charger information report
>>> - charging thresholds control
>>> - FN lock (An alternative method)
>>> - LID switch detection
>>> - Temperature sensors
>>> - USB Type-C altmode
>>> - USB Type-C PD(high power)
>>>
>>
>> Why are you resending?
>>
>> Previous version was only week ago and minimal time is two weeks. Plus
>> its merge window, so this resend is unjustified.
> 
> Sorry, I am still new to the process, I may have misunderstood something.
> I sent it because I had got at leaset one reviewed tag for every patch
> from the corresponding subsystem maintainer. Can I expect that there would
> be no reviewing? All I need to do is wait for it to be applied.

Generally if people have a concern, they'll share it with you.
It may be that one review is not enough, this is up to the maintainer.

You don't need to resend after you get new tags, the maintainer tools will
pick those up when the patches are being applied.

Patches are generally not picked up by maintainers in the timeframe between
stable vX.Y release and vX.(Y+1)-rc1, this is the time when Linus accepts
code that has been sitting in the maintainers' branches for some time and
getting build/functionality tested in linux-next over the previous cycle

Konrad

