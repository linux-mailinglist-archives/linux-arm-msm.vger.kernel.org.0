Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336C57587E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 00:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjGRWBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 18:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjGRWA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 18:00:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702C6198D
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 15:00:58 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36IM001t022216;
        Tue, 18 Jul 2023 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ymgd4/Bkgc7xtsP6rTTr4IPWNwHMeiTT1MxkMjb0zk4=;
 b=Zbo1b7yuDua5f52VhZaWotK7jfjuPZsk/ful4w/GCv6q2ePWbMfBtYMpmV3PoX74AHcI
 R9k17kfzZz3fLTYzHelbZLsYABURTZFJPL7GVz4yuADhtkoitLCm6Fq4jSnNFE/OltA1
 shgkKkfGfhHOnLW68uzF52d+g53xejxTj6WykE+TAmcFt7ER4jKefLnvFrP5UDmv8CU0
 kej07sQUYS/7l85LxSSmvX8qJ4SQLaEGV2lteYALz/FFYV+c0ttLd2vZXE4OSG23dHhP
 Uhe7+fbt7IjqbyszQtg0xFDKn59N3+lnno4EeSipESIMoj9ycWUDVc/OERuPz0rKU3Q5 ew== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwnrrhwgd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Jul 2023 22:00:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36IM0hKD002020
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Jul 2023 22:00:43 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 15:00:39 -0700
Message-ID: <c2d27415-f93b-e2db-fdbe-20c43120c4bb@quicinc.com>
Date:   Tue, 18 Jul 2023 15:00:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-3-dmitry.baryshkov@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hZpSseyhgr00jQUYaJjfhXnI_QN2Hk9v
X-Proofpoint-ORIG-GUID: hZpSseyhgr00jQUYaJjfhXnI_QN2Hk9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_17,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307180199
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
> the value is NULL, then the function will return 0 instead of a proper
> return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
> dpu_hw_intr_init() error check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e7ac02e92f42..85b8c9cc99ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	}
>   
>   	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> -	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
> +	if (IS_ERR(dpu_kms->hw_intr)) {
>   		rc = PTR_ERR(dpu_kms->hw_intr);
>   		DPU_ERROR("hw_intr init failed: %d\n", rc);
>   		dpu_kms->hw_intr = NULL;
> -- 
> 2.39.2
> 
