Return-Path: <linux-arm-msm+bounces-7986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0483839410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 512D51F23C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375495FDC6;
	Tue, 23 Jan 2024 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iGKUnXy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3B61664;
	Tue, 23 Jan 2024 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706025745; cv=none; b=QlKFeNfnk/FVOvVIkdCWhUm3dDki/BQNZX1/r6CK1SmTifCLLovvY/yYkTiZOiV7LxE5eQPyrpo6Ii30WEdBrd8baEZYjrjg3LxNeLrwI6hZKxta9j89cwpNyCAPfl7rLSLxrZRcj2hdi4PvrawfU1zw2TX6SR86LV+JDN4nEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706025745; c=relaxed/simple;
	bh=mqXIVAaMWkBymnpjWI+yTbHmqPo9c4SupuEU7emq97I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frI1nhf2i7NlNZdEdyfj2mfHuZMJBHin+ARuCG8oD0AX+A1tH0hB26wF/DNwEa7ZJ1NBz/wvvLbffBm1W+70PzlmnCmXFugMh2SaOi6ExZRvP5d/F8MvVMaF9fGrtY9auqgEU+GJafjNzzZnO7mbyX89zexbCD30TL8DdvS9GaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iGKUnXy5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NFHigr019375;
	Tue, 23 Jan 2024 16:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=s64+VzjI/2aDl5Kiv7zx7
	/HXW3omEWEwUPFe39rFxrE=; b=iGKUnXy5P7w1cnHM6mn73HU5KN8TdMwa5w6V1
	Z56bF6UwoM0zehuLmExlaLNWekaeDUntiHDWWAwV34Ptt0ImnNnk1cDxdqLtafnX
	AU8fmpEvHilmPWwyHMezRhDz7CbQ4IjtNX37OQN0pGjuO4nxi3u9YpoKYPOTRjds
	MaBaYlqDla8MiS2BM9g3hBACKpUJ27wsWbw5ImpCGXyXDdnRM4orj54fDNsWr8Aq
	COcYCUqhqG/C4jcXENiATNo2Ut+ThdBnSOBRPgoDMALFfaTDllL6AI+KzWnqyo7n
	6ZceFfWNpHqFD3lfFUMAMjTJ2ySv48YpvkqyUv3YCaYfZflJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vt9un9506-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 16:02:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NG27Yi007210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 16:02:07 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 08:02:05 -0800
Date: Tue, 23 Jan 2024 08:02:03 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Trilok Soni <quic_tsoni@quicinc.com>, Brian Masney <bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_psodagud@quicinc.com>, <quic_kprasan@quicinc.com>,
        <quic_ymg@quicinc.com>, <kernel@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to
 SA8775P
Message-ID: <20240123160203.GF2936378@hu-bjorande-lv.qualcomm.com>
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
 <Za5xj8S3Gs7N-UUc@x1>
 <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
 <884f92ac-4d1a-9f0c-29ad-9d5833f10863@quicinc.com>
 <CAA8EJpq74G7Et=vuc-K0y_wKCEiM0=YVyb7TcosAnbvOFMWDMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpq74G7Et=vuc-K0y_wKCEiM0=YVyb7TcosAnbvOFMWDMg@mail.gmail.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MBmTK3WH6ViE9vrIhZkVhUzPmCRksBvI
X-Proofpoint-GUID: MBmTK3WH6ViE9vrIhZkVhUzPmCRksBvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_09,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=812 mlxscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230118

On Tue, Jan 23, 2024 at 08:23:37AM +0200, Dmitry Baryshkov wrote:
> On Tue, 23 Jan 2024 at 04:58, Trilok Soni <quic_tsoni@quicinc.com> wrote:
> > On 1/22/2024 12:02 PM, Bjorn Andersson wrote:
[..]
> > As Brian M mentioned earlier, we want soc vendors to submit the support
> > for their SOCs and platforms on top it as early as possible and it means
> > such memory map changes will continue. Even memory map changes
> > continue even few months after the commercial s/w release in certain cases
> > due to critical bugs were found in some usecases which warrants the changes.
> 
> So, can one handle such changes? Are we going to publish a list of
> kernels to be used with the corresponding firmware images? Then what
> if the developer wants to update just the kernel? Just to get this or
> that non-platform-related feature. Or vice versa, what if the user is
> stuck with an older kernel because some driver gets broken in the main
> branch (which unfortunately happens sometimes)  Or what if the memory
> map patch gets backported via the AUTOSEL process?
> Unlike the Qualcomm binary distributions, the firmware and the kernel
> version are no longer connected.
> 
> That's why I keep on saying that memory map is an ABI. If it gets
> changed, it is a completely new, incompatible platform.

This is only a problem because we think the DeviceTree is a part of the
kernel. If we actually tied the DeviceTree to the firmware - as it was
intended - different firmware versions could come with different memory
map.

The one exception would be any remoteproc/pil firmware that is not
relocatable, as these are distributed together with the OS (in some
form) and not the boot/security/etc firmware.

Regards,
Bjorn

