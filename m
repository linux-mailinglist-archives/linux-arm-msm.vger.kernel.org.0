Return-Path: <linux-arm-msm+bounces-21791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323898FD3C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 19:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4076287454
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 17:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8376139D13;
	Wed,  5 Jun 2024 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X65T6mVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D94E79DE;
	Wed,  5 Jun 2024 17:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717607993; cv=none; b=eNv3BUvlgmKpGGv2N+x4PpIqeEvph5Lv+yetsKc2u3Hl47NA0RKFiDJABolnGaCdrS0sLETZ7/NWUB5pglzedSXIEUEfKrw1KdSHVPwanySKLbihHOsXH7nPMW4W3DNMkQaDFYVTdI803DmcGvkumRIZ5TRQcTQOG/no0pyIGEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717607993; c=relaxed/simple;
	bh=KoPDujt1xMD1rMjbCLSpQKDTwNo7Sp1vSRZVeW5Uy6s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZLjJucrax6DGM4DN05f64Rz4EKSlZ1hkfLFtcEKWFJ/+YvQi2pekqwqDtCYMBnPjYNDTLnHzEQY/glfAX5p96WONUWD1qsuqQLBgBXfFDKC7L7XMFk2hwlWdYeZBre7pXmSt1r5dwQi690duELgxN0GJAXpZCffTX3dKErbnfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X65T6mVX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455DGfD8014486;
	Wed, 5 Jun 2024 17:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sNJniB11qHa4cbo7LPak+xXf
	Ula5GuPjPcZNiVZTXdQ=; b=X65T6mVXXXVOqXlwsjcwOBZpbijhV+XkQzQsQ5SR
	p+BedcH67osUcAIBA3PcLM4lEvG6cVRmcLmbUaZ33bmofSAaVieupgsruwJtse+z
	zGq2QBbr3uSnSDHLEInKj+0xgCg27JnjYiYPLgM1idQGP9i48nfjD3Y3QpBMAKOE
	g7OC8B2I/Yj0ZArMuGtCJCsZyyYm1Rfv065sfCncU+l+ZlFFuXkOH1yuL9QZh/95
	uGk2tunv1W/oDmoAREOTpmEtUbo2fr43U2n+JQ0FE+aoEKgkz+pwiu4y+k8Vz3EL
	GjIDyvsM6jtwRJwBTgk2bZIb7SSZxEdAUEecpm8r8vhoTg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj7urasd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 17:17:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455HHNiC008319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 17:17:23 GMT
Received: from hu-eberman-lv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 10:17:23 -0700
Date: Wed, 5 Jun 2024 10:17:22 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Simon Glass <sjg@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Amrit Anand <quic_amrianan@quicinc.com>,
        "Peter
 Griffin" <peter.griffin@linaro.org>,
        Caleb Connolly
	<caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>, Doug Anderson
	<dianders@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Julius Werner
	<jwerner@chromium.org>,
        "Humphreys, Jonathan" <j-humphreys@ti.com>,
        "Sumit
 Garg" <sumit.garg@linaro.org>,
        Jon Hunter <jonathanh@nvidia.org>,
        Michal
 Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
Message-ID: <20240605100246481-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAFLszTjexpNEjo1sGVs67L0CAgGZLNkyn9RGfHRD7iHak_mtmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFLszTjexpNEjo1sGVs67L0CAgGZLNkyn9RGfHRD7iHak_mtmg@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rUOAnfgLEEt-4ffMEwQQ78zA6aJnT_VQ
X-Proofpoint-GUID: rUOAnfgLEEt-4ffMEwQQ78zA6aJnT_VQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406050130

On Wed, Jun 05, 2024 at 07:17:35AM -0600, Simon Glass wrote:
> Hi Elliot,
> 
> I am just picking up the discussion here, which was started on another thread.
> 
> I can't see why this new feature is needed. We should be able to use
> compatible strings, as we do now. I added a 'usage' section to the FIT
> spec [1] which might help. I also incorporated the board revision and
> variant information and some notes on how to add to the available
> suffixes.
> 
> Does that handle your use case?

-rev and -sku don't fit the versioning scheme for QTI devices, so this
isn't a generic enough approach. Patch 5 in this series describes the
versioning scheme for us.

In the other thread, we had talked about using some regex based approach
for matching the root node compatible. I haven't had chance to work on
that proposal and will try to get to it in the next couple weeks.

Thanks,
Elliot


