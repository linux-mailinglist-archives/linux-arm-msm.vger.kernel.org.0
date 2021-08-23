Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CC43F51D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 22:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbhHWUPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 16:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbhHWUPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 16:15:14 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB83C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:14:32 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id i3-20020a056830210300b0051af5666070so29893438otc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=imeFijr1ufQz/lyVbyX52fuMyimnJkFupP8Ym2EmTQo=;
        b=kIQLdC4l7hlpNTMxCAbMmy0l5zXzSOn85mn4Y1Lyvye5+7+wJ/9HAFxD7fWcE3+5B4
         5ijwMcBoO5e8PI16oP7CZ+c+KiJJm3dj51IxjfoiqxbshKwSperqs66DniUnS6ruQIDv
         sm4uUCQhJN4iiCp2GovuPFeW9UgadiAiIIvM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=imeFijr1ufQz/lyVbyX52fuMyimnJkFupP8Ym2EmTQo=;
        b=LxyE9y/nryQLFkwIKEVLRFK+E3rItl1R624hKZfRTFjDQxs5+SHKqklfH5txYliaoD
         mpOLq58QRft4zh9oLKjDIBTinkQ6rVfIw6IBYAfes02jlNEwNUTx3bcJvf7vF8BCB+/v
         dhCK1+N3Fkdgzi3aLXfkZxdvUn1J4+2vP7AovPPKS8Q6ibFqmLrZK5ovTGl3WtlWNn7l
         Ye5QrFxfyhmC6qpiuV3AIbiU9SFLI7enS1xetR3HW56YTr2zp9K7Lw6a4l9E97WbuejR
         8CWE3rLP6Ggqa2H/crmTAECzUnYT3sMu3oLxrHUScmFbjjGRzAGvnHNksQUTyz3Jt4qo
         tzfQ==
X-Gm-Message-State: AOAM530vM9xZtYrH5uP8qv/gylrFmJdCzB0VKBqD/eA1sP8KkZZX737x
        6g2Fs301NpmtSrlFN9j7Frk/nzTu+76rMM0soDJHJw==
X-Google-Smtp-Source: ABdhPJw2HcWyJlmraQaLOXE+VoqCAcv4OB/hNC1N5xlm5WxZRCrdxX8xQZ/oi0DgFlhYMnxtW2ar3P94+BlSUgfx+iQ=
X-Received: by 2002:a05:6830:2b24:: with SMTP id l36mr12752645otv.25.1629749671375;
 Mon, 23 Aug 2021 13:14:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:14:30 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-3-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-3-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:14:30 -0500
Message-ID: <CAE-0n52PEJnsW1bGNZcRuRJVaAPK2CHn9jepjNvRy6=BearZNg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] remoteproc: qcom: pas: Add SC7280 Modem support
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:36:17)
> Add support for booting the Modem DSP found on QTI SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
