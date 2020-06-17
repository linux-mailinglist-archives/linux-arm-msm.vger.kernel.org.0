Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880B11FD677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 22:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgFQUyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 16:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQUyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 16:54:15 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F680C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:54:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i4so1652691pjd.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OA+uiTlyL85CZVRoQNcoC7+qlZN6RmKLWW5aiSiJuSc=;
        b=NH/VqbBGwSaY1nzrHm1kEj9rcr4pDtofLKRzAdXGVa0FWB8cs7zmHv2MrzuTEOxuoR
         jqnS8y3QB2ZPfKLqOdPtU2EyEZqqlWe2H16s3046nhZoRfQ+NmZ24dyydktP0azd4CH9
         vpvjer/AXROo2NgkyG2Yv5o67ILRWOfh6VDE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OA+uiTlyL85CZVRoQNcoC7+qlZN6RmKLWW5aiSiJuSc=;
        b=BHcgbIrElDvwPzl+fFrovxbf9Dwurzn/4oVj+MZ9N9b8Jh8ydgPG8X2Hp3l/I0PK9A
         vkRayQiYo8ZYE6Wdbhs+01ZZUcy8T+n9Q21AMhmDxzDuXDZQKmrzdTvNw95u2aQUSlWZ
         ABZ6xrWBqTeG/2kGoejQCBEItmzMaenzHB9W1Ve5Syn7HRcjIs+Ph/WNptwFZOqZcMfO
         nctpWbGfZfigBgqsJcjGa74bxGYZnqMo469nRBfKRwqWuaXJqjSf/QrXlKU7ifrw1GDg
         7Ugnrw5XZPG3xOwpPbpo0FcLHLuboKWA+5NIRzOnt5MEbvwZpXpopu4hUJisVR13PfRU
         DNPQ==
X-Gm-Message-State: AOAM530ta32ZWfOY2WY3TgdDfpDDtx2/ipRHh7f+3IXeghH0V5pxtKEc
        PW7/FglIrplDZMNTDA2daBTrrQ==
X-Google-Smtp-Source: ABdhPJwQzv0SQLHzKZqNG5RUwMkhrA80IwPwJOJQUpxUYPiq4LFyAiKMcUt6VkqSVC+bEy+YrFSmmw==
X-Received: by 2002:a17:90a:f414:: with SMTP id ch20mr796741pjb.97.1592427254228;
        Wed, 17 Jun 2020 13:54:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j6sm673200pfi.183.2020.06.17.13.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 13:54:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616034044.v3.3.Id8bebdbdb4d2ed9468634343a7e6207d6cffff8a@changeid>
References: <20200616104050.84764-1-dianders@chromium.org> <20200616034044.v3.3.Id8bebdbdb4d2ed9468634343a7e6207d6cffff8a@changeid>
Subject: Re: [PATCH v3 3/5] spi: spi-geni-qcom: Check for error IRQs
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Alok Chauhan <alokc@codeaurora.org>, skakit@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Wed, 17 Jun 2020 13:54:13 -0700
Message-ID: <159242725302.62212.16716926914794028093@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-06-16 03:40:48)
> From reading the #defines it seems like we should shout if we ever see
> one of these error bits.  Let's do so.  This doesn't do anything
> functional except print a yell in the log if the error bits are seen.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
