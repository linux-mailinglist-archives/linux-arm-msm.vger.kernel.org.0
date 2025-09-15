Return-Path: <linux-arm-msm+bounces-73539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA14B575AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3576A7A0596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91E82FABF2;
	Mon, 15 Sep 2025 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRi20XHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434162FA0FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931007; cv=none; b=brgF2F5k/st30vISycvjSf+I0cg8ll4ROGCZAeTJBkfVZnK8AJbTzZOxOhsOR3pXvsWM4AFR6+Lq5v10ZQE/6mdLMmhDJ7Du/KN127NSmPs0/gn2nIlmB0JGf7jHZVxXv/Soq2ZU8fbxWR5e4VHGHZoEpUwyYR/VX7aIwqTCh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931007; c=relaxed/simple;
	bh=oJqDS6EtytX/4EwWe7RLhEzC5GGSyQ3r5FauvRmpSDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ankRHjmUNej5y7NiMftHpbLm9GXEN5fY2Dh/PhFTD4p89+CbUtbmQl3iyvDM7QrFwXtgaaXs8aVSSIHVEabUNkJvUVe7YYhneapG5m/xskEb3VcR4OsK2R7glsYjI+ALD4M2BkS3T8xKPrJxFG6ar5ha1fGBqQb2QTk5zsNr1NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRi20XHi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FwqM014464
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJqDS6EtytX/4EwWe7RLhEzC5GGSyQ3r5FauvRmpSDM=; b=bRi20XHiacZCWbyD
	nnFhvTKCYKBcrF6pLVVEY/ILkKCb2u5bF6NaJll6ONizwWc5ANhK62NewCl44joo
	eajx0d9CD72YWNjWaTDFmScq8uDJY1Jps2ZCSkg87U0JNvta5DeJ4lPF+jnzPGVz
	KT2BtL2oLJJBlt7WyE7V0veIBLTpwQV2VRY3vsh6ZgU8PlaP5V2RTtmkTUOYpejL
	Jt5oYmVCftVRI1ConQJrqSposZdQ9caCDCpeguEuH5KeJg8B70aKv/y/5YsidhBH
	F1YN2ptpqvXsFzhMscvyrGoluMF7MRokDvrGpbfXl7YzixcZJajCETPRe6zwKB2T
	AgDvMA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr4qrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:10:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5228e3fee5so558802a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757931004; x=1758535804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJqDS6EtytX/4EwWe7RLhEzC5GGSyQ3r5FauvRmpSDM=;
        b=jPsYYXIsUKtW5nXvmrkK7/UYL6igHnKi9W4qh3a38XCNT2IfEgIuGtX86P7SqUukMz
         5OTCYlRzRvVWQ3scjguEXuKtqauvkQ+Usw70uQlFJK97rKb7+eAY1LG85oGAEnaVopV1
         G4GjwLLtFl3k9F5Rbwpo9VzdNWNewxUOiKNiUmHQPpdNHv1JbQJTVCDFhePjnGfsX53H
         fMNP1HS1U+b+4ypOu3l2gEJK7xqxUi8DABY9qq+y5cy9wFQxI/9VxXjd3LjtfjUIAHwv
         t/q5QK470zHfyvqFuskHtyi44wXfhLE4PcANfRHX4K9S1fWGowWHwLollZ9d4G6aGgrP
         S4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXO+yJ1M4HV9+EcOqenOrXH+hxW5Nzs3OHYbwEnEiqMGZj4oXGvuXwnak5KS3beRrPThXYdQln/o5+Pc289@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0Gb2OCO9QRtBaWv+D6jbe8NlJ+FpCbRCwIk8AHP3Bt6QGsh1
	NlCcWSdjfIQeIZTeVi/4BYYVF2mTK2FDahhUi/uaX4IxFHTYXhburpT7ZSGTIndvgbEGcO1s3XD
	MCT+DRn/1QbebHRkYzZyAaM+TjDN80gxVO4ObnSy/t91BYzoq7ZFV/7p51mIYrK+7A+el
X-Gm-Gg: ASbGncuWx6SBav6XjOAXUAjrkRg93KverusuuxN+gB6ax1MRa8LaqhfhpXTfuO6mEVy
	slzoR7EEN1ESHjroTOVPnWfnLYVXS783avQa2hv7sOifjudWvjmXbSYrZHr/AabqjijAqi7Dsvy
	0dsYlXBn6tH+EZYftHuNMfwEY0IPiaQaISLsP977Wv4zZP/QsBTkK2kaGmN7SQyjVQFXT/w/4Xz
	XvTMqrnP1nbzOFKhFbt/XemkPWnfIYbBDeImfVqeTKfWk+CDVenJnTsNMEYx8yKlh0VYi3UN3zh
	pX9GGQPwH1tQiPm9hUzeOC7/gF965Ug8nYe6rjvHQT7nauCG2VD5se2m8E8OeaC8SZFkiGIkuqm
	33OwCgN3v8Rd/KGQdc5Nsvu9K4LmLcCQYE2c=
X-Received: by 2002:a05:6a00:7608:b0:776:165d:e0df with SMTP id d2e1a72fcca58-776165de1e8mr5272817b3a.0.1757931003875;
        Mon, 15 Sep 2025 03:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+aEaZbmtt8mkehB/0dhBi1/0r9uuMfBdz44WzDP2mKLR/7wRH7bmQR6ne33XUYpBhPwb1w==
X-Received: by 2002:a05:6a00:7608:b0:776:165d:e0df with SMTP id d2e1a72fcca58-776165de1e8mr5272797b3a.0.1757931003421;
        Mon, 15 Sep 2025 03:10:03 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b5fasm13129962b3a.16.2025.09.15.03.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:10:03 -0700 (PDT)
Message-ID: <4dd37b1f-2175-4759-a250-fee4ed2bd39c@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:09:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
 <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
 <droyp5atpjauyttqkwqzk64kkghg6jkkubvfz3zlbrodyzlvoe@fbns762o6vcq>
 <6bb0cbd0-d3b2-4359-a2d0-6b757f66d0e0@oss.qualcomm.com>
 <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <v3vuphn3n4w6ynpaqeosechjdcelomn53atwfotka7izqvjuid@nnvdwxqlelrp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q7Wseoq6zuJdYrOUwnQ1Jzl7xufsYKwD
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7e5fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=3s9BUBv2AkJYRnd1iEsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX/m1oiFnXKdCi
 M87ZLHqL4GbJ82tdJheFRLFVBD2ju7riYhzMahlQLeCZla0NcxRTmHZ/GzdqjNE6QdfSBCAEpAS
 mqUQKtj/sHC0fzz0jFWyPMYhMig+1ISredE/moMjBxrL3Wi87YKr9HtBpmr/JZMIN5t7mafNe/O
 mBH3WzrlnSG+t9VF6o2APguQdnRKsfahPpr12mj12eR+bZTwTinaOYNd2FDjFiJTEec4wvmnKQm
 5+UCc6mE7vE+0pNYGTWF1jtovLIv0GBzS9Krtdp3qoiR97+WBo4UhDiDoItT77vm6Jq0nCqByVD
 rO/vfflT7j0xpYsUmtw1Y7kW0y8gT6c0wZ1lrHMGDofCVZiap8Pj6+fV0o0u9osRotlJKMoQqnu
 h68XWTTC
X-Proofpoint-GUID: Q7Wseoq6zuJdYrOUwnQ1Jzl7xufsYKwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000


On 9/15/2025 6:03 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 02:26:12PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 8:10 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 07:54:31PM +0800, Xiangxu Yin wrote:
>>>> On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>>>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>>>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>>>>>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>>>>>> potential issues if SM8350 support evolves in the future.
>>>>> The controller is exactly the same as the one present on SM8150. HBR3 is
>>>>> a property of the PHY.
>>>> Ok, will update commit msg.
>>> Please red my response again. What does it says to you wrt bindings?
>>>
>> Yes, SM6150 uses the same DisplayPort controller IP as SM8150. I wasn’t
>> previously familiar with how fallback compatibility is defined in the
>> bindings. Since SM6150 will be declared as a fallback to sm8350-dp, is it
>> fine to drop the driver patch ([2/2])?
> Yes
>
>> Here’s the updated commit message for [1/2], does it match your expectation?
>> 'SM6150 uses the same controller IP as SM8150. Declare SM6150 as a fallback
>> compatible to sm8350-dp for consistency with existing bindings and to ensure
>> correct matching and future clarity.'
> I'd prefer if we have "qcom,sm6150-dp", "qcom-sm8150-dp",
> "qcom-sm8350-dp".


Ok. will update next patch.
'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp' ...
fallback compatible to 'qcom-sm8350-dp' ...



