Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7C876E53F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 23:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjDQVgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 17:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjDQVgp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 17:36:45 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F40D4C28
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 14:36:44 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HKeClM006420;
        Mon, 17 Apr 2023 21:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HNYfTE8aedu25aVlQ+Eoy8AaUtqm6feQUuUGK0VrZao=;
 b=QflANhaVHw4FvSnUxV391nIDXto554eYJN+1eohlPWwwLFyqHKqlbP1KpGPk2emVUr2v
 ounXxXmNFhhsSX54qw4nTgRKgB3PyJrxyJHv5EaFAuLIHQL6h4q5h7adI+NJP8+15UbT
 IwY3P0WDN4+5lEy87OdT2k3FC5fnH7b89OpcH+NSvF1IxZFWNh38bQj/H3swEL6goAee
 GhLtnvF7Gl/ujHwF6OlsMHqlo9Bsz0AEX+41oY3tsoaws2y22FxQahmCdKbPJpDdoLoN
 NeyJX0khR3NJGTdUefbJTxP9JU9IhgL1CKaVjffOl24vTLjc35lgXfRBiH1aGN1rKUk4 0Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q11fe1xr0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 21:36:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HLaapp023299
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 21:36:36 GMT
Received: from [10.110.98.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 17 Apr
 2023 14:36:35 -0700
Message-ID: <c218138c-d82c-502c-1a40-26f06d7800e4@quicinc.com>
Date:   Mon, 17 Apr 2023 14:36:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/msm/dpu: add HDMI output support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
 <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pHT4GeNdE4o_oueO5p3wjFxZAFXvci0k
X-Proofpoint-ORIG-GUID: pHT4GeNdE4o_oueO5p3wjFxZAFXvci0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_14,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=930 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170191
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/15/2023 10:19 AM, Dmitry Baryshkov wrote:
> MSM8998 and the older Qualcomm platforms support HDMI outputs. Now as
> DPU encoder is ready, add support for using INTF_HDMI.
> 

 From what I see, encoder was always ready but just HDMI case was not 
handled? Or are you saying this because of the prev patch which sorts 
out encoder_type and intf_type

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 45 +++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e85e3721d2c7..65cce59163a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -617,6 +617,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   	return 0;
>   }
>   
> +static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
> +				    struct msm_drm_private *priv,
> +				    struct dpu_kms *dpu_kms)
> +{
> +	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
> +	int rc;
> +	int i;
> +
> +	if (!priv->hdmi)
> +		return 0;
> +
> +	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
> +	if (IS_ERR(encoder)) {
> +		DPU_ERROR("encoder init failed for HDMI display\n");
> +		return PTR_ERR(encoder);
> +	}
> +
> +	memset(&info, 0, sizeof(info));
> +	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
> +	if (rc) {
> +		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> +		drm_encoder_cleanup(encoder);
> +		return rc;
> +	}
> +
> +	info.num_of_h_tiles = 1;
> +	info.h_tile_instance[0] = i;

As Arnaud noted, i is uninitialized here.

> +	info.intf_type = INTF_HDMI;
> +	rc = dpu_encoder_setup(dev, encoder, &info);
> +	if (rc) {
> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +			  encoder->base.id, rc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
>   static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>   		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
>   		const u32 *wb_formats, int n_formats)
> @@ -683,6 +722,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>   		return rc;
>   	}
>   
> +	rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
> +	if (rc) {
> +		DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
> +		return rc;
> +	}
> +
>   	/* Since WB isn't a driver check the catalog before initializing */
>   	if (dpu_kms->catalog->wb_count) {
>   		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
