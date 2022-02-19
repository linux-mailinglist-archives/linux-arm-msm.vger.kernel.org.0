Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F8F4BC452
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 02:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240733AbiBSA4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 19:56:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240765AbiBSAzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 19:55:52 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4574E27B495
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:55:26 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2d625082ae2so83442857b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6e9XzbPyHYbUgARMJP6T48TY7WCA5S63JhOSi9mRoE=;
        b=RikRBU7xIaIKvWLfe7SQw6ulaZ/y3ifFsyHlUYpwm4CyMN0bNrabJONNFTvSgOXy4z
         UE1+PhxhbbBqGFcgZvQ5KQiY5boog3hwz8Mf83oTOLM2B2y0QHCb8CFJoelkGv7967ID
         oTcVFwNH1UEjoR727/kfKB0NTyQYGVb3umh5akuFLzeKEBKD9OQ5EAP1m2NobiJG+jEd
         LQIZzKBhHXkrprQ4z7hw9V5hP7dE0Pm2RYK1X/WcvoQvgGSKIXU3GDE8bxe1OIdN95tw
         SyHQgaOfoOxHvDvGTXsvWKFcJ4Fc14uryZePzoesB+LDuZVPz8ZWjmIjX2P8N5XhtEnB
         fHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6e9XzbPyHYbUgARMJP6T48TY7WCA5S63JhOSi9mRoE=;
        b=Jy8sI81qM2+NqYfhl55hX5MMNdKzxvVBer624wwM4Ukapm8iKFBkOnBhmG1YTmgiNY
         kXk7nYl/plPKyN5Wo+TstgyR4eatKER5uDHFAEwbEdFHIe1E116T4SEgFzCuM1fbBOsg
         fsCwx0Cs6ELx5N23fgjhZwdHbyfqJ0dqebvJYoD6R5Ak0us0727sbA1Kk1Z38ShwhlnO
         YdlAMhfhHTIk648o7X2ny0mZf8YpGAF3B5ye4ziPmIfy4+nIqEyxh6IET7XMuPK68k+e
         AuYhncB/IiMHiTILFXhcxaKBHI8rItO/C976GshMeNl5o4LD+hJOufwdgdK8ERzALDqf
         QVDw==
X-Gm-Message-State: AOAM531isXM0yKJDkavmDHuRurpZvqz8jMirNvJQb1TFBUH3ARXOi/Sw
        JtBkIOJZ/iNYRZmAmDWOrNWalKs2+gol+w8qjqeJpQ==
X-Google-Smtp-Source: ABdhPJy0QzuFnbO1uSx4wHtdx9Iu18Fqj83SdErZlQ0sdD5fQ+iXFH2oyJpJxC9LTUhmYM+eMpl58Y567TJZ8lB3D3A=
X-Received: by 2002:a81:9957:0:b0:2d0:a8ee:37e7 with SMTP id
 q84-20020a819957000000b002d0a8ee37e7mr10582199ywg.448.1645232125466; Fri, 18
 Feb 2022 16:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20220210131210.24605-1-jonathan@marek.ca> <20220210131210.24605-2-jonathan@marek.ca>
In-Reply-To: <20220210131210.24605-2-jonathan@marek.ca>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 01:55:14 +0100
Message-ID: <CACRpkdbcmmjfybySW572JM1-2s98JZaSnf9OnAepMJEf3oM4vQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: print egpio mode in debugfs
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 10, 2022 at 2:14 PM Jonathan Marek <jonathan@marek.ca> wrote:

> When egpio_enable bit is cleared, the gpio is driven by SSC/LPASS TLMM and
> the APSS TLMM settings are ignored. Reflect that in the debugfs dump.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Patch applied.

Yours,
Linus Walleij
