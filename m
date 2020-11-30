Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42242C7F59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 08:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgK3H4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 02:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgK3H4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 02:56:09 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C5DC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 23:55:29 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id m19so14108310ejl.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 23:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lLjwMaRlmFk8cdjb61byqEUPHvd5mHzz+PPVHsNni1U=;
        b=UDyYpxcPlLMlL1aNJW1x9AbN37aqd+AIG23FKB/f+lnfQ0qFsXhz0n5R899QDDTucz
         eqvrGTDaiYSV4tw8hpzB/zmYFgfnqjn2I6NdydMxXrS2OsdAKAHzq5Gr5TOORlBV90zC
         T9Zkn07E+KbPQ0Jj6TLrIOqsCYuBxr1ZbCZX7hg8ofhCmMDpGupMr/fgKHtPvAat56Xq
         hpX86eryIGBvmVnPELmXSL2QS4yDMKcQrYtK0IfgB4tTYPnGuwbGxNusDuqRRYoIKqcJ
         gr03oLSxJLPuurAsGBO72Tzk/SUn7PyYz9e2HrSRLXClT+RtjGAlITc88ixzV3iBd4n0
         WHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lLjwMaRlmFk8cdjb61byqEUPHvd5mHzz+PPVHsNni1U=;
        b=nD8qKpIslYSraSwb9lE9vUHrOplGVU9PCaUdFWA867RRuiFxv6OYnY2ZEMQF70AgtQ
         wVmVL3QoEM72ImWAux/HFmttkLZrePvuog15JOzqdtn6yFBmbTNW/gCxG4gooRTJMPuS
         wVQTzK5JDgrf6RVjZ/SyfEIIgtP5VMt3XEw7T369wUFYSSQ2JU+Zn0is5lNQdsXUbXOD
         XCnV8PmVlTHYVGGK170vx9s2P9a7nhCjMQY0ss1tnbWKaF7BZcdkqrtHc2RM6mkLc4Ft
         Al9xdrSTd9X854+GgM8Rgo8j8l1e0UKlc8Ii4SlmTfj6dSpxNBTqwehxK+GGfqyUGydP
         INWA==
X-Gm-Message-State: AOAM532eXV3A9T1TuLTQafPqiy0C7DS7+qXGbKJTp/Y/gVz4LDK3wsZw
        BXhyuBx8h34kOzFiREJUVRvZMg==
X-Google-Smtp-Source: ABdhPJzcj32N0IZjwASJ4Qy9YUq174cNRzne/2mX0AbEhr+sbor3LD60k6ZMpPOQFunFRPnEyjnrNw==
X-Received: by 2002:a17:906:af83:: with SMTP id mj3mr12580359ejb.243.1606722928131;
        Sun, 29 Nov 2020 23:55:28 -0800 (PST)
Received: from [192.168.0.3] (hst-221-70.medicom.bg. [84.238.221.70])
        by smtp.googlemail.com with ESMTPSA id b5sm549899edw.69.2020.11.29.23.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 23:55:27 -0800 (PST)
Subject: Re: [PATCH v2 0/8] Venus stateful encoder compliance
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
 <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d539ab91-da28-e8b3-6b39-d5564eb6f22a@linaro.org>
Date:   Mon, 30 Nov 2020 09:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Fritz,

On 11/29/20 9:17 PM, Fritz Koenig wrote:
> Since this patchset adds support for V4L2_ENC_CMD_STOP and
> VENUS_ENC_STATE_ENCODING it should also add support for
> VIDIOC_TRY_ENCODER_CMD so that those commands are discoverable.  I've

6/8 is adding it:

+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,

> made an attempt at that here:
> https://www.spinics.net/lists/linux-media/msg182319.html
> 
> On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hello,
>>
>> Here is v2 of the subject patchset.
>>
>> The patchset starts with few small preparation and fix patches, 1/8 to 5/8.
>> 6/8 is redesigned Dikshita's patch and 7/8 add Reset encoder state handling.
>> The last 8/8 just delete not needed helper function.
>>
>> The major changes are:
>>  * An attempt to reuse m2m helpers for drain and reset state in 6/8 and 7/8.
>>  * Use null encoder buffer to signal end-of-stream in 6/8.
>>
>> Comments are welcome!
>>
>> regards,
>> Stan
>>
>> Dikshita Agarwal (1):
>>   venus: venc: add handling for VIDIOC_ENCODER_CMD
>>
>> Stanimir Varbanov (7):
>>   venus: hfi: Use correct state in unload resources
>>   venus: helpers: Add a new helper for buffer processing
>>   venus: hfi_cmds: Allow null buffer address on encoder input
>>   venus: helpers: Calculate properly compressed buffer size
>>   venus: pm_helpers: Check instance state when calculate instance
>>     frequency
>>   venus: venc: Handle reset encoder state
>>   venus: helpers: Delete unused stop streaming helper
>>
>>  drivers/media/platform/qcom/venus/helpers.c   |  65 ++---
>>  drivers/media/platform/qcom/venus/helpers.h   |   2 +-
>>  drivers/media/platform/qcom/venus/hfi.c       |   2 +-
>>  drivers/media/platform/qcom/venus/hfi.h       |   1 -
>>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   2 +-
>>  .../media/platform/qcom/venus/pm_helpers.c    |   3 +
>>  drivers/media/platform/qcom/venus/venc.c      | 232 +++++++++++++++---
>>  7 files changed, 226 insertions(+), 81 deletions(-)
>>
>> --
>> 2.17.1
>>

-- 
regards,
Stan
