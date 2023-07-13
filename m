Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F995752B18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 21:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjGMTkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 15:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbjGMTkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 15:40:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715D6271F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 12:40:16 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DIjVOu004450;
        Thu, 13 Jul 2023 19:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=jt3RhznHwuPHljelU3LuQE6YZCsogGmreeQYaKkdCpw=;
 b=cdfLuyiKEvcj32OQZIwqdqCWcmFjLVhwGiyqScuhg6tfAn8mw7gufTyiZS06/rkrqKmg
 cgmUVeHDlmyMtI7+CkV8w3R8GvogBq1VZqYOsCcNOh0Zj4L9MO1YH62scWdhY8+z/86D
 Ax4+bROsN8lJ0+Pjs/59OR3irVj+P3ywS0GwHEHs9TRgT3m4V//k37VhMCUdBrjfqpT6
 Gf+y/kpGB1vZhYYQZkvbYCZgmnk9jn6Twy50jQV7QUrXKj33xqKEXGznt40fQE68OMs6
 WguRh8ax7rN8NloBSxtXQPahtpQSWw9au0AfnyLlEm7Y/onn1RcjGow2+G3OpLZXiCvf EA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpts03h5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 19:40:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DJeCZl023395
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 19:40:12 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 13 Jul 2023 12:40:10 -0700
Date:   Fri, 14 Jul 2023 01:10:07 +0530
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Fix misleading comment
Message-ID: <zl2agkz6rcdvocmgiyszege7evbdcboz65u3w2gypizzdqdixi@ellnjfax5qrg>
References: <20230630162043.79198-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230630162043.79198-1-robdclark@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4jsYCokDZTRxuSgom5UlsU-rVkdzNtp1
X-Proofpoint-ORIG-GUID: 4jsYCokDZTRxuSgom5UlsU-rVkdzNtp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_08,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=861
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307130173
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 30, 2023 at 09:20:43AM -0700, Rob Clark wrote:
> 
> From: Rob Clark <robdclark@chromium.org>
> 
> The range is actually len+1.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eea2e60ce3b7..edf76a4b16bd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -39,8 +39,8 @@ struct a6xx_gpu {
>  
>  /*
>   * Given a register and a count, return a value to program into
> - * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
> - * registers starting at _reg.
> + * REG_CP_PROTECT_REG(n) - this will block both reads and writes for
> + * _len + 1 registers starting at _reg.
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>  	((1 << 31) | \
> -- 
> 2.41.0
> 
