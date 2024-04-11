Return-Path: <linux-arm-msm+bounces-17260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE3E8A1912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 17:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7755C1C23557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 15:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437B479DD4;
	Thu, 11 Apr 2024 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E4PVD38X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8E29416
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849597; cv=none; b=XBoHJMJgr6dq5vbZ1JslW0xT5QpBny85jeHSD9b6DvxRITcP8juBwEKJabOS9YM7Lg58HwDMUB21bCD5JtyQk7EYAMqcknrrhibOqftyevAqUlOUoyzSyUU/tlyyejKLXTCIlgI0BMxwX7Ca7lqE7ijUUygXqV85i5kVwlsXjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849597; c=relaxed/simple;
	bh=x1GhZ2tPv0w+EzjPaQ7KKMaYnIEyRGUc+QDb35aaN0U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyBlHgcsrKhAYI/HfsUw1iqT6XP5myEPFTvveMnayH8GFGvvnf+f+I5y+rIGyhNeYpQJYmY55PMp/UfBQGzguBUBZIir8cCHvQF5mxLgXVsF+hDNhMJ1FyO3ZPwKhhzMz4tSBNso+98Yi01uTyqWM/9iP/bfZR1czYFmPjIPNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E4PVD38X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BDKYku019962;
	Thu, 11 Apr 2024 15:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=PEg5kYzf+9yeqH6uxUQDh
	Gf4OjYUezS00/rUQSL4u64=; b=E4PVD38X7GG1tZbwrmwdmxLinfWBuXo97C8Fj
	SIkd+xdlhIc6EqQP9pzk6MRx88vOoKsQutaOFRBOJcL9P2el2MnJWgHwxG0zZMng
	CsefdLbRai+4EjKAGCa75RJEzRRJKAFUwl+GBVqyQVWgX5hk7oeNZCdORBNs3SZJ
	GYs6T0gEwqoX1iB0AS1rmKOkoyJ+YMFYqy+DZOfkSe16X+NBGJ7c2iOHkdnXrGzs
	XWAxXyvpnuSE8hIFaQIYfqBPCiMSlbvUaVg0BlbR+kTxArS0Coczi8Z652D8xl+Q
	b0u7jVdWX1STtgmJES8aheV0CPrF9+YX04KaWjKpFKcs/1hpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeb629t3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:33:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFX3wd000382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:33:03 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 08:33:03 -0700
Date: Thu, 11 Apr 2024 08:33:02 -0700
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
Message-ID: <ZhgCrlu4KP1og0xc@hu-bjorande-lv.qualcomm.com>
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
 <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
 <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
 <CAA8EJprDPtmzzoZCQ8eyZXYydR6=13TsYFnO9A-StK_GxL4Gpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJprDPtmzzoZCQ8eyZXYydR6=13TsYFnO9A-StK_GxL4Gpg@mail.gmail.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XLtJTSZqKn_p8IRfmstxU4N3dNTqJv36
X-Proofpoint-GUID: XLtJTSZqKn_p8IRfmstxU4N3dNTqJv36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=772
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110113

On Thu, Apr 11, 2024 at 06:33:17AM +0300, Dmitry Baryshkov wrote:
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
> BTW, so even if /dev/console doesn't handle switching behind the scenes,
> Systemd at initramfs opens /dev/console, maybe fails, loads icc and
> other modules. Then it does pivot_root and executes systemd on the
> rootfs. At this point the /dev/console exists and the systemd should
> continue without any issues.
> 

On which console does it ask for your passphrase for your encrypted
rootfs?


Closer to home, I do most of my testing in a ramdisk, not having working
/dev/console is a problem for m.

Regards,
Bjorn

