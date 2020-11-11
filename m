Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A1E2AE623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 03:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732123AbgKKCIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 21:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKKCIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 21:08:50 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B98C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 18:08:50 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id w3so256809uau.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 18:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9CTtCQABE7EZnyvMRJRp+ux2mvwXMPszr5VQjn2UmnU=;
        b=D4hYa65WfHrMf5alNOxHlfnicpj9Vucke/Ha0ieZmTy4CL5qv4AS08Mzgf3N5Dg3LP
         GloHepCI0Djj9Hb7x1bp/ejfxwmZbgkM7XrU5q5Yi+icuTUuhAI/m93GEiWOeeHuvt2h
         QW6MGb5eCzhsMdU4s31tUXt4719VQbYGFbwL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9CTtCQABE7EZnyvMRJRp+ux2mvwXMPszr5VQjn2UmnU=;
        b=PC1Txnv/To+kH8YUKf3OLke6GHWMiV3F3ijm9pLF2OUukp0dOVCb+F2P738xpbwBpT
         rYa68+yPeL5ZtSI5c1Gx6ya0Lv6ZGwEiG9FfDu8R7YbIq/YL9gZDeAhQyrgNuRjexFSk
         IvkE6Zf5o4MLrqTS5LShVugPp5W0doDX+vfAQs+x4kNb7rupY4B6Q643LpecrBIyKCbg
         2ebHKasaToO5qyGahtGhw0Smr8cDJb4gFeYkMFp7XFE/vE6lHGyGLK86nzdxG+gLX77B
         hMkxJvpw+wAZUKvzRwoqdbyyDMrOg+KswjcrEt767FKn6Y5iDo9vB3fVhPPDa7kP1aE4
         Q4Qw==
X-Gm-Message-State: AOAM530y0+dnNHPIFT1UPex5cDfi4+S/JxVtxe3+zaoI5npLTqQsKG15
        hX+G8+q5lcD4ahZqlTAxbb/Bya3LKpMeew==
X-Google-Smtp-Source: ABdhPJy/DKVSE/FmuH7jgYgg/22/qyaY5K38cVUKn48POUX9g6Jy35RhQq77NnKeHp55J2J+P1bn+w==
X-Received: by 2002:ab0:3154:: with SMTP id e20mr5538487uam.43.1605060528583;
        Tue, 10 Nov 2020 18:08:48 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id l76sm78060vkl.26.2020.11.10.18.08.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 18:08:47 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id f7so291964vsh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 18:08:47 -0800 (PST)
X-Received: by 2002:a67:f142:: with SMTP id t2mr13882174vsm.34.1605060526929;
 Tue, 10 Nov 2020 18:08:46 -0800 (PST)
MIME-Version: 1.0
References: <1604687907-25712-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1604687907-25712-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Nov 2020 18:08:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ws=s_XU8Fk0mtVmjbFDOrmYrDPk7pbLpWfBAw=bzRmsA@mail.gmail.com>
Message-ID: <CAD=FV=Ws=s_XU8Fk0mtVmjbFDOrmYrDPk7pbLpWfBAw=bzRmsA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: sc7180: Add camera clock controller node
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 6, 2020 at 10:39 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Add the camera clock controller node supported on SC7180.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

This matches the bindings, which has landed in the clock tree.  It's
also sorted properly.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
