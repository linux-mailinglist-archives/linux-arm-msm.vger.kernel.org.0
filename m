Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C77D17030F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 17:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241917AbjEOPGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 11:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242058AbjEOPGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 11:06:32 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B931170B
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:06:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba74affaf35so3996912276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684163167; x=1686755167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og220UowjXbjVmuC4TtBNxJbr3SzQPFOA/NQzEh0cHw=;
        b=LVhEC0Y5e0ObjYqnVbNK+3PEiCLOHdTn5cxrc2szVdK5t+KARyafPtAJ8jjRq5J0aw
         RF6ZOI4ME+M4jbstXS8YJlfUFI0h4QO69lmhrMV8hrIBR12xQoS/x8wD4nDRhpz56hc3
         jlK+IUNku7gnSewXWqdpKTergvV3WE6+YWxAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684163167; x=1686755167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og220UowjXbjVmuC4TtBNxJbr3SzQPFOA/NQzEh0cHw=;
        b=T42WnNfP3O/Lld7kHm+PEnOZNzhJP3FQdYZhW1khdL9nFQLAihmbmRg2MKa8YIyPpx
         wDUPadJYvJxmks5SKGKlFEYwgImEIHxPKayt5GuoD5cKlbSo7WAfdQwGOtM8z3bVfocv
         zQKYeXkMHumrmr7zCdEL9nggGX0YOBdZHfGof3cURncxowOu/fxHd2s8u3tWsXSVryUA
         Qd1s0+vlymrkuJ3fOzUFXGkydeuNNaDL465gZiz4+kMk0KzV4yKof/m5c03oLYfQwqOC
         lzcXIQbYhWEOVI1ldiGLTHzUqupBt9uXiU23lFENVBZMRZl/wf/Co7ok6hhMHNaUOToE
         cS7w==
X-Gm-Message-State: AC+VfDyrRpe3zsRWyE3FX/LX6rsXGMs4F/PRGLvShsVZGnZCE9LkAAlY
        RGjtDaFmGAFx7IR1360Zbc1WZVD/f46YwraAnuk=
X-Google-Smtp-Source: ACHHUZ46gVgzsYL9YFOvbTVe4bBVXQmDghJdb4zRB2863r/ODPjE1ZSHMAHw2ESD5/UGHo/dW/w7YQ==
X-Received: by 2002:a05:7500:c626:b0:106:b701:3661 with SMTP id ro38-20020a057500c62600b00106b7013661mr1085205gab.62.1684163167487;
        Mon, 15 May 2023 08:06:07 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id d2-20020a05620a158200b007577ccf566asm5571994qkk.93.2023.05.15.08.06.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:06:05 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3f51ea3a062so233481cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:06:05 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:3ef:3083:a437 with SMTP id
 e17-20020ac85dd1000000b003ef3083a437mr1183921qtx.18.1684163164854; Mon, 15
 May 2023 08:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230515145323.1693044-1-amit.pundir@linaro.org>
In-Reply-To: <20230515145323.1693044-1-amit.pundir@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 May 2023 08:05:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXB9tJWTcQJ5zuJ0zNhBD0FYvQf1y+zDFFmY9CBd7CCw@mail.gmail.com>
Message-ID: <CAD=FV=WXB9tJWTcQJ5zuJ0zNhBD0FYvQf1y+zDFFmY9CBd7CCw@mail.gmail.com>
Subject: Re: [PATCH] Revert "regulator: qcom-rpmh: Revert "regulator:
 qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS""
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 15, 2023 at 7:53=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org=
> wrote:
>
> This reverts commit ad44ac082fdff7ee57fe125432f7d9d7cb610a23.
>
> This patch restores the synchronous probing for
> qcom-rpmh-regulator because asynchronous probing broke
> Dragonboard 845c (SDM845) running AOSP. UFSHC fail to
> initialize properly and DB845c fails to boot regardless
> of "rootwait" bootarg being present or not
> https://bugs.linaro.org/show_bug.cgi?id=3D5975.
>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As mentioned in the other thread [1], I'd rather at least do a little
debugging before jumping to a revert, just so we don't end up having
to do a revert of a revert for the same driver again.

[1] https://lore.kernel.org/r/CAD=3DFV=3DVSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd=
4eyhn3rHyA@mail.gmail.com
