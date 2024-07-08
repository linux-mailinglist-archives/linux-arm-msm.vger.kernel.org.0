Return-Path: <linux-arm-msm+bounces-25453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5A929B06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 05:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CA4E1C209DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 03:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6DD3D76;
	Mon,  8 Jul 2024 03:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bk+XHpE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB12FB6;
	Mon,  8 Jul 2024 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720408608; cv=none; b=rBUXOb10S3coyhRecaL014oD77nly8IDc1LlpCqJ9JoNYQO5aDift3HL7u8O7G2TdgUoEpi/4Rg6S9x/ahsZ3ijg6peNAzv37LnpXqKM0qp/8XZZKMonmZYFtpBxo4xxKo+jZq6mPUJgeiqhx+5G9GCujX55nE0IQlad0XtfgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720408608; c=relaxed/simple;
	bh=lbEMPrSpCdABxOClAmHcc5Vm36A5NdX88qh9m87XESw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VH4u9mJjWgu6k/FxMMVSt+OOks3UtFfgXb9PUMhm2xZNqdKnFzlB7sV9G7S4QWWlBQYsCld9A46mtbiZo+UUNfDg5DXZgzlFePKTjAkThjaLkjbcndumTtR+A4MiqpFBfpwEGOihv+jFsdN2dC/q1yUtmmYiXy+cCoeKak7DK90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bk+XHpE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4680jeIm009524;
	Mon, 8 Jul 2024 03:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGLJ8rZgPHxFeQ0fOi/vKI8j
	E/UtbutbhZP87gHY+0E=; b=bk+XHpE/y2b1Yhu/1ZiigoxMJwJN9WghnuLLv3Sy
	kHdCYnzVpE6sqOXQg3JzRrT837ki7zbrk3QSAySxGCgKlRmf8uClihSGB0cmt4oG
	5GKngV2uCFa4TgPafScBDV8nQG4o8QGqGtrFgaEaCOtxKce1l9A1RmJZv0neFhHd
	/1ZTsuAHf65GS33ZGqIOj5kwlRLrqyQrhh5fGh18ZGybuDzpfUnMlLWuApAUw0AD
	kjVKIEepsEqvsnJRzZApFKcfXw5MMH/rdlFRNAGNG4Uczc3kcsPXKVqJdkz1iR4c
	DjWm0cIClzJfdH9EDvfkoeyzfm3qhHFYh9+YC2pdjgrhOA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t2fyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 03:16:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4683GWaQ002605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 03:16:32 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 7 Jul 2024 20:16:26 -0700
Date: Mon, 8 Jul 2024 11:16:23 +0800
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
Message-ID: <ZotaBxRpv29crRHV@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-4-quic_jiegan@quicinc.com>
 <9b502ba5-7042-424e-b0a2-5659e4064462@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b502ba5-7042-424e-b0a2-5659e4064462@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZAIsfCBzQoxETJFvt1uGg4ZiiXagjVHa
X-Proofpoint-ORIG-GUID: ZAIsfCBzQoxETJFvt1uGg4ZiiXagjVHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_10,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080025

On Fri, Jul 05, 2024 at 11:11:19AM +0200, Krzysztof Kozlowski wrote:
> On 05/07/2024 11:00, Jie Gan wrote:
> > The Coresight Control Unit hosts miscellaneous configuration registers
> > which control various features related to TMC ETR sink.
> > 
> > Based on the trace ID, which is programmed in the related CCU ATID register
> > of a specific ETR, trace data with that trace ID gets into the ETR buffer,
> 
> ....
> 
> > +static int ccu_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct coresight_platform_data *pdata;
> > +	struct ccu_drvdata *drvdata;
> > +	struct coresight_desc desc = { 0 };
> > +	struct resource *res;
> > +
> > +	desc.name = coresight_alloc_device_name(&ccu_devs, dev);
> > +	if (!desc.name)
> > +		return -ENOMEM;
> > +	pdata = coresight_get_platform_data(dev);
> > +	if (IS_ERR(pdata))
> > +		return PTR_ERR(pdata);
> > +	pdev->dev.platform_data = pdata;
> > +
> > +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +	if (!drvdata)
> > +		return -ENOMEM;
> > +	drvdata->dev = &pdev->dev;
> 
> Use stored dev variable.
pdev->dev replaced by dev variable.


> 
> > +	drvdata->atid_offset = 0;
> > +	platform_set_drvdata(pdev, drvdata);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ccu-base");
> > +	if (!res)
> > +		return -ENODEV;
> > +	drvdata->pbase = res->start;
> 
> Drop.
Dropped.

> 
> > +
> > +	drvdata->base = devm_ioremap(dev, res->start, resource_size(res));
> 
> Use proper wrapper for this two.
Replaced by:
res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
drvdata->base = devm_ioremap_resource(dev, res);

> 
> > +	if (!drvdata->base)
> > +		return -ENOMEM;
> > +
> > +	desc.type = CORESIGHT_DEV_TYPE_HELPER;
> > +	desc.pdata = pdev->dev.platform_data;
> > +	desc.dev = &pdev->dev;
> > +	desc.ops = &ccu_ops;
> > +
> > +	drvdata->csdev = coresight_register(&desc);
> > +	if (IS_ERR(drvdata->csdev))
> > +		return PTR_ERR(drvdata->csdev);
> > +
> > +	dev_dbg(dev, "CCU initialized: %s\n", desc.name);
> 
> Drop.
Dropped.

> 
> > +	return 0;
> > +}
> > +
> > +static void ccu_remove(struct platform_device *pdev)
> > +{
> > +	struct ccu_drvdata *drvdata = platform_get_drvdata(pdev);
> > +
> > +	coresight_unregister(drvdata->csdev);
> > +}
> > +
> > +static const struct of_device_id ccu_match[] = {
> > +	{.compatible = "qcom,coresight-ccu"},
> > +	{}
> > +};
> > +
> > +static struct platform_driver ccu_driver = {
> > +	.probe          = ccu_probe,
> > +	.remove         = ccu_remove,
> > +	.driver         = {
> > +		.name   = "coresight-ccu",
> > +		.of_match_table = ccu_match,
> > +		.suppress_bind_attrs = true,
> 
> Why?
Sorry, I dont get the point here.
We dont need automatic bind/unbind, so the suppress_bind_attrs sets to true.
We need configure some settings before we register the device.

> 
> > +	},
> > +};
> > +
> > +static int __init ccu_init(void)
> > +{
> > +	return platform_driver_register(&ccu_driver);
> > +}
> > +module_init(ccu_init);
> > +
> > +static void __exit ccu_exit(void)
> > +{
> > +	platform_driver_unregister(&ccu_driver);
> > +}
> > +module_exit(ccu_exit);
> 
> Why this is not just module platform driver?
Replaced by module_platform_driver(ccu_driver);

> 
> Best regards,
> Krzysztof
> 


Thanks,
Jie

