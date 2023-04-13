Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066B16E02F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 02:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjDMAFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 20:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjDMAFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 20:05:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F611713
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 17:05:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h12so11945251lfj.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681344338; x=1683936338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqDd36Xna87Ja2uYucxlmnJMfm1J2VYsmJqSFbSPlQI=;
        b=M2ED25aGEQVOUIoOeRvJA2/4Um84MCt5oMI1eOqRhZd8MaV4+Y1TPJNHMs8KrwEY2f
         WOHVw7C8nwV27UhqErNVsyhXMCqgrcapez/Zf1h+f9z7IYby3I0/uvalUY9nrtojPuYO
         LSpCxy5Ve4IAq8jtu3D/xJEpdORhA+7dHclgVsx4MthRUReDLdPHUN6GI0yXWxESO4KU
         dg908a/VRgW5Pv8dEf2t/RRKLmoO4iu3KMWnKEE0wJAu0/aoXeC9muMdokqYdTSocjsg
         PlcI1sEJC48Epuh/H733VE60yHmlakZIdcSszVXRgS/mtkZMK60qgbEy7Z5frThxcFSO
         1NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681344338; x=1683936338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqDd36Xna87Ja2uYucxlmnJMfm1J2VYsmJqSFbSPlQI=;
        b=Bo0kl+cw2pbXM30Sao+OuDbVNmu2JbA2FauuK8mrZc4x4AQ5AZ/roka8axbEh7Dk1l
         dyGZ0WjpL6A0xS2dgqTyBcp6jU44+5kliW946ukRoJerJN0eWuHt1/PKzQObUmAMjBf3
         ClnylWQLF+0Ehc5ZpNJKCCiT9CRo71/kJydSyeDWdWP+aw6WKaYoB131geZIGjdSJGNN
         X3agGn6nb/P6gWilehmzqnkz2X2SIac18Nj+LhwQqZuu83RuB3cjwBF42D0ucf2MGdCr
         fwPMiCKN9nrGFWBTnkyHbM69QWulofmdWs9GjNzZDR6+jUX+aZ2sDcBG0ahCD1t5uZSR
         vHew==
X-Gm-Message-State: AAQBX9c+E9iR+D09+D6wDy16YIS9bLXfjCBqwBFwrPnREtQMiwMIj7eR
        H2/g2bnEfIm51t8ok9VHFtH+IKt2yjzMtVwd5sk=
X-Google-Smtp-Source: AKy350aWaxxBspAXIGmezaj+Yjct61vVYleYqotsiazvOmF9AB3dmyba3DsfUjtzvzVvI0N9utag3Q==
X-Received: by 2002:ac2:4461:0:b0:4ec:84ec:db0c with SMTP id y1-20020ac24461000000b004ec84ecdb0cmr183251lfl.52.1681344338198;
        Wed, 12 Apr 2023 17:05:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w7-20020ac254a7000000b004eca35798a4sm41537lfk.32.2023.04.12.17.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 17:05:37 -0700 (PDT)
Message-ID: <b1b6ddc7-a793-a1b4-8dd6-8ea69b6e5573@linaro.org>
Date:   Thu, 13 Apr 2023 03:05:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 6/8] drm/msm/dsi: Add check for slice_width in
 dsi_timing_setup
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-6-0108401d7886@quicinc.com>
 <c829ff2f-f676-8c6d-2681-1b5da4f9ede7@linaro.org>
 <e72a1e24-72e1-aad4-bc8f-f23dc84780dc@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e72a1e24-72e1-aad4-bc8f-f23dc84780dc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 01:40, Abhinav Kumar wrote:
> 
> 
> On 4/12/2023 12:24 PM, Dmitry Baryshkov wrote:
>> On 12/04/2023 22:09, Jessica Zhang wrote:
>>> Add a check for valid dsc->slice_width value in dsi_timing_setup.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 508577c596ff..6a6218a9655f 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -937,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>               return;
>>>           }
>>> +        if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {
>>
>> This is an erroneous condition, correct. Can we move it to a better 
>> place, where we can return an error instead of ignoring it?
>>
>> I'd say that we should validate dsc->slice_width at the 
>> dsi_host_attach(). It well might be a good idea to add a helper that 
>> validates required dsc properties (e.g. version, bpp/bpc, slice_width, 
>> slice_height, slice_count).
>>
>> As for the mode->hdisplay, we have the following code in 
>> msm_dsi_host_check_dsc() (where pic_width = mode->hdisplay):
>>
>> if (pic_width % dsc->slice_width) {...}
>>
>> This way the only way how mode->hdisplay can be less than 
>> dsc->slice_width is if mode->hdisplay is 0 (which is forbidden if I 
>> remember correctly). So the second part of the check is useless.
>>
> 
> Lets drop this from this series and come up with a better approach to 
> validate dsc params. We will take it up once dsc over dsi and dp lands.

Sure, why not.

> 
>>> +            pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
>>> +                   dsc->slice_width, mode->hdisplay);
>>> +            return;
>>> +        }
>>> +
>>>           dsc->pic_width = mode->hdisplay;
>>>           dsc->pic_height = mode->vdisplay;
>>>           DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>>>
>>

-- 
With best wishes
Dmitry

