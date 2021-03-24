Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93584347D20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236841AbhCXP5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236773AbhCXP4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:56:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B16C061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:56:46 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q11so8168707pld.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=YqCR3r8Dk/Ap4w330iydSCj72+uSVcwtjIoa+AHxLQw=;
        b=PgBr5jHLPacqJEItJHNbwwnXuLO5Fk4dgQuOajM71zxKzxbwspBVkJwxlFs+3lPKfQ
         Xnkb8Fzla0JRHAKYRaiSU0gFP7dQD9M8dymba7QMeCF0vttddN1DLOR0QzjoYYFfsCIN
         qIYDbgi8SkVCsZQnepe92B5vpCU8MCbOcGpaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=YqCR3r8Dk/Ap4w330iydSCj72+uSVcwtjIoa+AHxLQw=;
        b=MP8Ws5nr9WYLRCHtgrhAyNZmcH8ST98GRWE31NOIBjSUFefYf85Ib6KDbtu2C/e5oH
         exv5id8h6kffYVRWCr1b5DiO2Cna0lmAmGnYNDpjeleKPMQf+NpvbkZXO93SGXjUOW4H
         HhHqk02IiJbIvZdyd8TnEY+MbUorpozAnLb4NiaGb9oGsFcYHH6KaTfO+IciPd9vXVmu
         wHwdlPSja/jlIQ3R8DZ/949DiuRW9yT81GtEDIQB4bK+WrGzptxtshjjFGSr/QBeptxg
         KgXLw6Dq4k9nYU0hD3wFk0+uc2ysEstCS/cyJYOy+66wtWMqZJZ87/jgJTmwD7fXjXYB
         4zBQ==
X-Gm-Message-State: AOAM531jbl6FqsZjV3+YKtq+nS3sP3IWppK0rTnnMprwdw6Y60MjYowD
        QAcu0qKs2Z75ByAKC/cd2F9yx43oScUbnw==
X-Google-Smtp-Source: ABdhPJzx7OBjrFG2Ww7vkGVfIrZEpN8LctAeeiuZX+e+O45XO6EB2L6jNC1/OretyXtMBPzf8n+dGg==
X-Received: by 2002:a17:902:e5ce:b029:e5:dc8a:7490 with SMTP id u14-20020a170902e5ceb02900e5dc8a7490mr4328937plf.37.1616601406141;
        Wed, 24 Mar 2021 08:56:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id a21sm3058055pfk.83.2021.03.24.08.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:56:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VfM10w60VUuTW5yXdykC8oXuxqq=FLfZYDP2aUh0P0_g@mail.gmail.com>
References: <20210324025534.1837405-1-swboyd@chromium.org> <CAD=FV=VfM10w60VUuTW5yXdykC8oXuxqq=FLfZYDP2aUh0P0_g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 08:56:44 -0700
Message-ID: <161660140410.3012082.16145667394892749711@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2021-03-24 08:32:00)
> NOTE: if you were feeling charitable you might consider sending a
> patch for "sdm850-lenovo-yoga-c630.dts" as well.  I don't personally
> know if HPD is hooked up on that system, but presumably even if it is
> it's just as useless as it is on other systems where the bridge is
> used for eDP. If nothing else setting it preserves existing behavior.

Ok I can cook up another patch for this one too.
