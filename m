Return-Path: <linux-arm-msm+bounces-60253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60EFACE229
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 18:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EE703A523F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 16:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1AF1DED69;
	Wed,  4 Jun 2025 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qge8JJvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B718DB0D;
	Wed,  4 Jun 2025 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054302; cv=none; b=DhwBGIsqimJ838N0GFrgb40UU/p/Y4H4/O5XbMmSiUSB/m5zdcKP76iw5Lr/1+TquMOXmKl8MJFKg1n59S5Kxqx4QYfUkwCOZMoMKSGT+7mziDsoaZpe1YDgBb5+rYKc6v9Y6q3gU88JA0NdvnYZRnslF5jyw92J9Q5flA74WdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054302; c=relaxed/simple;
	bh=87W48LqVY/aMuSheLPpnBNAoFGMDeu7rhmQlYwPnwdk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWTvarJd2wVyK03wlXtpKkz6xvitkuNjHnb9dmxxhYvJIVqhyaVkx87aryumXOSmGVkTcpoBvY0P3aOWnaMtnqcte2VLXROhGNowHEUECoi3ALx6ZpAwDQu/+GI7H/Ejg++BJVSP3Xz2qJhUBDrQevgx8kEbu9iF/lgnqI9qMbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qge8JJvd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549256e012946;
	Wed, 4 Jun 2025 16:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xksDVfmyMji+kYXngBYT/on4
	bbpSsAwyMiFwj7QJ/ro=; b=Qge8JJvd+NC37P/XOKTvAH2tk9tS8ZSIUjUoUW+i
	XWD5MLndsOYiAJBE9KzEqe7C+WhmDqFlv3JyIVkcMADadmrZpRQGYrX1bnI5awNl
	+4x4KS8iJ3SHmLP4wDlDU0E7Bf7BsjQtswe5hraAlrKmkWbs1G6RvvJ2j400ZesJ
	wg/guvUYYF3SDxOd1Feb4scVKEicDRmI9YjxUJtc0u2ignlP7kGBgQjzu/jvC/NA
	f3rQW4ON9zZKItUxa6FAoiw/Dny640+0vTU9YMZ6Ar3nyRXpAvUzCDLO2Ca72L9D
	6oWP/m2rthg72Ssh3L5TV4j2oqq5VGBipFVpeuNADCIPpQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wcb9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 16:24:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554GOtV6015416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 16:24:55 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Jun 2025 09:24:48 -0700
Date: Wed, 4 Jun 2025 21:54:38 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
Message-ID: <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QjUTpZFUt24HSENUyB9pNlAsHz4BwPro
X-Proofpoint-GUID: QjUTpZFUt24HSENUyB9pNlAsHz4BwPro
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68407358 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=wt0p8g2Xs4n1KaSH9c4A:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyNSBTYWx0ZWRfXyzhnEDRPmatr
 P8zCi4SZfRxKz/8SI9kfuhuhlpdHIlHNZvnUsnJ06oW6Cmw7BSlbhnmpWTGDtDD9cQKlvP0wu3/
 VuzpJAOsGe2i8xqAGfBev2ySQOWXmFU6RmJAiln2/Rd1l0DecsY2j/VSqPjJVD5OIjw6NZM6bAM
 RY6Q7GwylCJsLIJ+a1ullbH21pARhXAEEW3HmOobf2cw6379BiebeX/S+mWyYfoSRpHAs6eJLkr
 iKrUXhKF+KoM5JVvPyNGYp9sr5LV73ZJi3YQsD4oXd0kcwYjsqr+YYdnzDVOMj7d1RKWIGAZvT4
 rUTAx/ZLkonqCMw6enLxRMZ/rLV9/HSe20zzanauEpTCRng2ghfNNqDrxhocE39bJjddAS4Cktl
 9bPExlQ5eyu3m89Q19DCLwGNeh9mSK8XW9V/Y+o878omQzmJT7mqokWvoMoScDjifOPSUL5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040125

On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> > On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > 
> > > > SA8775P has a memory map which caters to the auto specific requirements.
> > > 
> > > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > > one. Has this changed?
> > 
> > Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> > the later one is SCMI based chip.
> > 
> > Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> > 
> > > 
> > > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > > inherit the memory map of SA8775P require a slightly different memory
> > > > map as compared to SA8775P auto parts.
> > > > This new memory map is applicable for all the IoT boards which inherit
> > > > the initial SA8775P memory map. This is not applicable for non-IoT
> > > 
> > > Is there are platform out there that actually uses the "initial SA8775P
> > > memory map"?
> > 
> > Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> > map.
> > 
> > > 
> > > > boards.
> > > > 
> > > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > > introduced as part of firmware updates for IoT. The size and base address
> > > > have been updated for video PIL carveout compared to SA8775P since it is
> > > > being brought up for the first time on IoT boards. The base addresses
> > > > of the rest of the PIL carveouts have been updated to accommodate the
> > > > change in size of video since PIL regions are relocatable and their
> > > > functionality is not impacted due to this change. The size of camera
> > > > pil has also been increased without breaking any feature.
> > > > 
> > > > The size of trusted apps carveout has also been reduced since it is
> > > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > > carveout and its corresponding scm reference has been removed as these
> > > > are not required for IoT parts.
> > > > 
> > > > Incorporate these changes in the updated memory map.
> > > > 
> > > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > ---
> > > >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > > >  1 file changed, 113 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > new file mode 100644
> > > > index 000000000000..ff2600eb5e3d
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > 
> > > The naming convention is <soc>-<something>.dtsi and I don't see any
> > > other uses of the "iq9" naming.
> > 
> > As this new memory map is common for IQ9 series of SoC (QCS9100 &
> > QCS9075), so we have used its common name.
> 
> IQ9 name is not known or visible outside of this commit.

Are you referring to add the same in cover-letter?

> 
> > Once the DT structure for QCS9100 is refactored, we would update this
> > common file there.
> 
> Can you refactor it first?

This refactoring involves changes in all the ride/ride-r3 boards which
are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
need to conclude on the final structure. Since, ethernet is broken in upstream,
we are working on its fix before sending another series.

Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
finalized, we can use the memory-map there.

But to avoid this dependency and to proceed with iq9075-evk alone,
I can rename it to qcs9075-reserved-memory.dtsi.

Let me know if that works here.

[1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/

> 
> > 
> > > 
> 
> -- 
> With best wishes
> Dmitry

Regards,
Wasim

