Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7EC153909
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 20:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgBETYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 14:24:54 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33330 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgBETYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 14:24:53 -0500
Received: by mail-vs1-f65.google.com with SMTP id n27so2139766vsa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
        b=IrCdKZxlk9MGjOVLL8nvg7LIAvfP0+eaAMZGI14LPfO2Xsvm/Oni8/zwNx3GyuHFVk
         xSLsRYvA/h9GJOGwHl3TB+be2gSu88KN9DX+j1QFvvlPQfCSgm7+m++IUH5+Awt0SV1x
         kg/476pbpukR7JOK7GsTJOiWYUwIcxVk69Ivs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
        b=HWfLczNryUJK2OgFCArta7xdExnlzfKp5+yuncCDQOSw1V96lvOI6ZcLADXrxgv7a4
         MGKflWicEvQyhaKQeriVP6bi1XkkCHkCenllre5N7NHOWTdDOsrMbtlh9z6wzM/GNy7J
         7FHS7p6SBT2gG5zcpKiax4wvLyqjlRIRW45uiUFvT29UhATXPpy19V9/xriAyTWMUVWJ
         rFt3xfIvDRauBg7ZPUJQA07UiugEXKhPbCGswd/hXAIk3cbJzS8pCAZ1FTmPd1J5oU1G
         oH9MicfYboVUc2qOuj5wcRJKiSrdHfifYcqzNJ7Vr0SY8RER0oxHT8O9AjSX6kwwdKvD
         o3JQ==
X-Gm-Message-State: APjAAAVyhgsaE50kYV5Dx4T9FrmfHlSgrkgnGO+XMVgpCwvBmP7wG+v1
        DnPYvFIQyI2DXWRZzcfO7YbnC513iWQ=
X-Google-Smtp-Source: APXvYqx4RwpDjM/11HI/EBK4gRP8p2uFjScPj5X/RGsrWBfqhXI065z6dB+QNOO+l3/6YkCljY6PSw==
X-Received: by 2002:a67:1884:: with SMTP id 126mr23089709vsy.219.1580930692729;
        Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id t11sm193778uad.4.2020.02.05.11.24.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id g7so885878vkl.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 11:24:52 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr2748451vkf.34.1580930691696;
 Wed, 05 Feb 2020 11:24:51 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org> <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 11:24:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> +                       power-domains = <&gpucc CX_GDSC>, <&gpucc GX_GDSC>;

I should note that this is going to be a PITA to land because the
patch adding "GX_GDSC" should technically land in the "clk" tree.
Without extra work that's going to mean waiting for a full Linux
release before Bjorn and Andy can land.  It might be worth sticking
the hardcoded "1" in for now instead of "GX_GDSC".  That's what we
often do in cases like this.

-Doug
