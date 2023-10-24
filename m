Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9C77D5B07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 21:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234903AbjJXTCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 15:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbjJXTCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 15:02:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC3610CB;
        Tue, 24 Oct 2023 12:02:35 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OIpZGt025550;
        Tue, 24 Oct 2023 19:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IeuYxMXjXXNfk7VdxjPKqFSawy4/s+8QUZE1IpwkpRI=;
 b=IA9zZU6z+2Wjw6VfpzIGjWc3WQ3sJDgwF9vLg0c6iCJPR8LGO5m+N1O/f5ZRRKbn2ZeW
 zeqUTyLjSaY8L/QvtjGTRt5dOVAu0YJ5A3SV9/tRGSo25ZtFFLJojOY4DmXANWpmete7
 3WZT6K2F5mvHEbSb1wqI5+Zd2StzHqN3ytD+fjibSshuM08JQi+KLTP5k1T4Klan+Obc
 fFWDrELMtn5qLuKZf8iqOqBeJEQQdRFGbmvPUso1ib1GAXNRE1Gowbb6o2MBZOasQRVc
 SNcfiTqjkNcf9yAGaXZHF1BzIvkRvdHxL7Cpjd2zsnyXFbW4ok6sbpSq9eqkLyEH0Dra tw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3twxn42qa3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 19:02:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OJ22De013547
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Oct 2023 19:02:02 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 24 Oct
 2023 12:02:01 -0700
Message-ID: <d003384d-3b4b-da05-f4b7-8497749fc843@quicinc.com>
Date:   Tue, 24 Oct 2023 12:01:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: Fix encoder CRC to account for CTM
 enablement
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Arnaud Vrac" <rawoul@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Jeykumar Sankaran" <quic_jeykumar@quicinc.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20231023221250.116500-1-robdclark@gmail.com>
 <CAA8EJpqVL5U7yaZsG5F=q7EFP1bsApySdjycywox6cZUd8JqdA@mail.gmail.com>
 <CAF6AEGvbKjHYU6qv4v3017DguEye23yMoYvTbEo=JZ+QW3=Atg@mail.gmail.com>
 <CAA8EJprRdezFBP=+aBinA-=tbTGWPcj-izOthA=cbehes0UYng@mail.gmail.com>
Content-Language: en-US
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprRdezFBP=+aBinA-=tbTGWPcj-izOthA=cbehes0UYng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dKGwiQsrGrzFtWGSS5bog8nPNvqqAorG
X-Proofpoint-ORIG-GUID: dKGwiQsrGrzFtWGSS5bog8nPNvqqAorG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_18,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240164
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/23/2023 4:03 PM, Dmitry Baryshkov wrote:
> On Tue, 24 Oct 2023 at 01:36, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Mon, Oct 23, 2023 at 3:30 PM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On Tue, 24 Oct 2023 at 01:12, Rob Clark <robdclark@gmail.com> wrote:
>>>>
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Seems like we need to pick INPUT_SEL=1 when CTM is enabled.  But not
>>>> otherwise.
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---

I cannot find anything in the docs which suggest this solution is correct.

Different blocks in the DPU pipeline have their own CRC (MISR) registers 
like LM, intf etc.

We dont need to change INPUT_SEL to tell DPU from which pipeline to take 
the CRC from as each of them have their own registers.

INPUT_SEL is controlling whether the CRC needs to be calculated over the 
entire display timings or only the active pixels. I am unable to tell at 
the moment why this is making a difference in this use-case.

Since I am unable to find any documentation proving this solution is 
correct so far, unfortunately I would hold this back till then.

We will investigate this issue and report our findings on this thread on 
how to proceed.

>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 3 ++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 5 ++++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 3 ++-
>>>>   8 files changed, 15 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index 2b83a13b3aa9..d93a92ffd5df 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -134,7 +134,7 @@ static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
>>>>          struct drm_encoder *drm_enc;
>>>>
>>>>          drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
>>>> -               dpu_encoder_setup_misr(drm_enc);
>>>> +               dpu_encoder_setup_misr(drm_enc, !!crtc->state->ctm);
>>>>   }
>>>>
>>>>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index b0a7908418ed..12ee7acb5ea6 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -241,7 +241,7 @@ int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
>>>>          return num_intf;
>>>>   }
>>>>
>>>> -void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
>>>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc, bool has_ctm)
>>>>   {
>>>>          struct dpu_encoder_virt *dpu_enc;
>>>>
>>>> @@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
>>>>                  if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
>>>>                          continue;
>>>>
>>>> -               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
>>>> +               phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1, has_ctm);
>>>>          }
>>>>   }
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> index 4c05fd5e9ed1..510783b2fb24 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> @@ -169,8 +169,9 @@ int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc);
>>>>   /**
>>>>    * dpu_encoder_setup_misr - enable misr calculations
>>>>    * @drm_enc:    Pointer to previously created drm encoder structure
>>>> + * @has_ctm:    Is CTM enabled
>>>>    */
>>>> -void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
>>>> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder, bool has_ctm);
>>>>
>>>>   /**
>>>>    * dpu_encoder_get_crc - get the crc value from interface blocks
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> index e8b8908d3e12..cb06f80cc671 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>>> @@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>>>>          return DPU_REG_READ(c, INTF_LINE_COUNT);
>>>>   }
>>>>
>>>> -static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
>>>> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count, bool has_ctm)
>>>>   {
>>>> -       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
>>>> +       dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, has_ctm);
>>>
>>> I'm not sure about the dpu_encoder and dpu_hw_intf interfaces. But
>>> dpu_hw_setup_misr definitely needs the `u8 input_sel` parameter
>>> instead of `bool has_ctm`.
>>
>> That seems a bit premature without knowing what the other values are.
>> (And I also question a bit the whole abstraction layer thing if it is
>> taking directly register bitfield enum's..)
> 
> dpu_hw_intf and especially dpu_hw_util are not real abstractions. I
> always viewed them as useful low-level helpers.
> 
> I think that has_ctm is valid at the dpu_encoder level, which selects
> which input to use. on the lower levels has_ctm doesn't make sense.
> IOW dpu_hw_setup_misr can be used to setup MISR for other blocks,
> where CTM doesn't exist.
> 
>>
>> BR,
>> -R
>>
>>> Most likely, I'd use u8 for dpu_hw_intf operation too.
>>>
>>> Could you please adjust?
>>>
>>>>   }
>>>>
>>>>   static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> index c539025c418b..95aafc4cf58e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>>> @@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
>>>>
>>>>          void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>>>>                          const enum dpu_pingpong pp);
>>>> -       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
>>>> +       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count, bool has_ctm);
>>>>          int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>>>>
>>>>          // Tearcheck on INTF since DPU 5.0.0
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>>>> index d1c3bd8379ea..2efe29396c6a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>>>> @@ -83,7 +83,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>>>>
>>>>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
>>>>   {
>>>> -       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
>>>> +       dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, false);
>>>>   }
>>>>
>>>>   static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>>>> index 9d2273fd2fed..528b8439209f 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
>>>> @@ -483,7 +483,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>>>>
>>>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>>>>                  u32 misr_ctrl_offset,
>>>> -               bool enable, u32 frame_count)
>>>> +               bool enable, u32 frame_count, bool has_ctm)
>>>>   {
>>>>          u32 config = 0;
>>>>
>>>> @@ -496,6 +496,9 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>>>>                  config = (frame_count & MISR_FRAME_COUNT_MASK) |
>>>>                          MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
>>>>
>>>> +               if (!has_ctm)
>>>> +                       config |= 1 << 24;
>>>
>>> Please define MISR_CTRL_INPUT_SEL instead.
>>>
>>>> +
>>>>                  DPU_REG_WRITE(c, misr_ctrl_offset, config);
>>>>          } else {
>>>>                  DPU_REG_WRITE(c, misr_ctrl_offset, 0);
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>>>> index 1f6079f47071..e42d9d00e40e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
>>>> @@ -360,7 +360,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
>>>>   void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
>>>>                  u32 misr_ctrl_offset,
>>>>                  bool enable,
>>>> -               u32 frame_count);
>>>> +               u32 frame_count,
>>>> +               bool has_ctm);
>>>>
>>>>   int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>>>>                  u32 misr_ctrl_offset,
>>>> --
>>>> 2.41.0
>>>>
>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 
