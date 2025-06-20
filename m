Return-Path: <linux-arm-msm+bounces-61887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84AAE1D49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 16:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7DE16AA79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 14:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFDF28CF6D;
	Fri, 20 Jun 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RucEdvV2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B928A3E4;
	Fri, 20 Jun 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429609; cv=none; b=ryoFjYzmYiScoTa4rqGWtNYXSip3BX/kyfDWvnbxt7dOEmwSHSvfbhVjoeVYdIORRxzVsrIuETiRIqif/n5I4WwXUD7euuS38KaCNVpcRxfMpQkuepThWarrMO0dDbP+dRHk9h4KfQzr5R2cD4diqVDNRgvcGscO5ckq8ZjeNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429609; c=relaxed/simple;
	bh=+pWQPw+Ca2mJz3X31Q1pGdLyshBfBAfKJlr9EFmlMsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uENAsiovztx/izpAaJyLZI7JaH2G/CLIoJyiVALE5oxjXmDvhjIxkSOxSVd4Z4itIytrlEgrpMPsYXfAYxAtCTiAInvsXkmh07no2AK2Lj4zAp1EfknkIc+63bfs+xen/2j3hkk8cNO2BoQTBY0FfYxEPDzpEg/4BldhPFpbYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RucEdvV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7H9dZ009657;
	Fri, 20 Jun 2025 14:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXkJ67cMbeMVJ9YZw29ONigI2pwCgXoma9QCqa3pX88=; b=RucEdvV2mPKLvwI5
	T6F7UEO3Tui9rGeReMnhUQq29KoXO/B/CYurSOFM0aaRmYzHTtsVBaf7uxgg70XI
	q1ZcCrG2Oky/TU46flij+fW9QPKUCMe1c7LS8QxMtC3hFIFTQeQ5/tHVBmnk8k2r
	uh47MfhZE6cIdpyl5rso7iOUi0METaeQYPMyqqZ7nPQaB9IowQEmpTGX0DeZP+70
	vgmR/JZhPUKAao1bcCB5T3KU14AI8OZYN8FGE+OVTcMRYRJB5PD0xi07/0Yj+x/R
	B7wCS8I5sAwmxZeJ15uSjm9+XBpTaMjUollDjpd6+u223GOZM1BNNwRXyllEh0xP
	3dn02Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d340155f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 14:26:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55KEQJbN023197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 14:26:19 GMT
Received: from [10.216.13.27] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Jun
 2025 07:26:13 -0700
Message-ID: <9c846734-9267-442d-bba0-578d993650c1@quicinc.com>
Date: Fri, 20 Jun 2025 19:55:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 10/10] scsi: ufs: qcom : Refactor phy_power_on/off
 calls
To: Aishwarya <aishwarya.tcv@arm.com>
CC: <James.Bottomley@HansenPartnership.com>, <andersson@kernel.org>,
        <bvanassche@acm.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <kishon@kernel.org>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <martin.petersen@oracle.com>,
        <neil.armstrong@linaro.org>, <quic_cang@quicinc.com>,
        <quic_rdwivedi@quicinc.com>, <vkoul@kernel.org>
References: <20250526153821.7918-11-quic_nitirawa@quicinc.com>
 <20250619135302.9192-1-aishwarya.tcv@arm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250619135302.9192-1-aishwarya.tcv@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZHYQYXUdS1hDqa-RbOPXtdnN-IZwsXyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwMyBTYWx0ZWRfX7wUCeFZ/MuQ2
 uVV2KVg+Gmu+Zg2yHEdVhWakIyNIdlOIQnsYwcHdtymxTLgmlDNwzImLMcJS/3oym6Qu93oGmJn
 3u0Nx/1fyU6dqbp1koyKdP+2cx7wTBB0/rIOUIcHJGJb8VK//7avb92NMoXG4ekQf0FsoWd0jiX
 PHAi+2McHCwUh1wgoMQn6lkhe2nr6MMM+n/bjSnm4sHRaAcg28u3/obBfJ1F+8v51RMUfKTSIlk
 IDUdGS1dINPxwaymt2TtK1RVK3xNiogFL7LybBl1GeLv773CzxrrqePOOe8OTmjdSjKDBeg/jA7
 uwhnKPO8USsvAbgxyYPfejU/Tj30X+hCOcAMgJp56Ewmarj/mWN8LYMND/yyA9dAEYEQCIxTwuU
 hicCo8bppRDyepwSZdOlzFaymUwnYZHFsJrRiSp8Nv2rMYIOrqVjaJv7InulMhRbT+D++sLi
X-Authority-Analysis: v=2.4 cv=JLE7s9Kb c=1 sm=1 tr=0 ts=68556f8c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=ydUYT1VdIsrJ1VNw940A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZHYQYXUdS1hDqa-RbOPXtdnN-IZwsXyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200103

On 6/19/2025 7:23 PM, Aishwarya wrote:
> Hi Nitin,
> 
> When booting the kernel from next-20250619 on Arm64 Qualcomm boards
> (RB5 and DB845C), we observe that the baseline bootr test fails due to
> dmesg.emerg errors in our CI environment.
> 
> A full git bisect (log included below) points to this patch as the
> culprit. The issue was introduced sometime from tag next-20250616 in
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git.


Hi Aishwarya,

I tested booting the QRB5165 using the qrb5165-rb5.dtb with the latest 
upstream tip multiple times, and each time it successfully booted to the 
shell without any issues.

Are you encountering a boot failure, or is there a specific test case 
you're running that triggers the problem? If so, could you please share 
the dmesg log to help check further.

Thanks,
Nitin

> 
> This issue is not present in v6.16-rc2
> 
> Here’s a sample of the failure observed on the RB5 board:
> lert :   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> kern  :alert :   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> kern  :alert :   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> kern  :alert : user pgtable: 4k pages, 48-bit VAs, pgdp=0000000102c4c000
> kern  :alert : [0000000000000000] pgd=0000000000000000
> kern  :emerg : Internal error: Oops: 0000000096000004 [#1]  SMP
> kern  :emerg : Code: a90157f3 aa0003f3 f90013f6 f9405c15 (f94002b6)
> <8>[   30.933289] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=emerg RESULT=fail UNITS=lines MEASUREMENT=2>
> + <8>[   30.943798] <LAVA_SIGNAL_ENDRUN 0_dmesg 1000325_2.4.4.1>
> set +x
> 
> Git bisection log:
> git bisect start
> # status: waiting for both good and bad commits
> # good: [9afe652958c3ee88f24df1e4a97f298afce89407] Merge tag 'x86_urgent_for_6.16-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good 9afe652958c3ee88f24df1e4a97f298afce89407
> # status: waiting for bad commit, 1 good commit known
> # bad: [4325743c7e209ae7845293679a4de94b969f2bef] Add linux-next specific files for 20250617
> git bisect bad 4325743c7e209ae7845293679a4de94b969f2bef
> # good: [436c8cbbcb18deb96100cd9f33f1efedddc31d9c] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
> git bisect good 436c8cbbcb18deb96100cd9f33f1efedddc31d9c
> # good: [183d224083773ca4a84a458fb608efecff19e19e] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
> git bisect good 183d224083773ca4a84a458fb608efecff19e19e
> # good: [1347ff0c0e510f1a6adb78259a2a0ddfac41d258] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git
> git bisect good 1347ff0c0e510f1a6adb78259a2a0ddfac41d258
> # bad: [b09bd04eabb1994257f4c11d0ed25ff03517d3ec] Merge branch 'gpio/for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> git bisect bad b09bd04eabb1994257f4c11d0ed25ff03517d3ec
> # good: [70bc9e18653c20fbcb47184d9498ad7bd7b7d6be] Merge branch 'togreg' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
> git bisect good 70bc9e18653c20fbcb47184d9498ad7bd7b7d6be
> # bad: [3a847fb85c9d47e61ad5d9d54b762a3e99a08084] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
> git bisect bad 3a847fb85c9d47e61ad5d9d54b762a3e99a08084
> # skip: [50355ac70d4f104e2f82bfbd0658c129027ebb37] dt-bindings: phy: Convert marvell,comphy-cp110 to DT schema
> git bisect skip 50355ac70d4f104e2f82bfbd0658c129027ebb37
> # good: [acc6b0d73d902d3296d8c77878a9b508c2c6a5bf] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
> git bisect good acc6b0d73d902d3296d8c77878a9b508c2c6a5bf
> # bad: [35b629b28afd72a14ed573f1b180dc4ab1bf7e19] dt-bindings: phy: Convert ti,dm816x-usb-phy to DT schema
> git bisect bad 35b629b28afd72a14ed573f1b180dc4ab1bf7e19
> # bad: [66acaf8f6b0bcc273f8356b2a77baa90b177014c] dt-bindings: phy: Convert img,pistachio-usb-phy to DT schema
> git bisect bad 66acaf8f6b0bcc273f8356b2a77baa90b177014c
> # bad: [f151f3a6ebe184b5f8c9abe58fe2d63f9950139b] dt-bindings: phy: Convert brcm,ns2-drd-phy to DT schema
> git bisect bad f151f3a6ebe184b5f8c9abe58fe2d63f9950139b
> # bad: [77d2fa54a94574f767d5fb296b6b8e011eba0c8e] scsi: ufs: qcom : Refactor phy_power_on/off calls
> git bisect bad 77d2fa54a94574f767d5fb296b6b8e011eba0c8e
> # good: [7f600f0e193a6638135026c3718ac296ed3f5044] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
> git bisect good 7f600f0e193a6638135026c3718ac296ed3f5044
> # good: [a079b2d715340482e425ff136b55810ab8279800] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
> git bisect good a079b2d715340482e425ff136b55810ab8279800
> # first bad commit: [77d2fa54a94574f767d5fb296b6b8e011eba0c8e] scsi: ufs: qcom : Refactor phy_power_on/off calls
> 
> Thanks,
> Aishwarya


