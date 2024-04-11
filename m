Return-Path: <linux-arm-msm+bounces-17270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182078A1D3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 20:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39B2B1C217D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 18:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646AC15B967;
	Thu, 11 Apr 2024 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dzZkQzrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1884CB4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712854543; cv=none; b=RrgtbK7xKBToLnO32rUYo92Yw4QRljTkSYm3alNQiRZqEO4FMheIzt5I/26vyKyjTJ9VcYJF4zLFN2mrd8pHknona7+oTvigg3w5KJi6ljWWiEkO+uMCmdOmMUKq30Hw78knv7ZvAOrQcl04cYA6eGT1cwqSWxWS+XfjpqVmEdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712854543; c=relaxed/simple;
	bh=DzDskdDfz48Z7q53R/4gN0I5ILamOs722rnsdYlZ4QY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3uTUy7Z1pAGROQo6WBqeUNaky5tVWt+L9LYOj/ojbF1fy0K1Tef543RXy0VFQQJukS0mYE03DIm4T1H+9nqeIqEClkq6motwtqurUqKngon0QheG0uG3shXRr1zpf81UTB2QF78XmKVZ0//9JVVJ+pJTwx7xmZwvliHcK+I+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dzZkQzrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BFlp2V018520;
	Thu, 11 Apr 2024 16:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=8fXIlMJuQRuCYz+eJGIZO
	ZuyFtDy9kRsjBqtp0TukYg=; b=dzZkQzrLvAT6YNWF7eEzAKpgf1Im2bIszGokR
	SXqL7pLkZW5brDpCUbcDQ7A+YqQTG5312UfkY6Mk/VkzbGikxEMiI/rhRZTuTnRC
	oUPjv4QBjqmH3hn0w8GQkd0an7jzTt4XrrROMvC3Z9iQ8RTCFjZAx1yKyq1GNdwP
	zC/RvgjPtiLrUK8v0D5NEgtFrDmzUljYrDFiFrT/1GHjhnHq8lfwQOOZAaSTuSY/
	gz1mn7QAV0QVL0qM6/nmw45zIlSpI7CTN0jBSz3mZkKmEWQWGKnpfTfPQSUZAA69
	oJa7BSYNVdOjVqvMXxDVajREgJxzndAme8ZI0FVcpZfZvw8gQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeb62a0u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 16:55:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BGtTHe021447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 16:55:29 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 09:55:29 -0700
Date: Thu, 11 Apr 2024 09:55:28 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
Message-ID: <20240411165528.GA14853@hu-mdtipton-lv.qualcomm.com>
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
 <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
 <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
 <CAA8EJppAw9F8OnSW35xmYv_abzYaHp_EKtDgo7hgtE00-UmAFg@mail.gmail.com>
 <ZhgD77bEoSiOmO3X@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZhgD77bEoSiOmO3X@hu-bjorande-lv.qualcomm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0VG66AlBE3xZC5o-WblmOMzweUkjME0V
X-Proofpoint-GUID: 0VG66AlBE3xZC5o-WblmOMzweUkjME0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_09,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110123

On Thu, Apr 11, 2024 at 08:38:23AM -0700, Bjorn Andersson wrote:
> On Thu, Apr 11, 2024 at 06:31:08AM +0300, Dmitry Baryshkov wrote:
> > On Thu, 11 Apr 2024 at 06:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > >
> > > On Wed, Apr 10, 2024 at 01:12:15AM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > > > On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > > > > > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > > > > > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > >
> > > > > =y for console?
> > > >
> > > > I think with pinctrl being set to m it won't reach the console anyway.
> > > > And earlycon should work w/o ICC driver if I'm not mistaken.
> > > >
> > > > Several other Qualcomm platforms also have interconnects built as
> > > > modules in defconfig. I really suppose that we should move all such
> > > > drivers to =m and force using initrd. But this sounds like a topic for
> > > > plumbers.
> > > >
> > >
> > > That currently does not work very well, because if you probe defer the
> > > UART into the future e.g. systemd will open /dev/console before it
> > > exist - with no interest in reopening that later.
> > >
> > > So, if you care about UART, that is suboptimal.
> > >
> > > Resolve this, and I'd be happy to see them all go =m.
> > 
> > Doesn't /dev/console handle switching between earlycon and actual
> > console? I'll take a look at some point in the future.
> > 
> 
> It does not, selection happens at open(). So user space need to reopen
> /dev/console once the console has been updated.
> 
> > But I can't help but notice that currently we have 5 ICC drivers built
> > as modules (out of 21 mentioned in the defconfig). Should we fix them
> > too?
> 
> I reviewed this a while back, at which time none of these had
> interconnects specified for their UART device.
> 
> The lack of icc is likely a problem at some point, in which case this
> would need to be updated. But at this time (at the time I looked at it),
> there was no problem to motivate such change with.

Note that on Android we have no choice but to build the interconnect
drivers as modules. Vendor support is added as modules loaded on the
vendor-agnostic GKI kernel. We don't have issues with earlycon there.
That being said, I'm not really an expert in how the earlycon or serial
drivers work.

From a HW perspective, all the busses required for the serial UART are
enabled by default from bootloaders. So, no explicit voting for them
should be necessary for early serial logs.

