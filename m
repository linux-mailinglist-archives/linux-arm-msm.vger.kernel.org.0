Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDE41A6E30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388979AbgDMVUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388968AbgDMVUB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:20:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB489C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:20:01 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t11so3087473pgg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=pKAQSooDbZrdFyfYyi067x5vIWQ2215/izUpXDa5f+E=;
        b=INlZhhtr9HTKbJi29G1pfAoNVsYeXe0L3auEF4//YpVAQOTclNOe25zQAwRqdg/8Qb
         lsjXI+S3U8jMtWtS6AivQSb7sK2XIA2Au/Xm+Q708dnuT+8UKgdmpEUqx5WoSRPWt2sw
         yfT5j6GqlCh8Fx8smFZSoh9syJmHWK82LphAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=pKAQSooDbZrdFyfYyi067x5vIWQ2215/izUpXDa5f+E=;
        b=tDsaUYYXb2AR8jk5I9Fda+Ei8z0r1eauT2Val2w63PZntEAqSOBto/riaZAs3CwlRR
         deu087WaOYUKOI+lxpGpLpvJXRGJGt+YwqyBqEQV23Ttl7PS/1kCIlfkLmv+71CqpJBr
         RgilLftb9uYqxHzhig+lYGfsks+ZKu+0i6R6dmhLQOnqzNSacVQbzcaR0fVwieYjsX+h
         y+RTaaMbBykIXUUPcxjF6d8c2ajjJObCfKavJ/u0If4qZvzDWQdOL+LSh9BOW9BOP3Xj
         GkDLMecJPmrWtoDi6N09PXJDoxRsjJZmQY+pzPdTLfH/t0Zir6gLJ93FTAWYfW8JWdz6
         e4ZQ==
X-Gm-Message-State: AGi0PuYo5xkrvbk1C7hFJyD/jkUUoKAWmlIUOLNJG6/PmGauBXeV0tpd
        YSf3JvkiNsYJijQUj8wYtF6/bw==
X-Google-Smtp-Source: APiQypKXPmEfDHL9hwN5hZ9xgiPDERG+HakjFhpdJ5N3jsTQ1pBXNlu14MtiZNv23C32zl0+CGmhgA==
X-Received: by 2002:a63:4e21:: with SMTP id c33mr19743362pgb.305.1586812801328;
        Mon, 13 Apr 2020 14:20:01 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 203sm9522055pfz.217.2020.04.13.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:20:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
Subject: Re: [PATCH v4 01/10] drivers: qcom: rpmh-rsc: Clean code reading/writing TCS regs/cmds
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 14:20:00 -0700
Message-ID: <158681280006.84447.15495634572502547499@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:06)
> This patch makes two changes, both of which should be no-ops:
>=20
> 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
>    write_tcs_cmd().
>=20
> 2. Change the order of operations in the above functions to make it
>    more obvious to me what the math is doing.  Specifically first you
>    want to find the right TCS, then the right register, and then
>    multiply by the command ID if necessary.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
