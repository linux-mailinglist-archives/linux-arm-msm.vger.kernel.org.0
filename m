Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC94F7094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 10:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfKKJZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 04:25:40 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35779 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfKKJZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 04:25:39 -0500
Received: by mail-wr1-f68.google.com with SMTP id s5so2674283wrw.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2019 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4p0qtiatlV0SP4T6lSPVHVPXlgHULFnSfHizAyGU0hg=;
        b=XRCUl0ntONH7UguamnyewxwL8FNRl5jKFpvkjL2XRuqeAejncL98iTV2xLCkpWbQSr
         xBN25JtyymE8a0XBGrYbJI5pHr8jvfi0oM24AqCtNC6LxJle9FvadHt/1gNdE3v0GMOu
         PtJMlSAGdQc/4xD3d1HmBJ3IY1rsgmEOP8jxOtf8VMGGc+riDbT9UFXW500Axiv1SEfi
         0bRZFvpuzSv3jHUUzJhoB9NVmj50aPYp5xy7XWDvbOINxxrUj2MjSW6qg8nReOpGUj5Y
         dhuqErqUx3hv3Y17uJUEdWu8XNeW9ln1h57kAE62ZheE7LKr2WhsS1Y89TThUjnCQ5uZ
         cDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4p0qtiatlV0SP4T6lSPVHVPXlgHULFnSfHizAyGU0hg=;
        b=GYiZk3++YpaqFHnYjNX4drGzx6+Qfb/aQswOcMhWyrnHKqOFX6LjdWl8e3SY0SFqvf
         4ZyVj1BdfpRlSZiO/uzwtgjjyvJKErF/ibIpUoG0RchLmaeQ3jnql5NuzrVPEXM/oTlG
         Idx7mZfZdU+GAaXEC0Dv12gjzYEF7drkPTk1ucyXApwTz+gDTP1CRq0FiwwUi61vHiSm
         ylW5kZucWsptqkKL5qEoqGkJrn4FzbJFU1RJR4zYHpwex0MCaAeRUG7OnHubEJT8Ta08
         usn7xOYfOFNqYS3kMj3wApHZUgkdaEUBZxoE0q1xbiQzQIP++h13BMvtd5qmN07xOYuY
         aSMg==
X-Gm-Message-State: APjAAAVBJf3xbS3DtZsFHi1QTek1PL8qe2CmeIh37epntmTi9Xl2T9RI
        g+rjsGxZh8jgTSQMhxJ8ryvBlQ==
X-Google-Smtp-Source: APXvYqz33HioT48RXV/AkDamtjCdumAIK3ppi3Q+UqUVT538LwYEY3/vW7NqUhgVByAGLe4va+taaA==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr15491628wrr.177.1573464337262;
        Mon, 11 Nov 2019 01:25:37 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id c144sm17688792wmd.1.2019.11.11.01.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:36 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V10 6/8] backlight: qcom-wled: Add support for WLED4
 peripheral.
Message-ID: <20191111092529.GT18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-7-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> WLED4 peripheral is present on some PMICs like pmi8998 and
> pm660l. It has a different register map and configurations
> are also different. Add support for it.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 255 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 253 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
