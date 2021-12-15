Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B943E47507F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 02:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238863AbhLOB24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 20:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238832AbhLOB2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 20:28:55 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A017EC061401
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 17:28:55 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso22966981otj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
        b=JGU0cApMNO/QObrJvFbIIED25d0QAjNji23cp4HxXLFGTpEnaeb2d947VuokTPrJh4
         GxqIDaSVHw/ZVrgLLUJ36p6hc4fc2Ao3NBWHZY9233yxuiRmSq0+VA+k2c7w+AK1ethh
         pIXA/919loix9H/jY9SRtqVmU7bJ5WRstSyhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
        b=cG/yXUbOpzk707LkyxbvoUetIP5ueu9pUFvxWkTXcQQtH7wC34AQgtR+o+icGOgX+4
         Wj70Sj24UeG3SDO8n9mP+XD24xxggKx7nSLX1om/FS2dMOe6u6NorLqgp2FRlS99X/oc
         qFu4ZJt0siw2uF55t1j21weWQVm79/iCWPNgYqFl03vydkBdgpM7q3vlNGVPtWZDz63J
         snyDg756tpipD62Dlro3hVsKgFC0Cea4El28PGEt4PgGDsy3yMnBeKlHc7z1qpN4ACeT
         YuKsxn+pXbcScufxO8aWJIgoKtwepk6i/QAUT+6uli5r1eh/VuDhRlv+2kdG3RbzwVzm
         3gxQ==
X-Gm-Message-State: AOAM531M66lQPcxvl2BfLGgOvsR2kY9fuzV3fLS21lanJlIebJAHb7Lz
        jYN0qRZLfeN0dyU5mJUS2UGlCAm2d/cWuAbXmW3iqw==
X-Google-Smtp-Source: ABdhPJwVvIEVSzGWkZ6r6tum5sN5c25e8CxEhW4XCE5QW3Fp24XzJo9z3AmfNkACncaxRnmD6mxorka5IqffVKX3Lug=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr6875613otj.77.1639531734897;
 Tue, 14 Dec 2021 17:28:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 02:28:54 +0100
MIME-Version: 1.0
In-Reply-To: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 02:28:54 +0100
Message-ID: <CAE-0n527T71LPe5R+S+YzEqiid2-QrFdvS2T7MWrakTccyG45w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add pin control support for lpass sc7280
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-12-07 07:35:34)
> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.

What ensures that the LPI pins are being muxed out on the pads of the
SoC? There's the eGPIO support in the tlmm driver, which seems to let us
override the LPI pins and mux them away from this pinctrl device to the
tlmm pinctrl device. Should this driver be requesting gpios from tlmm
and making sure they're not muxed away to tlmm so we don't have
conflicts?
