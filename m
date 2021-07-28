Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4398E3D8B30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 11:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235748AbhG1J52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 05:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbhG1J51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 05:57:27 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825E7C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 02:57:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d8so1777520wrm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wsImX0QCKZ1a8ZsZDJcjcgOC51nSy6JYTDJeExquDdw=;
        b=wI24ddW+o7m9CfmveCoei5saTwmvZmLzn8kYOeThOCd8JsribeKelLrfzUVY+4MvbF
         IooGSDuKJZzxFqONKRGZQ6OByO7nL+m+t8KmjPjwJIBTjsuQk4GgvTH4bjJkZ2mrqcAC
         HDRBeeSTakhNaPs7f2/5o7TXDRP5VmTbYUu9reUYnLDOkt4r7o878kV65u+lDWBUoCaR
         2lYQFYUnZdDlmXVduxGxRP1GMLVkzNqldWx2T5NRICzQDx9InyKYtm4PUv48RCbtxMlb
         DdYtdtYXXQ55UvkHMdlDvAE9WnDJUlanfQkOyfmxM9kbQylUC7RpIZzw472WQ5Jxb11w
         ii2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wsImX0QCKZ1a8ZsZDJcjcgOC51nSy6JYTDJeExquDdw=;
        b=CKYtHr6ZXv69viRwzzOzjBBOa359+L7IeCYO5hW4Y62PXznpIMfhtJITjuB/s8TZLk
         LVF4Yii6+V6JYRYHWlL76DIy2irpE+EEoB6g7ZPJ4p3qpiEqtTJPVdCBD4I80ACnXWKH
         pQ9WpEijbTXpOlpgc1OaxV/o09lZ0dS69xaUlXPP+msVCIy9EX/ejzW+OT/WYlcHBQyA
         6qcJMkQ1Qkb6UzTcnCbVxEklzuMcg72eR1KHjwc2g1S3dJv3OkNXVEF6BpTfNvkp7pML
         n4gsAVxlvrpS+KqkYVN0BILafpQ7QXZtL8nswQSrTMJCOH0fjFV/HgPUhEOIo7tHwTjy
         2H+w==
X-Gm-Message-State: AOAM531QX4gDy+bHYsXCu1T3OgFcjk3+l4KVQ7BZ670urz87dDryOFqa
        Li9e1SgccFHgI3ErSRH/doq/8g==
X-Google-Smtp-Source: ABdhPJxCpOb9sdXUE6ib46KA5RuGDnCQ7NiCqQWjvFQEvzVoQuIUQTmYeBml9yHtemOMVPBUwJwPiA==
X-Received: by 2002:a5d:522a:: with SMTP id i10mr7632890wra.280.1627466245194;
        Wed, 28 Jul 2021 02:57:25 -0700 (PDT)
Received: from [10.10.6.131] ([109.120.209.55])
        by smtp.googlemail.com with ESMTPSA id a2sm4157939wrn.95.2021.07.28.02.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 02:57:24 -0700 (PDT)
Subject: Re: [PATCH v5 0/3] Intra-refresh period control
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7f0ac52c-25c0-cd03-253a-f6fa4aeb9dcc@linaro.org>
Date:   Wed, 28 Jul 2021 12:57:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hans,

Could you please review this v5.

On 6/22/21 2:39 PM, Stanimir Varbanov wrote:
> Changes since v4:
>  * added new patch to document control zero value meaning (1/3)
>  * updated document for intra-refresh period (2/3)
> 
> regards,
> Stan
> 
> Stanimir Varbanov (3):
>   docs: ext-ctrls-codec: Document cyclic intra-refresh zero control
>     value
>   media: v4l2-ctrls: Add intra-refresh period control
>   venus: venc: Add support for intra-refresh period
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 19 +++++++++++++-
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/venc.c      | 26 +++++++++++++++++++
>  .../media/platform/qcom/venus/venc_ctrls.c    | 14 +++++-----
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  6 files changed, 55 insertions(+), 8 deletions(-)
> 

-- 
regards,
Stan
