Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59EC3752ABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 21:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjGMTIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 15:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjGMTIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 15:08:50 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E82F173B
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:08:49 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DIlKje026233;
        Thu, 13 Jul 2023 19:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=TnHCf7l6vXUqMxsQyDFpqBhLp/0PL/InN/4OikML8K0=;
 b=hK020tfprhYumNg5t7yFYxogIbY9jXtweMX7PuoQ3J2TT32G9dFTz5GHpbw7O3MNSG6Z
 X4cyJaWNPqKsQafVuBN4lsJDoWiKLQq8odcCnWKhyZ0JfuifvQOqtr9bRIZd/rfd1rni
 YHHKsJ4RmB9pHgvOHXgwHK1BmfjPrN2REpmDpPd8ZnvL+lEeOfqHCfQwHTd6zu1eYU0I
 yR2kNlGP1hYkeZRWcxzV2T+I85IosaVhrpByzs+UBHiBTPw/K1m33RPacif2x/akVLUX
 GQL4wi/7sA4xBLqyuB5ou+PhPuWvhurQTx9bsWWFfsLiftz3SANIorJLOXOoSZwIIT2H Fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpub81c6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 19:08:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DJ8Peh016003
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 19:08:25 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 12:08:19 -0700
Date:   Fri, 14 Jul 2023 00:38:16 +0530
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        <g@akhilpo-linux.qualcomm.com>
CC:     <liviu.dudau@arm.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
        <sam@ravnborg.org>, <quic_eberman@quicinc.com>,
        <a39.skl@gmail.com>, <quic_gurus@quicinc.com>,
        <angelogioacchino.delregno@somainline.org>,
        <james.qian.wang@arm.com>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
Message-ID: <gk5ttqzmz6psggq6xybpsmad63gimlwj6bsbpkhvqfd3htcddc@zveituq6siwa>
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-3-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713020556.1956639-3-cuigaosheng1@huawei.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XM25HRTeJyR88ftCR6A1GDGFl-zepvyU
X-Proofpoint-GUID: XM25HRTeJyR88ftCR6A1GDGFl-zepvyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_08,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307130169
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 13, 2023 at 10:05:55AM +0800, Gaosheng Cui wrote:
> 
> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a99310b68793..a499e3b350fc 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>  			 * since we've already mapped it once in
>  			 * submit_reloc()
>  			 */
> -			if (WARN_ON(!ptr))
> +			if (WARN_ON(IS_ERR(ptr)))
nit: can we make this IS_ERR_OR_NULL() check to retain the current
validation? A null is catastrophic here. Yeah, I see that the current
implementation of ...get_vaddr() doesn't return a NULL.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

>  				return;
>  
>  			for (i = 0; i < dwords; i++) {
> -- 
> 2.25.1
> 
