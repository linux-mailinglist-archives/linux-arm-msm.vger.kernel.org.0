Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571591538F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 20:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgBETVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 14:21:49 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:42609 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgBETVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 14:21:49 -0500
Received: by mail-vk1-f195.google.com with SMTP id b69so892330vke.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 11:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
        b=d+Lea2T1FikkJSXKbyM1VkmMu7+6OK51opstzFjKZqfVTWGc0HJyavyLb+VPLonbdH
         XamEHLtjdwui0xj8WnEoC7whi/BeT3DvPVSnA1XJbAN0mMEripODaa76GX6Q5KujvPEs
         uxYN8bYLDYx5xjHsKtyyQHKN8OKwwXdxQ/T74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
        b=taF2Q6SpTSntbNbPTy4GXUOuXvKnW7lHp9/UCWtKqIeP10Zd2ufH0eXJpK8Xwje3ta
         GArG/qej/2mAldckOgzLpq5yExb+GasemmFokAbflhCf6D7gjovhUpIB1MWIHhN3ETkG
         ryFLbzEay+adnEWXnFWEAOxyH/zFfZbBs3xQs5pedxmMcrTK+tBNPgv+5rKZTCzSKQqK
         RNRshUPtBchepcwJtP2mrNbjt2+/pu2FzwhJ9ly4ZHGDG+FvcNGmrG0uq7vWfhXHCMal
         Z0hhLrEFUBGVFijzaSqZlN6aY4Qf/q2WtGj6RfvKVb6I4YTvpT6OHSC0NBB2gjlEe2m+
         KDJA==
X-Gm-Message-State: APjAAAUHt9N0sp/GrLxEQ3JrT3Y4Hm1QREHhzi8dhZNY7kKJAbU903oh
        4phw27zMYwRpAHCJlwwMVa40kdVr+w8=
X-Google-Smtp-Source: APXvYqwJlIIfnuEcx6RPYTf7fOLmw8dyseFUhoaFOyNvLWKTWmtsTU2S0B39p0i/bX2/edy/Qf0hHQ==
X-Received: by 2002:a1f:6d82:: with SMTP id i124mr2686927vkc.4.1580930507114;
        Wed, 05 Feb 2020 11:21:47 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id p7sm260150vsd.32.2020.02.05.11.21.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 11:21:46 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id a2so2125669vso.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 11:21:46 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr22314847vsr.109.1580930506045;
 Wed, 05 Feb 2020 11:21:46 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org> <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 11:21:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:01 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
> In the cases where the GPU SW requires to use the GX GDSCR add
> support for the same.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.

Other than the SoB issue:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
