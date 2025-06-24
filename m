Return-Path: <linux-arm-msm+bounces-62162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54863AE5C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 926853B4318
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F2022FF22;
	Tue, 24 Jun 2025 06:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bleJG0tK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31702222CE;
	Tue, 24 Jun 2025 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745327; cv=none; b=bO98rjr9PjxobgWE4www+OrBfT0nnN+aCsHeDFZ3hlyaP+84Jl54OjBiHnNzFYwsGgLphdiSPQ37KQFDNatg4l3D+UUzlNoXNfOJPtTtawCMfxWrfS802r/l7Kp0yI6PyQ5sEjz6JGvQARDlX8+Aok+DFSuzdMgYFCZ8c0scIVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745327; c=relaxed/simple;
	bh=+X9MtZsUcv4GSkC9cyuG5jWSnASNAwoaLQAkoxpRors=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmjtkiIrorDa+khO6wAr7jOH8sk7BxFjLIvyp72mUfXKWBzRK4PkRmG6U5/3BP9qaSbi7uzLT5JJsh1rylGpqCNNts1yn0xy/9FIsBBoP/Fv+QIz0Qu2WbBHv8+xlFBZt/jPCPeyIx3Y/lh8CrqfGJWmJFFMfZ7EJQr/w6f4ZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bleJG0tK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O68Rmg021627;
	Tue, 24 Jun 2025 06:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1wDUv5SQjPOU0hH1sA13zx1J
	1sJ+ZXrjU+iyfsayI5g=; b=bleJG0tKNA7Y2vk2mBcusas5okxzOgSA8X8b8eYg
	Lpf0fx19vPBLmZAjvB1eSNqHmiESMreHqWI8NTGJ2uddPSp+q4HtchfGfgHujn3C
	qJb1qCMoFkN/GuSx6xm9mrgyeaCp8nmk9iuBkqDGq01gHb8VeCwvFPNX7as9SrO8
	l79tRxdOEaOJEcDUoT5TPPlry9NLwM5z7ILHlKdsmdWNK9JpzpNCho5BzL2PFlLP
	Y9DQp1fquM3RA7z5nVGHi41uvsJmMpcW6z9KL3wocfSbx/QApdotXwI22tbfzDlj
	RQPznn2BauFkO4JfbM255anW4ymtYwJJ+brwrxjBLVo8Zw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpu63g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:08:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O68fcg017083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:08:41 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Jun 2025 23:08:38 -0700
Date: Tue, 24 Jun 2025 11:38:34 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lumag@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
Message-ID: <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
 <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a40ea cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=hBTOza7BeWqvS7caNNMA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX0CVzaeCoc96Y
 887ER8cYDmrk6w0ZpE96cNi79SFSQgawv45fg0GHgg2/OP9zmkVR3cgrjFTrdRkFU8oNdvCo3T8
 UlghGwm/qAXyOZjZNygtkU93iZ+bLYNEmlbMzM+OQkpmSo21/dAV5KqHx3afv6+4SrJ+0z4GoEM
 F+WFE+Q7qAVyD5nzfA2qJgd9mnGpw6+uZGfYH9w4bSuBYN+KdnEpl33DnYibBLoMFcJb4M+u/d8
 ztgSMmlcLz9YzvXMcNc28o7p8N5WDG7Rgix6PTrWj8crxRn5BK8BO06bHLhYjimyJbaZYZ/zSV/
 aLMzFn25ceM2k6iIRBSWA5qyAcqn21mD475Ddte5xAirTe213dVb8xIl6h5IKseY9n5iX8q770Z
 zsVdEok5Uv8GEzkhpiUepPz5BLhYpN1sW3SD3XTq/1rPas9UDW3tUC7Elkm5FEv94DtQhLHj
X-Proofpoint-ORIG-GUID: QzpYM4SiRXrFgsB4SfmGR7todxqHUuhC
X-Proofpoint-GUID: QzpYM4SiRXrFgsB4SfmGR7todxqHUuhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=574 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240051

On Mon, Jun 23, 2025 at 01:34:22PM +0200, Konrad Dybcio wrote:
> On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
> > The min and max voltages on l2 regulator is 850000uV. This was
> > incorrectly set at 1800000uV earlier and that affected the
> > stability of the networking subsystem.
> >
> > Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
>
> Shouldn't there be a consumer for it, instead of it being always-on?

The uniphy block is the consumer of this voltage. The PMIC configures it
to 850000uV based on OTP settings and s/w doesn't change it as uniphy
doesn't do scaling.

-Varada

> >  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > index bdb396afb992..21b04a2c629d 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > @@ -106,8 +106,8 @@ ipq9574_s1: s1 {
> >  		};
> >
> >  		mp5496_l2: l2 {
> > -			regulator-min-microvolt = <1800000>;
> > -			regulator-max-microvolt = <1800000>;
> > +			regulator-min-microvolt = <850000>;
> > +			regulator-max-microvolt = <850000>;
> >  			regulator-always-on;
> >  			regulator-boot-on;
> >  		};
> >
> > base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934

