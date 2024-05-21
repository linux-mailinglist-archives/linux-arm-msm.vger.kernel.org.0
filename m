Return-Path: <linux-arm-msm+bounces-20155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8688CB424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BB191C227B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B911482F1;
	Tue, 21 May 2024 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UVNe5BgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D8F1865C;
	Tue, 21 May 2024 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319224; cv=none; b=sjxORQq36d/bvo6urvdhEKnw59fQ80qwc10wpEFLR890niSAHA6DKg86sbjSJTmlp4ZfMGS6LE2znK4ibIG+smXifx9g3rL5MtRXwl7wU11C6qrffCFDvcUAAUxMmWGsadhZrfbHOzD7Ufa6hkVZvW3jxbakoX6sqc2qDVFKLRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319224; c=relaxed/simple;
	bh=GyzDIv+gEXNgSGP3NuX3DC8m5/JkMz+u2luxNY65WNI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNdLEeh/j8rQxTrEm7tDXcJKpTykC0Na8jLvODGfagkLJ7FnUgUcTLXQItwp3q2RYMXU4SPGTp27Fvjw65/thsaHCfDEfgmlit3CjTPzkglMmIjSCdm26MSCp27XBfpEH1V+bBCRnq7d+XhXkFRgy6USJ17n3Y7glTivC2px/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UVNe5BgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LAfYSm022596;
	Tue, 21 May 2024 19:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=SrdXLGjWhEyhLmHl2VU7B
	djjuz3cIxz8d7WDLf2ZpKo=; b=UVNe5BgSSa4KvK42en+M4RG1mUa9rHksmUT2Q
	TTnga5CourquhX3erummiJphBwTQ67Wqby2zOmBp8ZBkA3/a20DriSMfGP+CENuB
	TjTClh9nI/aaCTnrkvNaaEO5pr+3e21wXOIhvCvdudu1de14k6C6RNs/IYXT4AsP
	rBTfqnElz90FZKckGk4FC2gTzVSa6cwUyn0gn9XooyBHcp0XnnpxcQ0D3AZZyeUt
	H7VR+qpHl2WWOwqXygrKuzmfRIOYhVYcOnVRvB+/bNhSYIbTmN79Y4EukDJia3Z5
	bmNvXiazXx2PAAkCNFvpS/SnD72/Q2Q7Eagaw3T0J0cBKswVg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4p7ewh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:20:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LJKEWL017029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:20:14 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 12:20:14 -0700
Date: Tue, 21 May 2024 12:20:12 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <julia.lawall@inria.fr>, <javier.carrasco@wolfvision.net>,
        <skhan@linuxfoundation.org>
Subject: Re: [PATCH next] drivers: soc: qcom: Auto cleanup using
 __free(device_node)
Message-ID: <Zkzz7PZUnU/xP/O2@hu-bjorande-lv.qualcomm.com>
References: <20240407072330.229076-1-pvkumar5749404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240407072330.229076-1-pvkumar5749404@gmail.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rGYja5rtrC3DsK3WNhlK4vTpCVqyQzMs
X-Proofpoint-GUID: rGYja5rtrC3DsK3WNhlK4vTpCVqyQzMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_12,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1011 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210144

On Sun, Apr 07, 2024 at 12:53:30PM +0530, Prabhav Kumar Vaish wrote:
> Use automated cleanup to replace of_node_put() in qcom_smem_resolve_mem().
> 

I don't find this easier to read or maintain.

Also, your subject prefix does not match other changes to this driver.

Regards,
Bjorn

> Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> ---
> drivers/soc/qcom/smem.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..ad1cf8dcc6ec 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -1032,18 +1032,16 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>  				 struct smem_region *region)
>  {
>  	struct device *dev = smem->dev;
> -	struct device_node *np;
>  	struct resource r;
>  	int ret;
> +	struct device_node *np __free(device_node) = of_parse_phandle(dev->of_node, name, 0);
>  
> -	np = of_parse_phandle(dev->of_node, name, 0);
>  	if (!np) {
>  		dev_err(dev, "No %s specified\n", name);
>  		return -EINVAL;
>  	}
>  
>  	ret = of_address_to_resource(np, 0, &r);
> -	of_node_put(np);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 

