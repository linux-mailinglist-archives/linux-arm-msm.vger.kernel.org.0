Return-Path: <linux-arm-msm+bounces-31937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353D97B52E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 23:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565F71C2158E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 21:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD9418950D;
	Tue, 17 Sep 2024 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UQmGJ2Ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2E446A1;
	Tue, 17 Sep 2024 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726608564; cv=none; b=UBEUMEGK6WTCcwLSRs+bWHC7oYSGJ5DcQXiPNLJ7qOBp88ijqq1rIcDAK3Advwna2gcv/9tRNzR34PwMPTXXUXL45so3G+DnhnIQIHiqb4iFd6bvqglAyhtMIFqKU8jPXBHNY+CBIJJnzFnloN11efAp2TW2zPHN8+4E+9oMCOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726608564; c=relaxed/simple;
	bh=L7Jxaf7jGN6nnCpk2JoqwVJgkp1qdT5VTM3CxQdeTcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TVIPBJCtqzHwvtHN+ofSfN6mcb1bWp11RmLHxXTUh3PVR3DS2ji4SI5tghZ1RmFEoQoZ/8KHZY9i/ya+l2V20YtEiWEwYVeQoftMhPMFn7IWBXwAKd6lWTM9Rruv79Uh4mSvCtnu4u4ZgdI0xiW/Zi79mUv79X8LPpSaWUoJ6qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UQmGJ2Ps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HJf67G024721;
	Tue, 17 Sep 2024 21:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJ3HgSet/OV384mECcTMsTyXAA8iz7QP9lgxzaAVQyE=; b=UQmGJ2PsVAEpIVMQ
	oswGX4CoHSt6HQ4RI6O8PBN3CHPIVi7ZeE6k069b3REpX3x1MwGuygCo9WbcwEgL
	Kps9R2vwiNtsTqwRrmbL2gn1sfmbA/eqq4YAvi37yfRecJ0xqRgoWJHMkCCy+2K+
	meO8UGvpT48hQwMiv8GKqEwg1z/g+pkIMnCDGFvte4Nol14dLUHCi0p9Htdk/Qvd
	zHTk0lhyKkNgsfDNjntjAC8u2DIDMrNkDd/kzAmcFoO1GB0GBPmaBUk0Cz+6G17m
	nVJv8KVK8vip+KKvZgGipJ+26VDmV57VBIUddV71LmdNiwvopl1bqEh7+m2SDo3p
	MQ6OZg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4ge7xyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 21:24:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48HLOFQq013880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 21:24:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 14:24:14 -0700
Message-ID: <7f735c0e-d052-15ed-8db8-214881811816@quicinc.com>
Date: Tue, 17 Sep 2024 15:24:12 -0600
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
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CABx5tqKWNCoE_9-MX+9unVLK8eqaJZiK6SC2RWMXDRzVayQLkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yMg4f7uF9unBsVNWcm2une6Q4aWrdo1K
X-Proofpoint-ORIG-GUID: yMg4f7uF9unBsVNWcm2une6Q4aWrdo1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170153

On 9/16/2024 1:40 PM, Brian Masney wrote:
> On Mon, Sep 16, 2024 at 1:42 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>> Bisect pointed to the following which makes zero sense -
> [snip]
>> I wonder if bisect-ability got broken somehow.
>>
>> I'm going to try to do a bit of a manual bisect to see if I can avoid
>> whatever glitch (possibly self induced) I seem to have hit.
> 
> I've seen this happen if the error is due to a race condition and only
> happens part of the time. When you are testing a kernel, try booting
> the system up to 3 times before you run 'git bisect good' against a
> particular iteration.

Found some issues with my initial bisect effort.

New run points to:

commit 1b0e3ea9301a422003d385cda8f8dee6c878ad05
Author: Yicong Yang <yangyicong@hisilicon.com>
Date:   Mon Aug 14 21:16:42 2023 +0800

     perf/smmuv3: Add MODULE_ALIAS for module auto loading

     On my ACPI based arm64 server, if the SMMUv3 PMU is configured as
     module it won't be loaded automatically after booting even if the
     device has already been scanned and added. It's because the module
     lacks a platform alias, the uevent mechanism and userspace tools
     like udevd make use of this to find the target driver module of the
     device. This patch adds the missing platform alias of the module,
     then module will be loaded automatically if device exists.

     Before this patch:
     [root@localhost tmp]# modinfo arm_smmuv3_pmu | grep alias
     alias:          of:N*T*Carm,smmu-v3-pmcgC*
     alias:          of:N*T*Carm,smmu-v3-pmcg

     After this patch:
     [root@localhost tmp]# modinfo arm_smmuv3_pmu | grep alias
     alias:          platform:arm-smmu-v3-pmcg
     alias:          of:N*T*Carm,smmu-v3-pmcgC*
     alias:          of:N*T*Carm,smmu-v3-pmcg

     Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
     Link: 
https://lore.kernel.org/r/20230814131642.65263-1-yangyicong@huawei.com
     Signed-off-by: Will Deacon <will@kernel.org>

  drivers/perf/arm_smmuv3_pmu.c | 1 +
  1 file changed, 1 insertion(+)


This one seems to make a bit more sense, and reverting it does make the 
prints go away.  Feels like either the driver is getting triggered 
earlier, or wasn't getting triggered before at all.

I plan to come back to this later in the week to dig more.

-Jeff

