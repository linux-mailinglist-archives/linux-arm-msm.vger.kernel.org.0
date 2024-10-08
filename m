Return-Path: <linux-arm-msm+bounces-33608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D9995838
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 22:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC5B28AC2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 20:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D3E212644;
	Tue,  8 Oct 2024 20:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fVn8BvqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52401E0084;
	Tue,  8 Oct 2024 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418432; cv=none; b=JiG3QMX05ztog4aWdIkX+Pih4QrMMK/wUR1OAVXuQM4/aHf9eDCaTSUfLfuZHWFgE1Z2Z3ZJSaAYp+1jkulGoLj+sroj1JfKYNz3/7NFbmh+o6QaG6hdRxrlRqlwaM2fvfdUCeaJtWj5J0X9nbDIEsvfvqQ6q8ynIuGlBtRNAUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418432; c=relaxed/simple;
	bh=I/DZ9lnQOuBt/9V2BmOL3gHe+sJH5lYhN2OxzJdXjww=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=bPZZtkSOCTTpC+UIjaqNT5TJnHDFZrL2b9KH7Vd8aFcd3sDRHYIS5XM8a6I89XUczgBte8g23kTImM8caUWp73EimNf7qrLQP4IftnByjaxq6L/h/V9PYvEsHVjvb+S5nn1eJWO8FJ4N4w7MR/ZV5maSQq6ukVufj9na4R8ekJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fVn8BvqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498ALTQA000686;
	Tue, 8 Oct 2024 20:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+BG68dSqKZgJmv0l0cKbSJIH0F3D9hqmRfeyh2Yzuc=; b=fVn8BvqRKXQ6mQcO
	D8QKaKOAl7yO91WkKaMzHSPfQAUp1Qjbx0AmNJjr/Wsqm4xgWAKGkz1fl0J4uEzW
	m4euxwgJpuOHGHHMBomemVG9+e3hqB3xZR8TTzHUSTwQV6w0ZhTweChTVVaT+Zyt
	K8uWCb5v1Fd+QGlJjk8A6KTNa6zHXMUbCgwkNaveg1h0P0Bt1lwjMtNh8NrrLQX5
	Z9nNmwXpL6NA4MNwRNOnBlK5SCaNwfU/Oi08pR0k/gKxqS3MKR951PwoCfYfQr56
	RGvOaWeM/PKG2LE/Yq+mZeB+XzBk/uepdnlKZl7+5AtUjvAEFDkESgDrhOKmO6Su
	FLHlAg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4252wssmq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 20:08:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498K8eeL011507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 20:08:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 13:08:40 -0700
Message-ID: <00a837bc-b793-5e50-af38-633a0e6a35bf@quicinc.com>
Date: Tue, 8 Oct 2024 14:08:39 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: qcom-rng is broken for acpi
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: Brian Masney <bmasney@redhat.com>
CC: =?UTF-8?Q?Ernesto_A=2e_Fern=c3=a1ndez?= <ernesto.mnd.fernandez@gmail.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-crypto@vger.kernel.org>,
        "Herbert Xu" <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        <linux-arm-msm@vger.kernel.org>,
        Om Prakash Singh
	<quic_omprsing@quicinc.com>
References: <20240828184019.GA21181@eaf>
 <a8914563-d158-4141-b022-340081062440@quicinc.com>
 <20240828201313.GA26138@eaf>
 <CABx5tq+ZFpTDdjV7R5HSEFyNoR5VUYDHm89JEHvKb-9TW6Oejw@mail.gmail.com>
 <f6075361-1766-35a5-c7ac-cc3eb416a4e1@quicinc.com>
 <CABx5tqJomV_Su2NmyBBgipOiiby5sF7LAo_kdvhYT6oNYwVpVA@mail.gmail.com>
 <da23b318-1d65-c001-1dc2-8ba66abe9d6f@quicinc.com>
 <e6299c6d-dc18-eb05-2af5-8f8d885831c9@quicinc.com>
 <CABx5tqKWNCoE_9-MX+9unVLK8eqaJZiK6SC2RWMXDRzVayQLkQ@mail.gmail.com>
 <7f735c0e-d052-15ed-8db8-214881811816@quicinc.com>
In-Reply-To: <7f735c0e-d052-15ed-8db8-214881811816@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kg_tjQSn2K3NYNIgnmnvYMbzlZlgtr7u
X-Proofpoint-GUID: kg_tjQSn2K3NYNIgnmnvYMbzlZlgtr7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080130

On 9/17/2024 3:24 PM, Jeffrey Hugo wrote:
> On 9/16/2024 1:40 PM, Brian Masney wrote:
>> On Mon, Sep 16, 2024 at 1:42 PM Jeffrey Hugo <quic_jhugo@quicinc.com> 
>> wrote:
>>> Bisect pointed to the following which makes zero sense -
>> [snip]
>>> I wonder if bisect-ability got broken somehow.
>>>
>>> I'm going to try to do a bit of a manual bisect to see if I can avoid
>>> whatever glitch (possibly self induced) I seem to have hit.
>>
>> I've seen this happen if the error is due to a race condition and only
>> happens part of the time. When you are testing a kernel, try booting
>> the system up to 3 times before you run 'git bisect good' against a
>> particular iteration.
> 
> Found some issues with my initial bisect effort.
> 
> New run points to:
> 
> commit 1b0e3ea9301a422003d385cda8f8dee6c878ad05
> Author: Yicong Yang <yangyicong@hisilicon.com>
> Date:   Mon Aug 14 21:16:42 2023 +0800
> 
>      perf/smmuv3: Add MODULE_ALIAS for module auto loading
> 
>      On my ACPI based arm64 server, if the SMMUv3 PMU is configured as
>      module it won't be loaded automatically after booting even if the
>      device has already been scanned and added. It's because the module
>      lacks a platform alias, the uevent mechanism and userspace tools
>      like udevd make use of this to find the target driver module of the
>      device. This patch adds the missing platform alias of the module,
>      then module will be loaded automatically if device exists.
> 
>      Before this patch:
>      [root@localhost tmp]# modinfo arm_smmuv3_pmu | grep alias
>      alias:          of:N*T*Carm,smmu-v3-pmcgC*
>      alias:          of:N*T*Carm,smmu-v3-pmcg
> 
>      After this patch:
>      [root@localhost tmp]# modinfo arm_smmuv3_pmu | grep alias
>      alias:          platform:arm-smmu-v3-pmcg
>      alias:          of:N*T*Carm,smmu-v3-pmcgC*
>      alias:          of:N*T*Carm,smmu-v3-pmcg
> 
>      Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>      Link: 
> https://lore.kernel.org/r/20230814131642.65263-1-yangyicong@huawei.com
>      Signed-off-by: Will Deacon <will@kernel.org>
> 
>   drivers/perf/arm_smmuv3_pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> 
> This one seems to make a bit more sense, and reverting it does make the 
> prints go away.  Feels like either the driver is getting triggered 
> earlier, or wasn't getting triggered before at all.
> 
> I plan to come back to this later in the week to dig more.

Or apparently 3 weeks later since life has a funny way of having other 
plans.

Prior to the above change, the arm_smmuv3_pmu module can be manually 
loaded via modprobe, and the same errors will appear.  This looks like 
an existing issue, that was just made visible, rather than something 
"newly" introduced.

arm_smmuv3_pmu is failing to obtain the second resource.  It is 
consuming a device that is created by the IORT table parser - 
drivers/acpi/arm64/iort.c

arm_smmu_v3_pmcg_init_resources() has a relevant comment for this issue-

/*
  * The initial version in DEN0049C lacked a way to describe register
  * page 1, which makes it broken for most PMCG implementations; in
  * that case, just let the driver fail gracefully if it expects to
  * find a second memory resource.
  */

Checking the IORT implementation, we do advertise revision 0.  I'm not 
certain, but I'm guessing this spec update occurred after the last 
firmware release of QDF2400.  I believe a FW update is unlikely so I 
suspect the options are -

1. Ignore the errors
2. Disable the driver on this platform
3. Use the ACPI initramfs override feature to silence the errors at the 
IORT table

Probably not the resolution we'd like, but this does feel like a final 
conclusion.

-Jeff

