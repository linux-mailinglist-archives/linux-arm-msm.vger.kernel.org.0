Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B117C414B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 22:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343548AbjJJUdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 16:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbjJJUdo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 16:33:44 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0E88E
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 13:33:41 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39AJEiiX023735;
        Tue, 10 Oct 2023 20:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GHaZIVIqG6K8ykZWHu6M9XGVryCtjw9sgFuB8ukaUiI=;
 b=Ezy7YT5Z5vG3/cYAe/+kSjSRHNxjaFMts7YgMaB/JDsDrvx0DK9YOXjjOdv5aDGch4A+
 l3tU4wZCdYTV8O/seB9N4s5CN1OfUewHS+ojGJn02hewA+JQCSRoySts02RbcMv5zDXB
 qfmBdJUIr5HW5K4or7+axTot/v2Rz2dCzoHbarl/yIW97udzlw/o9xQfJ/op7I4Y/MeZ
 Z5Sbb7okrdzvwVcBaZKDbridPUYq4Qh09KKzgESE+GQlPC6T9wC/cvYTlo8YbwS1+/e1
 E+5gAhjg3SDCX6xsAfsxcdwstW+uP/fPUXd3KhUw+j4E09oAPEW9tP6BLCLQdK2l1WJN ew== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tn492sgeg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Oct 2023 20:33:21 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39AKXKgO005161
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Oct 2023 20:33:20 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 10 Oct
 2023 13:33:19 -0700
Message-ID: <c35813b4-a486-43e3-917b-44e13b8be968@quicinc.com>
Date:   Tue, 10 Oct 2023 13:33:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
To:     <neil.armstrong@linaro.org>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <marijn.suijten@somainline.org>, <sam@ravnborg.org>,
        <daniel@ffwll.ch>, <airlied@gmail.com>
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
 <b1626143-747f-41b1-9b7b-18a2d4f9ffc4@linaro.org>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <b1626143-747f-41b1-9b7b-18a2d4f9ffc4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kvYFuldzzRNXr6Fmiw0cQoEcER3c8mIs
X-Proofpoint-ORIG-GUID: kvYFuldzzRNXr6Fmiw0cQoEcER3c8mIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_16,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100159
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/9/2023 3:32 AM, neil.armstrong@linaro.org wrote:
> Hi Paloma,
> 
> On 28/07/2023 03:26, Paloma Arellano wrote:
>> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
>> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
>> to command mode with DSC enabled.
>>
>> Note: This patch has only been validated DSC over command mode as DSC 
>> over
>> video mode has never been validated for the MSM driver before.
> 
> I was able to test this on the QRD8550 on top of v6.6-rc5, display works 
> fine,
> but when runnning:
> # modetest -r -v
> <snip>
> setting mode 1080x2400-144.00Hz on connectors 32, crtc 95
> failed to set gamma: Function not implemented
> freq: 74.22Hz
> freq: 73.09Hz
> freq: 72.48Hz
> 
> We get a correct 144Hz vsync test in video mode.
> 
> Do you know why this happens ?

Hi Neil,

Thanks for reporting this.

FWIW, I saw a slight drop in FPS (from 120 to 90Hz) when enabling DSC 
for the r66451 command mode panel though the drop reported here seems 
more drastic.

I'll try recreating this on SM8550 MTP and investigate it.

Thanks,

Jessica Zhang

> 
> Neil
> 
>>
>> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>>
>> Changes since v1:
>>   - Changed from email address
>>
>> [1] https://patchwork.freedesktop.org/series/121337/
>>
>> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>>   1 file changed, 73 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> index e1363e128e7e..5658d39a3a6b 100644
>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/of.h>
>>   #include <drm/display/drm_dsc.h>
>> +#include <drm/display/drm_dsc_helper.h>
>>   #include <drm/drm_mipi_dsi.h>
>>   #include <drm/drm_modes.h>
>>   #include <drm/drm_panel.h>
>> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>>       struct mipi_dsi_device *dsi;
>>       struct gpio_desc *reset_gpio;
>>       struct regulator_bulk_data supplies[3];
>> -    bool prepared;
>> +    bool prepared, enabled;
>> +    bool video_mode;
>>   };
>>   static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct 
>> drm_panel *panel)
>> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct 
>> visionox_vtdr6130 *ctx)
>>       if (ret)
>>           return ret;
>> +    mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>>       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>>       mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 
>> 0x00, 0x00);
>>       mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>>       mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>>       mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
>> -    mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>> +
>> +    if (ctx->video_mode)
>> +        mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>> +    else
>> +        mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
>> +
>>       mipi_dsi_dcs_write_seq(dsi, 0x70,
>>                      0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 
>> 0x04,
>>                      0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 
>> 0x00,
>> @@ -214,6 +222,42 @@ static const struct drm_display_mode 
>> visionox_vtdr6130_mode = {
>>       .height_mm = 157,
>>   };
>> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
>> +{
>> +    struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>> +    struct drm_dsc_picture_parameter_set pps;
>> +    int ret;
>> +
>> +    if (ctx->enabled)
>> +        return 0;
>> +
>> +    if (!dsi->dsc) {
>> +        dev_err(&dsi->dev, "DSC not attached to DSI\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>> +    ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>> +    if (ret) {
>> +        dev_err(&dsi->dev, "Failed to set PPS\n");
>> +        return ret;
>> +    }
>> +
>> +    ctx->enabled = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
>> +{
>> +    struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>> +
>> +    ctx->enabled = false;
>> +
>> +    return 0;
>> +}
>> +
>>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>>                          struct drm_connector *connector)
>>   {
>> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs 
>> visionox_vtdr6130_panel_funcs = {
>>       .prepare = visionox_vtdr6130_prepare,
>>       .unprepare = visionox_vtdr6130_unprepare,
>>       .get_modes = visionox_vtdr6130_get_modes,
>> +    .enable = visionox_vtdr6130_enable,
>> +    .disable = visionox_vtdr6130_disable,
>>   };
>>   static int visionox_vtdr6130_bl_update_status(struct 
>> backlight_device *bl)
>> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct 
>> mipi_dsi_device *dsi)
>>   {
>>       struct device *dev = &dsi->dev;
>>       struct visionox_vtdr6130 *ctx;
>> +    struct drm_dsc_config *dsc;
>>       int ret;
>>       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>       if (!ctx)
>>           return -ENOMEM;
>> +
>> +    ctx->video_mode = of_property_read_bool(dev->of_node, 
>> "enforce-video-mode");
>> +
>> +    dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>> +    if (!dsc)
>> +        return -ENOMEM;
>> +
>> +    /* Set DSC params */
>> +    dsc->dsc_version_major = 0x1;
>> +    dsc->dsc_version_minor = 0x2;
>> +
>> +    dsc->slice_height = 40;
>> +    dsc->slice_width = 540;
>> +    dsc->slice_count = 2;
>> +    dsc->bits_per_component = 8;
>> +    dsc->bits_per_pixel = 8 << 4;
>> +    dsc->block_pred_enable = true;
>> +
>> +    dsi->dsc = dsc;
>>       ctx->supplies[0].supply = "vddio";
>>       ctx->supplies[1].supply = "vci";
>> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct 
>> mipi_dsi_device *dsi)
>>       dsi->lanes = 4;
>>       dsi->format = MIPI_DSI_FMT_RGB888;
>> -    dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>> MIPI_DSI_MODE_NO_EOT_PACKET |
>> -              MIPI_DSI_CLOCK_NON_CONTINUOUS;
>> +
>> +    dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | 
>> MIPI_DSI_CLOCK_NON_CONTINUOUS;
>> +    if (ctx->video_mode)
>> +        dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
>> +
>>       ctx->panel.prepare_prev_first = true;
>>       drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
> 
