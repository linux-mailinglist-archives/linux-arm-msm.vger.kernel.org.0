Return-Path: <linux-arm-msm+bounces-30832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6932C96CD75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25BD5288F08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A4E1494CF;
	Thu,  5 Sep 2024 03:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+fIlPF1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201AC1494B5;
	Thu,  5 Sep 2024 03:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507335; cv=none; b=FbjjvY4wAzrhNuu6SY28t5lf8deOPXVUikitqEdjCs2SctjKMyVawdwy1SaREniZJquvbigIfl4WXq4eC9C7Ix6epusCJZhznwt1MHVp4w5JMu24CSNOOJqPLNjlvxpJdbRqhEOyzWuXYnjI3rFvnIxRvghwdcOT8fScWG4AVNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507335; c=relaxed/simple;
	bh=71BZXfdBCTsAyrqUDA4M3Xj0hkLE7+Dkt0m6fJL0whI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jng0T3OeRh4fSCHHxCGnXN6L2o+yhSsDMwDC3gU7r017nhTUvKxo6OdKW42dLeMuDOkjCSNjIaUHAWNnPo5BOH+gzlEF/Ao6dlWWr/tnlc/12NK26Z7jxDs9VFVlKS2vUYu3WQKDgWTfv1St6KBQqvZKLXmTSsbmYlbWeD/vyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+fIlPF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484MSBZn032349;
	Thu, 5 Sep 2024 03:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QJf3w+JkFSAhj424/ky9GdSZ
	1Wc02Dx4ry4NpAboNqg=; b=Q+fIlPF1v62A9lMaLW9mBzKiHcS93QXL+rEuBE60
	NdCb0e25PTSR8y7uBvhxVB3tWkC7zca2UBdru3Mx3orKI5Yi+JyFdIo5jblG1ACg
	8MtYNSU077Lg41y70+JXOdSXwfxyamYzRJsikNzCxk1ehHb8JidW/6TYHTmyYCKn
	Uo346DHmViO49wNc4D+7jWRFlnOoo/ivVFdLrcfgW5WfNEuATHGwnQMqvEKjLvRt
	IEXid3roEK1DWrxBCXTJvKAyk/V4iFIDbgfZsI0lahnI+3xu0cD67QWeoy/DEFGR
	rz5Sl4wTSEK0Uh9S+RKGE1O8L05ItsrPRwm/9vB0iuj9gg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe6x4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 03:35:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4853ZS4U021328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 03:35:28 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Sep 2024 20:35:24 -0700
Date: Thu, 5 Sep 2024 11:35:20 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <Ztkm+IOzEtvvD4Vf@jiegan-gv.ap.qualcomm.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
 <f6813e5a-9b8e-4728-abb2-ad5926d6fa41@kernel.org>
 <ZtZmwVK8h//nDXm1@jiegan-gv.ap.qualcomm.com>
 <1be14849-ba98-432a-9686-e0189c9c7ffd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1be14849-ba98-432a-9686-e0189c9c7ffd@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W9U-EYGwk8c3Vb1SwrfVHq0UDzKx4fDU
X-Proofpoint-ORIG-GUID: W9U-EYGwk8c3Vb1SwrfVHq0UDzKx4fDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_02,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=649 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409050024

On Wed, Sep 04, 2024 at 12:24:19PM +0200, Konrad Dybcio wrote:
> On 3.09.2024 3:30 AM, JieGan wrote:
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
> 
> Sorry, it crashes too early and my device doesn't seem to have an
> easily accessible serial port. Does any of the functionality
> described here require an unsecured device?
> 
I just checked the devices we used to test, they are all unsecured devices.
I also checked the dts, there are two components(known issue internally)
will fail the booting of the secure device.

I will disable those two components in next version. You can test it
with next patch.

Thanks for testing.

> What tag did you test this patch against?

next-20240820

> 
> > 
> > Can you successfully boot without the patch?
> 
> Yes.
> 
> Konrad

Thanks,
Jie

