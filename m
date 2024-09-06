Return-Path: <linux-arm-msm+bounces-31037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F091596E78E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 04:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E551F23173
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 02:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78661B59A;
	Fri,  6 Sep 2024 02:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j2H2TSR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D6224D1;
	Fri,  6 Sep 2024 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725588611; cv=none; b=nj8iJ1svBZuy0VjT/SxkIXE6kx+inl+V7xSI1SvMR3ryzLvPjIr59SuHPsabqhsceqkOrJmn6qqPZT7o0/Sa4kEb96qZJEurzdfX4Qe8zjpmPo4VwqwRFEUlubSP9XVgnrRevamdjAHdRM/5IgDrgTclPbz6lNE5WbG8+Rws9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725588611; c=relaxed/simple;
	bh=i4l10zfX/DGhG/AbOrQwBZEQooKwTqkjISKRIiHs6HE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeYnmK+fGgi83yPcJB9bmLB6Cl00i1uRyOZ2vJQ9+ZjLljwVPBv6IanBBix6fhCpEcnLy5CckVPvK3U0cUoryEMZ6zPU3P7dsSSt6KNObTKuh+15/foa0VGH8uokZyp7Gd598lIfmWzcLR0WVC0NkjLhGpHq3yv3oHw713mxH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j2H2TSR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ1Bj019686;
	Fri, 6 Sep 2024 02:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o3m6ibt/YPMUXISBWQEtD/dM
	JXL1mxksn9wAFtL6Bz4=; b=j2H2TSR1ow58n1mWGWdDXGcs74Z2Mhzj17bGVshe
	aWWGmzj2OwyV70OfSUMA85QzExyyQLbt0ELXnDNP3X78qOtp3wIBYQLRTB8Kuw4J
	ynUPKmwigoxp7KX2GYLvwlP9YsQM9baq+4RWXDrfpFLMQV6hBwx2QwWyznbI9IFf
	KrZ6mnFCgEZ9MDtPw38Lo3u9lmpmQpATDtTQppXP6WwarC8D9JeHDyTBqiIh05h5
	eb/SLZajy/9lbPLH4zgXbStErlygI4GHqJGH1138FME0K75jpreWwwXnIcPC5jjg
	TktE5hs3CsyWk/aAjrwc7NtgTqvn5C9sD4pdUYze2VEOYg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu0rjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 02:04:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48624wHx012353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 02:04:58 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 19:04:57 -0700
Date: Thu, 5 Sep 2024 19:04:56 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Brian Masney <bmasney@redhat.com>
CC: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <quic_omprsing@quicinc.com>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ernesto.mnd.fernandez@gmail.com>,
        <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v3 0/2] crypto: qcom-rng: fix support for ACPI-based
 systems
Message-ID: <ZtpjSPI5+loYoT2M@hu-bjorande-lv.qualcomm.com>
References: <20240906002521.1163311-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906002521.1163311-1-bmasney@redhat.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9fjCBhBEyxfCCy1WbR6yEJgMi4sf68gk
X-Proofpoint-GUID: 9fjCBhBEyxfCCy1WbR6yEJgMi4sf68gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060015

On Thu, Sep 05, 2024 at 08:25:19PM -0400, Brian Masney wrote:
> The qcom-rng driver supports both ACPI and device tree based systems.
> ACPI support was broken when the hw_random interface support was added.
> This small series gets that working again.
> 
> This fix was boot tested on a Qualcomm Amberwing server (ACPI based) and
> on a Qualcomm SA8775p Automotive Development Board (DT based). I also
> verified that qcom-rng shows up in /proc/crypto on both systems.
> 

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> Changes since v2:
> - Simplify ACPI fix based on what's done with other drivers (Brian)
> 
> Changes since v1:
> - Use qcom_prng_ee_match_data instead of qcom_prng_match_data for the
>   true skip_init to match previous behavior (Ernesto)
> - Reordered patches so fix is first (Dmitry)
> 
> Brian Masney (2):
>   crypto: qcom-rng: fix support for ACPI-based systems
>   crypto: qcom-rng: rename *_of_data to *_match_data
> 
>  drivers/crypto/qcom-rng.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> -- 
> 2.46.0
> 

