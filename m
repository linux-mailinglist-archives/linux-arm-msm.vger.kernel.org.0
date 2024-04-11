Return-Path: <linux-arm-msm+bounces-17261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C311D8A1AAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 19:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16D0AB2836B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 16:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7331C1C820F;
	Thu, 11 Apr 2024 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LD9duxIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9A41206
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849916; cv=none; b=N14U6a5cPb0046tSA2Ma2y5uKWldtZowNqCIQY4XbrPzgVLgUIlkUSbW1+05j+HavOuqaioWPg6spzAxNCzbWyGy3scLfzlTSzOB47vgo7CMbcK7VhR4pQuh483DS7zB2FlSvMgBKijHajdAES7HBjH93dwooqDu6yzK89EJybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849916; c=relaxed/simple;
	bh=dGDB02K0Viy+DR1u9XLb/QR6ktvmRU9W44q6QBkwxA4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=przVTm8QOSn4oEn7+k+TTpsIOv0NFgA0nGteWuZ9FnaPTuzCwelROBcTCQqKOwpvCSr/Qdv9QOEX4oz/6csEOfDK4FE3UyfL4IWAD/20NZAR43Y7SLgESlEqo46Mk4NhWtKiKsQppPExKK70g2LmRUJ9B+CXwlLAoBRxLceedcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LD9duxIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BBuNcO001845;
	Thu, 11 Apr 2024 15:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=80DHk0Fuz06Uku1wcCSuS
	QnLdPfxG6C3CtabdVHSiqw=; b=LD9duxIovTWHZd0+EaPGMuTe3EToLjACY9hBR
	Lfu47WgmMaVIXhi/j/5BSzwgRy46k421Iq/Ffq/r65Gty0TBqxzWIbOiM2dtuaN8
	7+RR9CCsiQvdWkZbJNfxRCZGR4pc73CqzPyIBlGATEsqhGov7SMFCn1MjYvRX78c
	/2USix69X+JuV2Jg7mu3dYb33l4IJvyAZ7bgpCogCDZ52lfnMcvSrSCDwcy9534T
	K1QCBnfosC6wsKZ4hVMSbr4dB69XGgFX5IZ+lsiMD7BBPaz6blV1UfJX1mszhNMJ
	rH33MB3irye9t/RWnwZaC6YHWAKnVCOSe4wy4PwOxPbYbpJug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xedugs18c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:38:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFcOQ6024473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:38:24 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 08:38:24 -0700
Date: Thu, 11 Apr 2024 08:38:23 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
Message-ID: <ZhgD77bEoSiOmO3X@hu-bjorande-lv.qualcomm.com>
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
 <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
 <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
 <CAA8EJppAw9F8OnSW35xmYv_abzYaHp_EKtDgo7hgtE00-UmAFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJppAw9F8OnSW35xmYv_abzYaHp_EKtDgo7hgtE00-UmAFg@mail.gmail.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wzncNA3D_SEAPV226ecD-cXupr7XApJ9
X-Proofpoint-ORIG-GUID: wzncNA3D_SEAPV226ecD-cXupr7XApJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=876 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110114

On Thu, Apr 11, 2024 at 06:31:08AM +0300, Dmitry Baryshkov wrote:
> On Thu, 11 Apr 2024 at 06:19, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Wed, Apr 10, 2024 at 01:12:15AM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > > On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > > > > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > > > > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > >
> > > > =y for console?
> > >
> > > I think with pinctrl being set to m it won't reach the console anyway.
> > > And earlycon should work w/o ICC driver if I'm not mistaken.
> > >
> > > Several other Qualcomm platforms also have interconnects built as
> > > modules in defconfig. I really suppose that we should move all such
> > > drivers to =m and force using initrd. But this sounds like a topic for
> > > plumbers.
> > >
> >
> > That currently does not work very well, because if you probe defer the
> > UART into the future e.g. systemd will open /dev/console before it
> > exist - with no interest in reopening that later.
> >
> > So, if you care about UART, that is suboptimal.
> >
> > Resolve this, and I'd be happy to see them all go =m.
> 
> Doesn't /dev/console handle switching between earlycon and actual
> console? I'll take a look at some point in the future.
> 

It does not, selection happens at open(). So user space need to reopen
/dev/console once the console has been updated.

> But I can't help but notice that currently we have 5 ICC drivers built
> as modules (out of 21 mentioned in the defconfig). Should we fix them
> too?

I reviewed this a while back, at which time none of these had
interconnects specified for their UART device.

The lack of icc is likely a problem at some point, in which case this
would need to be updated. But at this time (at the time I looked at it),
there was no problem to motivate such change with.

Regards,
Bjorn

> 
> CONFIG_INTERCONNECT_QCOM_MSM8916=m
> CONFIG_INTERCONNECT_QCOM_MSM8996=m
> CONFIG_INTERCONNECT_QCOM_QCS404=m
> CONFIG_INTERCONNECT_QCOM_SM8150=m
> CONFIG_INTERCONNECT_QCOM_SM8350=m
> 
> 
> -- 
> With best wishes
> Dmitry

