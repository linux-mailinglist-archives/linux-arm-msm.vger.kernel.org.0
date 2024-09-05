Return-Path: <linux-arm-msm+bounces-30833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D772D96CD6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6B51C24783
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D686145B3F;
	Thu,  5 Sep 2024 03:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LYqDrjzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C513D53F;
	Thu,  5 Sep 2024 03:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507446; cv=none; b=kiRtJn4i1ebTwDD4B6L/qYGmQsd98PpW2M+iF3/+APIuDt1rr2YtNdgwCGn3/l025nfoIAHSgAkkZYeBbyynRb/dYHR3OISe07DXdBkD3FXlQdISxTJLsRLQ6NySnpVGyvU43CRMwkj41ZZl2NZU2oM0wPSXKnjiKYUMj5cqONs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507446; c=relaxed/simple;
	bh=1ECGnaD69MRMHboTXQmfOmKTMUCi5318XQVc7AmLE6M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufvqZ5crkuYyaXi6SWvMNrWAtrtiKOS3DZJUa47WsP8jZensUZUtmlw6u6YlnYUyC3lEk8a73AYCMtaC9ouk7u3PGPCixaDnVciDbTgsBO+6cDOnCQyWlogjQ2gPNvd7xFB24kABSpBsnkfwnNXN0n0oVJpsHXiCXhlU7JGqvTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LYqDrjzM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484MRZ4S008193;
	Thu, 5 Sep 2024 03:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CdglmC91JdSXvLOGKQvUO9RG
	Ers2pICDzgc9MpH4XCM=; b=LYqDrjzMDrIIHEFzkb3buYN1YQUrJRNZ4Ct2hqr6
	DtcrDs516UHG1eVVHzHScqzuY68Z0ltqitLemSBJIZqkaELFJnyi8XPcDLmKoj8/
	HktjRh6Ty4j8VnFRvdmdPBibf9NbffERIFMWkNqNOaSeGzS2ODEWVZu5ntnAaAjv
	BmFuwmikA+EsUoxC97kywJHgyYUH8mhUWPTjabd76ye/2f2IRfTubXuPtkKJvooM
	Yl8c6/9+NZ2c3ZO5SAU9y64tN37TZG7kSPzkHliDIU3X6pMDKCntxiWxE8RpMCmC
	Nk3xcXW9nIWubvF8wDcPsicPAeMdeOFRr7rp7CMr72AdCw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt674rru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 03:37:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4853bJLs026017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 03:37:19 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Sep 2024 20:37:15 -0700
Date: Thu, 5 Sep 2024 11:37:11 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add coresight components for
 x1e80100
Message-ID: <ZtknZ2zPoFi65kq8@jiegan-gv.ap.qualcomm.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
 <f6813e5a-9b8e-4728-abb2-ad5926d6fa41@kernel.org>
 <ZtZmwVK8h//nDXm1@jiegan-gv.ap.qualcomm.com>
 <2fdcb1b1-3d60-4b46-8a9b-127a5950ea28@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2fdcb1b1-3d60-4b46-8a9b-127a5950ea28@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r5DfNZBZihsKXe0qC00XS5-O2s2jXGq9
X-Proofpoint-GUID: r5DfNZBZihsKXe0qC00XS5-O2s2jXGq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_02,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=573 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050024

On Wed, Sep 04, 2024 at 12:08:51PM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2024 03:30, JieGan wrote:
> > On Mon, Sep 02, 2024 at 05:27:32PM +0200, Konrad Dybcio wrote:
> >> On 27.08.2024 9:27 AM, Jie Gan wrote:
> >>> Add coresight components for x1e80100. This change includes CTI,
> >>> dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.
> >>>
> >>> Change in V1:
> >>> Check the dtb with dtbs_check W=1, and fix the warnings for
> >>> the change.
> >>>
> >>
> >> Applying this series and enabling CORESIGHT=m (along with all the options
> >> in menuconfig) breaks booting on my X1E Surface Laptop 7
> >>
> >> Konrad
> > 
> > Did not observe any booting issues with our devices. Any relevant log to share?
> > This patch also tested by my colleague.
> > 
> > Can you successfully boot without the patch?
> 
> I think that's the definition of "breaks booting"...
> 
> Best regards,
> Krzysztof
>

You are right. That's a clear expression. what a stupid question for me, lol.

Thanks,
Jie 

