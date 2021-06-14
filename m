Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E783A6621
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 13:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhFNL6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 07:58:08 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:39880 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhFNL6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 07:58:08 -0400
Received: by mail-wm1-f54.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso12841562wmh.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yO4bQv3rKZ65ZJRJ/lyl1Qcd2blU+mVdtVLes/zMW7s=;
        b=awICW+94hy4NRGpMkZ5TAOwo7443g11BQ6nOWcg76dvZXWc2p7Hk/0nAO9g4JNdYkf
         MwvBMpaYoSd8zQ0vDA8drAAk+ahvuAegi3a83dvDQwGidRLiaNzUZxB7XdzMtw3RzCmH
         iFHMR5zdNfmYrlCUMsSyg+PujxOpdkBnqAcqeQhfnlM2G+PGObTjjruifZNbCiim5DNW
         sH9HwxjfebRCqLqvjDPtHeRrpkdYgMWHIWvUxX2/5EbzPeeeijjj28MOJGO0SC6Nl/dv
         7MK6TNYfrTHEbHlHg04na1ckTL83QxyuixeCNXi2Pdw11yV++ZyTPOkFrwsAhkhudbLQ
         O7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yO4bQv3rKZ65ZJRJ/lyl1Qcd2blU+mVdtVLes/zMW7s=;
        b=Va3yCj6CIb+/XKtY/3k4Go3c85jXm9POL7H60zpm7Nevf3AdLaM+j7zjIolRvFbehr
         PWA/uKAWf2OYJt7uigPfq4oYE417l9ZTn15qZlW1RmqjPofI/RzpUHHj01tf55HdOxFg
         0+z1+O/J4E5ZwTQGz1j1TuWMhGVUqA/iAm02WZA8YIvBL4bqllVOT3KuW1dxA3WPNutX
         js4IG9SKm9nfMpei8sCS10kRJoR9nvRT27z3imNB5bsgzEkeEHbVAks0LMS6CYvSxLjI
         h5iRSzN2SYYLhNDf/EknAYgSMhxiLq5BdaMJB/c8uFJZ5MSwhI6o8e6i08m2iJ9PCloT
         twaw==
X-Gm-Message-State: AOAM530UtZll7pO2rns5H2NaDeflutwTDdOqYyThXcL26jvipW895WuC
        MlMesYtxEATjbx1nEj4h5Miiyw==
X-Google-Smtp-Source: ABdhPJxHKOW0w1lBJGYcvVFuYGzq87xRJP78nHKvtf1vYSTYapG2R0es7hemaCO+D6a6+ezpZ4TgVw==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr32404919wmk.147.1623671705038;
        Mon, 14 Jun 2021 04:55:05 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b15sm18917776wrr.27.2021.06.14.04.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 04:55:04 -0700 (PDT)
Subject: Re: [PATCH] venus: helper: do not set constrained format for UBWC
To:     mansur@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        dikshita@codeaurora.org
References: <1622195288-18541-1-git-send-email-mansur@codeaurora.org>
 <a66e00f2-af3a-9550-0779-625152cc2719@nexus-software.ie>
 <17aaec56-bfad-63a6-b1c4-7562dedb3137@linaro.org>
 <b649a7ecb3feb1fdf6d0743135814840@codeaurora.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <28ab2706-2a0c-e9d6-c02c-8ede6fa01efb@linaro.org>
Date:   Mon, 14 Jun 2021 12:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b649a7ecb3feb1fdf6d0743135814840@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2021 07:25, mansur@codeaurora.org wrote:
> On 2021-06-02 15:23, Stanimir Varbanov wrote:
>> Mansur, could you answer to Bryan's comments?
>>
>>> On 5/28/21 8:23 PM, Bryan O'Donoghue wrote:
>>>> On 28/05/2021 10:48, Mansur Alisha Shaik wrote:
>>>>> Do not set constrained format explicitly for UBWC
>>>>>
>>>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>>>
>>>> Could you give a little bit more detail on why, what the side 
>>>> effects are ?
>>>>
>      Sorry for late response, by default for NV12_UBWC is 128x32
> 

Right so we have

pconstraint.plane_format[0].stride_multiples = 128;
pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;

and

pconstraint.plane_format[1].stride_multiples = 128;
pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;

and your patch says if opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC then the we 
shouldn't do hfi_session_set_property()

I'm sure that's a fix that works but, I wonder would it be possible to 
fix this routine to continue to do hfi_session_set_property() with 
updated parameters for opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC ?

Could you drill down into the detail in the commit log a little bit 
maybe giving a description of why returning for opb_fmt == 
HFI_COLOR_FORMAT_NV12_UBWC is the right thing to-do instead of adding a 
new case to the routine for HFI_COLOR_FORMAT_NV12_UBWC and calling 
hfi_session_set_property() ?

Its more for my own education on this topic :) but, also helps somebody 
else reading the log to understand what the fix is, why it is done this way.

>>>> Should this be a Fixes: ?
>>>>
>      without this fix on V6, firmware throws below SFR
>      qcom-venus aa00000.video-codec: SFR message from FW: 
> QC_IMAGE_VERSION_STRING=video-firmware.1.0-df9cb37cf8e507a4468265658702247652351a49 
> 
>      Err_Fatal - 
> /local/mnt/workspace/pkg/builds/dynamic_timely/tree2/vendor/qcom/proprietary/video-firmware-noship/venus_proc/venus/decoders/common/src/video_decoder.c:6644:2fef3 
> 
>      which result in playback happens through Software codec.
OK, I think I can answer my own question here.

Technically no since 6XX isn't in the long-term-support kernel but, I'd 
suggest adding a "Fixes" anyway, so that other users know to apply this 
patch to their trees.

Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane 
constraints to FW")

---
bod
