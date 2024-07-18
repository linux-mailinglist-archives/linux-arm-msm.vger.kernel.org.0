Return-Path: <linux-arm-msm+bounces-26537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2990934903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 09:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D54261C22B9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B5077107;
	Thu, 18 Jul 2024 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O2/awaCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF976056;
	Thu, 18 Jul 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288329; cv=none; b=Ga8GPOHN8pD+RJ0mlh/B0AQCVHmxfO24xr/q48jsYstXXBDpoZGWnDU67iry+sicJ/xf0c9T53IjB/eVgsKEGcqkTGjs5M/RKNUTC8D4uZOM1YRE4CteVhYCAkV907q0LJTF/wJb0L9qR9n5mRFVuRDdfKfADp/fRTveQ4B/A1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288329; c=relaxed/simple;
	bh=PKeuFzvazocr5QRu/WGUbG5rPyb+cr8E2PCtHKS+FaU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4mqlA0Ja8Y8uv35tgp0J+Re4kLqZfXbWymHyhg++IkbnFafLJluBDVlhnYW9jjbXxoI7fo4gwiTaiZYdgSbgb/L8vSKtklGHHJRiBI61OPTCyyhNXHVNynHM1Qq4LeIriYtGnFyP0aBM+cJYGlVQSJfJpI5MhonxxzM6C6v5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O2/awaCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HHlfLZ019131;
	Thu, 18 Jul 2024 07:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iRl7Hp3kWjEIG+dQHsBwWHpj
	eg8Z8C7PjLd3hqlS2I4=; b=O2/awaCDU1oT/a0e2LYxPKQtmwV0OGc4hZZHZC0z
	d5eHNKKNTo7FhUSYkqarmhvAnLDhhtTDyP/6dx81ZkkZxK3xzrpfhEZD0CZi5ND+
	tf3iewS6kZ06zyJG0RAFifTaXIc3eBmMdopGigZFZQzYyP3+OlSPe3RxK/vBZ9Y0
	92XEk3b5TMh/DT63VK4NnMcXe0G4ZXSeGMlh9pd0hY59DV7fYyeHDHw4CzJ6QNGl
	MAQ8NL3nfpUqrHLM9qvAjPP+l3fp5QsgTVneUUOsr0BwAfNvxfh4cjxI34SPq92h
	uFL6VETXpykv/7rqfEETBSlGy0JjdYU1Gls4bTIVCr2CZw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpmq02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 07:38:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I7cXkd008118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 07:38:33 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Jul 2024 00:38:28 -0700
Date: Thu, 18 Jul 2024 13:08:25 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Maulik Shah <quic_mkshah@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <caleb.connolly@linaro.org>,
        <stephan@gerhold.net>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <robdclark@gmail.com>, <nikita@trvn.ru>, <quic_eberman@quicinc.com>,
        <quic_pkondeti@quicinc.com>, <quic_lsrao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v2] soc: qcom: cmd-db: Map shared memory as WC, not WB
Message-ID: <a49113a2-d7f8-4b77-81c7-22855809cee8@quicinc.com>
References: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aYzo42sn-TlTZryW5eE8PCTEiLOxnhcZ
X-Proofpoint-GUID: aYzo42sn-TlTZryW5eE8PCTEiLOxnhcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180051

On Thu, Jul 18, 2024 at 11:33:23AM +0530, Maulik Shah wrote:
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> 
> Linux does not write into cmd-db region. This region of memory is write
> protected by XPU. XPU may sometime falsely detect clean cache eviction
> as "write" into the write protected region leading to secure interrupt
> which causes an endless loop somewhere in Trust Zone.
> 
> The only reason it is working right now is because Qualcomm Hypervisor
> maps the same region as Non-Cacheable memory in Stage 2 translation
> tables. The issue manifests if we want to use another hypervisor (like
> Xen or KVM), which does not know anything about those specific mappings.
> 
> Changing the mapping of cmd-db memory from MEMREMAP_WB to MEMREMAP_WT/WC
> removes dependency on correct mappings in Stage 2 tables. This patch
> fixes the issue by updating the mapping to MEMREMAP_WC.
> 
> I tested this on SA8155P with Xen.
> 
> Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
> Cc: stable@vger.kernel.org # 5.4+
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Tested-by: Nikita Travkin <nikita@trvn.ru> # sc7180 WoA in EL2
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> ---
> Changes in v2:
>  - Use MEMREMAP_WC instead of MEMREMAP_WT
>  - Update commit message from comments in v1
>  - Add Fixes tag and Cc to stable
>  - Link to v1: https://lore.kernel.org/lkml/20240327200917.2576034-1-volodymyr_babchuk@epam.com
> ---
>  drivers/soc/qcom/cmd-db.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index d84572662017..ae66c2623d25 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -349,7 +349,7 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WB);
> +	cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WC);
>  	if (!cmd_db_header) {
>  		ret = -ENOMEM;
>  		cmd_db_header = NULL;
> 

Thanks Maulik for sharing the patch. It works as expected. Feel free to
use

Tested-by: Pavankumar Kondeti <quic_pkondeti@quicinc.com>

Thanks,
Pavan

