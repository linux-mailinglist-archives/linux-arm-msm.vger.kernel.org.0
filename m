Return-Path: <linux-arm-msm+bounces-47224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60162A2D310
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 03:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA3D3A580D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 02:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FE81531F9;
	Sat,  8 Feb 2025 02:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mz4VleyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7A1531DC
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 02:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738981469; cv=none; b=BEAZZdnAOjwuIb9rUn2EpvJZVf4l3rsGl95E7jMe/kAsEy/iWbUcRyP0/CJ+6XiICZMtidfHTqvkwj+vD8LFn4+VrkHHTlRzVZ/eg+gF0+Yge+vw+gyccK6qt7m55807SWKfGJPjC0UAX4XFNR4OpxcTfPHnafTM3OPG8pRLvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738981469; c=relaxed/simple;
	bh=ZAnCl5bwXgxvEZKak2K1q78bZc+0kOOH1x5yIMDy6UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqN4lyndugLYnN30ZlrondSAv88TbBd5GdZtap12sulbwSAHZAl7w1Czaru+ifRaitkrXSOq6u7NoVN7B9n0c1hyYb0AECcd5uYl2FxwLfEkb7c/PCLM+fPlmIsymhSRQabfzQgHKqzZjvjx/b10ehEc0nljUiYEiz43c5ECkbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mz4VleyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517Mpkhp003033
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Feb 2025 02:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCUv8dRg765XUh0Vz77e1co8H44WhCoFHb2CwK4qFCU=; b=Mz4VleyT3M/abRL3
	qF5eR2nWoJ0Ytv82Et8JfrCnkBcUEED2BFBzbqvxT3SEfKZbdpSWSMuiNkOJD5Oe
	xdK+O3pDVJKtnwJeY9YqvDK663odTpGofTggeleeVDuci5PA6pdm+zYOGCHhEwHz
	jjgVxJa6K7UrTE6uY2klh4hMetWU9ZEO0CapV7885MaTx9sjkQdGMc0DZDOv3EX8
	yR6FK9KkAwL7WQLG3HLyGXGcoXH6eojIzIfdgVl9280QPVsNrpFO+9Pg8ruS7tZG
	HnVNfV/pPyin/yreZhXns9S5dKFnTmNJ5i3ktdbvlQkOPhj+5KUiGhWvcjWtuRYd
	v/vFpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nubarafy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 02:24:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b704c982eeso56581585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 18:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738981465; x=1739586265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCUv8dRg765XUh0Vz77e1co8H44WhCoFHb2CwK4qFCU=;
        b=MqFEwyFZxAGi0Xf77+mogXZ+pUc1D8Nd4swppAxiHO0gIqwW7PL3eNGz0M/Z4YrqTF
         iITwY46ikC9v0F7VK7GLnzYzaX6D72POQIujCeYhS2tOCMB6IG7JjhTx8wohWo4jXDXu
         SCv1plz2LmD/VjoVadBhXn/7KVOaMGRg3Ii7GYIu5okx41QaDXYzrE4I7ma6dOfTqovC
         Lenl0njXmqJ7wtow4rAswik/JCOuSxFo2gjlfZPb8xiXsEab/vqjERjepfkzGvnT3FkH
         Ow1UMlRyq0ELu/XK3/dn5lPI8X1zxw18ZUJx16AVXvIeoGwsDRbptSmd1TI9dvLfsAW6
         5MkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCM5g6lZVFY+Sid4wjEHFLP51JmKbxg9xRkYVaeulbU3YqSP8TFb6EIOL/uMwLv9GO5Tac7Uuj6rnw/Tq7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8LRPEHt54ZJpQBFj1HCqSfnT7ag38jTL1CEmQP9HSB8wT5zsW
	MQV7hKpgT63TAHh6EHXwpLiLL7LQqcktj9ao6Se0HCaGB4+R0zRtp1Yzy6LYH2wnl5AQiERjgzr
	jOmzgr5mQ+7eesJS8Kbl653yIm1uS3ydgdswdGsFLh/uAIo6oKe+QLIUnWBRAWcbW
X-Gm-Gg: ASbGncttg6RVJe1cfk5qB1QB5bCcwuxVl8SR8xMRdeUJ6guqp2xPPdWNCutk1qCrK2m
	THHbMP0jigiYZv7mEvJN1R0lqGgb24NTL/5bfKgaZmhRv/78oHmFBB3Y5IbGXSZU6gERIPe48ui
	7iI98E/8YkPjKonNAnr3sAql+PcAVJK+LcoxU/MSBIWsFQCYfYf9Sf3HC3K+mVPvytibs2MzcEQ
	/MkM5GJ+YkweyIPblTzroFS6RhhfSzCFSHMj7i9AUHEfKqOd0m/j75oyMM7Rx6Lc0CtGmFYK5sx
	Cs9xY359Yduu3+Z5zlNK1XDsrXurVQ9yLMNzo68jc/cqdOI9Rg+KDObYExA=
X-Received: by 2002:a05:620a:2806:b0:7a9:bf88:7d9a with SMTP id af79cd13be357-7c047c4508cmr293334385a.10.1738981465225;
        Fri, 07 Feb 2025 18:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwH7EReKl7IEh4xTeMkF/Dqamjj2Pc1ozjjW8/DuI60lN8fp+Z03NVrZIMiVrtsWC3VgAyNw==
X-Received: by 2002:a05:620a:2806:b0:7a9:bf88:7d9a with SMTP id af79cd13be357-7c047c4508cmr293333485a.10.1738981464754;
        Fri, 07 Feb 2025 18:24:24 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e7232sm375298566b.97.2025.02.07.18.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 18:24:23 -0800 (PST)
Message-ID: <56e4ecaa-c79a-41fd-87fc-dad192bc5e30@oss.qualcomm.com>
Date: Sat, 8 Feb 2025 03:24:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: neil.armstrong@linaro.org, Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
 <20250124070829.oar3hlkshkpam57d@thinkpad>
 <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
 <df1f825f-66a4-4bab-9ca4-90d594f2cb36@linaro.org>
 <d928e662-07ac-4255-8d6f-adeaefb3db46@oss.qualcomm.com>
 <9d489930-9d2d-4b71-9b21-9c7918257b7c@linaro.org>
 <aaf02ae5-4ae8-4571-934f-2c95de9d7e4f@oss.qualcomm.com>
 <d36b497e-4717-4c25-8090-a20efd09f782@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d36b497e-4717-4c25-8090-a20efd09f782@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wbwCJ-8kDr1ODwRpjoZbdhdZ0O0WaavS
X-Proofpoint-ORIG-GUID: wbwCJ-8kDr1ODwRpjoZbdhdZ0O0WaavS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080016

On 29.01.2025 3:19 PM, neil.armstrong@linaro.org wrote:
> On 29/01/2025 14:55, Konrad Dybcio wrote:
>> On 29.01.2025 2:41 PM, neil.armstrong@linaro.org wrote:
>>> On 29/01/2025 12:29, Konrad Dybcio wrote:
>>>> On 29.01.2025 9:29 AM, neil.armstrong@linaro.org wrote:
>>>>> On 25/01/2025 14:10, Konrad Dybcio wrote:
>>>>>> On 24.01.2025 8:08 AM, Manivannan Sadhasivam wrote:
>>>>>>> + Mayank (with whom I discussed this topic internally)
>>>>>>>
>>>>>>> On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
>>>>>>>>
>>>>>>>> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
>>>>>>>>>> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>>>>>>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Currently, BCR reset and PHY register setting are mandatory for every port
>>>>>>>>>>>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>>>>>>>>>>>> Different than BCR reset that is used to reset entire PHY including
>>>>>>>>>>>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>>>>>>>>>>>> be reset but PHY registers will be retained,
>>>>>>>>>>> I'm sorry, I can't parse this.
>>>>>>>>>> The difference between no_csr reset and bcr reset is that no_csr reset
>>>>>>>>>> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
>>>>>>>>>> are programed. After Linux boot up, the registers will not be reset but
>>>>>>>>>> keep the value programmed by UEFI if we only do no_csr reset, so we can
>>>>>>>>>> skip phy setting.
>>>>>>>>> Please fix capitalization of the abbreviations (PHY, BCR) and add
>>>>>>>>> similar text to the commit message.
>>>>>>>>>
>>>>>>>>>>>> which means PHY setting can
>>>>>>>>>>>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>>>>>>>>>>>> no_csr is toggled after that.
>>>>>>>>>>>>
>>>>>>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>>>>>>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>>>>>>>>>>>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>>>>>>>>>>>> established with no_csr reset only.
>>>>>>>>>>> This doesn't tell us why we want to do so. The general rule is not to
>>>>>>>>>>> depend on the bootloaders at all. The reason is pretty simple: it is
>>>>>>>>>>> hard to update bootloaders, while it is relatively easy to update the
>>>>>>>>>>> kernel. If the hardware team issues any kind of changes to the
>>>>>>>>>>> programming tables, the kernel will get them earlier than the
>>>>>>>>>>> bootloader.
>>>>>>
>>>>>> We're assuming that if a product has shipped, the sequences used to power up
>>>>>> the PHY in the bootloader (e.g. for NVMe) are already good.
>>>>>>
>>>>>> If some tragedy happens and an erratum is needed, we can always introduce a
>>>>>> small override with the existing driver infrastructure (i.e. adding a new
>>>>>> entry with a couple registers worth of programming sequence, leaving the other
>>>>>> values in tact)
>>>>>
>>>>> Assuming Linux will be always ran directly after the bootloader is a wild assumption.
>>>>
>>>> Situations like
>>>>
>>>> [normal boot chain] -> [... (resets the PHY and doesn't reprogram it)] -> Linux
>>>>
>>>> are both so unlikely and so intentional-by-the-user that it doesn't seem
>>>> worth considering really.
>>>
>>> In embedded/mobile/edge world, definitely, in compute/PC-like market, not really.
>>>
>>> You'll have people add some custom bootloaders, hypervisors, who knows what...
>>
>> I see, however you actually have to intentionally assert the non-NO_CSR PHY
>> reset from said custom bootloaders, hypervisors and whoknowswhats for the
>> programmed sequence to be erased. So I have no idea what the issue is here.
> 
> I won't argue further, but you know as I do that relying on the bootloader state
> is a dangerous game, and we already rely a lot for dsp stuff and we have
> a lot lot of issue related to the UEFI implementation already on production
> devices.
> 
> I'm not against the nocsr stuff, which can be a big win for boot time, but
> honestly not adding a few registers in table seems risky enough, and we should
> probably delay this experiment until we are sure the nocsr stuff works fine.

I tested a range of mobile/compute platforms and only the latter kept
the PCIe PHYs initialized after dropping to the OS. No adverse effects
that I can tell.

Konrad

