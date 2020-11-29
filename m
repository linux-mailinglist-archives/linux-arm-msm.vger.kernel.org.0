Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774A62C7AEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 20:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgK2TSS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 14:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2TSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 14:18:16 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D3DC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 11:17:30 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id d17so14658457ejy.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LaYvdAUmRlNPKDBNivA2dWaWEk14e1Lfm+e5Aneve0s=;
        b=eFNgnuYCzfxHavNAx16ydX/pGZuNUSjHBmDDCAWQDjln+KsANNy/Mic3CzXF8XpiXw
         h+IkHwaqJ/Bw9x834JUlsp7aczAsHqvto+7uYv9Z9DYYLSO58eRtmRAeWaCIZdppZABj
         rc2q0KaTb7GfoRrxY0IQcoQwLqTKJPYVRRogs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LaYvdAUmRlNPKDBNivA2dWaWEk14e1Lfm+e5Aneve0s=;
        b=cMUQQ5cIe+j7kPhHLsXBAGEJzkpuGE0j1Eu80K/CLFV8q+R/DlQXWQNuzW7CWgtmVn
         5Jgc0z3HtMELyBnv2E4lBuOSQntPKUwnpmUtBrOt3BC88cDj3VSCiYE184S2xNUKZ2dg
         9Q9blVmmnFcfWEtSpSRahfVKz7pxMAegwJ9p+xSj4fQRFdIMO5rS3CpoWujX3vR1LSzl
         nW835UYaLVadUjz4Gvd1+wfdMu0PFBZvzwuI26+xFdtGY9JTAFU3YCEFdBCDn41+7lCp
         VANydDa3C95r6Ys5gfxJ38nZrJ68cpniWzP/jh/9smyfli5aS/B5CuoaIgXh/Dw42rIa
         7L/Q==
X-Gm-Message-State: AOAM531cWy99YjqSOS6uksZ325kOCiewET/+S3qhxZ+5todpkj9apOW4
        dJfJjivGd0HOWlCUfSfYqYCDrDMvlJn0Kw==
X-Google-Smtp-Source: ABdhPJzqcfItZNWmKekakEhptysm6ejTmXIWymjVWS6qbCYFUp3Ah/ON4g3VJHtJHuVFp/mhl0CKsA==
X-Received: by 2002:a17:906:180b:: with SMTP id v11mr17438330eje.466.1606677449087;
        Sun, 29 Nov 2020 11:17:29 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id q5sm7707089ejr.89.2020.11.29.11.17.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 11:17:28 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id w24so18468628wmi.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 11:17:27 -0800 (PST)
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr19952360wml.11.1606677447413;
 Sun, 29 Nov 2020 11:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sun, 29 Nov 2020 11:17:14 -0800
X-Gmail-Original-Message-ID: <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com>
Message-ID: <CAMfZQbxV4CuZ57kv1Nu=VTdd-eK2opMqnduxGGa+KvptaFL7=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Venus stateful encoder compliance
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since this patchset adds support for V4L2_ENC_CMD_STOP and
VENUS_ENC_STATE_ENCODING it should also add support for
VIDIOC_TRY_ENCODER_CMD so that those commands are discoverable.  I've
made an attempt at that here:
https://www.spinics.net/lists/linux-media/msg182319.html

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hello,
>
> Here is v2 of the subject patchset.
>
> The patchset starts with few small preparation and fix patches, 1/8 to 5/8.
> 6/8 is redesigned Dikshita's patch and 7/8 add Reset encoder state handling.
> The last 8/8 just delete not needed helper function.
>
> The major changes are:
>  * An attempt to reuse m2m helpers for drain and reset state in 6/8 and 7/8.
>  * Use null encoder buffer to signal end-of-stream in 6/8.
>
> Comments are welcome!
>
> regards,
> Stan
>
> Dikshita Agarwal (1):
>   venus: venc: add handling for VIDIOC_ENCODER_CMD
>
> Stanimir Varbanov (7):
>   venus: hfi: Use correct state in unload resources
>   venus: helpers: Add a new helper for buffer processing
>   venus: hfi_cmds: Allow null buffer address on encoder input
>   venus: helpers: Calculate properly compressed buffer size
>   venus: pm_helpers: Check instance state when calculate instance
>     frequency
>   venus: venc: Handle reset encoder state
>   venus: helpers: Delete unused stop streaming helper
>
>  drivers/media/platform/qcom/venus/helpers.c   |  65 ++---
>  drivers/media/platform/qcom/venus/helpers.h   |   2 +-
>  drivers/media/platform/qcom/venus/hfi.c       |   2 +-
>  drivers/media/platform/qcom/venus/hfi.h       |   1 -
>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   2 +-
>  .../media/platform/qcom/venus/pm_helpers.c    |   3 +
>  drivers/media/platform/qcom/venus/venc.c      | 232 +++++++++++++++---
>  7 files changed, 226 insertions(+), 81 deletions(-)
>
> --
> 2.17.1
>
