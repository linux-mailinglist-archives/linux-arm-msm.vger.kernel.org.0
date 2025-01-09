Return-Path: <linux-arm-msm+bounces-44633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12535A07B11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2AE13A92C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C1F21C9F4;
	Thu,  9 Jan 2025 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L4V/ADLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50C21517A;
	Thu,  9 Jan 2025 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435029; cv=none; b=U11MmADZC74g8EGk5PN/DbOGRNVRFWzP5veJv22lnri/UmcYF2A5VxoDupp/SbmMThCYzw2DR8MD5bwKWf1SkpomPneV7nYWl3AIBCNwpduy9GDFG0GmTV2jP1+IaEGRN4eiC3xby4TaKbTavV3RXMBy0r8YRp3PRE479sG2r1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435029; c=relaxed/simple;
	bh=ho9ulicaiUn3lPNKtJQPpJPNP6nkB26RPwtwvVpSZJ4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K08GqYXPpr1XzEuLcnumGL7EtPgwR4ka08nyHkzWIYIHtgNb7xVWMRGdUDqdT0xXNG003Ds7dFUtoJxE+sUZG+3T+AYUQzEUdEJp/mZ/wA0qdPdmNwlEO/IniQdQKhpQpFLWpesacVU8BMnTIa+h5zIBvfLueA/DudvhaZ0diII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L4V/ADLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509E7bLI006683;
	Thu, 9 Jan 2025 15:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X7cARWDlvKovXJOvzSYehNzZ
	81bZtEsg4IY8TnPR3ak=; b=L4V/ADLWforsITWUd9YZMiQW+xdRaIG0s3GoHiXr
	Yr4006gu8z/aXCvZ1DTBD78cSNqCtOsmAMbQHHhBSBeAbzdV6/gmTu77rYofjjBd
	MskZxP3w1VzBcKZk6UGmnnct/33Ib703h4GDv4D3cLrU8ouhfUXx/DF9+PI4YR3m
	UVSiqiY3TGi8LH+DB9UDpCQcnB9+t4sVFu2ZWNBLkyl7iCpM8Ldg8WXGh2pRA5zL
	zIW5t7hGbECbmhQqAIRRK5eud5VTo7naMRSGZA9A/IoOQxFgwhLpDfpvyGles7hV
	ZX5cKOQVysUsjuVQe/D56ucjGCBYXK3ahmIUfrZ+Jo0C4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442fxs047a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 15:03:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509F3f4V000982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 15:03:41 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 07:03:35 -0800
Date: Thu, 9 Jan 2025 20:33:26 +0530
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
Message-ID: <Z3/lA+w7BoazNeWk@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
 <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
 <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
 <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
 <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
 <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L8mC5HWXF_Lwq2FkVMxQ2BNVBZGh4Uni
X-Proofpoint-ORIG-GUID: L8mC5HWXF_Lwq2FkVMxQ2BNVBZGh4Uni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090120

On Thu, Jan 09, 2025 at 08:17:54PM +0530, Wasim Nazir wrote:
> On Wed, Jan 08, 2025 at 03:09:09PM +0100, Krzysztof Kozlowski wrote:
> > On 03/01/2025 20:58, Dmitry Baryshkov wrote:
> > >>>>>> Initially, we included the DTS [1] file to avoid duplication. However,
> > >>>>>> based on Krzysztof's previous suggestion [2], we change to this format.
> > >>>>>>
> > >>>>>> Please let us know how to proceed further on this.
> > >>>>>
> > >>>>> Krzysztof asked you to include DTSI files instead of including DTS
> > >>>>> files. Hope this helps.
> > >>>>
> > >>>> Are you suggesting that we should also modify the 9100-ride files to
> > >>>> include DTSI instead of DTS for consistency between QCS9100 and QCS9075?
> > >>>> However, this would result in the duplication of Ethernet nodes in all
> > >>>> the ride board files. Would that be acceptable?
> > >>>
> > >>> git mv foo.dts foo.dtsi
> > >>> echo '#include "foo.dtsi"' > foo.dts
> > >>> git add foo.dts
> > >>> git commit
> > >>>
> > >>
> > >> We cannot convert sa8775p-ride-r3.dts and sa8775p-ride.dts to .dtsi as
> > >> they represent different platforms. In patch [1], we included these DTS
> > >> files to reuse the common hardware nodes.
> > >>
> > >> Could you please advise on how we should proceed with the following
> > >> approaches?
> > >>
> > >> a) Previous approach [1]:
> > >> Include sa8775p-ride-r3.dts and sa8775p-ride.dts in the qcs9075-ride
> > >> platform DTS, similar to the qcs9100-ride platform DTS. This approach
> > >> avoids duplicating Ethernet nodes and maintains uniformity. However, it
> > >> involves including the DTS file directly.
> > >>
> > >> b) Current suggestion:
> > >> Include sa8775p-ride.dtsi in the qcs9075-ride platform DTS and also
> > >> modify the qcs9100-ride platform DTS files to maintain uniformity. This
> > >> approach results in duplicating Ethernet nodes.
> > >>
> > >> Please let us know your recommendation to finalize the DT structure.
> > > 
> > > sa8775p.dtsi
> > > `__sa8775p-ride.dtsi
> > >    `__sa8775p-ride-r2.dtsi
> > >       `__sa8775p-ride.dts
> > >       `__qcs9100-ride.dts
> > >       `__qcs9075-ride.dts
> > >    `__sa8775p-ride-r3.dtsi
> > >       `__sa8775p-ride-r3.dts
> > >       `__qcs9100-ride-r3.dts
> > >       `__qcs9075-ride-r3.dts
> > > 
> > Wasim and all other copy-pasters of sa8775p-ride,
> > 
> > Just to recap, qcs9100 contributions started this terrible pattern of
> > board including a board. Unfortunately qcs9100 was merged, so that ship
> > has sailed.
> > 
> > This patchset was going the same way, because poor choices like to keep
> > spreading, but at one of previous versions I noticed it and objected.
> > 
> > This v5 however solves above problem by duplicating the nodes.
> > 
> > Apparently all these designs - sa8755p, qcs9100 and qcs9075 - use the
> > same board, but none of this was communicated. I checked all the commit
> > msgs in this patchset and nothing explained about it. What annoys me is
> > that you do not communicate your design forcing us to accept poor DTS or
> > forcing us to guess and make poor judgments.
> > 
> > Come with proper hardware description and split out shared parts, like
> > motherboard. Look how other vendors are doing it, e.g. NXP or Renesas.
> > But assuming there are shared parts because I am pretty sure you will
> > pick my comments when it suits you without actually following them fully
> > and without understanding and explaining to us your own hardware.
> > 
> 
> Hi Krzysztof,
> 
> Here is the pictorial flow showing how SoCs are derived and what all boards
> are supported.
> 
+-----------------------------------------------------------------------+
|                                                                       |
|                                sa8775p                                |
|                                   |                                   |
|           +-----------------------+-----------------------+           |
|           |                       |                       |           |
|           v                       |                       v           |
|        qcs9100                    |                    qcs9075        |
|           |                       |                       |           |
|           v                       v                       v           |
|         (IOT)                  (AUTO)                   (IOT)         |
|   qcs9100-ride.dts        sa8775p-ride.dts        qcs9075-ride.dts    |
|   qcs9100-ride-r3.dts     sa8775p-ride-r3.dts     qcs9075-ride-r3.dts |
|                                                   qcs9075-rb8.dts     |
|                                                                       |
+-----------------------------------------------------------------------+
Updating it as previous one is messed up with whitespaces.

> 
> Although we included details about the QCS9075 and QCS9100 in the cover
> letter and commit message, explaining their differences and common
> origin from the SA8775P SOC, the new DT structure suggested by Dmitry
> should make things clearer. This structure properly splits common parts
> and enhances reusability.
> 
> > Best regards,
> > Krzysztof
> 
> Thanks & Regards,
> Wasim

