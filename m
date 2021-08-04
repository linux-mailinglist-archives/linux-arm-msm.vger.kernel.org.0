Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC213E05EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbhHDQ2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 12:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237636AbhHDQ2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 12:28:54 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F274AC061799
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 09:28:40 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so619440ooq.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=YJl9Dp+HFALeJtquI91ykNZTzDaqiOMR/BEIZraugLA=;
        b=NPi/wThKhegJOv29TATNg7YLUc62HzWzyI2P8DDoUHEVYP50DKPf0UFgqbYg04wAVa
         mR0VWfpI4l5VUHr4rF74AcUAW/nEeFKdFNIMi313/NnkUHuRNBtNReY9S6ndzY0wm/tG
         SSvTksJUHIqUig9jPvfe9LuPn2DebrvL9+6uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=YJl9Dp+HFALeJtquI91ykNZTzDaqiOMR/BEIZraugLA=;
        b=Z7kPezIXiBvQMirKdx8eQEP6mFynOxZLWWoJkk88JMl6gvZbFH1rxbk4GZjQx6c84t
         gqHE4e2npHruMs1ILWdEFgpHy55/2AEiqpoQPpoSaWad1re2mOJ2WmJ1oeBXzCZ/t1sB
         5X4FCipxeMMycsDKfqOGmhsg91Vd3Z/CvFatwet4fYneJelzD4oS+IhGyWH9c/z+vtwM
         5xlRM7KGNa4/sNhPXW7sxafolFILKVhDnPTLlcUFAZgWWEsugtaTp5kjQAHm3ef0lELJ
         FgWJtV2kG4bl5ABXhpVufvqQvuQQPU/0PcSx/mUjj33H1EgTYrNKeyKE+FlBpNEE9BlX
         s/2g==
X-Gm-Message-State: AOAM531GmTqE3D7G4dNSj5qOn7GBLGQZ7/p7FqAeIpOkZlEwf8XPOHSJ
        oTo0SZhWX8IjXKxKOXxtmN7su4SqKpJ2/bHm3eiFqg==
X-Google-Smtp-Source: ABdhPJzyWPBPVIygrEAq4SFdclm9lnLtKV1Qk4UcANBrV40RTjaxXlxoUlMUX5rreE2sq2LD6udGEHf3JIMbKuKRrGY=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr301841ooi.80.1628094520323;
 Wed, 04 Aug 2021 09:28:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 09:28:39 -0700
MIME-Version: 1.0
In-Reply-To: <1628082199-17002-2-git-send-email-rnayak@codeaurora.org>
References: <1628082199-17002-1-git-send-email-rnayak@codeaurora.org> <1628082199-17002-2-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 4 Aug 2021 09:28:39 -0700
Message-ID: <CAE-0n53b5XEc7gctkKPKrBcZo=2rbY5Stt_FQ0E_XWRQ7RuDrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document qcom,sc7280-idp2 board
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, skakit@codeaurora.org,
        konrad.dybcio@somainline.org, dianders@chromium.org,
        mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-08-04 06:03:18)
> Document the qcom,sc7280-idp2 board based off sc7280 SoC,
> The board is also known as piglin in the Chrome OS builds,
> so document the google,piglin compatible as well.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
