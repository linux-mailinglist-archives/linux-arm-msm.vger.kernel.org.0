Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031643D8B48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 11:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbhG1J7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 05:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235520AbhG1J7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 05:59:04 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE6FC061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 02:59:03 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l18so1770015wrv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MvgxeqS+HaNEMobeFZP5WA95GeptTcq9rnLkrwhIlVM=;
        b=PM6QlPgsr8IposamgI4WB5COeh/xDcr9ATMbDA2Dd4wRs5KSwHmbalTJllsKMJqM+0
         GDtVquL4G0DduiUTM6rh2DnnFr74LbinaXDuvc8SQEpTi04iXI9d3sgTZKmfngdUo/jv
         iPKqNea0aMKJq3ZOu0o9sWtT+9Y5QnRrWD+fNjBFea1IdXYXi26ZusvymOmzKFdPaUUf
         Gw+c311o8ZrV5KyBC7eMm/rBsvkGmo/DMqIW8UGT4JSh3u0IO16huU6UUGAPYxE5BiCi
         y2oIn5YLRqvYUtRBFx07ouCdrDNNV8XYOJB99SauDS4MfBTlB61waYP4BT59aQJyYqdR
         niyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MvgxeqS+HaNEMobeFZP5WA95GeptTcq9rnLkrwhIlVM=;
        b=deELNGcGjQqrLd4P1Wxe6IGEwIEt+XJmwdd+4pxZaJoefQngeUTijf95FT2ps87Npn
         /Mt1aEjEsiTrGPsgaXADB7aBXs3zEaHtZ1auRiDMKaOCgWxdHZc5E403TZw3gygIn0xc
         Q544U44soq08lv01J5wHUavCuIe38+O39Rasg9S+Z3ecadOgk823jcCDIvKpcDwbZaU3
         DENDf5jc5O2punKyUIgqaTibIDLy3kRIXCiTrcBhOX9eCVHYFHjdrP6QoeEZSsHLfYtg
         D/4vqfUkOf+EhwvFnk6x9FVzjD48zDJOwJe3nFBPL1nunLlqBToj4bzKNilbK+R6aso9
         r2GQ==
X-Gm-Message-State: AOAM533UgeJMshbHAGC+jJszMmqd/z2VngYHahOmkQ1NQOcwLVPL1y25
        Fv1S3dIdtfL9Qpv66D/O0bYmFg==
X-Google-Smtp-Source: ABdhPJzw9wZ661UYODGhQsJBzpN0GOzYVIRHpR9IMyHfWkN/3VFO+RS3Knf9UGECNY7xg56NRMZ1Fg==
X-Received: by 2002:a05:6000:189:: with SMTP id p9mr1300213wrx.137.1627466341898;
        Wed, 28 Jul 2021 02:59:01 -0700 (PDT)
Received: from [10.10.6.131] ([109.120.209.55])
        by smtp.googlemail.com with ESMTPSA id 19sm5605207wmj.2.2021.07.28.02.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 02:59:01 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Qualcomm custom compressed pixfmt
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-api@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210706124034.773503-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <1e07d249-fd55-6c23-c36f-e10fbdeeaca7@linaro.org>
Date:   Wed, 28 Jul 2021 12:59:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706124034.773503-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hans,

Gentle ping.

On 7/6/21 3:40 PM, Stanimir Varbanov wrote:
> Hello,
> 
> Changes since v1:
>  * rename QC8C to QC08C
>  * rewrite the documentation part
>  * handle correctly QC10C compressed format in the driver
>  * correct compressed 10-bit formats for Venus v4 and v6
> 
> Regards,
> Stan
> 
> v1: https://patchwork.linuxtv.org/project/linux-media/list/?series=5331
> 
> Stanimir Varbanov (5):
>   v4l: Add Qualcomm custom compressed pixel formats
>   venus: helpers: Add helper to check supported pixel formats
>   venus: Add a handling of QC08C compressed format
>   venus: hfi_platform: Correct supported compressed format
>   venus: Add a handling of QC10C compressed format
> 
>  .../media/v4l/pixfmt-reserved.rst             | 18 +++++++
>  drivers/media/platform/qcom/venus/helpers.c   | 48 +++++++++++--------
>  drivers/media/platform/qcom/venus/helpers.h   |  1 +
>  .../platform/qcom/venus/hfi_platform_v4.c     |  4 +-
>  .../platform/qcom/venus/hfi_platform_v6.c     |  4 +-
>  drivers/media/platform/qcom/venus/vdec.c      | 31 ++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
>  include/uapi/linux/videodev2.h                |  2 +
>  8 files changed, 82 insertions(+), 28 deletions(-)
> 

-- 
regards,
Stan
