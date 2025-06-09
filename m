Return-Path: <linux-arm-msm+bounces-60568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED3AD1B18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 11:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AA4916144E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA91224C09E;
	Mon,  9 Jun 2025 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YtLz+01m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408541C63;
	Mon,  9 Jun 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462881; cv=none; b=fk/KmBPluhl4Qpd1NAElENee6Upr7LL5JTC1c+K/4nP+WjVnNdo89snIv3iCysK7pSRAUT852V8OLYcWstdTUlcEP+Xumj16wN/yDtSOU1V7Wsgofcj0Y810fz/S4I16mxgEFFNdcPQ/k60Rk9KjWWGMyml5Lv+lF3zMQbis2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462881; c=relaxed/simple;
	bh=eOgMCR2qJQTO7OxJCrTlsFRVzvCtziaqjcV0SI0FU0M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epuBwlpIcb2xAYrRiSiDL2uagemXyibAiTdaYqtfwDuyuHKGv5cuFhrVWq0h9hYvoTE/6px42dek2uvYKELN83iV9CkfZOT8lbMH+uPuovqMyfUgxr6pd5IfxKXSMAsdGKeKJERvy0iJdvK9cdP8DjYm4Y58PkDq+NMugAYV9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YtLz+01m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55934vfI020014;
	Mon, 9 Jun 2025 09:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7lcrrRHKoLWZrxnSLwacatN1
	dshNcspmS+DeJ5CdxmU=; b=YtLz+01mJAtSV+KbxJaClOR1nfa5V3+URhX0AuUN
	YUiTxY95ws4RIBy0Tdwh5hMrOKm+bf2VsSn61okD/ougoLvtnGOD6lffaUm0JfDB
	fT5ux8/L1dCipbSYBbUoONV2nsFZEBLt7dV3jwvq9wzzIaVxvvs0zvvlMpnUxyQx
	f7sYMUkan3QPjHRI6o4CbxV9zhOcnUYcy+WNJR9+MXc0OOLvv+J4N4RmCcrExjft
	HeleiOghl6FuWfSdWKShqgOUrJ0GyXKjb/NNyP9tg17jn5qpp3Z+hP5xW0pdV6e/
	C4nwFXWp0wh/g6GuHksLm6Am5fSqfyoQpzPHKsdefn1L7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qcts1ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 09:54:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5599sZhX014112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 09:54:35 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 02:54:27 -0700
Date: Mon, 9 Jun 2025 15:24:18 +0530
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
Message-ID: <aEavSv3VWuMvzyBw@hu-wasimn-hyd.qualcomm.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
 <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
 <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c_0WZxpIbSWgC6ad4N2cE_taKB_l5Edt
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846af5c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=-YevBJ-UrPJtX6aMaiwA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3NiBTYWx0ZWRfX/3veLVIKMeWb
 1oA+c09Zd51VTBy1dOH+WlRF1BdlnCfAMVHHfzXh1LJ/pxPBtwae4Tw6ccCRlBDX/8b1Yq05z7C
 7xx0m9N3KFEnStkhGrBh4QUT4CN0MvDH/L2CKw/ArsTkm1IeKT0quaBDe3w9TZyGobf7yTSQXpF
 NliCY23H4DKH3m6FAGgS4s3CjNJOpl1YdSplDIk2N4f0GIl7OUHzFbmmbi2d4jOhOObZ5jCh+Gp
 DL+NLVriGP9Sa1pFcPaeCWDsQQL9tlgYg/HMupOnxXF3lpa7Zj+/dgnUZ2j4nrodxdrWtEbORuG
 MmqLLkdMHZJ2/2lT7Lhx0xrQiuyuOoQJBsGyHyzoNd9Qm0WOUvhYO0wUx7MvpT4+mNw06RbYxxN
 Y3+Km0GRoko6CChLdu+fHFcpEff3GOTe3b7N1vXV+VL4M6GKFp/ZGNjiX2IB68wQ/y4g0FkN
X-Proofpoint-ORIG-GUID: c_0WZxpIbSWgC6ad4N2cE_taKB_l5Edt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090076

On Sat, Jun 07, 2025 at 11:22:39PM +0300, Dmitry Baryshkov wrote:
> On Fri, Jun 06, 2025 at 02:02:50PM +0530, Wasim Nazir wrote:
> > On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
> > > On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> > > > > On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > > > > > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > > > > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > > 
> > > > > > > SA8775P has a memory map which caters to the auto specific requirements.
> > > > > > 
> > > > > > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > > > > > one. Has this changed?
> > > > > 
> > > > > Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> > > > > the later one is SCMI based chip.
> > > > > 
> > > > > Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> > > > > 
> > > > > > 
> > > > > > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > > > > > inherit the memory map of SA8775P require a slightly different memory
> > > > > > > map as compared to SA8775P auto parts.
> > > > > > > This new memory map is applicable for all the IoT boards which inherit
> > > > > > > the initial SA8775P memory map. This is not applicable for non-IoT
> > > > > > 
> > > > > > Is there are platform out there that actually uses the "initial SA8775P
> > > > > > memory map"?
> > > > > 
> > > > > Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> > > > > map.
> > > > > 
> > > > > > 
> > > > > > > boards.
> > > > > > > 
> > > > > > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > > > > > introduced as part of firmware updates for IoT. The size and base address
> > > > > > > have been updated for video PIL carveout compared to SA8775P since it is
> > > > > > > being brought up for the first time on IoT boards. The base addresses
> > > > > > > of the rest of the PIL carveouts have been updated to accommodate the
> > > > > > > change in size of video since PIL regions are relocatable and their
> > > > > > > functionality is not impacted due to this change. The size of camera
> > > > > > > pil has also been increased without breaking any feature.
> > > > > > > 
> > > > > > > The size of trusted apps carveout has also been reduced since it is
> > > > > > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > > > > > carveout and its corresponding scm reference has been removed as these
> > > > > > > are not required for IoT parts.
> > > > > > > 
> > > > > > > Incorporate these changes in the updated memory map.
> > > > > > > 
> > > > > > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > > > ---
> > > > > > >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > > > > > >  1 file changed, 113 insertions(+)
> > > > > > >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..ff2600eb5e3d
> > > > > > > --- /dev/null
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > 
> > > > > > The naming convention is <soc>-<something>.dtsi and I don't see any
> > > > > > other uses of the "iq9" naming.
> > > > > 
> > > > > As this new memory map is common for IQ9 series of SoC (QCS9100 &
> > > > > QCS9075), so we have used its common name.
> > > > 
> > > > IQ9 name is not known or visible outside of this commit.
> > > 
> > > Are you referring to add the same in cover-letter?
> > > 
> > > > 
> > > > > Once the DT structure for QCS9100 is refactored, we would update this
> > > > > common file there.
> > > > 
> > > > Can you refactor it first?
> > > 
> > > This refactoring involves changes in all the ride/ride-r3 boards which
> > > are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
> > > need to conclude on the final structure. Since, ethernet is broken in upstream,
> > > we are working on its fix before sending another series.
> > > 
> > > Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
> > > finalized, we can use the memory-map there.
> > > 
> > > But to avoid this dependency and to proceed with iq9075-evk alone,
> > > I can rename it to qcs9075-reserved-memory.dtsi.
> > > 
> > > Let me know if that works here.
> > > 
> > > [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/
> > 
> > Hi Dmitry,
> > 
> > Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
> > other suggestion that we should discuss?
> > 
> > Aparently, this series is for qcs9075 only so using exact (not common)
> > name also aligns the naming format.
> 
> Squash it into qcs9075.dtsi.

We don't have qcs9075.dtsi.
Is it ok to squash it into qcs9075-som.dtsi ?

> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > > 
> > > Regards,
> > > Wasim
> > 
> > -- 
> > Regards,
> > Wasim
> 
> -- 
> With best wishes
> Dmitry

-- 
Regards,
Wasim

