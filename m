Return-Path: <linux-arm-msm+bounces-60645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD8AD1EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E501116C27C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BFF2580EC;
	Mon,  9 Jun 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fL4N0VX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F925A2CF;
	Mon,  9 Jun 2025 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475165; cv=none; b=T5f8MQEOf4PJbIq8Iq12Qp8yqIo5Xu15adOwzpisrb2rgVH3laswR5ncSz05kWI9DjvZzb2kfTGwQENArVlOCWCzEil/7f7w9EtPrbUTRgn+E1c+qoh6itFY9/WH3QA97Wqe4eEMMKay/+iBf2im8xuey+IjCyiNau0h+hI+YfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475165; c=relaxed/simple;
	bh=Z2932OZyveK0+Uk61aLzEQ44aEOFqJ0e6p8TWd4Yka0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPfxYIXmK0jKn3/vuRo9dyBc4JAE1uaoftvkQdsFeWwzql23TOE/0G3kxZ23oRFJWdR7QZ1eMZ83dIAD/OlvMS2WlI+YmNisZJRXWtY9kXORnt3am74l1CnJyEFfYFY6B1QqPei0MeTUVLK2tDEJINwruJWWXMqSjVTXnFebFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fL4N0VX4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599gUfi021017;
	Mon, 9 Jun 2025 13:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wf+0jqAv8Wsqf1LsxHnd2k+B
	8yrYVSDIpG3ltaNDxcw=; b=fL4N0VX4fk+AAP2NGA86hPMYC5VAYDReNx/RaEBR
	6f/4iE8yxhx/eBBQYfN5ogd+3S4MdOO/yn3zimSn6rmzieDejUexGIjiYcYx/gnF
	Cadu+23eTfDwEBmjGQ4uv1MW4Y8XxwnuBsoaVQUoPcLB4dyYXZw5QKP/NVQnELL5
	ZqmAVBObEZc7E+B0F5nFc6diHOuPItMaEmRxZ83LCOjLEjiWvs+3xTt2ErHm/v3A
	1G7oghH+QKu5guza1yvSmV7bCfsRH8Coxr5SxT0FVA2D21fdmVAMvqSSlx5VECSF
	9iZBpwaDP7130srLEAy7vxBg6ENPnFs4cxhZEbecd/TsiQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpnuns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 13:19:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559DJI58017893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 13:19:18 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 06:19:11 -0700
Date: Mon, 9 Jun 2025 18:49:02 +0530
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
Message-ID: <aEbfRoSbJgKmVYZe@hu-wasimn-hyd.qualcomm.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
 <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
 <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
 <aEavSv3VWuMvzyBw@hu-wasimn-hyd.qualcomm.com>
 <84f4dedd-fe3a-452f-93f7-b20e0bda9951@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <84f4dedd-fe3a-452f-93f7-b20e0bda9951@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846df57 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=1J-_arqMHHhWf6i7UV4A:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NyBTYWx0ZWRfX8EI3raYXGx+Z
 9kEvnEffpy7MiMcnpXMQ/5V8V6nTe93JuLbgi7OFQQOZXPh0o8wDMiXYlxXbHzpk/z//MmQ+IIb
 pd83B7vwc0HLHDH+TyhfOHz4R4L4pJMEFCY/Gww8D5rY6aWyLHEXmk2/O51VCUxLkX0QHukUijs
 3T3heNLgYUwX0VhYNZRbnAVrmZTRrzffquEr1z2IXpNa72rZRRYeAdHp4ncu1pQlZmFCYr5eDkj
 6qJyMZ6Ofc02zCMwvEiF2ui9QipdfzXw3KNyOf7/3fHjWSqlEQqlmQI2eQqN4RNRb10Blkpt+9x
 pSzxM+aonjHNFxFtGdi9dngjXyaUUNSmps3dzcnA6/1+h9z+7c3YoywqYQHiijMvooE7YqbXE4I
 K9KLJ7YpDrtMoHNZ0bZyrtYddwuBiM7GbMRBEnPzvuwkN0JpGe47PoZhTrQJ+JB/LUYxY7Ml
X-Proofpoint-GUID: XwIvaZ5hT7WsiD3_MhVqIMQRPDRU5Uuh
X-Proofpoint-ORIG-GUID: XwIvaZ5hT7WsiD3_MhVqIMQRPDRU5Uuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090097

On Mon, Jun 09, 2025 at 01:03:02PM +0300, Dmitry Baryshkov wrote:
> On 09/06/2025 12:54, Wasim Nazir wrote:
> > On Sat, Jun 07, 2025 at 11:22:39PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Jun 06, 2025 at 02:02:50PM +0530, Wasim Nazir wrote:
> > > > On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
> > > > > On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> > > > > > > On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > > > > > > > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > > > > > > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > > > > 
> > > > > > > > > SA8775P has a memory map which caters to the auto specific requirements.
> > > > > > > > 
> > > > > > > > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > > > > > > > one. Has this changed?
> > > > > > > 
> > > > > > > Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> > > > > > > the later one is SCMI based chip.
> > > > > > > 
> > > > > > > Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> > > > > > > 
> > > > > > > > 
> > > > > > > > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > > > > > > > inherit the memory map of SA8775P require a slightly different memory
> > > > > > > > > map as compared to SA8775P auto parts.
> > > > > > > > > This new memory map is applicable for all the IoT boards which inherit
> > > > > > > > > the initial SA8775P memory map. This is not applicable for non-IoT
> > > > > > > > 
> > > > > > > > Is there are platform out there that actually uses the "initial SA8775P
> > > > > > > > memory map"?
> > > > > > > 
> > > > > > > Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> > > > > > > map.
> > > > > > > 
> > > > > > > > 
> > > > > > > > > boards.
> > > > > > > > > 
> > > > > > > > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > > > > > > > introduced as part of firmware updates for IoT. The size and base address
> > > > > > > > > have been updated for video PIL carveout compared to SA8775P since it is
> > > > > > > > > being brought up for the first time on IoT boards. The base addresses
> > > > > > > > > of the rest of the PIL carveouts have been updated to accommodate the
> > > > > > > > > change in size of video since PIL regions are relocatable and their
> > > > > > > > > functionality is not impacted due to this change. The size of camera
> > > > > > > > > pil has also been increased without breaking any feature.
> > > > > > > > > 
> > > > > > > > > The size of trusted apps carveout has also been reduced since it is
> > > > > > > > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > > > > > > > carveout and its corresponding scm reference has been removed as these
> > > > > > > > > are not required for IoT parts.
> > > > > > > > > 
> > > > > > > > > Incorporate these changes in the updated memory map.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > > > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > > > > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > > > > > ---
> > > > > > > > >   .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > > > > > > > >   1 file changed, 113 insertions(+)
> > > > > > > > >   create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > > > > 
> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..ff2600eb5e3d
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > > > 
> > > > > > > > The naming convention is <soc>-<something>.dtsi and I don't see any
> > > > > > > > other uses of the "iq9" naming.
> > > > > > > 
> > > > > > > As this new memory map is common for IQ9 series of SoC (QCS9100 &
> > > > > > > QCS9075), so we have used its common name.
> > > > > > 
> > > > > > IQ9 name is not known or visible outside of this commit.
> > > > > 
> > > > > Are you referring to add the same in cover-letter?
> > > > > 
> > > > > > 
> > > > > > > Once the DT structure for QCS9100 is refactored, we would update this
> > > > > > > common file there.
> > > > > > 
> > > > > > Can you refactor it first?
> > > > > 
> > > > > This refactoring involves changes in all the ride/ride-r3 boards which
> > > > > are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
> > > > > need to conclude on the final structure. Since, ethernet is broken in upstream,
> > > > > we are working on its fix before sending another series.
> > > > > 
> > > > > Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
> > > > > finalized, we can use the memory-map there.
> > > > > 
> > > > > But to avoid this dependency and to proceed with iq9075-evk alone,
> > > > > I can rename it to qcs9075-reserved-memory.dtsi.
> > > > > 
> > > > > Let me know if that works here.
> > > > > 
> > > > > [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/
> > > > 
> > > > Hi Dmitry,
> > > > 
> > > > Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
> > > > other suggestion that we should discuss?
> > > > 
> > > > Aparently, this series is for qcs9075 only so using exact (not common)
> > > > name also aligns the naming format.
> > > 
> > > Squash it into qcs9075.dtsi.
> > 
> > We don't have qcs9075.dtsi.
> > Is it ok to squash it into qcs9075-som.dtsi ?
> 
> Is the memory map specific to SoM or to the SoC?

Understood, will create soc file and add the memory map changes.

> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > 
> > > > > > -- 
> > > > > > With best wishes
> > > > > > Dmitry
> > > > > 
> > > > > Regards,
> > > > > Wasim
> > > > 
> > > > -- 
> > > > Regards,
> > > > Wasim
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Regards,
Wasim

