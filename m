Return-Path: <linux-arm-msm+bounces-62416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1BAE7FA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E055A63E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF836280309;
	Wed, 25 Jun 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gEKgZYyL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186529E0F4;
	Wed, 25 Jun 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847746; cv=none; b=Ne4gZU41UHZ2z+Vof714UfIWdz0KwwQpMfHuoA45jbuPyG+haHCSPPkR5yiLf4SjDWljBQ15f87fDEuurgP/zkEhQy5ZzWbk6Tti5CB7S73LS8RTtvuwgEJ6DhcuHVMnT5xWB77qjIabtmqWBl8DwTnmZ5eE+YnaL/IqCJaXS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847746; c=relaxed/simple;
	bh=QF2/nTzgTNewJqtTDSDCBUv+MKs2/0U6B8wr3E4jhpQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5Vmca7my0JBsw/XfexJN6e+f6lDZ4KDIMZBNR3dQnzkvntPyxKR4fK//OqphgSGEt0mE5h3+2YsDODwbL3nHrX6iySQ9GTt649nB38jLdiQTofY6cPjXaThxu/WmuofyYGkpPYf6kAOI6Kf9ZheALST9oZecmOc6UnZagW/Q5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gEKgZYyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5Ntnj032017;
	Wed, 25 Jun 2025 10:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uiZBvkEuqcSuz312Gn4jCPAi
	lFFf4Ltnui1EyIcPcTU=; b=gEKgZYyLYERXnWLUlW3qSXlViRGVq7jUfgjfZjDX
	jQdnQUo0bjhLiUs6ShJLBJTVHFjGul8oI+VNMRv/YrlqRd5HmVB22P5Pjo0s0tda
	d8sJIxpnJRcswlWAdEvdVinOTl3a4lM4YX387P0ze95IjioZSxLiAksP0b0q9ymc
	sRY+n5oaJfbTD/GTt9DqgcFQNmVLeu5aXhmR0upmTMKbj2qlhEndH7qZ8cGgnl0J
	10yYqp2qQxdk1a2ohw9PyMKgZB77M0HL+vyc3gkd8sWWZxWGaOiXm6X0540cj0FE
	xlu5yw9jPs+/QYRmK9QtgWun9H3VsHrZbLYy8lUUxIHp0g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4rrcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:35:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAZgZ8011283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:35:42 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:35:38 -0700
Date: Wed, 25 Jun 2025 16:05:35 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lumag@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
Message-ID: <aFvQ96h+BdRf5ma3@hu-varada-blr.qualcomm.com>
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
 <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
 <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
 <qbet26mwfas4ymyy3ozl6f3a5yhgcd2e3euvrn6m3gdvnyvugh@c6yl2u2pcshz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qbet26mwfas4ymyy3ozl6f3a5yhgcd2e3euvrn6m3gdvnyvugh@c6yl2u2pcshz>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685bd0fe cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=YFLLylPM97RZD3lBE-IA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PQgyuCRGNZuIwCzVm-4yHqaNJrD3yAXj
X-Proofpoint-ORIG-GUID: PQgyuCRGNZuIwCzVm-4yHqaNJrD3yAXj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OSBTYWx0ZWRfX1czRz9YB9xQC
 zNXN5b1B8MDXBtKencCxbnws5+aLs4fJ1LgLnyX4EyZ4g6VsHewqWJDO9vL6IevcVaLzGbbq+li
 KcYgzSRdG1TN3dU+YZMUWF1hkv6BWmrJMBfxq//hpdcstqWWGK8+itydynwezXBi5kDRnKJ8pDX
 GRMwV+v/lFArSz9dEcs/1UKx499zHkIAYbbBw6sM2Ajut1JeyGae7it77fYpAR6BJtM31HEBhYa
 7CSVFHTf3aHowu5BNr7vd05xe7ZLbe5iljxLwRrZD3ej44yPnqfOyy4oIqZutYa8eRKcsABo3iC
 YyBJp+fPsAkPNpju0DoGRBWzfuerT7DK5lfw0XS4HClId3GAwrrUfiVnp7NWA8HG1lAS3K8Rx69
 2ajCTGxKdBu6RNQpbln/A6VlKSZBFtsx00z+4TSJVqXvyST0Wb3VgcetDkV/292lRgvPeZQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=364
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250079

On Wed, Jun 25, 2025 at 04:26:29AM +0300, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 11:38:34AM +0530, Varadarajan Narayanan wrote:
> > On Mon, Jun 23, 2025 at 01:34:22PM +0200, Konrad Dybcio wrote:
> > > On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
> > > > The min and max voltages on l2 regulator is 850000uV. This was
> > > > incorrectly set at 1800000uV earlier and that affected the
> > > > stability of the networking subsystem.
> > > >
> > > > Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
> > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > ---
> > >
> > > Shouldn't there be a consumer for it, instead of it being always-on?
> >
> > The uniphy block is the consumer of this voltage. The PMIC configures it
> > to 850000uV based on OTP settings and s/w doesn't change it as uniphy
> > doesn't do scaling.
>
> Please express this in DT terms, specifying the regulator as a supplier
> to the uniphy and then making the uniphy driver use that supply.

Sure, we will update UNIPHY patch series [1] to enable this voltage supplier.

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20250207-ipq_pcs_6-14_rc1-v5-0-be2ebec32921@quicinc.com/

> > > >  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > index bdb396afb992..21b04a2c629d 100644
> > > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > @@ -106,8 +106,8 @@ ipq9574_s1: s1 {
> > > >  		};
> > > >
> > > >  		mp5496_l2: l2 {
> > > > -			regulator-min-microvolt = <1800000>;
> > > > -			regulator-max-microvolt = <1800000>;
> > > > +			regulator-min-microvolt = <850000>;
> > > > +			regulator-max-microvolt = <850000>;
> > > >  			regulator-always-on;
> > > >  			regulator-boot-on;
> > > >  		};
> > > >
> > > > base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
>
> --
> With best wishes
> Dmitry

