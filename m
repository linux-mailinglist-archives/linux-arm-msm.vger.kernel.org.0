Return-Path: <linux-arm-msm+bounces-60206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A1ACDB17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 11:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43571176B13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C028C2D8;
	Wed,  4 Jun 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XJBiI245"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BA82864;
	Wed,  4 Jun 2025 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029782; cv=none; b=sn727TKMU11Hna9kpTYY7hvLkr4qo3swKAHMJQMXK/TJYL8bocl8Fm3tNGxpdCaSAZ8G6EbNxPtx0rkjN0Soao6VYNTf+zaBq7qv1EVk6PGFagQpxAmReuncWr1qegduWmHTrfL7NqdLdzAXsE+V6MhVVTfGYkauIe0Vtc20n7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029782; c=relaxed/simple;
	bh=0b0UpOZGoz9b9Oj2yt0/+c1AigdIfX0+NKUZ0HHnAyk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZlRx77av3aL4DFUuIuwp/VGfsJ1D6QZ5+ObY91AJZ5q2CvJVEJgW+VWdMky6HviqxFsMdkLHSZJUVBHOA+GgThkVfc3w+22mV/IoVBl7VIIC9/zpObN3gR5vGbHjub8lxfyMZ97wG9Gs4v1Sp57WpJ4awwvlCCKDVe/xcpkTeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XJBiI245; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547t2eS032469;
	Wed, 4 Jun 2025 09:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aamdvi6wxPKp4kP4MW9geq4G
	Kuy3gj464lLjH6acW4I=; b=XJBiI245LEtK+xvNtxepGGpBddCL0uo2JOqagsF3
	+0QAJvn9xXOr0uNs7sE/bVXIQ+GXD4Cvm/Gnd4Kso6Uzd5MAh0Giwlqld37L2EaO
	ubuwkzMVYJv2fo/yr4LQ8kCCtZevtY9SIDgeH1oHIAsYULTktZLShMZyk65F3Twn
	VOrjjdwLKUGSvIIbrPLtX87biFNWkiIk+qu1CU/1Jive/bzpgONjm+xitbhxtpXl
	gHbJm0IOxH63DM4WGn9Un40Wx4PWwr0/qTK8qGmfxrEn1oGo5OcOP5t2KeXHuO3N
	7jyVetyjMa0eztcCC36Dv3oUZcgD4omcTxT2wIlGlcMgXA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuvdqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 09:36:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5549aBgV012507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 09:36:11 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Jun 2025 02:36:05 -0700
Date: Wed, 4 Jun 2025 15:05:55 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
Message-ID: <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6840138c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=6_P49hg9oysbzb5WdkEA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UT2cgFoPtz9T-eK3Gqwo7CfwdUdKbv1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3MSBTYWx0ZWRfX6Iq/0usoNpFy
 at/GVhz+/bnXFxqHmHMF8T3o8mHzuIfHoAMs1561PLi5gHg/B/keqA/KmyLdUMM8nXBJo0kCwu9
 ibhIv8W4kMBFUucNy5ARZb8Hitq3O4+iM4cWH2yUKRRaTdpkGlj9WY37nMiTzEdw2Z6F3aEHe2B
 FamypfgPYVzDEBwnctr5glUmNSOeKA25O/Dfq5qZ1tlPkgMmTjPqbMT+V0uKlwVJMlq/BY7wsSo
 SD3wb8LoYIo+kH/vSqxBd0O0zJ0H5sSQpKfTGGksvpq+ZuaqPfZbeW1ks9ShrH+k608pmYvorBJ
 m29bVBo3kNseJcr7QTKzh6moh4T0qfOemL3GNyvfSP0djgv4NcBLvw99sQtErQaaR0z/XSo1ena
 WvGTMOW2WeE6qXc3fY7EA/qLONt8Pemq/OF380quczSkPW5cdoZ7ogxwyVsdfE7DkUE1KNoh
X-Proofpoint-GUID: UT2cgFoPtz9T-eK3Gqwo7CfwdUdKbv1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=801 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040071

On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > 
> > SA8775P has a memory map which caters to the auto specific requirements.
> 
> I thought SA8775P was the IoT platform and SA8255P was the automotive
> one. Has this changed?

Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
the later one is SCMI based chip.

Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.

> 
> > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > inherit the memory map of SA8775P require a slightly different memory
> > map as compared to SA8775P auto parts.
> > This new memory map is applicable for all the IoT boards which inherit
> > the initial SA8775P memory map. This is not applicable for non-IoT
> 
> Is there are platform out there that actually uses the "initial SA8775P
> memory map"?

Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
map.

> 
> > boards.
> > 
> > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > introduced as part of firmware updates for IoT. The size and base address
> > have been updated for video PIL carveout compared to SA8775P since it is
> > being brought up for the first time on IoT boards. The base addresses
> > of the rest of the PIL carveouts have been updated to accommodate the
> > change in size of video since PIL regions are relocatable and their
> > functionality is not impacted due to this change. The size of camera
> > pil has also been increased without breaking any feature.
> > 
> > The size of trusted apps carveout has also been reduced since it is
> > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > carveout and its corresponding scm reference has been removed as these
> > are not required for IoT parts.
> > 
> > Incorporate these changes in the updated memory map.
> > 
> > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > new file mode 100644
> > index 000000000000..ff2600eb5e3d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> 
> The naming convention is <soc>-<something>.dtsi and I don't see any
> other uses of the "iq9" naming.

As this new memory map is common for IQ9 series of SoC (QCS9100 &
QCS9075), so we have used its common name.
Once the DT structure for QCS9100 is refactored, we would update this
common file there.

> 
> > @@ -0,0 +1,113 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +
> 
> Why is there a blank space here?

Will remove this in next patch.

> 
> Regards,
> Bjorn

Regards,
Wasim
> 
> > +/*
> > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +/delete-node/ &pil_camera_mem;
> > +/delete-node/ &pil_adsp_mem;
> > +/delete-node/ &pil_gdsp0_mem;
> > +/delete-node/ &pil_gdsp1_mem;
> > +/delete-node/ &pil_cdsp0_mem;
> > +/delete-node/ &pil_gpu_mem;
> > +/delete-node/ &pil_cdsp1_mem;
> > +/delete-node/ &pil_cvp_mem;
> > +/delete-node/ &pil_video_mem;
> > +/delete-node/ &audio_mdf_mem;
> > +/delete-node/ &trusted_apps_mem;
> > +/delete-node/ &hyptz_reserved_mem;
> > +/delete-node/ &tz_ffi_mem;
> > +
> > +/ {
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		gunyah_md_mem: gunyah-md@91a80000 {
> > +			reg = <0x0 0x91a80000 0x0 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_camera_mem: pil-camera@95200000 {
> > +			reg = <0x0 0x95200000 0x0 0x700000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_adsp_mem: pil-adsp@95900000 {
> > +			reg = <0x0 0x95900000 0x0 0x1e00000>;
> > +			no-map;
> > +		};
> > +
> > +		q6_adsp_dtb_mem: q6-adsp-dtb@97700000 {
> > +			reg = <0x0 0x97700000 0x0 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		q6_gdsp0_dtb_mem: q6-gdsp0-dtb@97780000 {
> > +			reg = <0x0 0x97780000 0x0 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_gdsp0_mem: pil-gdsp0@97800000 {
> > +			reg = <0x0 0x97800000 0x0 0x1e00000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_gdsp1_mem: pil-gdsp1@99600000 {
> > +			reg = <0x0 0x99600000 0x0 0x1e00000>;
> > +			no-map;
> > +		};
> > +
> > +		q6_gdsp1_dtb_mem: q6-gdsp1-dtb@9b400000 {
> > +			reg = <0x0 0x9b400000 0x0 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		q6_cdsp0_dtb_mem: q6-cdsp0-dtb@9b480000 {
> > +			reg = <0x0 0x9b480000 0x0 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_cdsp0_mem: pil-cdsp0@9b500000 {
> > +			reg = <0x0 0x9b500000 0x0 0x1e00000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_gpu_mem: pil-gpu@9d300000 {
> > +			reg = <0x0 0x9d300000 0x0 0x2000>;
> > +			no-map;
> > +		};
> > +
> > +		q6_cdsp1_dtb_mem: q6-cdsp1-dtb@9d380000 {
> > +			reg = <0x0 0x9d380000 0x0 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_cdsp1_mem: pil-cdsp1@9d400000 {
> > +			reg = <0x0 0x9d400000 0x0 0x1e00000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_cvp_mem: pil-cvp@9f200000 {
> > +			reg = <0x0 0x9f200000 0x0 0x700000>;
> > +			no-map;
> > +		};
> > +
> > +		pil_video_mem: pil-video@9f900000 {
> > +			reg = <0x0 0x9f900000 0x0 0x1000000>;
> > +			no-map;
> > +		};
> > +
> > +		trusted_apps_mem: trusted-apps@d1900000 {
> > +			reg = <0x0 0xd1900000 0x0 0x1c00000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	firmware {
> > +		scm {
> > +			/delete-property/ memory-region;
> > +		};
> > +	};
> > +};
> > --
> > 2.49.0
> > 

