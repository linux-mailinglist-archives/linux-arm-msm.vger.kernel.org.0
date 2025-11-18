Return-Path: <linux-arm-msm+bounces-82318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEACC69A40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 05DE136868B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EF1354AC8;
	Tue, 18 Nov 2025 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHwaacsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKT1vAqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1234F25C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473307; cv=none; b=jnUCmsOmyrLQR4Em8Wsf7OH3pLVdUD3m3zrrx0rFIevFlFvAzkBgMkqZ+ChmY4LOERL1msWZaiN8u65lC5lSdqdzsPZF9mrwuaB6+jcWjtypsbYshA61RyaSP05cou+jmf37lkzbq8+ohBZNoxwbnn3h6mT9zPmMZ0XROISYPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473307; c=relaxed/simple;
	bh=Zo8K2yUnf9uubFIzjR8kfvtCxSbWPa+RPe4pt+y0sAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVxgC/3TzJRLN7z4U1DavDn4cD7HAW1uKT4ynwnfaWO+AD7sJGfZgcIXPSjPqkoZoOCUCXcD8vl2uDlHKjv122y9+Hs2h0j1AA1mNDljpO/nxZN/7KHB4wtZEqV4N5Or6FagT/MLzCj1mv98aSM2Mayx95RP9/DNG6f7mKmJIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHwaacsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKT1vAqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAcA4G375643
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqRV2aVVd+Us1s82VVuj58sUCW2v0MN6BPbX+PLpd0g=; b=dHwaacszWgUkcRdx
	gxzK9IXVoA8YvPwRHKvF+U6RtAb6N9x8pA/YCQmWZttBBnx7OncZgz2XGEfSlVXb
	SfSfRrtBxjT5w7cU1dCw3O53XyfLkbRnBufksmBWwLSMrTIyRPR25C4I968eNSXL
	IW0K9mHu9/v/oIFbPk8JDiKrQgtKuX6PBXL0aPTYar2koKrtaRnLp05adGDYcfOm
	dgm0b1CqLovmg7AqWrw1QsIq2lQQ+fmGIoiVYnVyKh0obYS3G1TL+7cZrrGDsOG9
	Fr2OJBrH0azhHQWeghRjIqUCU/0dWDjGQUSUVKfuGnlpWkrs2dr5F1HWVA+RebGC
	X3UXsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nk945-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:41:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso10274301cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763473304; x=1764078104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqRV2aVVd+Us1s82VVuj58sUCW2v0MN6BPbX+PLpd0g=;
        b=IKT1vAqmdal9mQ/s/AxAwcETy0Bdof6UIVWI0bio+EeLccdfq4ROJnuavt9FShdPxA
         lbOlVBCZucHzOFlyWi9jP+zSUXzZ3s4gzxcuDry+DZn9gtv8mJYe0TUw+GiWt8ilc4RM
         y4KYnpoEbwFLorb30/bcFcr9qK3yCsBp5DUGxAg6Axuzckl50SpOY0JrvlMGurdyoUxE
         gGm9a11H8xIVNXbTybLsxwhRQXm378W3VFudvR4TLwP93zHm8i4Oej1BeqE/AqmVkRKE
         mWz3btOj5MpLpYH10dUwFrOMm+5umHuh1Wyk4M7/HlHGF/fZcRTgJtDgXy5EqdZw3c34
         Wjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473304; x=1764078104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqRV2aVVd+Us1s82VVuj58sUCW2v0MN6BPbX+PLpd0g=;
        b=lT3EF4BjJPsG3OQP4Bfwes6kP9zEwiwZg5uIrUAOYTaE7YP4WvkevUOP+GMQv1zPR2
         ivGlFaQ2FnSYZG+wWtTX3ePpYakZ2r6YmohBu5zVsO/Z9tcMoz+bzxXvXpZTMMr3DNok
         UDxV9AhHJYFhnDWOj+EsJGhkU10862PGEcsf1e9IiCT9ETXN+By+iAO7t1o0vx0RUVQN
         KMDoix2bQYJ8V3UX4QsPXGsVrmqVaMmvlF4U3m16t1p94bbVm+eXRgAs45zkA8DUOr0+
         ysTUXqZ4hnTBDXI2SS5+5jxd+i+wKJXfJj4zskCc3/bZK5pbt+RbpUGllZrzhpuIO0lB
         Ivsg==
X-Forwarded-Encrypted: i=1; AJvYcCXMNyB534fsHtSevX3Kv67f7CN7Ia9h1nbEbVSKaqnwgv0BWmLVicNwyCDEjwGu5eVTYNbOswMZpdAa4aa4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++jVrOB2AizhW8JFibJkoouF+ID5EK7IRRKYb5LBzR4bO+ja0
	BpKoQvVJ37u/cwq+xFRTWisU1JdFKF+pGlYHSG5+QcqIFV5rjLe3uSvdC8N74ASxPxmNpxRlt8e
	cbf9fQMRsFG66mS2MLP207vGjmOULp8fszKLXXrkibh4yXtYTb4LGjo4BtdnYjFzsKjLa
X-Gm-Gg: ASbGncvauv5UfT09A7t0w4GdhHJzkf+MAwt7NIsbLFKVV2jjxsJcasS+KCXpB3ZKnKS
	m9p67hiC2j/+HNv2XCDl3Hmm/GwfO3hfOpdKBk3ioo/H1cRAClebu4Expua1WOCKJX6mw7nLzNs
	+9vHM1+n5Zacpr1mcUAlTz5QSXfraS5jUu+YR8DmE+CmSOsyI2TeU7IehwKltCUy+Ozkj4otI8T
	/Lea2z1lVsqf9/tkIfVQVFJVb+t9SlIWP/OGaVvb+E3S4EheBv6maT/f+lzZX03ppFpVtWvA7FP
	ose/UnfB2PsZcSpDgYOenN9wqU2r1MTswaIvsc+wHC06Kqs3d05uAi2vYsJNOm0aW3AtaP5YzhN
	rc9gQOlxJpnbR3TfKBeg+VAGLEEaxx0PkVFDuh75o95uPqe9Rp4LA30DnUJBgRBfsJ9U=
X-Received: by 2002:ac8:570f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4edf202fd18mr175516041cf.3.1763473302422;
        Tue, 18 Nov 2025 05:41:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2L5dm2T1z2wEDohRTNQGcAvzKF98sJtsZ9cN+Q3K8DeR9Z4KdenAu1WYqthASSoj5p8VKjQ==
X-Received: by 2002:ac8:570f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4edf202fd18mr175515671cf.3.1763473301831;
        Tue, 18 Nov 2025 05:41:41 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda8da2sm1322499966b.55.2025.11.18.05.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:41:41 -0800 (PST)
Message-ID: <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:41:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
 <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com>
 <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMCBTYWx0ZWRfX6gJTNvLBqlrw
 KKtwxzZ4lzm3D9b5Pizcyc4Cyk2JWq8e+3gtLzY6sGfQOcREz5SDClX5WrkO1T8hY2y85emd6gm
 XTcvaUwbv25fStru9m/kw5y17nNdxCtqcuEtZPUwKd4TE/AL2ZkhecmwtRr76CyVBV23UTJ2dST
 Pfj3DFSnj3Qxx7yCRlccEmmAnfS/davrQ+Io+aOcR5TcCX4P7PJntkoT770c36ArGLVkj4mJLFG
 u1eedp0sFbwPxVtl7+nxO3mdmx0pw6HuIu53tbZp0PE/KYnq/H7DV30Yrcj4AHWUS9dyMb17xWK
 AcH2KRyGrjeZ5LpTwWCVofCqrYP/sfbqteBEOQxpadiiR1zROLjpnbxk9v1ZUFXuFGd0D8IFhbQ
 mvBQDiDefONYsHjwMm9Dkm1REdi+aA==
X-Proofpoint-GUID: oLBwXZm-WjufImLX9DTfgH7XdAibhqtD
X-Proofpoint-ORIG-GUID: oLBwXZm-WjufImLX9DTfgH7XdAibhqtD
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c7798 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=wtcFHR801LI_0YcmPCAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180110

On 11/18/25 2:31 PM, David Heidelberg wrote:
> On 18/11/2025 13:32, Konrad Dybcio wrote:
>> On 11/18/25 12:30 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> This adds initial device tree support for the following phones:
>>>
>>>   - Google Pixel 3 (blueline)
>>>   - Google Pixel 3 XL (crosshatch)

[...]

>>> +&adsp_pas {
>>> +    firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";
>>
>> Sorry if I asked this before, but are the binaries identical for
>> both devices?
> 
> Yes, there is only one firmware, which crosshatch has different, but all listed in the initial bringup are used for both.
> 
> To add, crosshatch was somehow not that popular device, so as I've been suggested in u-boot discussion, I would love to keep blueline everywhere.
> 
> One exception is LineageOS kernels, where they go by name crosshatch, but again for the both phones.

Google seems to suggest crosshatch is the 'base'

https://android.googlesource.com/device/google/crosshatch/+/refs/heads/main

Ultimately if none of the Googlers (hello +Doug) care that much, it's up
to you to choose

Konrad

