Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC9B34852A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 00:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239013AbhCXXTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 19:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239026AbhCXXTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 19:19:01 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA83C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 16:19:00 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id x9so382636qto.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KOQ7esl90KWEmnjDE6UGjHvYuLkknu4oxnEsJM3fbxk=;
        b=I8LLHJTXiSFwWG08KpCjmbhYHB4+bJ5Jr1PMvkhPb9guXt4kPXwXSDBb5w3pW6YKP+
         Y3MXDdkhlUigcRn9Soo3y9HjPiYeIjslYj/gs3Qu595nmPh/ErNtubV8ayh2yO3Z4/6B
         tB6bIdWPlgC++IeivTg9oL6lj9EFP1EHRtvFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KOQ7esl90KWEmnjDE6UGjHvYuLkknu4oxnEsJM3fbxk=;
        b=QNZ23jbOHzwuygLHNfPplr03RYEjSmx59j0uXdrAds03XXtVQgj+Mp9YKcZKMCuUpW
         65jQVZLEKOwOPgwvY51nrKHZFOyStky8whQQ8nrBGRp8Lt53wPKB1Jv7J01ZmTcS+cc8
         lK8bu6Sm+eZT6xvGMnFlHYDHOXKYIcevwdBN3MjZQH7Ea+8WVxCJus+8ghCNqIUtGxPz
         QKmaBUSqEhZo02UJMvFLD7eKKI+VaAKHCRBxlZO+dWO0K/3AL80/dQrGbCvhaG9abNvf
         LBgbbWctr5zH+SZX9o0bqaPv0A5uFU1QBqxWYAcmkE5QcNPCOO5jflT3nUkKSE6Juils
         yl3w==
X-Gm-Message-State: AOAM532rh2E3NkZfBXOcfAC4Pg037K4C7r/aZ6CkN6b8jW0WuWSGnv4A
        AG6W/l6kF/F1Z+ClKtP3jn221nsOO2J+0Q==
X-Google-Smtp-Source: ABdhPJwNkHi3+Fps8HSqO6KFN+nrhkhYFRC0iTGpiS9NZSI3DBiriGcRX+phPYMfSqmjEHm53xvgCA==
X-Received: by 2002:ac8:4ccc:: with SMTP id l12mr5198533qtv.137.1616627939505;
        Wed, 24 Mar 2021 16:18:59 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id y8sm2625034qtn.68.2021.03.24.16.18.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 16:18:59 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id z1so346197ybf.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 16:18:58 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr8405375ybi.276.1616627938513;
 Wed, 24 Mar 2021 16:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210324231424.2890039-1-swboyd@chromium.org>
In-Reply-To: <20210324231424.2890039-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 16:18:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQSzanPn03-98L5KT89rkz4D1CcNLrtz2pXOHW8XOORw@mail.gmail.com>
Message-ID: <CAD=FV=VQSzanPn03-98L5KT89rkz4D1CcNLrtz2pXOHW8XOORw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 24, 2021 at 4:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We should indicate that we're not using the HPD pin on this device, per
> the binding document. Otherwise if code in the future wants to enable
> HPD in the bridge when this property is absent we'll be enabling HPD
> when it isn't supposed to be used. Presumably this board isn't using hpd
> on the bridge.
>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Fixes: 956e9c85f47b ("arm64: dts: qcom: c630: Define eDP bridge and panel")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
