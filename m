Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B9C76BEA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 22:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbjHAUnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 16:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjHAUnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 16:43:18 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40BF1982
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 13:43:16 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371IIJNT005795;
        Tue, 1 Aug 2023 20:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=L6kPG1+o2fiU+711/43TvD4B4n6PxNGDgxz+f+Bzr3Q=;
 b=MHTGGVrxs5W+qeKGZCAD+MZdDGRYpz6G0LyE8XUnIYvkL+xIh8JRgk3SlEdyz8Gvp2Hu
 WoeZu3DGX89+Y+5ZM6pFisLZpWvVmJbl5ipWw4TQFJRvmakzI+EIDBWbpopCZVrWMS/p
 0oh0d7zpdFn6i9esIb13x3CLRbYDtsJzCF6mJjt+MtIDZCYhtPhpZthUR9oId7jW2+c+
 a0YqZzx11GByW4lzB30WFen/V8yb5tTcNRX5h4pAAsaSLjGYjdXhvWbOvI+ndwZ/KdY9
 IvFTE79bFipoguWJDuD2czTQLKK7tKfUn3lr7EXdFIg72qqkslMvYJAyfMJYZVp/erVN 7w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s6rhat971-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Aug 2023 20:43:02 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 371Kh1Cg003438
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 1 Aug 2023 20:43:01 GMT
Received: from [10.71.108.114] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 1 Aug
 2023 13:43:00 -0700
Message-ID: <f987a4e2-b461-7dad-c435-3cd10b341c2f@quicinc.com>
Date:   Tue, 1 Aug 2023 13:43:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-US
To:     <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <sam@ravnborg.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <marijn.suijten@somainline.org>
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
 <CAA8EJpqPgzd4ZSP948MQW=f4EVBHxajj4nwYq5s-OConBP7Vvg@mail.gmail.com>
 <a03e4ec2-0516-7d4c-180f-e0916c83373b@quicinc.com>
 <70875c10-9f9d-a084-d0f0-aaf80f56cb1e@linaro.org>
From:   Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <70875c10-9f9d-a084-d0f0-aaf80f56cb1e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 81p7rl9keaDf9md2F9mBeDA_PjgOkaZO
X-Proofpoint-ORIG-GUID: 81p7rl9keaDf9md2F9mBeDA_PjgOkaZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_18,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308010185
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/1/2023 1:26 AM, neil.armstrong@linaro.org wrote:
> On 28/07/2023 23:44, Jessica Zhang wrote:
>>
>>
>> On 7/28/2023 2:37 AM, Dmitry Baryshkov wrote:
>>> On Fri, 28 Jul 2023 at 04:26, Paloma Arellano 
>>> <quic_parellan@quicinc.com> wrote:
>>>>
>>>> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 
>>>> Visionox
>>>> VTDR6130 AMOLED DSI panel. In addition, this patch will set the 
>>>> default
>>>> to command mode with DSC enabled.
>>>>
>>>> Note: This patch has only been validated DSC over command mode as 
>>>> DSC over
>>>> video mode has never been validated for the MSM driver before.
>>>>
>>>> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
>>>>
>>>> Changes since v1:
>>>>   - Changed from email address
>>>>
>>>> [1] https://patchwork.freedesktop.org/series/121337/
>>>>
>>>> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 
>>>> ++++++++++++++++++-
>>>>   1 file changed, 73 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c 
>>>> b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>> index e1363e128e7e..5658d39a3a6b 100644
>>>> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
>>>> @@ -9,6 +9,7 @@
>>>>   #include <linux/of.h>
>>>>
>>>>   #include <drm/display/drm_dsc.h>
>>>> +#include <drm/display/drm_dsc_helper.h>
>>>>   #include <drm/drm_mipi_dsi.h>
>>>>   #include <drm/drm_modes.h>
>>>>   #include <drm/drm_panel.h>
>>>> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>>>>          struct mipi_dsi_device *dsi;
>>>>          struct gpio_desc *reset_gpio;
>>>>          struct regulator_bulk_data supplies[3];
>>>> -       bool prepared;
>>>> +       bool prepared, enabled;
>>>> +       bool video_mode;
>>>>   };
>>>>
>>>>   static inline struct visionox_vtdr6130 
>>>> *to_visionox_vtdr6130(struct drm_panel *panel)
>>>> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct 
>>>> visionox_vtdr6130 *ctx)
>>>>          if (ret)
>>>>                  return ret;
>>>>
>>>> +       mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>>>>          mipi_dsi_dcs_write_seq(dsi, 
>>>> MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>>>>          mipi_dsi_dcs_write_seq(dsi, 
>>>> MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>>>>          mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>>>>          mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>>>>          mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
>>>> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>>> +
>>>> +       if (ctx->video_mode)
>>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
>>>> +       else
>>>> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
>>>> +
>>>>          mipi_dsi_dcs_write_seq(dsi, 0x70,
>>>>                                 0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 
>>>> 0x09, 0x60, 0x04,
>>>>                                 0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 
>>>> 0x1c, 0x02, 0x00,
>>>> @@ -214,6 +222,42 @@ static const struct drm_display_mode 
>>>> visionox_vtdr6130_mode = {
>>>>          .height_mm = 157,
>>>>   };
>>>>
>>>> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
>>>> +{
>>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>>>> +       struct drm_dsc_picture_parameter_set pps;
>>>> +       int ret;
>>>> +
>>>> +       if (ctx->enabled)
>>>> +               return 0;
>>>> +
>>>> +       if (!dsi->dsc) {
>>>> +               dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>>> +               return -ENODEV;
>>>> +       }
>>>
>>> The error message is misleading. Also, if you don't want to enable DSC
>>> for the video mode, this will break.
>>>
>>>> +
>>>> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>>> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>>> +       if (ret) {
>>>> +               dev_err(&dsi->dev, "Failed to set PPS\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       ctx->enabled = true;
>>>
>>> Do we need this refcount just for PPS upload? What will happen if PPS
>>> is uploaded several times?
>>>
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
>>>> +{
>>>> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>>>> +
>>>> +       ctx->enabled = false;
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>>>>                                         struct drm_connector 
>>>> *connector)
>>>>   {
>>>> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs 
>>>> visionox_vtdr6130_panel_funcs = {
>>>>          .prepare = visionox_vtdr6130_prepare,
>>>>          .unprepare = visionox_vtdr6130_unprepare,
>>>>          .get_modes = visionox_vtdr6130_get_modes,
>>>> +       .enable = visionox_vtdr6130_enable,
>>>> +       .disable = visionox_vtdr6130_disable,
>>>>   };
>>>>
>>>>   static int visionox_vtdr6130_bl_update_status(struct 
>>>> backlight_device *bl)
>>>> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct 
>>>> mipi_dsi_device *dsi)
>>>>   {
>>>>          struct device *dev = &dsi->dev;
>>>>          struct visionox_vtdr6130 *ctx;
>>>> +       struct drm_dsc_config *dsc;
>>>>          int ret;
>>>>
>>>>          ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>>>>          if (!ctx)
>>>>                  return -ENOMEM;
>>>> +
>>>> +       ctx->video_mode = of_property_read_bool(dev->of_node, 
>>>> "enforce-video-mode");
>>>
>>> Please also add a DT bindings patch.
>>>
>>>> +
>>>> +       dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
>>>> +       if (!dsc)
>>>> +               return -ENOMEM;
>>>
>>> You can add struct drm_dsc_config to struct visionox_vtdr6130 instead
>>> of allocating it.
>>>
>>>> +
>>>> +       /* Set DSC params */
>>>> +       dsc->dsc_version_major = 0x1;
>>>> +       dsc->dsc_version_minor = 0x2;
>>>> +
>>>> +       dsc->slice_height = 40;
>>>> +       dsc->slice_width = 540;
>>>> +       dsc->slice_count = 2;
>>>> +       dsc->bits_per_component = 8;
>>>> +       dsc->bits_per_pixel = 8 << 4;
>>>> +       dsc->block_pred_enable = true;
>>>> +
>>>> +       dsi->dsc = dsc;
>>>
>>> Only in command mode?
>>
>> Hi Dmitry,
>>
>> The intention of the patch wasn't to enable DSC for only command mode.
>>
>> We didn't want to limit DSC to only command mode because, while the 
>> MSM DPU driver isn't able to validate DSC on video mode, other 
>> vendors might have already validated DSC on video mode and would 
>> benefit from this patch.
>>
>> FWIW, inital driver commit [1] notes that the panel is meant to work 
>> with compressed streams in general and DSC support was tob be added 
>> later on.
>
> The panel supports Video, Video+DSC, CMD, CMD+DSC, so it would be 
> great to be able to
> select any of the supported modes, including the non-compressed ones.
>
> So enforce-video-mode is great, but an enforce-uncompressed-mode would 
> be necessary
> aswell.
>
> Neil

Hi Neil,

Are you suggesting to add a new binding to handle the 
'enforce-uncompressed-mode'?

-Paloma

>
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>> [1] https://patchwork.freedesktop.org/patch/517483/?series=112369&rev=2
>>
>>>
>>>>
>>>>          ctx->supplies[0].supply = "vddio";
>>>>          ctx->supplies[1].supply = "vci";
>>>> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct 
>>>> mipi_dsi_device *dsi)
>>>>
>>>>          dsi->lanes = 4;
>>>>          dsi->format = MIPI_DSI_FMT_RGB888;
>>>> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | 
>>>> MIPI_DSI_MODE_NO_EOT_PACKET |
>>>> -                         MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>> +
>>>> +       dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | 
>>>> MIPI_DSI_CLOCK_NON_CONTINUOUS;
>>>
>>> Keep the line split please.
>>>
>>>> +       if (ctx->video_mode)
>>>> +               dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
>>>> +
>>>>          ctx->panel.prepare_prev_first = true;
>>>>
>>>>          drm_panel_init(&ctx->panel, dev, 
>>>> &visionox_vtdr6130_panel_funcs,
>>>> -- 
>>>> 2.41.0
>>>>
>>>
>>>
>>> -- 
>>> With best wishes
>>> Dmitry
>
