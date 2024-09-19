Return-Path: <linux-arm-msm+bounces-32031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E4A97CD89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 20:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22BEC1C2220E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 18:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DD01EF1D;
	Thu, 19 Sep 2024 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FTkt+prq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4522612;
	Thu, 19 Sep 2024 18:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726770424; cv=none; b=rc8uBOb8wkanFW24UaT4oxPWWddQ8/+aeuyh2EQtZdzArQzFKutBLXEwaWj10IVaDV7hJbOxDrTicvMvLOiCJYviht569SZL/6PMXqAl3qgWPkxhISLk/qqxIQwzEMrgcJyQq2w94ePpXK8OGAWC+7jL9JtbB6xqbNeJ8MyZKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726770424; c=relaxed/simple;
	bh=+tSIlAbahTuJSj8tulWAQD7IPGFDu55eDHbUAbttPjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jv7rxY7nRQTn+VbX+zYgHeTXtO11XOBKnMsr7CKLOpEKYWcWVA789SV41ht35tckw9lAsZAEL457FZXsA3OArKmMj6NVz1xgW4IWX8xuIfeP8pio1g0xghqxBiaLqf4Vk6gcRWFHqTmJ6z43mafWwr1MyD3Qn6sdCK5InFxAHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FTkt+prq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J97QQS005813;
	Thu, 19 Sep 2024 18:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1NwkcCP+9Au12YWcI9sbzGfangJc6C+wSvJTbSss0o=; b=FTkt+prqfRaovEMR
	jxv/tgDLKS+HdoEOVIal6pSpkujgKfO3OM6Z2o6aIGZB40ZUDtWfT0pZWaQM3lYO
	gDRUTH/0tBpnfu8hsZCFdrcEgNjLiS5t0em8zuTCmK7Vw5Z5Jb1AA168CQ8fPA0V
	DbBPrVSRGPDvQ+3TTnIugoEFFijrF5dsxD9i5nJJgwcSEIMifJTFoveyjYT/mhYx
	QRjkYnv8cqmDvItSZxEgn4DbyjuDr8gdudalnz7Vit9YDmDXNR3M5QaIVBRkU4RA
	j4Xu4yZyRfrggdEKlxP1Luv8sPN2LUDvBADMUhIVxfBrXuy9SAZzTqqYceKQ2pXV
	5cHrgQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdxd9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 18:25:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JIPW9T020939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 18:25:32 GMT
Received: from [10.110.111.10] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 11:25:32 -0700
Message-ID: <233ac3dc-41c4-46a0-b821-e6e835baa0e9@quicinc.com>
Date: Thu, 19 Sep 2024 11:25:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sravanthi
 Kollukuduru <skolluku@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jami Kettunen
	<jami.kettunen@somainline.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jeykumar
 Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
 <20240905-dpu-fix-sdm845-catalog-v1-1-3363d03998bd@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-1-3363d03998bd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wz0_x3Kgugbzns0JkCBcCGhSsbJWBk4r
X-Proofpoint-GUID: wz0_x3Kgugbzns0JkCBcCGhSsbJWBk4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190123



On 9/4/2024 8:26 PM, Dmitry Baryshkov wrote:
> On the SDM845 platform the DSPP_3 is used by the LM_5. Correct
> corresponding entries in the sdm845_lm array.
> 
> Fixes: c72375172194 ("drm/msm/dpu/catalog: define DSPP blocks found on sdm845")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Matches the docs I have, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

