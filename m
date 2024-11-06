Return-Path: <linux-arm-msm+bounces-37113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946C9BDFCF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 08:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADA1C1F23B05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32CF1D1E62;
	Wed,  6 Nov 2024 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oU+vpOBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04C1CF2AE;
	Wed,  6 Nov 2024 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879839; cv=none; b=VRJU1Zuv6oejYs5hExAjaR7HEyKH2dDGYfnCGgtzQEGYlmiguhY/Eo/1EZpzqCIuuGNImcNJ+EMTRhWFBUSBG5e9LhdfcKFVt0oCSb6ed8XKXPJ7xp4o6c4dyKDWNkqPytyP7F6NdvDUj4lnOnct/9mHUY2d5NceYfd73kosDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879839; c=relaxed/simple;
	bh=A18hwwQXDHSuvVzVQ1dr03xToCzrofme+zQbQvdRNqM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ/KGZz6zpMqaRqUMbVjhOAUh0DdIWubXvpwWAfg2es9W5GKNzS5OnPxfrxZNq1oq5nwH3TIgNAG3hni3IFvmQs5/HPNDTB9yanwNZhqOpwCx0vE49AB3uGnpWfAUtAmZ+FwunVXUkE9t995BwY39QQulTn+lBkxnaJw85ExcmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oU+vpOBX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5J7ODw028847;
	Wed, 6 Nov 2024 07:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=83ziYWoZClVdDhNSH21S+p/f
	IXRi/7i0V1SZKrqVp+M=; b=oU+vpOBXjkm/qxQhwdUgXvD+nDOIlKqFZwSklCpZ
	90XqjQoz01vF9TvDbGdN4snc5T24MhKeTmOu1fR7FgNgg2L7T7XQF9gDbhQTW6WG
	0yY/DXifgsreqMA2r5996xZuBh9HZr0dYTtDkKHdoHjBkCoXL0uDGZqmQnnY6Tze
	gqdYF3VZIyjdVAuZynNJhhgN2nYi4NKupja2SeWWNt9ZmPyxfGuHQ1ET7Y0kbnnl
	rw2htEkxppZBX7BvF1LOxdKdPkXPoMJB6jtYN3vbu9rPT0T17ueDur+FSYjBIJJU
	QhSITl1flwwg84tE9wvJskCykILSwZIYTfIgVB1MI0vmNQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd28afbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:57:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A67vBO2009916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 07:57:11 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 23:57:07 -0800
Date: Wed, 6 Nov 2024 15:56:57 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <ZyshSbJgLHTRaps1@cse-cd02-lnx.ap.qualcomm.com>
References: <20241106072343.2070933-1-quic_yuanjiey@quicinc.com>
 <20241106072343.2070933-2-quic_yuanjiey@quicinc.com>
 <347uhs7apex3usmfpzrpwakrzchxactwtc7gs45indkzez2vfj@n75dc3ovl3g2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <347uhs7apex3usmfpzrpwakrzchxactwtc7gs45indkzez2vfj@n75dc3ovl3g2>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N8Was61WdcKMQix7Su7OR19lQQbw8oH7
X-Proofpoint-GUID: N8Was61WdcKMQix7Su7OR19lQQbw8oH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=776
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060063

On Wed, Nov 06, 2024 at 09:36:56AM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 06, 2024 at 03:23:42PM +0800, Yuanjie Yang wrote:
> > Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The SDHC1
> > and SDHC2 of QCS615 are derived from SM6115. Include the relevant
> > binding documents accordingly.
> 
> Which binding documents?
Thanks, the binding documents is sdhci-msm.yaml.
I have modified this yaml patch in patch v1, and this yaml patch is
applied, so I remove this yaml patch in patch v2.
link:https://lore.kernel.org/all/CAPDyKFr-Gzd3Mzn+vN6DXO9C4Xrvpv4z5V2G_VRTzOa=89Fd3w@mail.gmail.com/

> > Additionally, configure SDHC1-related
> > and SDHC2-related opp, power, and interconnect settings in the device
> > tree.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

