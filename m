Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB4741A0DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 22:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236967AbhI0U6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 16:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236212AbhI0U6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 16:58:51 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A827C061740
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:57:13 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id c6-20020a9d2786000000b005471981d559so26195290otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PlyMlGa7MDqDwyrJ+9Nu78wzBfZgUOD4Mgr0q1/+DtM=;
        b=moPLRYA1b47/e+Ag8chwN5277xtgkL54F4pJjVzJQ8CJvxpDYXlG4JU36cXnciVIJg
         w7LAFtvv3vssN/tsad0nhW1QFW7gKGfSSGJBWoz1eg/Q/IAqVM3+TcIxKWn/73XjSnb7
         mNSOT3Gij3AvCdxttNYIyO7r+uBx7T/hwSQYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PlyMlGa7MDqDwyrJ+9Nu78wzBfZgUOD4Mgr0q1/+DtM=;
        b=MABBUma5gQTwXWQ8o8URnYGpIwZy+g/2fdeUhkyRpM10U9REwOJN4N8x/Ls+NhFlx4
         dayCBP8jAUrZwniTSXt2UQc3Oxc7yqwft8cNOcQ3PTx9rZxf7F9jqeD7AF5G3ddmMavQ
         yajxZECn/fcxx8YQd5HoaXWdQc86uUO6O31MngzlZcm+VbHSarf0UjVeqtTHNBhVAofb
         6OmGo7+w6jGOBnskjuiJmBZrlXFrjtXNk3Xh+bE3FB6rKaLfwS73KgcbUsJf7eLDK809
         BtDsU/j2/BoQnquSdgqqB77luT8Zj8kwVBLoyo6XuYyoOkvxBUwcEjoLKAY3W+zjme6o
         x+8Q==
X-Gm-Message-State: AOAM531dqBU8+0jJxMXDvad73JQ0aW2FzzF/RyQfD6MAaF4HPsb+zbXM
        gEzh8i6v9zELVgCEVdX3VS7H5nnNy2rlly5/1xNlkw==
X-Google-Smtp-Source: ABdhPJzetWLzdTY1Zy3XhA67zGHzvF4rx1QkEDk19MmphpfXgqeCf77aOCeShKwuSbYtfHyG4OSseqvUAa7Ch8aqhU8=
X-Received: by 2002:a05:6830:358:: with SMTP id h24mr1721655ote.159.1632776232722;
 Mon, 27 Sep 2021 13:57:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Sep 2021 13:57:12 -0700
MIME-Version: 1.0
In-Reply-To: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
References: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 27 Sep 2021 13:57:12 -0700
Message-ID: <CAE-0n508_+MkVz6t0sWF_q7ofXXWHADQSWZCGxk3rtS=td9=fA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: media: venus: Add sc7280 dt schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2021-09-27 04:46:37)
> Add a schema description for the venus video encoder/decoder on the sc7280.
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
