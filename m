Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C8A3574CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 21:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345248AbhDGTML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 15:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344887AbhDGTMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 15:12:09 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CC2C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 12:11:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5ABA73ED55;
        Wed,  7 Apr 2021 21:11:54 +0200 (CEST)
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
To:     abhinavk@codeaurora.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
 <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
Date:   Wed, 7 Apr 2021 21:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 07/04/21 20:19, abhinavk@codeaurora.org ha scritto:
> Hi Marijn
> 
> On 2021-04-06 14:47, Marijn Suijten wrote:
>> Leaving this at a close-to-maximum register value 0xFFF0 means it takes
>> very long for the MDSS to generate a software vsync interrupt when the
>> hardware TE interrupt doesn't arrive.  Configuring this to double the
>> vtotal (like some downstream kernels) leads to a frame to take at most
>> twice before the vsync signal, until hardware TE comes up.
>>
>> In this case the hardware interrupt responsible for providing this
>> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic at
>> all.  This solves severe panel update issues observed on at least the
>> Xperia Loire and Tone series, until said gpio is properly hooked up to
>> an irq.
> 
> The reason the CONFIG_HEIGHT was at such a high value is to make sure that
> we always get the TE only from the panel vsync and not false positives 
> coming
> from the tear check logic itself.
> 
> When you say that disp-te gpio is not hooked up, is it something 
> incorrect with
> the schematic OR panel is not generating the TE correctly?
> 

Sometimes, some panels aren't getting correctly configured by the 
OEM/ODM in the first place: especially when porting devices from 
downstream to upstream, developers often get in a situation in which 
their TE line is either misconfigured or the DriverIC is not configured 
to raise V-Sync interrupts.
Please remember: some DDICs need a "commands sequence" to enable 
generating the TE interrupts, sometimes this is not standard, and 
sometimes OEMs/ODMs are not even doing that in their downstream code 
(but instead they work around it in creative ways "for reasons", even 
though their DDIC supports indeed sending TE events).

This mostly happens when bringing up devices that have autorefresh 
enabled from the bootloader (when the bootloader sets up the splash 
screen) by using simple-panel as a (hopefully) temporary solution to get 
through the initial stages of porting.

We are not trying to cover cases related to incorrect schematics or 
hardware mistakes here, as the fix for that - as you know - is to just 
fix your hardware.
What we're trying to do here is to stop freezes and, in some cases, 
lockups, other than false positives making the developer go offroad when 
the platform shows that something is wrong during early porting.

Also, sometimes, some DDICs will not generate TE interrupts when 
expected... in these cases we get a PP timeout and a MDP5 recovery: this 
is totally avoidable if we rely on the 2*vtotal, as we wouldn't get 
through the very time consuming task of recovering the entire MDP.

Of course, if something is wrong in the MDP and the block really needs 
recovery, this "trick" won't save anyone and the recovery will anyway be 
triggered, as the PP-done will anyway timeout.

>>
>> Suggested-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@somainline.org>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@somainline.org>
>> ---
>>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> index ff2c1d583c79..2d5ac03dbc17 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
>> @@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct
>> drm_encoder *encoder,
>>
>>      mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CONFIG_VSYNC(pp_id), cfg);
>>      mdp5_write(mdp5_kms,
>> -        REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), 0xfff0);
>> +        REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), (2 * mode->vtotal));
>>      mdp5_write(mdp5_kms,
>>          REG_MDP5_PP_VSYNC_INIT_VAL(pp_id), mode->vdisplay);
>>      mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_IRQ(pp_id), 
>> mode->vdisplay + 1);

