Return-Path: <linux-arm-msm+bounces-26429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD6933A5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79FE01C21119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD5417DE33;
	Wed, 17 Jul 2024 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M/glFTDN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB59381DE;
	Wed, 17 Jul 2024 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209897; cv=none; b=VzEqlgmDAw7sV7ZpPm0ainPKJd4QVoNJm7mcL1iNOXnMg+7dEtkE6SUYcSTIXCgiMDLpWaaLDpn6O9jhGd7cRbTSrXXRDJ8jyVDnmErBXSbzeEVHu2HvuVpcAIv/JuvYYa9m7VggwcDUTn+bXb+aitGIsSjUa0LLS5UZZY94QuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209897; c=relaxed/simple;
	bh=0mehBSeLwhUZ/WAmUEaJbbNRA0Jr5Eg0HVEFt1KnCRI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEnugU5I0xtgBMXJYgSSRWpoY71BLPa2xRTO8YRYkYNZA8rEgm0AiElpXUumMheAt+T3jyzSUuwSy00SC9B8PBFgx0zCZorjzxtLpBEeQkwFU/uwr3Q8YnPjFR8YsgnuSP+F9/tsxDKGAH+Ac4WuQA7w6Wc9nosw38GHCiT4k/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M/glFTDN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H6ofal027012;
	Wed, 17 Jul 2024 09:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0mehBSeLwhUZ/WAmUEaJbbNR
	A0Jr5Eg0HVEFt1KnCRI=; b=M/glFTDN4RbCmzyETyZkxwZ/+8O3cljf+unaupWF
	tHwKFRB9ouGNSc9rTTH1Q9i/Kb6Qz2WDMwM17S9bnreatqITVYh2sGiM72kYBuKX
	8e7HfI4Tw4cry8GOUxq80WXcCMSpYsaiMx/8EUH+NptTpMMz27fHGDKPSqBbP6nE
	Kg1KLFyYSoS7jhUCEV+gsqJ/bTFTKCFGTVO+KFCSE/kW4fUxuofie8mL9zSUAApt
	iyDyEuLFX+bdLnrWxRyWYaiSlgH4C2FCnNuAvHRP0ZIIhDrjC7zEizPMCd9/UNj1
	iTRze056mq60U7+S6KfjZRHPQaP2ckf3tls26oySEUr4uw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs1whw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:51:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46H9pVrl008851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:51:31 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 02:51:27 -0700
Date: Wed, 17 Jul 2024 15:21:23 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <quic_wcheng@quicinc.com>, <johan+linaro@kernel.org>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v0 1/2] dt-bindings: usb: qcom,dwc3: Add minItems for
 interrupt info
Message-ID: <ZpeUG66oI2D/r4Ma@hu-varada-blr.qualcomm.com>
References: <20240711065615.2720367-1-quic_varada@quicinc.com>
 <20240711142202.GA2256964-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711142202.GA2256964-robh@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tO9HBD7Uz4dxzSPmFB9il-1whlWnBc-J
X-Proofpoint-GUID: tO9HBD7Uz4dxzSPmFB9il-1whlWnBc-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=525
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170076

On Thu, Jul 11, 2024 at 08:22:02AM -0600, Rob Herring wrote:
> On Thu, Jul 11, 2024 at 12:26:14PM +0530, Varadarajan Narayanan wrote:
> > IPQ5332 has only three interrupts. Update min items
> > accordingly for interrupt names to fix the following
> > dt_binding_check errors.
>
> Patch version numbering starts at 1, not 0.

Sorry. Have posted v2 addressing the above and other
comments. Please take a look.

Thanks
Varada

