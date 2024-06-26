Return-Path: <linux-arm-msm+bounces-24193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF909176D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 05:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428FE1F237A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 03:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565DD8565E;
	Wed, 26 Jun 2024 03:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y/J9U8eZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9107535BF;
	Wed, 26 Jun 2024 03:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719372736; cv=none; b=FXp8KOapgsWXIAYFCvbpQ4M6gm5elVXtKzsfrhkCAAWouVybEXIjqBWHQT/yiWPNGfqtBAu11ReV7mglK6BwwEaWNOfsuUNriDjyxa0+okpsv1RgDPUf4U0DIR0VZ5M7I80EXhZb1cqzkoXQE4Rmns+Py/DslezQ44I4pR7GeHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719372736; c=relaxed/simple;
	bh=eSLtpy9J3DnxY6j9ss/SgfMGsXYGO4P8zfJ1rxSKujA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMRnEYXczboDytFaqlPGQ8qgrca9ntYNTz5Hd1HYCGSr1+LPnGLTeS7iR0y2G1hJMLXtd91rXXy9fx9oR2cqsc8ZHamultar1YxlOfUiZFQAmpzEIm8HMXKeF/ZYYihfsbzQEsnPwRlg74Qp4ElytRSo/5dWwtCVj3duaRtQQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y/J9U8eZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PG9EZI008956;
	Wed, 26 Jun 2024 03:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ndEmfYpnpWUa8CmBnJA35uvQ
	PqLEkBqpcOHII7KJgrc=; b=Y/J9U8eZx+TQyeYX2wHm+SdyloHIbM9b5OwMs3dn
	Fmi3BBbu7LXPhnACRrL9LfxT86vqEJOa7xnD/X3PF0ZX107gC8llOHtZWIMY4zMW
	7ZOIqIgwdD+trsxB99VNXszAZGf8cxCwN7VdqUhsvgAm+vXo0ec0mTy/3TEmJsjm
	G+HnaVLpwpSE9MCT4dok0tJrJEEbE8PqGiiUKHGJ31Pq3w0RCH9+bathwYVmDFoR
	WslfieAAW+fbOnRmdF0+07kluG/+GscO+gRC+7M3xffqzYyhUgjvgqMSWRnCTmQB
	C5AIgM6glnNVM+3QT4EYor+JB2a2aDhuUGaBrr0rrAGafQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqcegc4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:32:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q3Vxbd027157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 03:31:59 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 20:31:52 -0700
Date: Wed, 26 Jun 2024 11:31:49 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: Re: [PATCH 2/2] Coresight: Set correct cs_mode for dummy source to
 fix disable issue
Message-ID: <ZnuLpTE+qhvYzICy@jiegan-gv.ap.qualcomm.com>
References: <20240626022537.1887219-1-quic_jiegan@quicinc.com>
 <20240626022537.1887219-2-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240626022537.1887219-2-quic_jiegan@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gKNOYI1EQmdKjzRrBHChWw2Jcp0S2WM1
X-Proofpoint-ORIG-GUID: gKNOYI1EQmdKjzRrBHChWw2Jcp0S2WM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260026

On Wed, Jun 26, 2024 at 10:25:37AM +0800, Jie Gan wrote:
> The coresight_disable_source_sysfs function should verify the
> mode of the coresight device before disabling the source.
> However, the mode for the dummy source device is always set to
> CS_MODE_DISABLED, resulting in the check consistently failing.
> As a result, dummy source cannot be properly disabled.
> 
> Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement.
> Configure CS_MODE_DISABLED during the disablement.
> 
> Fixes: 9d3ba0b6c056 ("Coresight: Add coresight dummy driver")
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-dummy.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index ac70c0b491be..dab389a5507c 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -23,6 +23,9 @@ DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
>  static int dummy_source_enable(struct coresight_device *csdev,
>  			       struct perf_event *event, enum cs_mode mode)
>  {
> +	if (!coresight_take_mode(csdev, mode))
> +		return -EBUSY;
> +
>  	dev_dbg(csdev->dev.parent, "Dummy source enabled\n");
>  
>  	return 0;
> @@ -31,6 +34,7 @@ static int dummy_source_enable(struct coresight_device *csdev,
>  static void dummy_source_disable(struct coresight_device *csdev,
>  				 struct perf_event *event)
>  {
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
>  	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>  }
>  
> -- 
> 2.34.1
>
Please ignore this patch. This patch should be included by an independent email.
I will correct it.

Thanks,
Jie 
> 

