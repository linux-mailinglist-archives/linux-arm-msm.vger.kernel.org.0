Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3897026D487
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 09:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgIQHUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 03:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIQHUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 03:20:42 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2432EC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 00:20:41 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id c3so655742plz.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qTwre4ZeIJuKy55xpBHaxVBN8pj7CPhlTLeYSSpiSIU=;
        b=mUK1l+0V3m0aQzgpa7FBva6vX516YzP+V0Ikp9EOOpWanHA6Oqd/eds6F+JWOODp5F
         lRVkvzD5o394JcSu9xKkcS+1wIY/QVYxmY8V/+1GAwI8vuVSxeRJquEr4tUCdJ7dgwBS
         JPwCv9bw4jQvsjgSpvgiFXug1bnoUS8X3LQqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qTwre4ZeIJuKy55xpBHaxVBN8pj7CPhlTLeYSSpiSIU=;
        b=mW+U8xLzWLaFetv+ohUSUPLUB5DmgHbeST+CMtGt/F1esMEzqOFCpaeZPzPZc/rSHC
         zk8NkQLcCSe3dY3TnHUrv/OT0o/iphmZAXS9NJGnDx1+7shM+jBQ2BDO+dhrdBu3JORq
         efcOHY75y5DSefv9T3HQAP7nKqVf25agauK6af7YJZvzhe/BFVlcJIAsNSucEpSu26ev
         eewJc6HIf0YFCYLz/fIi4/Svaz/rx46ydeDnxUoUQQDxg0dwMH8NWNafu/1VEMD4i2+I
         OxeGn+e8aXg6LKT7vspEL4+dLG4uC6WUbrml7xCaJFNL4jdyFzimxEQAzI0elYTLp15Y
         BLdA==
X-Gm-Message-State: AOAM531vgICdgssNJsg9C365pPmI4Cs4ekN0ZunPheUfyCOfX0Tkcidc
        7g0Fyo2wt58tuGM/qWEQ9/PuVQ==
X-Google-Smtp-Source: ABdhPJwg+azqcg7sWP3zo0LXxIcosCEY+c69pW80exTxTNCPi7oboCX55uPw+dUh9lC85AB99OkYuA==
X-Received: by 2002:a17:90b:1916:: with SMTP id mp22mr6792303pjb.132.1600327240752;
        Thu, 17 Sep 2020 00:20:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id g23sm19530034pfh.133.2020.09.17.00.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:20:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600305963-7659-2-git-send-email-mansur@codeaurora.org>
References: <1600305963-7659-1-git-send-email-mansur@codeaurora.org> <1600305963-7659-2-git-send-email-mansur@codeaurora.org>
Subject: Re: [RESEND v2 1/4] venus: core: change clk enable and disable order in resume and suspend
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 17 Sep 2020 00:20:39 -0700
Message-ID: <160032723903.4188128.6871272126838595856@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-16 18:26:00)
> Currently video driver is voting after clk enable and un voting
> before clk disable. Basically we should vote before clk enable
> and un vote after clk disable.
>=20
> Corrected this by changing the order of clk enable and clk disable.
>=20
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
