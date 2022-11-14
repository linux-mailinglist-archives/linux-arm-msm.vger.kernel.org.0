Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E075628A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 21:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbiKNUd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 15:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235592AbiKNUd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 15:33:27 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281A3276
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 12:33:23 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id n20so10617222ejh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 12:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QCfG+hOC32UcE1+jvceujSzl/rFR67fnp9HdOcb9XXo=;
        b=YZbBARaiZIN5w5hmUzF7Yt5HUb8Fu8ZcAoW26h5RlMwSHRIVsAdn1PNguLoBw9ki+I
         avs6Bhr7b7wxAMHDI3giIi54k5CDbe4SATViP+LZnOobPbn85eYeB7PNCat8brXZqZ/T
         AhbN07fijNjTdg2kBJYXr5RMz1Nf5+naQTzsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCfG+hOC32UcE1+jvceujSzl/rFR67fnp9HdOcb9XXo=;
        b=IyRgNylel/9sFVfzAArvUEBDbWDpt4sfJnnGXhxbHOsW1hLHNu5yuW0RsZz7N9XkSm
         P24/wnxqNyIWsnRkXlFyMXLrucJPov+8h+O79VzP8V7mJo96q+WESS/Xx6NL+Uxws5S/
         SmgXGwemfSOmldpK5N+H3tbbbivaNE0sHiprHd5gyBo2gQEzXIRb0aHDdEvz7KV3I4db
         lA9eyImrh6DFdSFH5AgxW6QB4AgtuMesL1d5koKPYV+l2QJuZAI9oIq+Pilbp3kHgLv4
         OQVQAcuWNzaNSWNYcUROFeaCnQwwXNjPZQcMm0tPYypJ60/C7y+IazncK+Zj8SZ5/dxX
         gc7g==
X-Gm-Message-State: ANoB5pn6ticftLWEHaY055cNWXadI9FmWC6ccKt31HeyvpcOPqTILoc9
        c2KRTkDN/EuRRqiL86aWeCrOEDsAjTCcn4fK
X-Google-Smtp-Source: AA0mqf5BW/rPnE8URppeCx8txjqdhuahYKUmlH7Hk+K9FNn5Qb7BCns+qkQrJhP9w0x/CfQafK2nSA==
X-Received: by 2002:a17:907:765c:b0:7ad:49b8:1687 with SMTP id kj28-20020a170907765c00b007ad49b81687mr11601519ejc.407.1668458001521;
        Mon, 14 Nov 2022 12:33:21 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906318d00b007822196378asm4659068ejy.176.2022.11.14.12.33.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 12:33:20 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso11591316wme.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 12:33:20 -0800 (PST)
X-Received: by 2002:a1c:f611:0:b0:3cf:9ad3:a20e with SMTP id
 w17-20020a1cf611000000b003cf9ad3a20emr9535222wmc.151.1668457654755; Mon, 14
 Nov 2022 12:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20221114194133.1535178-1-robdclark@gmail.com>
In-Reply-To: <20221114194133.1535178-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Nov 2022 12:27:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
Message-ID: <CAD=FV=WB__v5TPFOqnQMajR6MvLGjLYrKrV+qosJYQFTCpROzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 14, 2022 at 11:41 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If we get an error (other than -ENOENT) we need to propagate that up the
> stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
> whatever OPP(s) are represented by bit zero.

Can you explain the "whatever OPP(s) are represented by bit zero"
part? This doesn't seem to be true because `supp_hw` is initiated to
UINT_MAX. If I'm remembering how this all works, doesn't that mean
that if we get an error we'll assume all OPPs are OK?

I'm not saying that I'm against your change, but I think maybe you're
misdescribing the old behavior.

Speaking of the initialization of supp_hw, if we want to change the
behavior like your patch does then we should be able to remove that
initialization, right?

I would also suspect that your patch will result in a compiler
warning, at least on some compilers. The goto label `done` is no
longer needed, right?

-Doug
