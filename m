Return-Path: <linux-arm-msm+bounces-38093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A199CFA4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 23:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2EC01F23CFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB55D19066B;
	Fri, 15 Nov 2024 22:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RaSmTQfh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0B17BB32;
	Fri, 15 Nov 2024 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731710722; cv=none; b=Ko2/e5L1U2WujJsfNZMIVHwnoBjq6GQfNnoESHzaEdr8RtRmHAESobvH2jJHpGCVf2Kq27JBW0zfYltEOZYyHqLsVzhpWflBZEngryIOIQkGaGQd4YZ8la4Fr7LdEmEInRZoi2hMh9rvKwMT89nfjdNscBdHd3/u/pz/h5LgSUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731710722; c=relaxed/simple;
	bh=edSxazeEdv0suRWi3uesHfdFCEM96I/EpCuL02ikyqY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4TpVkwboTjbk0NbXQJIfB+e1h52w7VKS0z6/neAVi7GzRkt5fSG4W85656gu77FlfFc2q3wMkCBPZzjD27U+ZYf0QAXrRatDUHt9cp009E3E8V/2gxHnDfgABl1gzsPY41ihsIzQsD/GtND2omqaB9PX+JK/OT3QOwj8LrjdVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RaSmTQfh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFC8No1012802;
	Fri, 15 Nov 2024 22:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e8Ql58ZAJKLmNnF89QVmxGqb
	9LNLIUtVAukCz4QoUsk=; b=RaSmTQfh81rp3qvHChaPEZdiNEjYrMP8dXCzE6kF
	wdg8Osv9CQz9meAiNh6EyXAgxvQvUzW8u+OF70PHfKqrUdQBEF9nzrH9mQyHV05R
	xOZ/KPY2RVzZt/U7AbDXuysuwNVBEGyaFqOfzf5H6hRW9DkEhfV+JdSEwINh5NS+
	T/nDzPN8pYt1d67uz7/1Q2ATZ9A9H2JN2onRDLM98b70u83uDsXq/aN257xsKwCD
	J6x3VIAV/4F4dfWoOmDVFle9Ixahe7dHkcSBN0ZBl0qPazIjZJin0qIqjIoKwKZx
	JEDkOIHMDLv4glvWa2v1xW97oCM5nE4z1oEVdnlpPnV3Ww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wwddb01x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:45:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFMjHtX011735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:45:17 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 15 Nov 2024 14:45:13 -0800
Date: Sat, 16 Nov 2024 04:15:04 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <ZzfO8HwiRyZTi5Bd@hu-wasimn-hyd.qualcomm.com>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
 <20241110145339.3635437-5-quic_wasimn@quicinc.com>
 <glvtcxuaniuzxg46rr2a6nvem2ruxxmvidafcn33xpeskjkqal@fyehlwys43vc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <glvtcxuaniuzxg46rr2a6nvem2ruxxmvidafcn33xpeskjkqal@fyehlwys43vc>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BVc6NKfbzqsuDjM5yEXelA-bemv4SvYH
X-Proofpoint-ORIG-GUID: BVc6NKfbzqsuDjM5yEXelA-bemv4SvYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=631 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150192

On Fri, Nov 15, 2024 at 06:05:20PM +0200, Dmitry Baryshkov wrote:
> On Sun, Nov 10, 2024 at 08:23:38PM +0530, Wasim Nazir wrote:
> > Add device tree support for the QCS9075-RB8 board.
> > 
> > Basic changes are supported for boot to shell.
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |   1 +
> >  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 287 +++++++++++++++++++++++
> >  2 files changed, 288 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 9bb8b191aeb5..5d9847119f2e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -115,6 +115,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > new file mode 100644
> > index 000000000000..8d4a27a8f371
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > +
> > +&tlmm {
> > +	/* FIXME: mdss0_dp0 is dependent on this so adding a dummy node for now */
> > +	dp_hot_plug_det: dp-hot-plug-det-state {};
> > +
> > +	/* FIXME: mdss0_dp1 is dependent on this so adding a dummy node for now */
> > +	dp1_hot_plug_det: dp1-hot-plug-det-state {};
> 
> I don't see these two being used in the MDSS node. Please drop.
Thanks for pointing it out, will drop in next series.
> 
> LGTM otherwise.
> 
> > +
> > +	qup_uart10_default: qup-uart10-state {
> > +		pins = "gpio46", "gpio47";
> > +		function = "qup1_se3";
> > +	};
> > +};
> 
> -- 
> With best wishes
> Dmitry

Regards,
Wasim

