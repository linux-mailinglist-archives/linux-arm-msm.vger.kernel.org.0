Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D7C516019
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 21:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244330AbiD3TcI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 15:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244265AbiD3TcH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 15:32:07 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3017205FB
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 12:28:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w19so19274569lfu.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 12:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wr4z1m7clyU/rhtX6ics/d7f934zQVoQlUaav7spP24=;
        b=Pq+iH3cSJUsfcRyKVTK7VYUjVS164RGQwa+/jN7tE4j8ejQUI5I29267hyeC716zDI
         m6GSZTnu1Qw9DC4P22Xs2KddNJ3Q4Jokp2oLsvPeCLhaCncwzko+JHwFU29+7aHB6uBQ
         dANaqzqO2flcr8H81oiWI3IXetXTLO5MFIHeyiW2Hy0LL4QQkchZqcdNwWjlyibgR0Oq
         soDeveZPKVLSHafwnYHdQdQYcQSTxByj9boNNs+M1g+Ru9eLPdMuXWusqDD4+kfJ5ZTI
         oB/3ILuCFfXx+A5GwZzN6iDCR8buJ9Bsjl9D3wT6/+cXlPOI3YUyArmdxDrPkFJ6cb8I
         MVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wr4z1m7clyU/rhtX6ics/d7f934zQVoQlUaav7spP24=;
        b=3nZGmyT0HVrA2dEktPQ9AvpHWHGaPSmh2g8dxA3piyhX4XRrdmUxmH8zdqU5XkeBOd
         ySVHTuuxFr3QsQ6pPshZv2mlxGqYwqHab9eijc1v3QWshGT/83EGaBKiK9lmE2dzVQ2v
         izkDZiU9sS74XzjLYDgandIdkqzGc1hPTfP6MfWepG8z2Or3uD4SRYFepKWBpJm2lPFo
         4ftvsJcPiSqIRvz4gKLr5DtNk+G4QRcvWexJcFqhp1A2aYNs674WNidRa77YeOpYgjsB
         dFhTSr1qML2agMMyaYFzFrWOEXKpv2EtA647UnybYKq63ELGWnCdrliW2r2ZSLCBluD2
         7ioA==
X-Gm-Message-State: AOAM530ug6E/KKhVfva9FskZRh70vf7imtFgJKW8e2rLJR5LhmWnMmMW
        9UPwF0FiVQG0//vJ2rcz59C77Q==
X-Google-Smtp-Source: ABdhPJxF/BuZC+a4yXloMls8O55PrskqgvnLRWSgp6iNkP+444IVA+JKjr5Njsl9zGQmzFO17pSghA==
X-Received: by 2002:a05:6512:12cc:b0:472:384:ef0e with SMTP id p12-20020a05651212cc00b004720384ef0emr3801207lfg.407.1651346923278;
        Sat, 30 Apr 2022 12:28:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p10-20020a05651238ca00b0047255d21138sm256780lft.103.2022.04.30.12.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 12:28:42 -0700 (PDT)
Message-ID: <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
Date:   Sat, 30 Apr 2022 22:28:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/04/2022 21:58, Marijn Suijten wrote:
> On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
>> The downstream uses read-modify-write for updating command mode
>> compression registers. Let's follow this approach. This also fixes the
>> following warning:
>>
>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I pointed this out in review multiple times, so you'll obviously get my:

I think I might have also pointed this out once (and then forgot to 
check that the issue was fixed by Vinod).

> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> (But are you sure there's nothing else to clear in the 1st CTRL
> register, only the lowest 16 bits?  That should mean `reg` never
> contains anything in 0xffff0000)

Judging from the downstream the upper half conains the same fields, but 
used for other virtual channel. I didn't research what's the difference 
yet. All the dtsi files that I have here at hand use 
'qcom,mdss-dsi-virtual-channel-id = <0>;'

> 
> However, this seems to indicate that the DSC patch series has been
> approved and merged somehow??

Pending inclusion, yes. If Vinod missed or ignored any other review 
points, please excuse Abhinav and me not noticing that.

Can you please take a look at the latest revision posted, if there are 
any other missing points. Let's decide if there are grave issues or we 
can work them through.

> 
>> ---
>>
>> Changes since v1:
>>   - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
>>     (Abhinav)
>>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index c983698d1384..a95d5df52653 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>   		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>>   		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>>   
>> +		reg_ctrl &= ~0xffff;
>>   		reg_ctrl |= reg;
>> +
>> +		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
>>   		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
>>   
>> -		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>>   		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>>   	} else {
>>   		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
