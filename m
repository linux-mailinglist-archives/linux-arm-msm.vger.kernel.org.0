Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F5D64BEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 22:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbiLMVlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 16:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236073AbiLMVlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 16:41:39 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9BB1A22B;
        Tue, 13 Dec 2022 13:41:38 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDJLxI2016987;
        Tue, 13 Dec 2022 21:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=k2/6D6zuaLaEhdAcOJZCvzbKiS3qV2h9Q/FlVs18pVI=;
 b=pJMfb0J1GpF34CQSo857Eoi6aTK0JRrkAeyAKjVek8+qGI5atkeEfTaxjBEoTebaF9uu
 YpW1YpF5WF/CjO2uLD+Ie5NDzv1QyL+7dOtqRUI6h9atZj9ZNxW07JrbAbQPVY13egy1
 iS2kPVoSnUpmTfuC4QuKAkuUAABVdT53ySCe8dodqjRfittY7NQOyeRP98WSCeu7As4i
 MWxDR+RGQD1nrUJ2Owhl96d3StxnP3uAtQa3NKBE4Kym2vU7jB7LCjeAdNWAN3q4OzDw
 jhdLIHhrDsINDAkRPe9+XhHyqBuFr6IUMTTk35VUWKMw2dVnhvDFJrdCMGp6skgALS9H wA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3meyfx0cpx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Dec 2022 21:41:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BDLfSLS027033
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Dec 2022 21:41:28 GMT
Received: from [10.111.167.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 13 Dec
 2022 13:41:26 -0800
Message-ID: <2e878a04-e86a-35d3-546d-34e4c1bafe19@quicinc.com>
Date:   Tue, 13 Dec 2022 13:41:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: check for null return of devm_kzalloc() in
 dpu_writeback_init()
Content-Language: en-US
To:     Hui Tang <tanghui20@huawei.com>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <yusongping@huawei.com>
References: <20221119055518.179937-1-tanghui20@huawei.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221119055518.179937-1-tanghui20@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZuqlS4FmkMU5Mmlzw_Bd1mxRnoYF_9eM
X-Proofpoint-ORIG-GUID: ZuqlS4FmkMU5Mmlzw_Bd1mxRnoYF_9eM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=853 phishscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212130188
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/2022 9:55 PM, Hui Tang wrote:
> Because of the possilble failure of devm_kzalloc(), dpu_wb_conn might
> be NULL and will cause null pointer derefrence later.
derefrence --> dereference
> 
> Therefore, it might be better to check it and directly return -ENOMEM.
> 
> Fixes: 77b001acdcfe ("drm/msm/dpu: add the writeback connector layer")
> Signed-off-by: Hui Tang <tanghui20@huawei.com>

With that nit fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 088ec990a2f2..2a5a68366582 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -70,6 +70,8 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>   	int rc = 0;
>   
>   	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
> +	if (!dpu_wb_conn)
> +		return -ENOMEM;
>   
>   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>   
