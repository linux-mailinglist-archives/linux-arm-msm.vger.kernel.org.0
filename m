Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D033975863E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 22:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjGRUpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 16:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjGRUpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 16:45:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B916C199D;
        Tue, 18 Jul 2023 13:45:16 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36IKOvkC021330;
        Tue, 18 Jul 2023 20:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mlqbt5WZNsb+wOntEByMuNPDh5jufZg/txOT85LUM7Q=;
 b=MCGXNZEeBLQZsYFI0kda57hiQ195Zwpj2cU4rH4R9rGOvHBo6voVMGTbwAk0S34m0l9z
 4/WSGTv758bNMi6KhhlBnUdYqf9X6fuoGKvhCMJBCo9QinMM9mwBeU/PA3x0llnPInmL
 4d/2NIKQEo9YeMZ3UOlsOHXJsuFosqpHovc7vPDgCWe6MPgCQqV//wOwUu1exPwsfJLI
 wLagOEaiZmJNQqwMGpGpu04Xdlp8mE65FDmFEL6sdo773DAy0Ld/TyNSoFCkrPwlAzlp
 eXsh023ALcmWU1Rj0+C/E+WQ4dz7WyEabVtPENOIF4g+d42v18mX7Cjsp9h9epzSvqxy Pg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwnrrhtb0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Jul 2023 20:45:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36IKiT47005006
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Jul 2023 20:44:29 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 13:44:29 -0700
Message-ID: <b2b044f7-9ddd-1d68-4eae-d5670e70cc8c@quicinc.com>
Date:   Tue, 18 Jul 2023 13:44:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <freedreno@lists.freedesktop.org>, <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
References: <20230713-add-widebus-support-v2-1-ad0added17b6@quicinc.com>
 <91bc6348-2030-85dd-1492-1609b392793f@linaro.org>
 <05996344-0e43-7f37-c99a-42c04f91dc83@quicinc.com>
 <CAA8EJppFDcrVdegskSD0TJPOdSzVw_50+Bq+u8LKn26jdKE=tw@mail.gmail.com>
 <19ff3766-a73e-761d-8965-015817fa9c0c@quicinc.com>
 <637e4979-cadc-2167-a14f-25363c9da990@linaro.org>
 <2804b7c7-0ed2-6490-3316-7a38eb1262f8@quicinc.com>
 <d7b93f39-e866-899b-578f-17f7bdd5bdd5@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <d7b93f39-e866-899b-578f-17f7bdd5bdd5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d5-wcoMOhvVw9yXS6P0whJCaH8rQnsp4
X-Proofpoint-ORIG-GUID: d5-wcoMOhvVw9yXS6P0whJCaH8rQnsp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_15,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307180189
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/17/2023 11:04 PM, Dmitry Baryshkov wrote:
> On 18/07/2023 03:30, Jessica Zhang wrote:
>>
>>
>> On 7/14/2023 6:38 PM, Dmitry Baryshkov wrote:
>>> On 15/07/2023 03:59, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 7/14/2023 3:30 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, 14 Jul 2023 at 22:03, Jessica Zhang 
>>>>> <quic_jesszhan@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 7/13/2023 6:23 PM, Dmitry Baryshkov wrote:
>>>>>>> On 14/07/2023 03:21, Jessica Zhang wrote:
>>>>>>>> DSI 6G v2.5.x+ and DPU 7.x+ support a data-bus widen mode that 
>>>>>>>> allows DSI
>>>>>>>> to send 48 bits of compressed data per pclk instead of 24.
>>>>>>>>
>>>>>>>> For all chipsets that support this mode, enable it whenever DSC is
>>>>>>>> enabled as recommended by the hardware programming guide.
>>>>>>>>
>>>>>>>> Only enable this for command mode as we are currently unable to 
>>>>>>>> validate
>>>>>>>> it for video mode.
>>>>>>>>
>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>> ---
>>>>>>>> Note: The dsi.xml.h changes were generated using the headergen2 
>>>>>>>> script in
>>>>>>>> envytools [2], but the changes to the copyright and rules-ng-ng 
>>>>>>>> source
>>>>>>>> file
>>>>>>>> paths were dropped.
>>>>>>>
>>>>>>> Separate commit please, so that it can be replaced by headers 
>>>>>>> sync with
>>>>>>> Mesa3d.
>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> Acked.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> [1] https://patchwork.freedesktop.org/series/120580/
>>>>>>>> [2] https://github.com/freedreno/envytools/
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> Changes in v2:
>>>>>>>> - Rebased on top of "drm/msm/dpu: Re-introduce dpu core revision"
>>>>>>>> - Squashed all commits to avoid breaking feature if the series 
>>>>>>>> is only
>>>>>>>> partially applied
>>>>>>>
>>>>>>> No. Please unsquash it. Please design the series so that the patches
>>>>>>> work even if it is only partially applied.
>>>>>>
>>>>>> Acked.
>>>>>>
>>>>>>>
>>>>>>>> - Moved DATABUS_WIDEN bit setting to dsi_ctr_enable() (Marijn)
>>>>>>>> - Have DPU check if wide bus is requested by output driver (Dmitry)
>>>>>>>> - Introduced bytes_per_pclk variable for dsi_timing_setup() 
>>>>>>>> hdisplay
>>>>>>>> adjustment (Marijn)
>>>>>>>> - Link to v1:
>>>>>>>> https://lore.kernel.org/r/20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 
>>>>>>>> ++++++----
>>>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  4 +++-
>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  3 +++
>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>>>>>>>>    drivers/gpu/drm/msm/dsi/dsi.c                      |  5 +++++
>>>>>>>>    drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
>>>>>>>>    drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  1 +
>>>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c                 | 23
>>>>>>>> +++++++++++++++++++++-
>>>>>>>>    drivers/gpu/drm/msm/msm_drv.h                      |  6 ++++++
>>>>>>>>    9 files changed, 48 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> index f0a2a1dca741..6aed63c06c1d 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>> @@ -2411,6 +2411,7 @@ struct drm_encoder *dpu_encoder_init(struct
>>>>>>>> drm_device *dev,
>>>>>>>>        struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>>>>>>>        struct drm_encoder *drm_enc = NULL;
>>>>>>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>>>>>>> +    int index = disp_info->h_tile_instance[0];
>>>>>>>>        int ret = 0;
>>>>>>>>        dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), 
>>>>>>>> GFP_KERNEL);
>>>>>>>> @@ -2439,13 +2440,14 @@ struct drm_encoder *dpu_encoder_init(struct
>>>>>>>> drm_device *dev,
>>>>>>>>        timer_setup(&dpu_enc->frame_done_timer,
>>>>>>>>                dpu_encoder_frame_done_timeout, 0);
>>>>>>>> -    if (disp_info->intf_type == INTF_DSI)
>>>>>>>> +    if (disp_info->intf_type == INTF_DSI) {
>>>>>>>>            timer_setup(&dpu_enc->vsync_event_timer,
>>>>>>>>                    dpu_encoder_vsync_event_handler,
>>>>>>>
>>>>>>> While you are touching this part, could you please drop
>>>>>>> dpu_encoder_vsync_event_handler() and
>>>>>>> dpu_encoder_vsync_event_work_handler(), they are useless?
>>>>>>
>>>>>> Since these calls aren't related to widebus, I don't think I'll 
>>>>>> include
>>>>>> it in this series. However, I can post this cleanup as a separate 
>>>>>> patch
>>>>>> and add that as a dependency if that's ok.
>>>>>
>>>>> Sure, that will work for me. Thank you!
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>                    0);
>>>>>>>> -    else if (disp_info->intf_type == INTF_DP)
>>>>>>>> -        dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>>>>>>>> -                priv->dp[disp_info->h_tile_instance[0]]);
>>>>>>>> +        dpu_enc->wide_bus_en =
>>>>>>>> msm_dsi_is_widebus_enabled(priv->dsi[index]);
>>>>>>>> +    } else if (disp_info->intf_type == INTF_DP) {
>>>>>>>> +        dpu_enc->wide_bus_en =
>>>>>>>> msm_dp_wide_bus_available(priv->dp[index]);
>>>>>>>> +    }
>>>>>>>>        INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>>>>>>>>                dpu_encoder_off_work);
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>>>> index df88358e7037..dace6168be2d 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>>>>>> @@ -69,8 +69,10 @@ static void 
>>>>>>>> _dpu_encoder_phys_cmd_update_intf_cfg(
>>>>>>>>                    phys_enc->hw_intf,
>>>>>>>>                    phys_enc->hw_pp->idx);
>>>>>>>> -    if (intf_cfg.dsc != 0)
>>>>>>>> +    if (intf_cfg.dsc != 0) {
>>>>>>>>            cmd_mode_cfg.data_compress = true;
>>>>>>>> +        cmd_mode_cfg.wide_bus_en =
>>>>>>>> dpu_encoder_is_widebus_enabled(phys_enc->parent);
>>>>>>>> +    }
>>>>>>>>        if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
>>>>>>>>
>>>>>>>> phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf,
>>>>>>>> &cmd_mode_cfg);
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>> index 8ec6505d9e78..dc6f3febb574 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>>>>>> @@ -521,6 +521,9 @@ static void
>>>>>>>> dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>>>>>>>>        if (cmd_mode_cfg->data_compress)
>>>>>>>>            intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>>>>>>> +    if (cmd_mode_cfg->wide_bus_en)
>>>>>>>> +        intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>>>>>>> +
>>>>>>>>        DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>>>>>>>    }
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>>>> index 77f80531782b..c539025c418b 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>>>>>> @@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
>>>>>>>>    struct dpu_hw_intf_cmd_mode_cfg {
>>>>>>>>        u8 data_compress;    /* enable data compress between dpu 
>>>>>>>> and dsi */
>>>>>>>> +    u8 wide_bus_en;        /* enable databus widen mode */
>>>>>>>>    };
>>>>>>>>    /**
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>>>> index baab79ab6e74..e3cc06c94397 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>>>>>>> @@ -17,6 +17,11 @@ struct drm_dsc_config
>>>>>>>> *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>>>>>>>>        return msm_dsi_host_get_dsc_config(msm_dsi->host);
>>>>>>>>    }
>>>>>>>> +bool msm_dsi_is_widebus_enabled(struct msm_dsi *msm_dsi)
>>>>>>>> +{
>>>>>>>> +    return msm_dsi_host_is_widebus_supported(msm_dsi->host);
>>>>>>>
>>>>>>> This is incorrect. It will enable widebus even for non-DSC cases.
>>>>>>
>>>>>> FWIW, all calls for msm_dsi_is_widebus_enabled() and
>>>>>> msm_dsi_host_is_widebus_supported() are guarded by a DSC check.
>>>>>>
>>>>>> That being said, I also see your point that 
>>>>>> msm_dsi_is_widebus_enabled()
>>>>>> is an incorrect name since this will only check if widebus is 
>>>>>> supported.
>>>>>>
>>>>>> Maybe a better change would be to change 
>>>>>> msm_dsi_is_widebus_enabled to
>>>>>> *_is_widebus_supported(), move the setting of dpu_enc->wide_bus_en 
>>>>>> for
>>>>>> both DP and DSI to dpu_encoder_virt_atomic_enable(), then for DSI set
>>>>>> wide_bus_en = dpu_enc->dsc && dsi_is_widebus_supported().
>>>>>
>>>>> I think we should change msm_dp_wide_bus_available() to
>>>>> msm_dp_wide_bus_enabled(). We don't have a way to tell DP (or DSI) if
>>>>> widebus really should be enabled or not. So it would be better to make
>>>>> DP and DSI drivers provide is_widebus_enabled function.
>>>>
>>>> I think making changes to the DP API is outside the scope of this 
>>>> series since these changes are focused on supporting widebus for DSI 
>>>> specifically.
>>>
>>> Sure, the DP can be handled separately, if we agree on the API.
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>>>>>>>    {
>>>>>>>>        struct platform_device *pdev = msm_dsi->pdev;
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>>>> index bd3763a5d723..219a9f756759 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>>>>>>> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host
>>>>>>>> *msm_host, bool is_bonded_dsi);
>>>>>>>>    void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, 
>>>>>>>> struct
>>>>>>>> mipi_dsi_host *host);
>>>>>>>>    void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>>>>>>>>    struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct
>>>>>>>> mipi_dsi_host *host);
>>>>>>>> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host 
>>>>>>>> *host);
>>>>>>>>    /* dsi phy */
>>>>>>>>    struct msm_dsi_phy;
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>>>> index a4a154601114..2a7d980e12c3 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>>>>>>> @@ -664,6 +664,7 @@ static inline uint32_t
>>>>>>>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>>>>>>>>        return ((val) << 
>>>>>>>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) &
>>>>>>>> DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>>>>>>>>    }
>>>>>>>>    #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE            0x00010000
>>>>>>>> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN            0x00100000
>>>>>>>>    #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL            0x000001b8
>>>>>>>>    #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK 0x0000003f
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> index 645927214871..6ea3476acf0d 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>>> @@ -710,6 +710,14 @@ static void dsi_ctrl_disable(struct 
>>>>>>>> msm_dsi_host
>>>>>>>> *msm_host)
>>>>>>>>        dsi_write(msm_host, REG_DSI_CTRL, 0);
>>>>>>>>    }
>>>>>>>> +bool msm_dsi_host_is_widebus_supported(struct mipi_dsi_host *host)
>>>>>>>> +{
>>>>>>>> +    struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>>>>>> +
>>>>>>>> +    return msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>>>>>>>> +            msm_host->cfg_hnd->minor >= 
>>>>>>>> MSM_DSI_6G_VER_MINOR_V2_5_0;
>>>>>>>
>>>>>>> Would it be better to push it to the config data, like we did for 
>>>>>>> DP?
>>>>>>
>>>>>> I don't think so -- I think adding it to the config data as a feature
>>>>>> flag would bloat dsi_cfg.c. It would be simpler and cleaner (IMO) to
>>>>>> keep this as a version check.
>>>>>
>>>>> Ok.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>    static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>>>>>>>>                struct msm_dsi_phy_shared_timings 
>>>>>>>> *phy_shared_timings,
>>>>>>>> struct msm_dsi_phy *phy)
>>>>>>>>    {
>>>>>>>> @@ -757,6 +765,11 @@ static void dsi_ctrl_enable(struct 
>>>>>>>> msm_dsi_host
>>>>>>>> *msm_host,
>>>>>>>>                msm_host->cfg_hnd->minor >= 
>>>>>>>> MSM_DSI_6G_VER_MINOR_V1_3) {
>>>>>>>>                data = dsi_read(msm_host, 
>>>>>>>> REG_DSI_CMD_MODE_MDP_CTRL2);
>>>>>>>>                data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
>>>>>>>> +
>>>>>>>> +            /* TODO: Allow for video-mode support once 
>>>>>>>> tested/fixed */
>>>>>>>> +            if (msm_host->cfg_hnd->minor >=
>>>>>>>> MSM_DSI_6G_VER_MINOR_V2_5_0 && msm_host->dsc)
>>>>>>>
>>>>>>> msm_dsi_is_widebus_enabled() && msm_host->dsc
>>>>>>
>>>>>> *_is_widebus_enabled() also checks for major version >= 6G, so 
>>>>>> calling
>>>>>> it here would be a bit redundant as we're already checking for 
>>>>>> that earlier.
>>>>>
>>>>> However now you have different checks in two different places.
>>>>>
>>>>> My suggestion is to have the function msm_dsi_is_widebus_supported(),
>>>>> which the rest of the code uses to check if wide bus is actually
>>>>> enabled in the HW. If at some point DSI 2.11 drops wide bus support,
>>>>> I'd like to see a change at a single place, rather than having changes
>>>>> all over the code.
>>>>
>>>> Ok, I think this is a fair point. The main reason I just had the 
>>>> minor version check here was to avoid the redundant major version 
>>>> check from the BURST_MODE conditional [1].
>>>>
>>>> What if we just move the MDP_CTRL2 configuration to a separate 
>>>> function and do the BURST_MODE and DATABUS_WIDEN checks separately?
>>>
>>> I think that a function that just writes MDP_CTRL2 is an overkill. 
>>> Moving video / CMD setup to separate functions to be called from 
>>> dsi_ctrl_enable sounds like a better idea.
>>
>> Got it -- will have a separate mdp_ctrl2_config_cmd_mode() helper.
> 
> No. First, it's not MDP, it's DSI. And then I especially poited out that
> 'a function that just writes MDP_CTRL2' is an overkill.
> 
> So, if you want a separate helper, `dsi_ctrl_enable_cmd_mode()` sounds 
> better.

Acked.

> 
>>
>>>
>>>>
>>>> So, something like:
>>>>
>>>> ```
>>>> bool burst_supported()
>>>> {
>>>>      return major >= 6g && minor >= 1.3;
>>>> }
>>>>
>>>>
>>>> bool widebus_supported()
>>>> {
>>>>      return major >= 6g && minor >= 2.5;
>>>> }
>>>>
>>>>
>>>> void program_cmd_mdp_ctrl2()
>>>> {
>>>>      if (major < 6g)
>>>>          return;
>>>>
>>>>      data = read(mdp_ctrl2);
>>>>      if (burst_supported)
>>>>          data |= burst;
>>>>      if (widebus_supported)
>>>
>>> Two issues with this piece of code.
>>> First, you are splitting the 6g and minor checks. Please don't do 
>>> this. If might be obvious now, but it is better to keep full 
>>> condition in one place, even if it looks redundant to you. The 
>>> compiler will do its jobs and make sure that all expressions are 
>>> evaluated only once. And this is especially true for widebus, since 
>>> the driver checks this condition several times.
>>
>> The reason the major and minor checks are split here is because 
>> MDP_CTRL2 is only present in DSI 6G.
>>
>>>
>>> Second problem (which is quite specific to widebus): in this fragment 
>>> of code you say that if widebus is supported, it should be enabled. 
>>> But it is not true: we should not be enabling widebus if this is not 
>>> a DSC mode. So, I will be insisting on is_enabled() kind of function.
>>
>> I can add a DSC check here, but have some concerns about the 
>> *_is_enabled() function. Please refer to my response below.
>>
>>>
>>>>          data |= widebus;
>>>>
>>>>      write(mdp_ctrl2, data);
>>>> }
>>>>
>>>> void dsi_ctrl_enable()
>>>> {
>>>>
>>>>      ...
>>>>
>>>>      program_cmd_mdp_ctrl2();
>>>>
>>>>      ...
>>>> }
>>>>
>>>> ```
>>>>
>>>>>
>>>>> Likewise I'd like to have the function msm_dsi_is_widebus_enabled(),
>>>>> which is used by the rest of the code to check if the widebus should
>>>>> be actually enabled.
>>>>>
>>>>> Actually I think we can even drop the is_supported at all() and use
>>>>> the following code:
>>>>>
>>>>> bool msm_dsi_is_widebus_enabled()
>>>>> {
>>>>>     if (major < 6G || minor < V2_5_0)
>>>>>       return false;
>>>>>
>>>>>     return !!msm_host->dsc;
>>>>
>>>> I'd rather keep this API as *_is_widebus_supported() or 
>>>> *_is_widebus_available() (if you'd like it to match DP) and have the 
>>>> DSC check outside.
>>>>
>>>> This is because we already guard for DSC in DSI for the 
>>>> dsi_timing_setup() hdisplay adjustments and for the DPU hw_intf 
>>>> widebus register configuration. The only place where a DSC check 
>>>> needed to be added was for the MDP_CTRL2 configuration.
>>>>
>>>> So, since most places can already use preexisting DSC checks, having 
>>>> another DSC check within msm_dsi_is_widebus_enabled() would either 
>>>> be redundant or require extensive refactoring to justify adding the 
>>>> check here.
>>>
>>> As I wrote, I'd prefer using a single is_enabled() function all over 
>>> the code to optimizing / removing redundancy in C expressions. If for 
>>> some reason the HPG suggests enabling widebus for non-DSC modes (or 
>>> e.g. disabling it for yuv4:2:0 DSC), I do not want to have this check 
>>> scattered between different places (with a high likelyhood of missing 
>>> the most obvious place).
>>>
>>> This is the place where DSI differs from DP. For DP and widebus it 
>>> was really simple: available => enabled.
>>
>> Sorry if I didn't make this clear enough earlier, but I think the 
>> issue with having a single *_is_widebus_enabled() function is that it 
>> will cause redundant checks -- specifically in dsi_timing_setup() 
>> where the DSC hdisplay adjustment (that depends on widebus) is already 
>> wrapped in an `if (msm_host->dsc)` check. We'd either have to find a 
>> workaround to avoid having a redundant `if (dsc)` check, or do a minor 
>> version check for this instance.
> 
> Again, I don't have an issue with such kind of checks. Please don't try 
> to do the job of the compiler.

Acked.

> 
>>
>> In addition, *_is_widebus_enabled() would only work under the 
>> assumption that DSC (if supported) will always be enabled during 
>> bootup for DSI. If there ends up being support for a panel that allows 
>> for DSC to be enabled on the fly after bootup, the proposed 
>> *_is_widebus_enabled() check would break since the assumption that DSC 
>> is always enabled on bootup would not be true anymore.
> 
> Why is that going to break?


Currently, the msm_host->dsc is initialized in attach() [1] and we do 
widebus setup during power_on() [2]. So we can assume that if the panel 
supports DSC, msm_host->dsc will be not NULL during power_on() and the 
widebus setup will work as expected.

However, if a panel supports enabling DSC after bootup, then 
msm_host->dsc will be set later within the commit enable() path meaning 
the necessary widebus setup during power_on() would *not* happen (as 
*_is_widebus_enabled() would return false on account of msm_host->dsc == 
NULL during power_on()).

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L1587

[2] 
https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L2359

> 
> -- 
> With best wishes
> Dmitry
> 
