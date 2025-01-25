Return-Path: <linux-arm-msm+bounces-46133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90BA1C390
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 14:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 109E816750F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE64207E04;
	Sat, 25 Jan 2025 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZAOzWGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2D1D9A54
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737810665; cv=none; b=sqr+DQhIFDdATGUoo6VDaBBrv3nW2twPMDamlXtfBvKH8sAvH7MHW05LyQVBfLEoHfPjd3f8XM1OGZPi1+pCjyb6QHkXk0DuoVEV0WZz4dgvAOmFNywsK7EcM+DI5JB5irOrsZEi0I7fVhPzEss5zR1t1ncIMDtFEecYmoFkaII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737810665; c=relaxed/simple;
	bh=Yeuc4Idp54Hk+AraGsESy3zDvvPWXFjJHx25/33twAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRrcFKeitj6aOkCMZGzYUKBSCAias1xm3hr0KUS2id8eHCoeEkGAmejujnZp6yIgySwI/WoTnwLyZgTWbdfS73qdLSK5LSi3xb+JonOddk36kJIi+rcqW2M67WrKvDWHwGuaRDjRZV1O32cMFgAQvQqj8q4P3nxDm1MHZhLIiPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZAOzWGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50PCodtQ017975
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbYpYco5oc1eP1haET1D41v9RRtkLAc4rtmVyB5yIPE=; b=lZAOzWGVCRW957K5
	z3yr9k8LHjh3Uuz3g9wWDeuGAEaStwm46zi0vqxaphXB76jih1Biog6Sd275Q5bH
	kZGcK3U3IR0Je2Cd6hnnhR54Q545JAo+lcO8mhcx5YL/fpwzYroH0o2nPGHeo5gX
	uckx+FMU3d2W2NHuqi92UKQJvU6BVYH71OR3rx29h5TMz4IADfGwHB4qZ8E14Ufz
	0cZPyNxD7NAAxPvEC9mTTI+Z87ylc3+LP7XQcd1jrpMVxgmRZ0tXX6iymPzANxT+
	2rbSCGe5eUgTVxwwJEo5obFRzHHQCmumj5SC46Ke/Htk3B9tG7TsO8A3FhD8TlVr
	580v2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs878h1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 13:11:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a437e5feso7241741cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 05:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810659; x=1738415459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbYpYco5oc1eP1haET1D41v9RRtkLAc4rtmVyB5yIPE=;
        b=J7DR0xw9EJRYkj0txg8CZuX1baAsru6lDU9n9AgMLFRPrcEJiqhspdQHZuNS44fTz7
         W3HtlSTj4q6ILd1hVquqw7eSMXoOXuWIAPns0ac8WQhRSCwhuN7jVE+lKPGu7gtE63Ar
         DmSnmhO6nsuQI1gUugYXG2Z0JIrzgQsN4/xVoX9eP2vKwU6z5koEHHKDQnn5R18Hthdm
         3EB+Go7PiTGEsXf/qrztb4NJD7zO/Dn5IAMs8UVIMDuA6B31fcIldQCBmUrgz6PJULwT
         7RJxw1fQ/vM+zrES5W5IuBHfotJ54qSarw/yZ/FLhQ/L6Vju5I4qZvx+0lG/CW1Ebhz+
         dz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhM+BTTbMku60nDW2ppx9iOUDPDxUjW8KgWvBh7k3p2G88GCw1W6y5zv/h6nK+X9x++AEnkc0LjUI2j9xc@vger.kernel.org
X-Gm-Message-State: AOJu0YwhRPvFNliqYcQQSZfukTL5VySTHnAfanY+sgFU4fqlQL4y4vK3
	nPlkOxIOuhHuE93r0J+thMc7oYmwtf45Tawc2x6NIW35r8lWN0IbAYE6L4xskv7JfzBqeoRgnNI
	fp33l4JL89c9RzPlt4UCnvLhqdiL15Hr5ggChNSVViFmq8cTUHOKuoGJG6NKDVUxW
X-Gm-Gg: ASbGnctVd3Vfgq4qvuFGf50eE7jC7JcYLFzi6QPX58Xi7XFQXOo0ktzQBwsBWxCm8cU
	JNrHIdluJm6kaQGPvvBhIKxn8yoWxMkKfhTQbCk3BDacZ5KD7ZtDKeAXm4AiK5LXzM9GtU7l5/4
	J2Jaed0pF2BG/2vQZhZdmWnyfwbdMP5wHz+XxEXBnjoVe/BM5OLe6AI19mBPMrKIe12otTigewl
	RGV1+fKUnIWnb06eq9uEIMlg/uhzIuv07vKehCzI5RjQ1V1ZLCd0xC0C36VeYnorHPFnR1WfDal
	xdVGDX3jpjA0n0gp51EWPp0J6ku960n8wmw4DdO4kGBLpr9/Pmz4pLi0ca8=
X-Received: by 2002:a05:622a:1344:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46e12a4ff41mr165924451cf.6.1737810658892;
        Sat, 25 Jan 2025 05:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4DzQuJrrCIonbiD5W8KeMIpBaQuLve9eqF9M9kMGq8GJIRagIa0plXcCkwiQA3uVCezQzyw==
X-Received: by 2002:a05:622a:1344:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46e12a4ff41mr165924181cf.6.1737810658361;
        Sat, 25 Jan 2025 05:10:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863ae37sm2658621a12.41.2025.01.25.05.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 05:10:57 -0800 (PST)
Message-ID: <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 14:10:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
        neil.armstrong@linaro.org, manivannan.sadhasivam@linaro.org,
        quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
 <20250124070829.oar3hlkshkpam57d@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250124070829.oar3hlkshkpam57d@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dimp7oHlUMyRj7oPENyeFsF7caOjq5r4
X-Proofpoint-ORIG-GUID: dimp7oHlUMyRj7oPENyeFsF7caOjq5r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_05,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501250095

On 24.01.2025 8:08 AM, Manivannan Sadhasivam wrote:
> + Mayank (with whom I discussed this topic internally)
> 
> On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
>>
>> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
>>>> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>
>>>>>> Currently, BCR reset and PHY register setting are mandatory for every port
>>>>>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>>>>>> Different than BCR reset that is used to reset entire PHY including
>>>>>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>>>>>> be reset but PHY registers will be retained,
>>>>> I'm sorry, I can't parse this.
>>>> The difference between no_csr reset and bcr reset is that no_csr reset
>>>> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
>>>> are programed. After Linux boot up, the registers will not be reset but
>>>> keep the value programmed by UEFI if we only do no_csr reset, so we can
>>>> skip phy setting.
>>> Please fix capitalization of the abbreviations (PHY, BCR) and add
>>> similar text to the commit message.
>>>
>>>>>> which means PHY setting can
>>>>>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>>>>>> no_csr is toggled after that.
>>>>>>
>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>>>>>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>>>>>> established with no_csr reset only.
>>>>> This doesn't tell us why we want to do so. The general rule is not to
>>>>> depend on the bootloaders at all. The reason is pretty simple: it is
>>>>> hard to update bootloaders, while it is relatively easy to update the
>>>>> kernel. If the hardware team issues any kind of changes to the
>>>>> programming tables, the kernel will get them earlier than the
>>>>> bootloader.

We're assuming that if a product has shipped, the sequences used to power up
the PHY in the bootloader (e.g. for NVMe) are already good.

If some tragedy happens and an erratum is needed, we can always introduce a
small override with the existing driver infrastructure (i.e. adding a new
entry with a couple registers worth of programming sequence, leaving the other
values in tact)


While updates to the PHY init sequences have happened in the past, I believe
they are mostly a result of oneOf:

* someone upstreaming a pre-release revision / premature release
* someone making a mistake when typing in the numbers

Although sometimes there may be an update that isn't a result of any dev fault.
It's worth to keep in mind certain values in there can be board specific, as
they affect the analog interface. But we haven't seen that being used much if
at all.

>>>> With this change, we don't need to upstream phy setting for all phys
>>>> support no_csr reset, this will save a great deal of efforts and simplify
>>>> the phy driver. Our goal is to remove proprietary PCIe firmware operations
>>>> from kernel. PHY is just the start and will be followed by controller,
>>>> clocks, regulators, etc. If program table need to be changed, the place to
>>>> do that will be UEFI.
>>> Well, that sounds like a very bad idea. Please don't do that. Linux
>>> kernel drivers should not depend on the UEFI or a bootloader. Unless
>>> there is a good reason for that, Linux should continue to be able to
>>> reset and program the PCIe PHY (as well as all other hw blocks).

While I personally like being able to look into what's being programmed
onto my hardware myself, this unfortunately does not scale, both from
maintainability and reviewability perspectives with tables that host
hundreds of essentially magic values.

Plus this approach makes it easier to extend to other OSes, without
polluting them with the same data.

>> I'm wondering if it's really necessary for Linux to be able to program the
>> PHY. Perhaps Linux should only care about common aspects defined by the
>> PCIe spec like bus scanning, BAR space allocation, and functions provided
>> by other PCIe capabilities. As for the specific operations that are
>> different on various platforms, it might be more appropriate for the
>> firmware to take care of them. This way, the responsibilities can be more
>> clearly divided, and the driver could potentially be
>> more streamlined.
>>
> 
> It is not necessary in an ideal world, but what we have seen is Qcom releasing
> updated PHY init sequence after upstreaming the initial PHY driver support. In
> that case, the devices with old firmware will become outdated unless the fw is
> updated (which is not straightforward compared to updating the kernel).
> 
> But, I do like this idea of reusing the PHY init sequence in the kernel. Though
> we cannot just do it for all platforms. Maybe we can enable it on platforms like
> compute starting from X1E and see how it goes? Just to minimize the impact if it
> didn't go well.

X1 is just the first of many here.

We can possibly move some existing ones over after confirming that:

a) the bootloader programs the PHYs at all
b) the values programmed are reasonable

on a case-by-case basis to ensure we're not regressing anything. Perhaps a
piece of code and a modparam could be added that would read out the values
present at boot and compare them to what the kernel has in store.


>> On the other hand, since the no_csr reset can retain register values,
>> maybe we should still make full use of it, even if we don't want to
>> rely on UEFI. For example, during runtime suspend/resume
>> (the D3cold -> D0 cycle)
> 
> D3Cold during runtime suspend in bizarre.

Very much so. But this extends to system suspend as well - we can still shave
a couple ms off the wakeup times if we can skip all the programming.

> 
>> , when re-initializing the PHY, same PHY
>> settings will be programmed again. This is a bit redundant.
>>
> 
> Hmm, what would happen if the CX collapse happens during system suspend? Will
> the PHY registers be retained?

PHYs are always(asterisk) backed by some flavor of MX instead

Konrad

