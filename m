Return-Path: <linux-arm-msm+bounces-34370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A090F99D798
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 21:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6B81F22B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 19:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777671CC154;
	Mon, 14 Oct 2024 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cRdgRODf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D173A1B6;
	Mon, 14 Oct 2024 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728934809; cv=none; b=PA7ANq2TLGgCIRkGr8NP7V9JvqG6idgC6pPND8H3xyLeqqOPGJmlLbhhiwWvPZHODjXnj3agCF1FzabQ9ot0cYt9om9HXBIUpuP04W+YC1Kb8TxvaUFIRQqjkCOD+6NYqDdKCXIqz+1wyBlO1oNTfg7cY+G7qeqe1/Hd81P+QCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728934809; c=relaxed/simple;
	bh=gon8OVgfeokbF9dH8vAU/I2q1MXEJEK/bKmrbJyCTC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U0xu8EQSCEIkVUzW4SFF0AmdfSgB9SApnktFAkmMFiZ8rHErITb9sp/0LCjm7BEj/ARuYPsOnIpCuLHefKJs6+++Lx+SOuHh82JqTKlWqXcT+D6xP5/D4dXp4+TRSnXQN07FOFhGV6pCD6mszOJB83SoYJbkewmRGvapLnpI6Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cRdgRODf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EB92Yf018340;
	Mon, 14 Oct 2024 19:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awl4z4MGhITyUFRVeT3/YC6IRZPD4SDnGGUgmfXsRPI=; b=cRdgRODfBR0JFcil
	2pjEElr7LnDW53Au4U6uKtVKRp/NxDAxyhS0IU66WSOqqy2/PQM5xt7nTeti3l9p
	+RXxmjene+0VvXQxcKX9e7HNcoVfG7TyRqZLhl6rNpfvmJatmrS6ehEkiHNqPBRA
	mnE7qE5d2lF9a5h4lBq8yzL67touwd7sdSNpvRGfi7oBxcZPb31ZWB9lfQ2YaVqb
	BJ2jhxtoUMs8MeGuy2I0R2q6iLXoC/P8ZiQfSHl5kXb0kKJPRtPKXJkQ32Np8qss
	18OwOob+zocZsxXfu2vybYJDziqzkjk8Er5BrWFucskxpW2gv24ysnkbbl3xnxZt
	pACtHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427gpxndx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:39:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EJduQF026953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 19:39:56 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 12:39:55 -0700
Message-ID: <37d53ab8-e9d8-4fe1-89fd-dfc5fd551771@quicinc.com>
Date: Mon, 14 Oct 2024 12:39:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
To: Jonathan Marek <jonathan@marek.ca>, <freedreno@lists.freedesktop.org>
CC: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        "open list:DRM DRIVER for Qualcomm display
 hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm
 display hardware" <dri-devel@lists.freedesktop.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20241007050157.26855-1-jonathan@marek.ca>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Uqu6iplxeBK2bCeos95vSYOQJ1_gUMVo
X-Proofpoint-ORIG-GUID: Uqu6iplxeBK2bCeos95vSYOQJ1_gUMVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=633 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410140139



On 10/6/2024 10:01 PM, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

