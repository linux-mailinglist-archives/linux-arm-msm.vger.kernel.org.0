Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C0D1C6E00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 12:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgEFKIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728314AbgEFKIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 06:08:00 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084D3C061A10
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 03:07:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l18so1475118wrn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eh6CjI5qlJbfI0/vhnP4eL4p9yTZrlT7LtScBoT0wAA=;
        b=eF9rRF3kORznrWQ6Ryu3DYtV+uP9iro81Ds3jDSv9PZLgiljc8BeSRWDmWt0EHcu1v
         yc+OcrRTIVK4KIEKG2ikX9qJ8Ghwpv37guMlIDqPMIcxKbAhnIJcMNAhv9kJlNRvZg8w
         ykbxXQtCjh3XePczObskArBb5wqVbvEHrUG0+/SvqwTj6TCpkTovV4JUcDamaefrtQtY
         x4HuBqf7vxVZ800ryyJamkeyn2bNyQmHLUk6N3TcgjgX7pvosP8KzVB7qmbCZ1q3Tu6M
         /ZDNTK1t9ymxM0/a3RWi4RgJxJAv8Sh5+CWOiB44foLpnAMliiporE/qh/wlrfCK0qzO
         1PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eh6CjI5qlJbfI0/vhnP4eL4p9yTZrlT7LtScBoT0wAA=;
        b=ZHJmoTIj4sRTvlFWInLvAbg8ol71gecRswKM/b2r/II5mmFDNHPMdz3Hchr8nMxlQ+
         jvotQkSPSj8rr++9Bq+GmIjQ/kuaquTOr5g36UxszgjqRQmOfwjkRoYtaRLbYfr8wVTT
         yMpeots8Cf8apGoA0VT2g/pqArqtDdPwV005/CZzCfNJud30dXH7Qn0O5Ugzbna2Nz5c
         IinawEUM6SMfARHC1cFSuZJ8Bk26jjrMjyjjbz0csuGs8KaNG4dUE9NVwsTJiNdljP90
         CPdWiGM2Dpy7inDR2XmbjNypRClyCiOV6mrl3NEw/zhAX+JWMr2GwTA9OO2bQfN2dwly
         jsww==
X-Gm-Message-State: AGi0PuYiGVokHmKmA6QeV1BdfwdGfhLVAJpX5BJYFGN0qQ1mGXhJlO9y
        tI7WJ5O4DL4D0jxRZ5swVkJFjQ==
X-Google-Smtp-Source: APiQypKuj4JYfxO8nKTrw9i4Yi3jaNONI0rOK9zdGpxB6OGfTP8PMtsRVxoevWRNas/XupOIzfnd5A==
X-Received: by 2002:adf:f207:: with SMTP id p7mr8527397wro.20.1588759678524;
        Wed, 06 May 2020 03:07:58 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id x5sm1820447wro.12.2020.05.06.03.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 03:07:57 -0700 (PDT)
Date:   Wed, 6 May 2020 11:07:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200506100748.GD823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> Convert the qcom-wled bindings from .txt to .yaml format.
> Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 ---------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 208 +++++++++++++++++++++
>  2 files changed, 208 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
