Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D11816710DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjARCKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjARCKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:10:23 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FE33F288
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:10:22 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I1ijNH016896;
        Wed, 18 Jan 2023 02:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uz/iD/DAeQQi6vcAGZ+LaO5mTb5qfAm1AU7+FN230yQ=;
 b=iN//7yWsCGMizzHEsqz4PajdFc2Avqd1RSO1ML5YolBvwTdPUHz4QTWfwY/dg5D4sb2t
 ugkt+K84y8dbzmYCs88IXSwPwamajXpbUn16DkMo10i936J2TUe87b9QPdIcU3I8P830
 9gWuEIPG0N7n7kawI2dhpG31enBwSV9cxy4asX+bfLFrK53WnDMB/7Ue54MIyERfU16M
 zzkjTenyHXApHcDbqoIrELcjvPXNlWecBY9Ox1hkEa9yrWRsZzTk5/1ULVEtGbQ909Cm
 OfYuDZnjDkoU4opCQQlzc36JCjGNz8Uq7OgopPTIG2LB16RLVeJ6mOIJoiH2nROKc0EF JQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n602k0x4p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 02:10:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30I2AG7g013579
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Jan 2023 02:10:16 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 17 Jan
 2023 18:10:15 -0800
Message-ID: <4aca64ed-df8e-2f1e-a7b0-22e9603d28cc@quicinc.com>
Date:   Tue, 17 Jan 2023 18:10:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: add missing dpu_encoder kerneldoc
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230118020549.1690078-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230118020549.1690078-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X9SXq1CBFyEM_82q_nuniKyfviXSuVym
X-Proofpoint-GUID: X9SXq1CBFyEM_82q_nuniKyfviXSuVym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301180015
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/17/2023 6:05 PM, Dmitry Baryshkov wrote:
> Describe missing dpu_encoder_phys_wb_is_master() argument and struct
> dpu_encoder_virt.wide_bus_en field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d1a528ff0f28..758261e8ac73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -162,6 +162,7 @@ enum dpu_enc_rc_states {
>    * @vsync_event_work:		worker to handle vsync event for autorefresh
>    * @topology:                   topology of the display
>    * @idle_timeout:		idle timeout duration in milliseconds
> + * @wide_bus_en:		wide bus is enabled on this interface
>    * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
>    */
>   struct dpu_encoder_virt {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 95921efd8139..bac4aa807b4b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -26,6 +26,7 @@
>   
>   /**
>    * dpu_encoder_phys_wb_is_master - report wb always as master encoder
> + * @phys_enc:	Pointer to physical encoder
>    */
>   static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys *phys_enc)
>   {
