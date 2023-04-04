Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0725C6D6FF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 00:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235377AbjDDWMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 18:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjDDWMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 18:12:30 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6007EE
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 15:12:29 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334ErIKP019412;
        Tue, 4 Apr 2023 22:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uerbjAmfzgMPDUgUg2AEAzqKyg8+tW2n/LalK+Ace2M=;
 b=cUDHuqztN1QDHKEFLeYdaBAbDpt8tm/ytGjIg3FsxPDF8OT05QRCJeKZG/rcTyRQQ3rD
 7PUtohlyI4BOyPlfu4gQxvO7xmbXGUWDYCVEDd5XAfBON7uVNz5I1TUE0nljzBLRDgqM
 7RtSJ/VMbTMBtnqF8gjPfqT/ZZxy5mJsVQH2KgKoKE3Aza/5pSjUpbMlvUGPso6IlSuu
 hw8wIF9Fn7Eib/PlF+WG/ykiZ5CB8jriJti4ikkKoog7nMelaSfJ+tYUBcj9CxArQYlC
 m5Xua6q7tRS/63RyvHEPMhvX8ZtSqjWPm42cASZB5Jfn5JbQiYIc5pWVua4uG0KgKd/2 Eg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prmkmsdd8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 22:12:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334MCL8J006310
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Apr 2023 22:12:21 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 15:12:20 -0700
Message-ID: <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
Date:   Tue, 4 Apr 2023 15:12:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's
 ctl_0
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Lb6nFo2MIsJdzCdkHhhBuZ9zo49LfSaf
X-Proofpoint-ORIG-GUID: Lb6nFo2MIsJdzCdkHhhBuZ9zo49LfSaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040202
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
> so switch it to CTL_SC7280_MASK too.
> 
> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
> for SM8450") had all (relevant at that time) bit spelled individually.
> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
> despite being a mismerge, correctly changed all other CTL entries to use
> CTL_SC7280_MASK, except CTL_0.
> 

I think having it spelled individually is better. If we start using one 
chipset's mask for another, we are again going down the same path of 
this becoming one confused file.

So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to 
hw catalog") corrected the mask to re-use sc7280, with the individual 
catalog file, its better to have it separate and spelled individually.

This change is not heading in the direction of the rest of the series.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6840b22a4159..83f8f83e2b29 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   	{
>   	.name = "ctl_0", .id = CTL_0,
>   	.base = 0x15000, .len = 0x204,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	},
>   	{
