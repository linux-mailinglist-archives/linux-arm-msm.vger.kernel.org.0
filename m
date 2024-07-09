Return-Path: <linux-arm-msm+bounces-25541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574E92AEF1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 06:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0DD8282548
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 04:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05330487BF;
	Tue,  9 Jul 2024 04:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dg0rbrOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DFD2BD05;
	Tue,  9 Jul 2024 04:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720497969; cv=none; b=q1FfPA3ViVRrUeC8b0pcqwbDfbH+sd9xEg7JbuMbTkcTV4P6AIYdmD0jmJCv/PaG56UTsNnqK+c48/xJt8c2vWJE3bSoF7OWsATyCoNp43T7Lm75WcVk09cp4cgq/Br0KRP5EulGze5CnvI9dHPHUEFJN54P4zHKWjr3hXcu+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720497969; c=relaxed/simple;
	bh=NFDu3F7rDMNV4FUo0YDfu3JzkZQunh0B5Q61UPbhL5c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7726EdYxWq/sEkMwAxmuD5e/f2FrNTT2AqlzbX5p8teMEd7pFkMdtbplcKO7DDNaI3at7hNjWCa1txyNcM9eAUqiL/jgN/ni9g1nKqOGAJqkpcsoIX389pdrT6F7rLMi4twSg5++abRR48hijAhA+jDHllBkcqXcUQgjrczYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dg0rbrOp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4693QcTl019517;
	Tue, 9 Jul 2024 04:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cuu2bpuOvAkFqLc8LvHG+iaz
	1VSGPDczMvb/f1B4aBk=; b=dg0rbrOpUHUdyRl+pBoNijqg8BIWiQ89yGaQzJB+
	l6gz2MX6cllc7j8b90kEuKsLIg3kcrtURxzBoVjaXl3kQ4nc+R9Fr1hs6jT7XYG5
	6Qrv7UwJn4J4p8QUJZXCWi3Cfy2MAztlqWMGqsIR8fXcVmJRK9Yx1AEhXAfsPWEG
	gZOGBTI4i+40fEy8ZgjTWhNOjr+o1RkwVixshIG10++G/jYwh9BupdU0z/m9F0pZ
	rW/OBc/KqRi8J/j93YvvyPpHeHqLwZSqiD2vfpO9e5jwiYCbrBNV2TN+M69MT2Dm
	VDr8tBOgcCyOQjyxFZRG1nOs6qnCWB5WFUbyWWq2+6Yk5A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwn94m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 04:05:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46945q4g009025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 04:05:52 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 21:05:47 -0700
Date: Tue, 9 Jul 2024 12:05:43 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] Coresight: Add Coresight Control Unit driver
Message-ID: <Zoy3FwurfmQUhF0S@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-4-quic_jiegan@quicinc.com>
 <9b502ba5-7042-424e-b0a2-5659e4064462@linaro.org>
 <ZotaBxRpv29crRHV@jiegan-gv.ap.qualcomm.com>
 <afd3c7b3-9d12-4ece-a938-c99bf9c5bb7b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <afd3c7b3-9d12-4ece-a938-c99bf9c5bb7b@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M18-D_-Qvg3WEgDOf71E8l-bUyNnTU2w
X-Proofpoint-ORIG-GUID: M18-D_-Qvg3WEgDOf71E8l-bUyNnTU2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=811 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090024

On Mon, Jul 08, 2024 at 12:44:43PM +0200, Krzysztof Kozlowski wrote:
> On 08/07/2024 05:16, JieGan wrote:
> > 
> >>
> >>> +
> >>> +	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));
> >>
> >> Use proper wrapper for this two.
> > Replaced by:
> > res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > drvdata->base = devm_ioremap_resource(dev, res);
> 
> Why?
> 
> Use the wrapper.
Sorry, I misunderstood the "wrapper" before.
Just wrapped drvdata->base by void __iomem *base;

> 
> 
> ...
> 
> >>> +
> >>> +static struct platform_driver ccu_driver = {
> >>> +	.probe          = ccu_probe,
> >>> +	.remove         = ccu_remove,
> >>> +	.driver         = {
> >>> +		.name   = "coresight-ccu",
> >>> +		.of_match_table = ccu_match,
> >>> +		.suppress_bind_attrs = true,
> >>
> >> Why?
> > Sorry, I dont get the point here.
> 
> You do not get the point why I am asking "why?"?
> 
> Why do you need it?
> 
> > We dont need automatic bind/unbind, so the suppress_bind_attrs sets to true.
> 
> But I need it...
> 
> > We need configure some settings before we register the device.
> 
> Hm, is this expected for coresight devices?
The coresight device cannot be unbinded independently. As we known, 
The coresight devices collaborate to form a path, from source, link, to sink.
If an unexpected unbinding occurs for a coresight device that is part of the path,
it will disrupt the entire path.

I think it's the reason why the coresight device driver does not need automatic bind/unbind.
Here is the previous discussion for suppress_bind_attrs:
https://lore.kernel.org/all/1453753248-1716-1-git-send-email-mathieu.poirier@linaro.org/#r

> 
> Best regards,
> Krzysztof
> 

Thanks,
Jie

