Return-Path: <linux-arm-msm+bounces-60449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2A1ACFE5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CA047A75A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 08:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A0327D77A;
	Fri,  6 Jun 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="onjfzsfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED113B2A4;
	Fri,  6 Jun 2025 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198788; cv=none; b=P2d23eoMeP6kNpMv0xpnXeHdSYDixaxnSYq6JjW38/++hYcMSdzVUV0zQq1+voTiRk4l9xIkQJQknoR9JXR80qiFVt/D5cGhmrdOF8L99bD89Q/eA5CBSrxi7aL9kz+/qiaxccalrNMTYWHWa8vUN4YbXgILasMRQJmse/QjJmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198788; c=relaxed/simple;
	bh=1gzjtlxcNBaboAp10B6DsPzSnR0n5tBzCYY1UIHBU9Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PK7naPSuRbLQYTuZMiQw0mJDi6HvFEJft6iV40efN2+q1ISeOOX83ng+GNYYPSwn/XK4wz8BA/wx7Isaji2bEFTIowuGnDhACsjpV6Ljf/e8mIXoWYT4omLED46XLCKfAVfsdzYheCKDLvX9O2DC0EPC50Bs82udjSHrUnUKpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=onjfzsfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5560K2am012188;
	Fri, 6 Jun 2025 08:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jQfYr5ca0u+R0dNsjLWO8jy3
	cZurjVwbb0x8P7BeGgg=; b=onjfzsfjkif9rFWctQ3uS9DTlk/d+C229qRRix49
	gwkUOWe0mV0rQhZCjE2inkiLHZT4BnxAwZN/mbGNaBRwB7cPaLYwRxJbFCmCkrN0
	08vT5AxlHT0rcsN0tH6dxmADs9ZNXTmZCOz5BmlZdjpeitO7VriLCwfAMbthw3HU
	sxYJsNxkR0Sc3hNm3IRfvSH55YqI3OihS7U2aMCzbGMxcedN2wL7SoqRTgWDY3Dz
	5rvf4WkgbdQtRQ8HkXx9/+M9ZvSlIg4UByCAxuH8lEdKDhnPcNW5f2Oy1FCC0I/S
	8pYv6MXAAKOyc6gK4vdMhdhsEn/2ojBtwUMv1KOGATbjgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 473nphs09h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 08:33:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5568X107019131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 08:33:01 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 01:32:54 -0700
Date: Fri, 6 Jun 2025 14:02:50 +0530
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
Message-ID: <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zgZp3PWVoq8iKPL3K4ByqNG-_DC-rBzx
X-Authority-Analysis: v=2.4 cv=N8QpF39B c=1 sm=1 tr=0 ts=6842a7be cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=YzUi6L5IsME7Xw4Q_eYA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3OCBTYWx0ZWRfX0BSiBwDhf80o
 nn86y8LkCsZtd9PJIftHtvhWGqL7o5eVjlR1/Eq4ewL3dfK9INuU2bA4RzIu0D9ofMUhftecBwl
 xR7f+34gmQhs1FFwEoImdYq0MXHGv67MwmoYgV884oW0FYqq9P81j8hsouvlFDwsTKeYqcT3Soj
 frdpRjPm/u8fE10rkeQmXYLttWKq8WnJC9fO0fW5G8uyuCtq8TVQ3lbLWW2w3VSfFEiQc2bXG4U
 turh/IGPYlRly+6V9GJL0Vs3vUOvFFW6Apa7Z9hXX2jo4+aBeJeYOlu4/54BCJ0qssABZHQM0uh
 OrlJ+cZNreYWBtdl+oY2ufN/SQD1Zg/eG0aSH0NxmKjCmXLJu1e0M/OqGkE/P5HDQaePmtcpAj+
 VQogTeb3yfO5LJgQOe5aXB3kIiQvfmBKOiOuNSh89oe1n1hHm7fp7NA6YOyoEQdrBN2i7CdY
X-Proofpoint-GUID: zgZp3PWVoq8iKPL3K4ByqNG-_DC-rBzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060078

On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
> On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> > > On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > > > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > 
> > > > > SA8775P has a memory map which caters to the auto specific requirements.
> > > > 
> > > > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > > > one. Has this changed?
> > > 
> > > Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> > > the later one is SCMI based chip.
> > > 
> > > Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> > > 
> > > > 
> > > > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > > > inherit the memory map of SA8775P require a slightly different memory
> > > > > map as compared to SA8775P auto parts.
> > > > > This new memory map is applicable for all the IoT boards which inherit
> > > > > the initial SA8775P memory map. This is not applicable for non-IoT
> > > > 
> > > > Is there are platform out there that actually uses the "initial SA8775P
> > > > memory map"?
> > > 
> > > Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> > > map.
> > > 
> > > > 
> > > > > boards.
> > > > > 
> > > > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > > > introduced as part of firmware updates for IoT. The size and base address
> > > > > have been updated for video PIL carveout compared to SA8775P since it is
> > > > > being brought up for the first time on IoT boards. The base addresses
> > > > > of the rest of the PIL carveouts have been updated to accommodate the
> > > > > change in size of video since PIL regions are relocatable and their
> > > > > functionality is not impacted due to this change. The size of camera
> > > > > pil has also been increased without breaking any feature.
> > > > > 
> > > > > The size of trusted apps carveout has also been reduced since it is
> > > > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > > > carveout and its corresponding scm reference has been removed as these
> > > > > are not required for IoT parts.
> > > > > 
> > > > > Incorporate these changes in the updated memory map.
> > > > > 
> > > > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > ---
> > > > >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > > > >  1 file changed, 113 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > new file mode 100644
> > > > > index 000000000000..ff2600eb5e3d
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > 
> > > > The naming convention is <soc>-<something>.dtsi and I don't see any
> > > > other uses of the "iq9" naming.
> > > 
> > > As this new memory map is common for IQ9 series of SoC (QCS9100 &
> > > QCS9075), so we have used its common name.
> > 
> > IQ9 name is not known or visible outside of this commit.
> 
> Are you referring to add the same in cover-letter?
> 
> > 
> > > Once the DT structure for QCS9100 is refactored, we would update this
> > > common file there.
> > 
> > Can you refactor it first?
> 
> This refactoring involves changes in all the ride/ride-r3 boards which
> are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
> need to conclude on the final structure. Since, ethernet is broken in upstream,
> we are working on its fix before sending another series.
> 
> Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
> finalized, we can use the memory-map there.
> 
> But to avoid this dependency and to proceed with iq9075-evk alone,
> I can rename it to qcs9075-reserved-memory.dtsi.
> 
> Let me know if that works here.
> 
> [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/

Hi Dmitry,

Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
other suggestion that we should discuss?

Aparently, this series is for qcs9075 only so using exact (not common)
name also aligns the naming format.

> 
> > 
> > > 
> > > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> Regards,
> Wasim

-- 
Regards,
Wasim

