Return-Path: <linux-arm-msm+bounces-45070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C3A11953
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 06:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4385F165BCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 05:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F11C234D06;
	Wed, 15 Jan 2025 05:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ACkgQEHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA4D2309A7;
	Wed, 15 Jan 2025 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736920153; cv=none; b=Lgnkq4/qNv7zGMAF2uCYjn2uaNbueywxp91pzFWByDwXdwLM4kg0rM9yCp/lcq7EwgzUwsszaZ7qvgeQC0IyYq4anJT6OffMqupzizU2XuKttPk7+Zj/jCcuZNR0afivbmcKtDFfTjND4a5GpAco8d3X1d5hufCXWCDcOleDjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736920153; c=relaxed/simple;
	bh=ymbwF5m2COfxwX2733AUiNTnjTrTOsMXvlcTU+SxuB8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPSUAtdZ/NZezdFVRedmSFo341zdt/IP/PCYCvBw2XJvw6cnV1PqH4d8JaZewiUUeIzYgb8gyBrrvDTnrRTCcRbzoiLCMBjQiwDPsOFINPkWXG7p5Ao98JVht6+ghLCR6SDmsr0OYpMDZheRXxqm6vrWk6n64eraBf1whqX3zA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ACkgQEHB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F1Z6OQ008367;
	Wed, 15 Jan 2025 05:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9rigf5XQsEAT71z2V3r4TnXC
	4FYxRzPqS8GbqmboF/M=; b=ACkgQEHB92AxZQx0OLtY/tpwoW9R4z4Et8rmcmNi
	+OyC8lfjB12tXhjUwxMl1ZyZuHsrP6dpwE9OfXjtfTfXFRstuWCaoDzy3AMTH7KI
	gloJ5KPCZGfvTICLsQR5DC6s24V7piYyadY+GWg2qr9VbEhqWMoIsHPtvDqvEw0V
	F+Asc/3U190onXvQgbg1TAgeM1jp+T0uRukX9NfPZV62vwsJACcXo1rcMw0mjyuq
	Ff9e6i0r1T9i1I2K0S9Z06rrx2t2UwzunLcm0GGHAux7NNw9WUR10QDVgkq/fCA3
	i24i8BF9uUGKrNPsYXJ/WonvzUVUqqWiLSaJO8eJJUaP5g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4463frrgc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:49:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F5n6CM017374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:49:06 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 21:48:58 -0800
Date: Wed, 15 Jan 2025 11:18:54 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
References: <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
 <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
 <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
 <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
 <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
 <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xHY1GVZxmFkLg7XWd-Z-zIeezHO6vpZ1
X-Proofpoint-GUID: xHY1GVZxmFkLg7XWd-Z-zIeezHO6vpZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150040

On Thu, Jan 09, 2025 at 05:16:25PM +0100, Krzysztof Kozlowski wrote:
> On 09/01/2025 15:47, Wasim Nazir wrote:
> > On Wed, Jan 08, 2025 at 03:09:09PM +0100, Krzysztof Kozlowski wrote:
> >> On 03/01/2025 20:58, Dmitry Baryshkov wrote:
> >>>>>>>> Initially, we included the DTS [1] file to avoid duplication. However,
> >>>>>>>> based on Krzysztof's previous suggestion [2], we change to this format.
> >>>>>>>>
> >>>>>>>> Please let us know how to proceed further on this.
> >>>>>>>
> >>>>>>> Krzysztof asked you to include DTSI files instead of including DTS
> >>>>>>> files. Hope this helps.
> >>>>>>
> >>>>>> Are you suggesting that we should also modify the 9100-ride files to
> >>>>>> include DTSI instead of DTS for consistency between QCS9100 and QCS9075?
> >>>>>> However, this would result in the duplication of Ethernet nodes in all
> >>>>>> the ride board files. Would that be acceptable?
> >>>>>
> >>>>> git mv foo.dts foo.dtsi
> >>>>> echo '#include "foo.dtsi"' > foo.dts
> >>>>> git add foo.dts
> >>>>> git commit
> >>>>>
> >>>>
> >>>> We cannot convert sa8775p-ride-r3.dts and sa8775p-ride.dts to .dtsi as
> >>>> they represent different platforms. In patch [1], we included these DTS
> >>>> files to reuse the common hardware nodes.
> >>>>
> >>>> Could you please advise on how we should proceed with the following
> >>>> approaches?
> >>>>
> >>>> a) Previous approach [1]:
> >>>> Include sa8775p-ride-r3.dts and sa8775p-ride.dts in the qcs9075-ride
> >>>> platform DTS, similar to the qcs9100-ride platform DTS. This approach
> >>>> avoids duplicating Ethernet nodes and maintains uniformity. However, it
> >>>> involves including the DTS file directly.
> >>>>
> >>>> b) Current suggestion:
> >>>> Include sa8775p-ride.dtsi in the qcs9075-ride platform DTS and also
> >>>> modify the qcs9100-ride platform DTS files to maintain uniformity. This
> >>>> approach results in duplicating Ethernet nodes.
> >>>>
> >>>> Please let us know your recommendation to finalize the DT structure.
> >>>
> >>> sa8775p.dtsi
> >>> `__sa8775p-ride.dtsi
> >>>    `__sa8775p-ride-r2.dtsi
> >>>       `__sa8775p-ride.dts
> >>>       `__qcs9100-ride.dts
> >>>       `__qcs9075-ride.dts
> >>>    `__sa8775p-ride-r3.dtsi
> >>>       `__sa8775p-ride-r3.dts
> >>>       `__qcs9100-ride-r3.dts
> >>>       `__qcs9075-ride-r3.dts
> >>>
> >> Wasim and all other copy-pasters of sa8775p-ride,
> >>
> >> Just to recap, qcs9100 contributions started this terrible pattern of
> >> board including a board. Unfortunately qcs9100 was merged, so that ship
> >> has sailed.
> >>
> >> This patchset was going the same way, because poor choices like to keep
> >> spreading, but at one of previous versions I noticed it and objected.
> >>
> >> This v5 however solves above problem by duplicating the nodes.
> >>
> >> Apparently all these designs - sa8755p, qcs9100 and qcs9075 - use the
> >> same board, but none of this was communicated. I checked all the commit
> >> msgs in this patchset and nothing explained about it. What annoys me is
> >> that you do not communicate your design forcing us to accept poor DTS or
> >> forcing us to guess and make poor judgments.
> >>
> >> Come with proper hardware description and split out shared parts, like
> >> motherboard. Look how other vendors are doing it, e.g. NXP or Renesas.
> >> But assuming there are shared parts because I am pretty sure you will
> >> pick my comments when it suits you without actually following them fully
> >> and without understanding and explaining to us your own hardware.
> >>
> > 
> > Hi Krzysztof,
> > 
> > Here is the pictorial flow showing how SoCs are derived and what all boards
> > are supported.
> > 
> >   +---------------------------------------------------------------------+
> >   |                                                                     |
> >   |								 sa8775p                                |
> >   |					        		|                                   |
> >   |			+-----------------------+-----------------------+           |
> >   |			|				  		|			    		|           |
> >   |			v				  		|				    	v           |
> >   |		 qcs9100			  		|		    		 qcs9075        |
> >   |			|				  		|			    		|           |
> >   |			v					    v						v           |
> >   |		  (IOT)				     (AUTO)					  (IOT)         |
> >   |	qcs9100-ride.dts		sa8775p-ride.dts		qcs9075-ride.dts    |
> >   |	qcs9100-ride-r3.dts		sa8775p-ride-r3.dts		qcs9075-ride-r3.dts |
> >   |													qcs9075-rb8.dts     |
> >   |                                                                     |
> >   +---------------------------------------------------------------------+
> 
> The the SoC, I am asking about the board. Why each of them is for
> example r3?
> 
> So this is not sufficient explanation, nothing about the board, and
> again just look Renesas and NXP.
> 

Hi Krzysztof,

sa8775p(AUTO), qcs9100(IOT), qcs9075(IOT) are different SoCs based on
safety capabilities and memory map, serving different purpose.
Ride & Ride-r3 are different boards based on ethernet capabilities and
are compatible with all the SoCs mentioned.

With the combination of these 3 SoCs and 2 boards, we have 6 platforms,
all of which we need.
- sa8775p-ride.dts is auto grade Ride platform with safety feature.
- qcs9100-ride.dts is IOT grade Ride platform with safety feature.
- qcs9075-ride.dts is IOT grade Ride platform without safety feature.

Since the Ride-r3 boards are essentially Ride boards with Ethernet
modifications, we can convert the Ride-r3 DTS to overlays.

Please let me know if this solution works for you.

> 
> Best regards,
> Krzysztof

Thanks & Regards,
Wasim

