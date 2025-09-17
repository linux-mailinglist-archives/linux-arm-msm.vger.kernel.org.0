Return-Path: <linux-arm-msm+bounces-73977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0649B811EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 19:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99AE27A537D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 17:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3443D2FC892;
	Wed, 17 Sep 2025 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUEtssX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981422FC875
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758128796; cv=none; b=FIYhqDHq3UcER1PZR5Xt/deRdvk/Tt1SJ6ZQL2K/sZkrLOruxUEC4YXyuAS8Y6Llq0JsHkftqYKnwRZKRueRjBRDYQkefNph2q9JcSB0ZVsZwUZaWENx4rWi6DQWM0rJ2d7DutRVV2mvD7I8sulxUzqLm0Fja7NHUlCM7thLnb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758128796; c=relaxed/simple;
	bh=76CbFOoG7fO8/knkAO5zHOpDO4lOmZ2qmfgZf2rMkng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBNsRBLPmyfxN8+YrMOc9Thj2TvMIfJv6SLePaUEgxOACZxS0z5tCrR+QVupH2n91pvCDg+I6Ih4gsvDPM1/LFTAkljg2LGRa7bjhxJXGR9aU/LCY0F9GEK8OxpqDUZ6m6ujg/EnMzC7EoqJbkU4Cu0ulhmmocQ0d/RIWhuHxdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUEtssX0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDGVeF004300
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 17:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CldjWF1Kec39RRy7IefPImhF3OKmtV3emAzZ2/VbBsc=; b=TUEtssX0LEp4+Yxj
	JKISkX+yfP9FaUzYI7MnA84nLIbPhWzkDwswuy06e9tZtu1ufEXn9TY5FHq5KtEQ
	QOk2Sj2p4JsG31ZA20mZYG5t9YHKpHhhAVoVeBjdF/eLpsxoUHYoORtpDBHE+DJ0
	8chO+dMThHKCxYrIZ61qXJLb84+83OE+DDc6ZvHWTGHUKtyQ2molI6e45D4FmTWh
	KIlhcFt37AQzo8ZA/XrIFFK/5ZM2U02MzhYZUWb9D1ATL8BYQ0P/S3RVy/sWfa+W
	MaBeAURM1jxhrpN+VzmWeh1tOj9sGaKmamNMjLTXLuk+1nyG7hkXQdrphs2VQmIx
	7Evx6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgrrbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 17:06:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457ef983fso558235ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 10:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758128792; x=1758733592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CldjWF1Kec39RRy7IefPImhF3OKmtV3emAzZ2/VbBsc=;
        b=KWO7tF9QFXaIeohSMW3tDQbBiEToqr+KZbAGboNtwAK5elJ+zS4YHic2+P+zSwarPu
         IwiIQl2fb0f0o+UeL/LX6hUe1IhvFt3Sc/i9UjTKKoPQ1x6reJzCIDOhkMGYw5Ok3mhv
         sC8gaRXf1HQah0ylnHOnQi5Kn2G0KsVdG9CIn63pjdTgGrlNRjB//mPwoAFLhj8Km7ik
         loWxrYKzh4gybmJm9NISiNiDbdwQlakHXBLJ0gCkzKRRIKjZetqcHE0ROq46gXE9bhoK
         E72LzYeu8DhB4hI9oLaPCrqRAVZo24NDchneV2c4sWi362I6jvBSdhGwCc6q9gVIagFX
         JJNg==
X-Forwarded-Encrypted: i=1; AJvYcCVECcG8/E7eOSA5b46ecFdHn70OUUHdJrwTot+OVfg00rYEWk9s0UVHAmr29XxuNqa+ab3C04QI63oFCaBp@vger.kernel.org
X-Gm-Message-State: AOJu0YyuQoiwu+0/8aFKBJf0zRKnBDHamPeKIGKe1aka5jqLMX3/6RUB
	ja9hIhoOLd4RR+EDW6Fe9Ywt6xg/KU1V9kH/8FmK7F3B2+mcWsKQV9kmriWMSH0VufM1f4t6BOp
	q1yBbzVwm6bTwpwgUeDdsT9hdDFCD+ksgLyZaO1v5Q9cvE0wRtlfAKgogttL1LbNTPjOs
X-Gm-Gg: ASbGncs5Ggqx1z2AyM5Ku4dXpv0a4a6rzaqN2cWzlihg7Z6ZYQcN4lBdb4tboET6YuX
	OumwtYCAX0rhahtEfvFda9EjuUYZPLMEkfOrQtNx8VtsdSHgA7b/yK//IAR4gECzTsK25StIxmg
	E0x3EONEn7qpda6vPpq8N1r+2CInDMAtT7793yi9c7B1l8U0XV6ffdJkFyhJ2Wpf9mYq2V3diMy
	qb3I4fhzwvWxWtZV6kqWy8peiBMO+K9QY8YnFkqZdYRHT2cgjDZpLAl2RCf/up1APg1W6IfAiVR
	av8mExUajUa2bD1CVrz7APkww3TotPThyxSREJh1PswJMKMQTFk8sNpW8XKZXjk=
X-Received: by 2002:a17:903:3d0d:b0:266:2e6b:f5a7 with SMTP id d9443c01a7336-26813d04f4bmr37704275ad.58.1758128792171;
        Wed, 17 Sep 2025 10:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiYS06pnxVlJyVc8usIQK/iQa6m8Xw/xXXNj5CZpC/OXWCWIJ7/dsM3zh0SSUhq8YicFepBA==
X-Received: by 2002:a17:903:3d0d:b0:266:2e6b:f5a7 with SMTP id d9443c01a7336-26813d04f4bmr37703845ad.58.1758128791682;
        Wed, 17 Sep 2025 10:06:31 -0700 (PDT)
Received: from [10.216.34.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053dbdsm1270735ad.9.2025.09.17.10.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 10:06:31 -0700 (PDT)
Message-ID: <472265f5-8463-e0ed-6386-f52478d4f2fd@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 22:36:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 01/10] power: reset: reboot-mode: Synchronize list
 traversal
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-1-37d29f59ac9a@oss.qualcomm.com>
 <7eqa3rs3nvy7htvrkwyh5m7ok34n6c3h2dxn7xm2abdjzav4hp@i275ed4owgru>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <7eqa3rs3nvy7htvrkwyh5m7ok34n6c3h2dxn7xm2abdjzav4hp@i275ed4owgru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uyW3SvB38uQxsHDqCguZ550PTYJgSx1P
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68caea99 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hMdzhsAlQAsAiGmCIg0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: uyW3SvB38uQxsHDqCguZ550PTYJgSx1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX0dLr9b1nYPih
 cqTFN+slphaCcaE151V7e4VHp01mcei7ZeLYZHSIoHIHhcrTE6mrckrkoZSLvL1FKp/yEkZnOWD
 e9wGSxm05jVkaZFvJev713TpyqZbTP+3JoA1eSMGg8nFNXL6bLK6Lkr1ChozaQiWuhO92RWYH3p
 r6m4j28ZzV63go12CvLFKuCkbYItRiBlilLccDalRzfYdVI59r2VZdjouCBapXiUIkAJByMbtWd
 BaudHp4/PXh85ErLRbGs2ZmQjbZfPQgLTnMmlugrhgw6qhxsFaY9jgHHEVUfR2wJiNe9RSw9rIG
 wta9uZ5dOLT6o1IWdHE0GYlk7kJETU4uyv4BX87vORZnZAhT3dtj/Np6mASPQQqf+TTY/HRIN87
 CvjgPeH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128



On 9/17/2025 12:14 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 15, 2025 at 08:05:06PM +0530, Shivendra Pratap wrote:
>> List traversals must be synchronized to prevent race conditions
>> and data corruption. The reboot-mode list is not protected by a
>> lock currently, which can lead to concurrent access and race.
>>
>> Introduce a mutex lock to guard all operations on the reboot-mode
>> list and ensure thread-safe access. The change prevents unsafe
>> concurrent access on reboot-mode list.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> This should use scoped_guard() and a Fixes: tag. Otherwise LGTM.

ACK. Will update this patch based on scoped_guard() and add a Fixes tag.

thanks,
Shivendra

