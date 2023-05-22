Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472E870C1A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 16:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjEVO7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 10:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233769AbjEVO7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 10:59:02 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7C7B9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:58:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so1249775e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684767524; x=1687359524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GB7XYhd2mlIH0fHMUAhimGnNPOH+S2GqRkVg6KqMpSs=;
        b=gPTggsTBERvcP+EXfapcNg3Im+HXfZaBAsfZou5V4jt90/bqnENtw1bbGYVIeHQyd0
         N6wQ4CN9n+IvlsUIFDXSqPAbwWfZ5KAUrtV7Q4eUdvFdpaUPrPzlQZm9rY2UHZ08vYVi
         EhCYxVKDHkgk3wft4zSgmjRkJBTST7DXgkSbzSmVS/L+VR9XbHPGLsfwL8ExFI2TKeyd
         jmthItPiRl4f5pxPwlu7d58UfmQAHPWbcubxJ2h1ptGdgBtsIe4L9PDhgo1wzb+tSsXk
         zBDdkdfYTAVJclEgmyFlDS0bdqNcP2pSv0TuGQnkDMG6yEAkut3jc/xVdEdC2hwIlR9I
         EWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684767524; x=1687359524;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GB7XYhd2mlIH0fHMUAhimGnNPOH+S2GqRkVg6KqMpSs=;
        b=EpNoO+Jz5Fpa907Fl2Zp6FBkGM5zbNixpQsThZ3sVSA4go0MMa/Bo8yXSAFIEDUejj
         hmFggVh+0V6rSfTM8gldxsG5Zv5hvtQlF2DR6QW+Ml3vdqZkaDPVwZOH2jFARjvH+JxT
         zEqBhWM72RFBxmWM0bqKkFQbCeZnuEh/1AlUdbpgCxGuW3BbvPfKXc9jLpas8ps1jIIe
         i5Gu1a1MLA61sdoaNzkBUAyBuWbau2IbvDU1UPVyGDP+/B/55RqZ5FwrALBcz7SxSdMh
         k3HP21l2a5+vdSaV/SPPRGJWLmOFrUjcdqyFPUce7AtRrCVewUJ1x3hmmU78JpDCPMtD
         69Wg==
X-Gm-Message-State: AC+VfDwagpynHEIgF+ac6MpX06foadoS7XxTiaxvcPBhKzRhnaooZo4T
        La5Ah003cwC7wacbJ8mBDei35Q==
X-Google-Smtp-Source: ACHHUZ4BDbUixCFCn6K/ZmSTVEPc3IlyEtxt5/2WqXNMuohCC/E7nqhpjiIN29qz4pge9WjbtitRVA==
X-Received: by 2002:ac2:489c:0:b0:4e8:5112:1ff2 with SMTP id x28-20020ac2489c000000b004e851121ff2mr3557967lfc.27.1684767523807;
        Mon, 22 May 2023 07:58:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b004f3942e1fbesm1021727lfc.1.2023.05.22.07.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 07:58:43 -0700 (PDT)
Message-ID: <0be4bb6e-40dd-f4bd-3fd2-d62fa228d356@linaro.org>
Date:   Mon, 22 May 2023 17:58:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] drm/msm/dpu: split interrupt address arrays
Content-Language: en-GB
To:     neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
 <20230522004227.134501-4-dmitry.baryshkov@linaro.org>
 <80da4c26-ca3f-00c9-072c-087a1ff24c74@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <80da4c26-ca3f-00c9-072c-087a1ff24c74@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 17:36, Neil Armstrong wrote:
> Hi,
> 
> On 22/05/2023 02:42, Dmitry Baryshkov wrote:
>> There is no point in having a single enum (and a single array) for both
>> DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
>> enum and two IRQ address arrays.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
>>   3 files changed, 74 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 677048cc3b7d..72530ebb0ae6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -351,6 +351,7 @@ struct dpu_rotation_cfg {
>>    * @has_dim_layer      dim layer feature status
>>    * @has_idle_pc        indicate if idle power collapse feature is 
>> supported
>>    * @has_3d_merge       indicate if 3D merge is supported
>> + * @has_7xxx_intr      indicate that INTF/IRQs use addressing for DPU 
>> 7.0 and greater
>>    * @max_linewidth      max linewidth for sspp
>>    * @pixel_ram_size     size of latency hiding and de-tiling buffer 
>> in bytes
>>    * @max_hdeci_exp      max horizontal decimation supported (max is 
>> 2^value)
>> @@ -364,6 +365,7 @@ struct dpu_caps {
>>       bool has_dim_layer;
>>       bool has_idle_pc;
>>       bool has_3d_merge;
>> +    bool has_7xxx_intr;
> 
> looks good, but I can't find where has_7xxx_intr is set in the patchset
> 
> Neil

Indeed. It seems I missed a patch.

-- 
With best wishes
Dmitry

