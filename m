Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1407543A4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbhJYU2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236073AbhJYU20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:28:26 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A617C04319B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:21:03 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id y15-20020a9d460f000000b0055337e17a55so16585285ote.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2bwvidlggTYqPYdvEnjOvk7VU+AKnEUaEntsTXBWAFo=;
        b=QlMEgpBJ9ktL1Opdpn5bEbYppOzz8dAxIhFM1fS/dyAlTNLIsRZpVMwvZCw8it46TV
         7PsHfIiTCVF3zUe8SyWC2+4ulLziCOVa56PohaFbunFmZYFTwT9O4lRllgezN8Hg/ExP
         i2/v7r23NiyEEQrRxBsnA4u+fn4qQ1rfVcbPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2bwvidlggTYqPYdvEnjOvk7VU+AKnEUaEntsTXBWAFo=;
        b=ysZYki03o07vrOLxBlVO3zxYAyx5TrQVp2TTc26nfWo6Hq5b8RG7nt9oPyeKAGgOiQ
         9KGODX3Ebc634tl25f2G3GY2xBc6VhnJHMEMtVN+3hEuA+n9N+1891fjWl/D6Qg9hUVw
         dmWmIpXiKqDHQ6zQNqYgnJ9+xzuCnemIPG+ZDldR9per8MXD11QtkTx/0CEkuqH5M8zs
         +Mh014/G7zUPg0qLflF9KRxsoZyT4hDRRhk0HsYgOezpha+ZPLSsvq9waRUtQT66l5sH
         GCZF1EkrmYWxfRXpzSxp03rek8+axvLkgqAU+umfIS994iuw4fRZEt6aHsOEm+3XSR0Y
         AmHw==
X-Gm-Message-State: AOAM530JIXf7+wIkcnC0ldA8KHH39bjV7qWxvjYv+2/FFqhS/bInGsXT
        88d9kwmhW7TEfau3uryypXqg3pNbIFJIkqG95cjEfg==
X-Google-Smtp-Source: ABdhPJwdShfN68KpfDhT+2JDhJNv3XDUA5odNLOwOPjxhpTa/LV7X8Gla3x9vxWUHGPtAQOIO8tzMjzdDyBGswkThuE=
X-Received: by 2002:a05:6830:4187:: with SMTP id r7mr15519057otu.126.1635193263072;
 Mon, 25 Oct 2021 13:21:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 13:21:02 -0700
MIME-Version: 1.0
In-Reply-To: <1635070162-21669-1-git-send-email-tdas@codeaurora.org>
References: <1635070162-21669-1-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 25 Oct 2021 13:21:02 -0700
Message-ID: <CAE-0n51c-og98OmPGPooeV8XaRnpN=VGRM5GuwBKKfvbYzzZLw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add camcc clock node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-24 03:09:22)
> Add the camera clock controller node for SC7280 SoC. Also add the header
> file for lpass clock controller.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
