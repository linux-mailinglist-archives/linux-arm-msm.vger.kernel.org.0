Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE7430718B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 09:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbhA1IbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 03:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbhA1Iau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 03:30:50 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E1CC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 00:30:08 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id jx18so3849180pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 00:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ylVX93kG0pfKLjOK+VyaAAnOVEasqsi8+AYeDV5CIVc=;
        b=m1b089FNnXo/FIiunebnJhh/k60S/WpehXj3Sn+4cJjvq7c7gjsn3qu3e1LmwBksDI
         c1uj3sQjem5jPatGk0juLcrRCEyooTxLT869X7uL5VkZRiITvBItmB0neRIuYzBqVhX+
         ewZGSlmSnNBvkKwWR0vJTGCrtbVA/WUvXlyBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ylVX93kG0pfKLjOK+VyaAAnOVEasqsi8+AYeDV5CIVc=;
        b=NvcBbTsUZimt1q+RcEmv4dCwk3MwjDHprhQxqb9RtzTe1uou1R707X5IQr8aLHBNfG
         6L1H5gHVQHlhEsLl510qPSzLW+gpouwJm4vRJK2P/V0420oO0fmQ4MDRl5ZTqosxdyln
         huLAbX7/vxPEoQ5KIUhh0ahoHg7tSL4IN1xUhbg//Z8ZLMQIZtfoCE2FzPWxOaYnrYuo
         SnjVeFJu0FEQAB4Hwn9EAA3E1hQAxeugqlDyKXbTpFKdMCiCrIv81f9fgpKxzemZJO1s
         zCQLpf+P6KMdWnIll9BupILmavODEWgVYambO1u/j9yu1ssFxyp1g7HT9qj38dilckTy
         e89w==
X-Gm-Message-State: AOAM531cDh+ENZ/zjSUcpOqZAHeXPswPXEN00Sp1kUsPPAOmxnwMPev6
        yPTqJn853A3mz+G78HZQ9bL7GA==
X-Google-Smtp-Source: ABdhPJxv0VGQQsxMPwF5kTuNuglyyXV6LtQH2Bm9BpqAnuekS43gpU7rJFA5oCN9CaT2gYItOLy3cA==
X-Received: by 2002:a17:90a:df0c:: with SMTP id gp12mr10171448pjb.3.1611822608072;
        Thu, 28 Jan 2021 00:30:08 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:304c:5453:303a:8268])
        by smtp.gmail.com with ESMTPSA id l190sm4813102pfl.205.2021.01.28.00.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 00:30:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210128021753.2560931-1-judyhsiao@google.com>
References: <20210128021753.2560931-1-judyhsiao@google.com>
Subject: Re: [PATCH] drm/msm/dp: trigger unplug event in msm_dp_display_disable
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@google.com>,
        Judy Hsiao <judyhsiao@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>, linux-kernel@vger.kernel.org
Date:   Thu, 28 Jan 2021 00:30:05 -0800
Message-ID: <161182260580.76967.3767678954967498619@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Judy Hsiao (2021-01-27 18:17:53)
> 1. Trigger the unplug event in msm_dp_display_disable() to shutdown
>    audio properly.
> 2. Reset the completion before signal the disconnect event.
>=20
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---

Fixes: 158b9aa74479 ("drm/msm/dp: wait for audio notification before disabl=
ing clocks")

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
