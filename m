Return-Path: <linux-arm-msm+bounces-26386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87F9333B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 896931F232D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BC8745E4;
	Tue, 16 Jul 2024 21:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dgR/NU6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471113C80B;
	Tue, 16 Jul 2024 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166043; cv=none; b=NSDnil6uiIxMkbX2IEjqmr/A+jya5Y48GN3EcLSYVO+Nq6r4hATKl3RXAfOyCmlq65JpZGOUpWzHfhHagBv0F1EWUNVkHiw40UWxh59nkIa0Di0gdajdTM17iKDUl2/AKcHfzUQy2bZwq8d5XSu+Si0gcM+8U1+SWfHNEV4PYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166043; c=relaxed/simple;
	bh=xd/Nj1Qlh9Hke1zuVavKAibUSp+9bgvw8wtScntoj/Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e75rQH7LBs9Lm9HNeM/1tIuFPHLs3WGlVQypDbqTbAg0cIkAUpNeFxq+SejMdVMdlUs5+MmNNPgs+NvvsU1Ic3Sst780EVUpAYAIEh7s3ilDIJNMP73sIpT1ch1xcfliaaeYRM6Fac1kJqMkPuwKkeQUvZhyK/fRnGRlD56DlGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dgR/NU6z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHjj7Y029065;
	Tue, 16 Jul 2024 21:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBEzOsZ4h4Hp0Is/UX7H3i4RNVmAcyg80rxq4hc8wNo=; b=dgR/NU6zOhMUDQpd
	LB0icFD/m8lXkD6WGgyGl/G2XPRRTRJypZ2FdNKCS1taDxgBvQZqJJ9R/MKdZW0x
	Ry18/+YtcSVIoDpWHKC2AeaySKMCNPhdn6PEmdktC59VFAHHPaRXt9DAITuZyUmq
	RmLv0hnDGxLrpB4sKlWzDOVz7wZ0CHpIUnix2X+5Wy+a2EH51jkaeKWAr+ZAcOdw
	0NpjPpKdPY+K/OAIn5CpyDFKsJNFBryIDUe1X5au0JTF0qfblEeZuXBpV/kcsYCe
	GR0qI7NemrEOwCNcx1lHDG9pageBazhwVTSlHHwh3R19XjpoZVtNgi+63JPV1vpK
	5X9K9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwj1ge5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:40:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GLeZBE020275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:40:35 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Jul 2024 14:40:31 -0700
Date: Wed, 17 Jul 2024 03:10:27 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark
	<robdclark@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: disable GPU on x1e80100 by default
Message-ID: <20240716214027.mryjjmi5rwr2id75@hu-akhilpo-hyd.qualcomm.com>
References: <20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org>
 <20240715190108.vjctytyntxlottgt@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJpqzhEotdVsW3EudR9cqSOm-djjKSgRaqKRbEtJ6wTBZKQ@mail.gmail.com>
 <CAF6AEGvmuzMcYz+oqu+GKhhxYqc8SqKcThY5CvR6tnES-Lu71A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvmuzMcYz+oqu+GKhhxYqc8SqKcThY5CvR6tnES-Lu71A@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7kzI0tuG-EoZF5q1500I5r0nnm3pQT0p
X-Proofpoint-ORIG-GUID: 7kzI0tuG-EoZF5q1500I5r0nnm3pQT0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_01,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407160158

On Tue, Jul 16, 2024 at 07:49:07AM -0700, Rob Clark wrote:
> On Tue, Jul 16, 2024 at 4:03 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 15 Jul 2024 at 22:01, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >
> > > On Mon, Jul 15, 2024 at 09:18:49PM +0300, Dmitry Baryshkov wrote:
> > > > The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
> > > > file is signed by the OEM keys and might be not available by default,
> > > > disable the GPU node and drop the firmware name from the x1e80100.dtsi
> > > > file. Devices not being fused to use OEM keys can specify generic
> > > > location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.
> > > >
> > > > The CRD was lucky enough to work with the default settings, so reenable
> > > > the GPU on that platform and provide correct firmware-name (including
> > > > the SoC subdir).
> > > >
> > > > Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> > > > Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Changes in v2:
> > > > - Keep GPU enabled for X1E80100-CRD (Johan)
> > > > - Link to v1: https://lore.kernel.org/r/20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++++++
> > > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 3 ++-
> > > >  2 files changed, 10 insertions(+), 1 deletion(-)
> > > >
> >
> > [..]
> >
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > index 7bca5fcd7d52..8df90d01eba8 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > > @@ -3155,9 +3155,10 @@ gpu: gpu@3d00000 {
> > > >                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> > > >                       interconnect-names = "gfx-mem";
> > > >
> > > > +                     status = "disabled";
> > > > +
> > > >                       zap-shader {
> > > >                               memory-region = <&gpu_microcode_mem>;
> > > > -                             firmware-name = "qcom/gen70500_zap.mbn";
> > >
> > > In general, why not keep a default zap firmware listed here? Anyway we
> > > are disabling gpu node here in case of platforms which doesn't upstream
> > > secure firmwares.
> >
> > Excuse me, I missed the question before sending v3, however the answer
> > is still going to be the same:
> >
> > First of all, we don't do it for other platforms
> > Second, we don't do it for other firmware. Each DT declares its own
> > set of files.
> > Last, but not least, it's better to get an error message regarding
> > firmware-name not being present rather than a possibly cryptic message
> > regarding firmware failing authentication.
> 
> tbh, I think it might be better to just remove the default fw name
> from a6xx_catalog.c device table.  That would better reflect the
> situation, ie. some fw is needed and not available (if the
> firmware-name prop isn't provided).  Trying to fall back to loading
> the wrong fw is a mis-design.

Agree. Thanks for the clarification.

-Akhil

> 
> BR,
> -R
> 
> > >
> > > -Akhil
> > >
> > > >                       };
> > > >
> > > >                       gpu_opp_table: opp-table {
> > > >
> > > > ---
> > > > base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> > > > change-id: 20240715-x1e8-zap-name-7b3c79234401
> > > >
> > > > Best regards,
> > > > --
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> >
> >
> >
> > --
> > With best wishes
> > Dmitry
> >

