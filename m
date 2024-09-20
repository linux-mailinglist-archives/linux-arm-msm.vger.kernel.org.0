Return-Path: <linux-arm-msm+bounces-32118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148E97D9C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 21:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6191F22A02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECED17B50B;
	Fri, 20 Sep 2024 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p1vGYOK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B543FB3B;
	Fri, 20 Sep 2024 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726859414; cv=none; b=D/CAhor/zhzx0Bi3897Sa+AG8ZDIsi4Io7AtvWXNmoFDAPqZTicv6y4qsdJJRwNlYjhY01dmkI6AUncTeCRUa7K9rHzDZ7NAK6BuljvXe2s3YI3sAimcfvNLRZ9GQRWZmUwfiS+1pxKLdO3hG3KroL8AGWuCd9Vx/mQvJApYJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726859414; c=relaxed/simple;
	bh=ez/mPdvd1QIN88nMxftKEiiiI8ySa6ENCbKolxX+7KU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwcCNT8ZFmmXm+6jzSTuYtKCtgHYray04W7eVcXQ/ojCOOp34JibGA/uaPP1aob3Le4hskyEvRmQZvyL11mCDxEPnJrwZgg5Q9QYeixDZKtPWN4LQh4WBGyvE6UOafanS4+Too8QuS5rRsFek3NMJ6MvaiXkvj+D/VUUIM60gCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p1vGYOK3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KBMNET017481;
	Fri, 20 Sep 2024 19:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQzfz18VMaqcdlFy6t9nYj9x
	tLCuv3ntbNwrACzqcWU=; b=p1vGYOK3ipqCfQ2br3OWi2k3lKjqb0cwiZvzGVbw
	92FIt+n0Hn1Ld6VSJwoVdxDEnYTDOw5SN8Qn8NxgcCUd2deuzPoqiN/WR5M69CdX
	cW8/RBWhBEqVHuExUq2Tor5oiOkyc60e6tWGNWHn8xDRUgm+EN4GYBLtpit9ItcL
	etp82l99cP0dA1flj6JPUU3Rz8Uz6OD94fDttGoUQ5UFO6aujOhA21XusjBjmaVe
	sfrQQvo2HkTM6MjOKqHNq2xfbLVwtUqBgJgC/MFZ9E4hoN3/BShGSnwc8BmnqE07
	dhecDM0iM3iMTHQv0reL/RF89p57GVn79ZIfGw1+NCbNkQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41ry4ab1bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 19:10:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KJ9gWK030075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 19:09:42 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 12:09:42 -0700
Date: Fri, 20 Sep 2024 12:09:41 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Rudraksha Gupta <guptarud@gmail.com>,
        "Linux regression tracking (Thorsten
 Leemhuis)" <regressions@leemhuis.info>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] firmware: qcom: scm: Allow devicetree-less probe
Message-ID: <20240920120615393-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240920-scm-pdev-v1-1-b76d90e06af7@quicinc.com>
 <719dc21d-4c4f-4ca5-b46e-a044aa751815@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <719dc21d-4c4f-4ca5-b46e-a044aa751815@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z_EekgiUyuQzTsv-0tCc4t0PVKL903_3
X-Proofpoint-ORIG-GUID: z_EekgiUyuQzTsv-0tCc4t0PVKL903_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200139

On Sat, Sep 21, 2024 at 12:11:39AM +0530, Wasim Nazir wrote:
> 
> 
> On 9/20/2024 11:31 PM, Elliot Berman wrote:
> > Some devicetrees representing Qualcomm Technologies, Inc. SoCs are
> > missing the SCM node. Users of the SCM device assume the device is
> > present and the driver also assumes it has probed. This can lead to
> > unanticipated crashes when there isn't an SCM device. All Qualcomm
> > Technologies, Inc. SoCs use SCM to communicate with firmware, so create
> > the platform device if it's not present in the devicetree.
> > 
> > Tested that SCM node still probes on:
> >   - sm8650-qrd with the SCM DT node still present
> >   - sm845-mtp with the SCM DT node still present
> >   - sm845-mtp with the node removed
> > 
> > Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> > Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> > Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> > Link: https://lore.kernel.org/all/CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com/
> > Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c | 75 +++++++++++++++++++++++++++++++++++-----
> >   1 file changed, 66 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 10986cb11ec0..842ba490cd37 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -1954,10 +1954,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >   	init_completion(&scm->waitq_comp);
> >   	mutex_init(&scm->scm_bw_lock);
> > -	scm->path = devm_of_icc_get(&pdev->dev, NULL);
> > -	if (IS_ERR(scm->path))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(scm->path),
> > -				     "failed to acquire interconnect path\n");
> > +	if (pdev->dev.of_node) {
> > +		scm->path = devm_of_icc_get(&pdev->dev, NULL);
> > +		if (IS_ERR(scm->path))
> > +			return dev_err_probe(&pdev->dev, PTR_ERR(scm->path),
> > +					"failed to acquire interconnect path\n");
> > +	}
> >   	scm->core_clk = devm_clk_get_optional(&pdev->dev, "core");
> >   	if (IS_ERR(scm->core_clk))
> > @@ -2012,10 +2014,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >   	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)
> >   		qcom_scm_disable_sdi();
> > -	ret = of_reserved_mem_device_init(__scm->dev);
> > -	if (ret && ret != -ENODEV)
> > -		return dev_err_probe(__scm->dev, ret,
> > -				     "Failed to setup the reserved memory region for TZ mem\n");
> > +	if (pdev->dev.of_node) {
> > +		ret = of_reserved_mem_device_init(__scm->dev);
> > +		if (ret && ret != -ENODEV)
> > +			return dev_err_probe(__scm->dev, ret,
> > +					"Failed to setup the reserved memory region for TZ mem\n");
> > +	}
> >   	ret = qcom_tzmem_enable(__scm->dev);
> >   	if (ret)
> > @@ -2068,6 +2072,11 @@ static const struct of_device_id qcom_scm_dt_match[] = {
> >   };
> >   MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);
> > +static const struct platform_device_id qcom_scm_id_table[] = {
> > +	{ .name = "qcom-scm" },
> > +	{}
> > +};
> > +
> >   static struct platform_driver qcom_scm_driver = {
> >   	.driver = {
> >   		.name	= "qcom_scm",
> > @@ -2076,11 +2085,59 @@ static struct platform_driver qcom_scm_driver = {
> >   	},
> >   	.probe = qcom_scm_probe,
> >   	.shutdown = qcom_scm_shutdown,
> > +	.id_table = qcom_scm_id_table,
> >   };
> > +static bool is_qcom_machine(void)
> > +{
> > +	struct device_node *np __free(device_node) = NULL;
> > +	struct property *prop;
> > +	const char *name;
> > +
> > +	np = of_find_node_by_path("/");
> > +	if (!np)
> > +		return false;
> > +
> > +	of_property_for_each_string(np, "compatible", prop, name)
> > +		if (!strncmp("qcom,", name, 5))
> Is this limitation updated in dt-schema also? This static check in code
> might cause unwanted issues.

arm/qcom.yaml describes the requirement that Qualcomm SoCs would always
have a "qcom," prefixed compatible.

> 
> Instead can we use this simple check method? I am ok to do some refinement
> if needed.
> https://lore.kernel.org/all/20240920181317.391918-1-quic_wasimn@quicinc.com/

We'd like to make sure that SCM device is instead probed in time.
Returning error isn't preferred as most (all?) users won't retry
later.

> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >   static int __init qcom_scm_init(void)
> >   {
> > -	return platform_driver_register(&qcom_scm_driver);
> > +	struct device_node *np __free(device_node) = NULL;
> > +	struct platform_device *pdev;
> > +	int ret;
> > +
> > +	ret = platform_driver_register(&qcom_scm_driver);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Some devicetrees representing Qualcomm Technologies, Inc. SoCs are
> > +	 * missing the SCM node. Find out if we don't have a SCM node *and*
> > +	 * we are a Qualcomm-compatible SoC. If yes, then create a platform
> > +	 * device for the SCM driver. Assume scanning the root compatible for
> > +	 * "qcom," vendor prefix will be faster than searching for the
> > +	 * SCM DT node.
> > +	 */
> > +	if (!is_qcom_machine())
> > +		return 0;
> > +
> > +	np = of_find_matching_node_and_match(NULL, qcom_scm_dt_match, NULL);
> > +	if (np)
> > +		return 0;
> > +
> > +	pdev = platform_device_alloc(qcom_scm_id_table[0].name, PLATFORM_DEVID_NONE);
> > +	if (!pdev)
> > +		return -ENOMEM;
> > +
> > +	ret = platform_device_add(pdev);
> > +	if (ret)
> > +		platform_device_put(pdev);
> > +
> > +	return ret;
> >   }
> >   subsys_initcall(qcom_scm_init);
> > 
> > ---
> > base-commit: 2adcf3941db724e1750da7094c34431d9b6b7fcb
> > change-id: 20240917-scm-pdev-bc8db85fad05
> > 
> > Best regards,

