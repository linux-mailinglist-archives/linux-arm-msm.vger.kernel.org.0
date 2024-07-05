Return-Path: <linux-arm-msm+bounces-25396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68634928DA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 20:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4616B20DE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 18:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D61016C6B3;
	Fri,  5 Jul 2024 18:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n0w4D5h9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D185465B;
	Fri,  5 Jul 2024 18:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720205760; cv=none; b=aXbQeBmB2nNtPO9APBBTkE7gdFW/IQlR94cJoedDOEHefFlh6HG83knQgQd6Y81w5/EBQzFhqKoEdmw3lzu8d//ZkIk7ZrCvCtchLcjSTIEzXB0mKTpfQu8bDx/qs+pbpC4bE7ymQ96R4Xh96XBNwtgFoGQMguGg1WBxygv34qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720205760; c=relaxed/simple;
	bh=7seUvFVoyQmIN5FBQZbQICDn3NQ9rwhq9ufulaQsPoI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUb/vRHDeiFgIZVlA19d0QgEMzYBdqStFKGbb7gAQhqhnfyjV79CDsSZrINcios7l1QoxWbuszJJlsGQBaLnJlmOuR6rhnZ/kC/VS6Il8bo50/cLz52FbiAlKVX4BPMAc604j2H5udgTVvAx/ZElVgIHAqkYlGS+x+7Bf7AMLsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n0w4D5h9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465A6GCL005913;
	Fri, 5 Jul 2024 18:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvqhVjitbKaxqla5Sc6GP9c7
	xklkshXFW2zL5IvkQ8s=; b=n0w4D5h9YZyMvTQQZBEHJ4BO9dFnVVTv0Q980PiT
	S5SbsTFmNczBT/FbmI0qsapDlEZYn19gf5TriQxqNU471mZH6GqPH/LeZYzVYvN3
	XfncN9XpLwlOQs61E2nA1FDbRPLnTrRyHzQX5HfCFnGWiKdHzUp03wrhtApk+kmN
	1mgpb1GjkbylTCQ3InNp3+0SjWoJ3cqdwHES8ZRsKJ5yJ6GY5rbGtN7VP7lXRTAN
	+U5hty1EN7s6BYnJVg3N/2vVpHRLjubkIAdPYplZ9pUoH+5J5Jsd/NoLEcsM+oVv
	mexmX/mZqP1gMM1DpmG6Oa0qeOGEkchh9nUb1I/o7679xw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405dbe5cyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 18:55:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465Itrco019587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 18:55:53 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 11:55:53 -0700
Date: Fri, 5 Jul 2024 11:55:52 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ] firmware: qcom: scm: Disable SDI and write no dump to
 download mode register
Message-ID: <20240705113813958-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240705120623.1424931-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240705120623.1424931-1-quic_mojha@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SrCogPNrF7C6ri7cvUzyS2L24Pp70gcp
X-Proofpoint-GUID: SrCogPNrF7C6ri7cvUzyS2L24Pp70gcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_14,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050137

On Fri, Jul 05, 2024 at 05:36:23PM +0530, Mukesh Ojha wrote:
> SDI is enabled for most of the Qualcomm SoCs and as per commit
> ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")
> it was recommended to disable SDI by mentioning it in device tree
> 
> However, for some cases download mode tcsr register already configured
> from boot firmware to collect dumps and in such cases if download
> mode is set to zero(nodump mode) from kernel side and SDI is disabled
                     ^^^^^^^^^^^^^
that's not what download_mode=0 does currently, but it's what you're
proposing it should be doing. I think that proposal is reasonable, but
can you call out in the commit text that the current behavior of
download_mode=0 is nop.

> via means of mentioning it in device tree we could end up with dump
> collection.
> 
> To disable complete dump collection mode, SDI and dload mode register
> need to be set no dump mode.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Should this be?

Fixes: ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")

> ---
>  drivers/firmware/qcom/qcom_scm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 00c379a3cceb..2e10f75a9cfd 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1954,14 +1954,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	 * will cause the boot stages to enter download mode, unless
>  	 * disabled below by a clean shutdown/reboot.
>  	 */
> -	if (download_mode)
> -		qcom_scm_set_download_mode(true);
> -
> +	qcom_scm_set_download_mode(download_mode ? true : false);

Just: qcom_scm_set_download_mode(download_mode);

>  
>  	/*
>  	 * Disable SDI if indicated by DT that it is enabled by default.
>  	 */
> -	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled"))
> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,sdi-enabled") || !download_mode)


>  		qcom_scm_disable_sdi();
>  
>  	ret = of_reserved_mem_device_init(__scm->dev);
> -- 
> 2.34.1
> 
> 

