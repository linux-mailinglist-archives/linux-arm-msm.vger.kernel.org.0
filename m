Return-Path: <linux-arm-msm+bounces-38477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7674E9D3A66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A1EDB2C917
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A8D1A9B38;
	Wed, 20 Nov 2024 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ONF3QyCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1241A4AA1;
	Wed, 20 Nov 2024 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103619; cv=none; b=cH39xegcvXLmuHy9OnZzRp1gDATw1JkO6Otg44K2giC1vj0wx1bUzR0tUpGaIV6ze7e6lZrp/5yax7+Ij+WM75cJ6pwxLBgI8DmPNYPEuFVTGy2/acv9aaGuILp3l5k8bo2pObuh1udEwyshdFNet/txZkuKPD/nN85LjtXfGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103619; c=relaxed/simple;
	bh=3FR1ky094xdN9WO0F5J8zlFHKIIXOpiIsAHeqk7o7tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rhBypeCH/knRcY7YA8qF2Xe7kyCrOlrtrqOZO42oYbpI4aTD+PdUMER45vzCQoDRpmvDRbgf3M6DC46kuLZJ2KLcialTt5Tdm9Z4K72OEyaTYb3INFuIpEKJaMp9S2oEjpSjNBTC4A081SotwaRQuesGPWLJJEiCcdWD0o4NUCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ONF3QyCF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FJFM029736;
	Wed, 20 Nov 2024 11:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RX4EOPtrWDQhSqLJwh/DLTATy8YlgdLZf6BEVOabtA=; b=ONF3QyCFdbWFhRxD
	s/UXnZYgChQaqlc8JVn3A4gsUSUVb2LQxR1CKV9zKZeRiv8xgQlYUlKwZq6vr/dT
	7w4K/MAVOlqm8hIfQqTXQJUZeXiKvNkAIzyIk2pEaw87JkEz7/0sDGMsfEXN/xee
	bfjEX6cNu2TCtJSSpkEyXeFPTVi4mkqL1FPdXvZb+5FCdEzgzJYVXG3BYihNlXB2
	fo7oHHauYS7e16TsXIM2Ys0UkIv+ARdngFpqmWOlJxgrRntFxb/zb7liiVFF/iMQ
	OcslCJsOm2kd2se9fiBOQpgytxJzlWZBQMFzaZxDgCiY+E55Dt6JC9wkNHx/P7Zw
	pM0k+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4319528yn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 11:53:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKBrXvS003944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 11:53:33 GMT
Received: from [10.206.104.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 03:53:29 -0800
Message-ID: <4da87d98-823f-4781-b138-c6f6caae38fb@quicinc.com>
Date: Wed, 20 Nov 2024 17:23:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_abhinavk@quicinc.com>
References: <20241120105954.9665-1-quic_mukhopad@quicinc.com>
 <20241120105954.9665-3-quic_mukhopad@quicinc.com>
 <lkovymvjsbd44v2huij7paikvnmo7i7rrmkmvpha2wn5sc4hr3@ppr2dgvhzy6d>
 <a741b71b-af04-44aa-9e08-a3f852b8a801@quicinc.com>
 <qpdponpaztryzacue5vtythr4b4cu6fohmgiwlzredm7ky7caw@eose6vpy4e7y>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <qpdponpaztryzacue5vtythr4b4cu6fohmgiwlzredm7ky7caw@eose6vpy4e7y>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xwadpKECjOaOjr08ZOVHhPKc3seqM2n6
X-Proofpoint-GUID: xwadpKECjOaOjr08ZOVHhPKc3seqM2n6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200081


On 11/20/2024 5:13 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 05:05:50PM +0530, Soutrik Mukhopadhyay wrote:
> > 
> > On 11/20/2024 4:42 PM, Dmitry Baryshkov wrote:
> > > On Wed, Nov 20, 2024 at 04:29:54PM +0530, Soutrik Mukhopadhyay wrote:
> > > > Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> > > > sa8775p-ride platform.
> > > > > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 80 ++++++++++++++++++++++
> > > >  1 file changed, 80 insertions(+)
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > > index adb71aeff339..4847e4942386 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > > > @@ -27,6 +27,30 @@
> > > >  	chosen {
> > > >  		stdout-path = "serial0:115200n8";
> > > >  	};
> > > > +
> > > > +	dp0-connector {
> > > > +		compatible = "dp-connector";
> > > > +		label = "DP0";
> > > 
> > > Thundercomm's SA8775p RIDE platform doesn't show such a connector. At
> > > least not on a device advertised on the web pages.
> > 
> > 
> > Are you referring to this product in the Thundercomm web page : SA8225P and
> > SA8775P
> > Ride SX 4.0 Automotive Development Platform ?
>
> Yes
>
> > For this particular product we
> > can see
> > eDP 0/1/2/3 serving as the dp connectors.
>
> Please correct the labels then. And also please mention why eDP2/3 are
> not included / tested.


Sure, we will update the labels in the upcoming patchset.
edp 0/1 corresponds to mdss0_dptx0 and mdss0_dptx1. We have validated 
only these.
edp 2/3 corresponds to mdss1_dptx0 and mdss1_dptx1, and these are not 
validated,
as already mentioned during the driver changes for the same.
Should we mention the same in the commit message for the upcoming patchset ?


>
> > 
> > 
> > > 
> > > > +		type = "full-size";
> > > > +
> > > > +		port {
> > > > +			dp0_connector_in: endpoint {
> > > > +				remote-endpoint = <&mdss0_dp0_out>;
> > > > +			};
> > > > +		};
> > > > +	};
> > > > +
> > > > +	dp1-connector {
> > > > +		compatible = "dp-connector";
> > > > +		label = "DP1";
> > > 
> > > Same comment here.
> > > 
> > > > +		type = "full-size";
> > > > +
> > > > +		port {
> > > > +			dp1_connector_in: endpoint {
> > > > +				remote-endpoint = <&mdss0_dp1_out>;
> > > > +			};
> > > > +		};
> > > > +	};
> > > >  };
> > > >  >  &apps_rsc {
> > > 
>

