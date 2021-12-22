Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6B547D40D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 15:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343642AbhLVO74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 09:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240608AbhLVO74 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 09:59:56 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B9CC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 06:59:56 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso6151066pji.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=R4fAvto+5kiJhIGMycVJNRIDsGMunfWc3NoA9gToFxc=;
        b=yAYsIew16rDxK2O8IBSr18NkIZNRERvjTpiLlglFWe7mdn+WkOxn6IU5Ar2X5kHWqW
         71UgZbTwcoNT5Olu2zDRURo8mWCi+LY6l3M3D3UXfEZicV7wCMfOj7Op5zDWDfVIx2w3
         CRK/Tf/UZM5tSjXeKNEoQbC9F6PHwtEL0AzoihUU5ccqp0U28BRygvV3N2MKvDNhg5on
         pyYw73E46Vhal0zXq/48c7XQxUPw4ihx2Jlb3TMYhB8cjTOutZEgY+XvDoWnVPBlcFG/
         aBOtJOiU8njTxlHaBeQMLTt8LMz2WSbXCA62sVBTUVYano6heJeY3yrb1IFIEHIMWthq
         DPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=R4fAvto+5kiJhIGMycVJNRIDsGMunfWc3NoA9gToFxc=;
        b=uHKQWV3jjHqHuzvqhxOWAlvx8FKgHScnfpFQw2JAGcROexK+1N7U5Bs+yN73mwvSAm
         Tg2BFtfOd/WpesTOBRFjgCmto3GFqUWmmChSMdtvPYZqI3XG/h+8RHuXVVkvYdrAL/lY
         5Jt7CNfnLnjXF2KtVjeoQYh7CN6vUQRGUpH0as3Yc9TVwsrJsToYszut2eLvYWpetFgA
         O0DRHOeLaXkrbnYOv2BnKEbix2MBxmDno7xrs5DjF1rron5Spfvtue1e95modYFLTQMT
         WZ+L+kL2ntGbA1FSCdVdxwsF6wlS8NKybqLrYU/yF4/bx72e+21w+C48bfRC1OfpmzM+
         8o8w==
X-Gm-Message-State: AOAM533O7N9mLuQk73eVXnKzKOxdX+CfuiGBrzdmfraV9pB1PW16gsQr
        OkE5GOW9mHj2ol6ScUEOZTx4tHXJrqFJC2PvHtcX1w==
X-Google-Smtp-Source: ABdhPJxD+B+hmQU/gZDQgKwOCAzSvQG1Z4rSyD47kKB+7bVpUE/kfF9NRmwJWNjPCxWHnv2nROBlW7MbbxP2zerqXEs=
X-Received: by 2002:a17:90a:a6d:: with SMTP id o100mr1780124pjo.179.1640185195954;
 Wed, 22 Dec 2021 06:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20211206151811.39271-1-robert.foss@linaro.org> <20211206151811.39271-2-robert.foss@linaro.org>
In-Reply-To: <20211206151811.39271-2-robert.foss@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 22 Dec 2021 15:59:44 +0100
Message-ID: <CAG3jFys1MO461TeWMdasVS0B_ya5NU=5mMomchq_nZ+X+v07SQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: camss: csiphy: Move to hardcode CSI Clock
 Lane number
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn: The CAMSS changes related to this series have just been applied
to the media tree, so I think this series is ready to be applied now.

https://lore.kernel.org/all/20211206151811.39271-1-robert.foss@linaro.org/
