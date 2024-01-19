Return-Path: <linux-arm-msm+bounces-7641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF5832F50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 20:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 936051C23B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 19:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8812755E66;
	Fri, 19 Jan 2024 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dF7ihbSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030204CE08;
	Fri, 19 Jan 2024 19:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705691516; cv=none; b=CpthzFQkPTpFvjTBJbLENEn1vuYS90/kQJqnAFeLTr0I0wphMZ7xN3dKdkHXGsf9sGxIsVjJEqIanIrlqadxL7YVNIRY0Ygc6lWAtFSpJn5tlelgoj3VLLB0qx0SVR+1BK2iBXjHElI3AdBRVWCCMbDSE1pTZ/okgN3b+CzF9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705691516; c=relaxed/simple;
	bh=Mjqwbp2pegsIkFmoyyG9p0QPJv/okbVvZ82TUoLMWms=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew/yZG3w7H3ooNIKMA5ftWP/nZ8MDXsXRwUFgcac+G2KmNFMNUQGwRuLVPZ8vyTkJhSSyLrtJWp2harTAHaS4EYwr8rujcwWJsPSvbcFFEd2hL8+rfLvRX3ZaBC64jnsXerD7IPXJPVqHOcz9xtJSWKmQNboEdxrhzoMOASUtd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dF7ihbSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JIxTLY000889;
	Fri, 19 Jan 2024 19:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=LrakZsaAJchAPzWVUjPWg
	ITYgXgh88HhH3V9/YulKqw=; b=dF7ihbSj0i2qQZsFVfNgRz8SXWlP3wBPLyNQU
	Euk63Opg1FDKqTPYUd/LyCGkdh14QEO55L/m2fxq9CM2YadMbTigU705d26aSgWC
	Dza1mFEUnRF9Nl8PB8TBTXtvv5z5ajES4CG7sBV8hfyBlQYvserbW98fNgX8zxaX
	1K7qiE3iz+8DdLFHW/ghrIZ52U6pVjBOdFXHvU2X+Xvc/AzKor/vXDdlAtzfz9Af
	GJBlsfjsWbc0y/i5IXvD8Kxmbtk+Khnr3ei8VGxhfKixCpFXhCZyWq4oxCuecZD1
	EShwP3+m/hGBfJLn3YmRqoWN9nZdoLkCGZ6sljzHSo7gz4k1w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vqn89har2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 19:11:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40JJBmDP030707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jan 2024 19:11:48 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 19 Jan 2024 11:11:45 -0800
Date: Fri, 19 Jan 2024 11:11:44 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Eric Chanudet <echanude@redhat.com>
CC: Ninad Naik <quic_ninanaik@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_ymg@quicinc.com>, <kernel@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Message-ID: <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RSKDQoez4qVCUzt1G45Mvnvrtf2YvONp
X-Proofpoint-ORIG-GUID: RSKDQoez4qVCUzt1G45Mvnvrtf2YvONp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_12,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=360 clxscore=1011
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190113

On Thu, Jan 18, 2024 at 06:58:19PM -0500, Eric Chanudet wrote:
> On Thu, Jan 18, 2024 at 09:27:11PM +0530, Ninad Naik wrote:
> > New memory map layout changes (by Qualcomm firmware) have brought
> > in updates to base addresses and/or size for different memory regions
> > like cpcucp_fw, tz-stat, and also introduces new memory regions for
> > resource manager firmware. This change brings in these corresponding
> > memory map updates to the SA8775P SoC device tree.
> > 
> > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> 
> With next-20240118, without this patch, running "./memtester 32G"[1]
> crashed the board quickly during the mlock:
> 
> [   42.144892] Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP

Sounds like just passing "memtest=1" on the kernel command line (with
CONFIG_MEMTEST=y) would trip this...

> [   42.153316] Modules linked in: r8153_ecm cdc_ether usbnet marvell dwmac_qcom_ethqos stmmac_platform r8152 rfkill stmmac crct10dif_ce qcom_spmi_temp_alarm pcs_xpcs nvmem_qcom_spmi_sdam qcom_stats i2c_qcom_geni qcom_pon spi_geni_qcom qcom_wdt socinfo phy_qcom_sgmii_eth nvmem_reboot_mode phy_qcom_qmp_usb gpucc_sa8775p phy_qcom_snps_femto_v2 phy_qcom_qmp_pcie qcom_rng drm fuse backlight ipv6
> [   42.188566] CPU: 3 PID: 472 Comm: memtester Not tainted 6.7.0-next-20240118-00001-g10a3c9d045cf #169
> [   42.197944] Hardware name: Qualcomm SA8775P Ride (DT)
> [   42.203138] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   42.210292] pc : clear_page+0x18/0x58
> [   42.214063] lr : clear_huge_page+0x84/0x1a0
> [   42.218370] sp : ffff800081ef3a30
> [   42.221776] x29: ffff800081ef3a30 x28: 0000000000000000 x27: 0000000000210009
> [   42.229108] x26: 0000000000000000 x25: fffffc6abc053380 x24: ffff000000000000
> [   42.236439] x23: 0000000000000000 x22: 0000000000000000 x21: 0000006a89b87f80
> [   42.243770] x20: 00000000000001fe x19: fffffc6a89b80000 x18: ffff800081ef3d18
> [   42.251101] x17: 0000000000000068 x16: 0000000000000001 x15: 00000000000001c2
> [   42.258431] x14: 0000000000000002 x13: fffffc6a89b90008 x12: 0000000000000001
> [   42.265761] x11: 0000000000440dc0 x10: 0000000000000100 x9 : ffffc570ba60c604
> [   42.273090] x8 : 0000000000000030 x7 : ffff554053756000 x6 : ffff800081ef39f0
> [   42.280420] x5 : 0000000000000130 x4 : ffffc570bd029ae0 x3 : ffff554053756000
> [   42.287752] x2 : 0000000000000004 x1 : 0000000000000040 x0 : ffff1aa26e1ff000
> [   42.295083] Call trace:
> [   42.297607]  clear_page+0x18/0x58
> [   42.301015]  do_huge_pmd_anonymous_page+0x254/0x8f8
> [   42.306036]  __handle_mm_fault+0x728/0x1548
> [   42.310338]  handle_mm_fault+0x70/0x290
> [   42.314281]  __get_user_pages+0x144/0x3c0
> [   42.318404]  populate_vma_page_range+0x7c/0xc8
> [   42.322972]  __mm_populate+0xc8/0x1d8
> [   42.326736]  do_mlock+0x194/0x2d0
> [   42.330144]  __arm64_sys_mlock+0x20/0x38
> [   42.334178]  invoke_syscall+0x50/0x120
> [   42.338034]  el0_svc_common.constprop.0+0xc8/0xf0
> [   42.342874]  do_el0_svc+0x24/0x38
> [   42.346284]  el0_svc+0x34/0xb8
> [   42.349425]  el0t_64_sync_handler+0x120/0x130
> [   42.353906]  el0t_64_sync+0x190/0x198
> [   42.357674] Code: 37200121 12000c21 d2800082 9ac12041 (d50b7420) 
> [   42.363932] ---[ end trace 0000000000000000 ]---
> 
> With next-20240118 and this patch, memtester continues through the
> test-suite.
> 

But the commit message says that this is a new memory map, not that it
fixes critical shortcomings in the existing definition.

If that's the case the commit message needs to be updated so that we can
get this into v6.8-rc and the stable kernel (and do we really need all
those changes for that?).

Regards,
Bjorn

