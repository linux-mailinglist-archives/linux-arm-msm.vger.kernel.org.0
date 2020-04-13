Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4F91A6FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 01:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389889AbgDMXDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 19:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389877AbgDMXDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 19:03:19 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E951C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:03:20 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cl8so3291217pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=HERDNU5OH+PvjNlr9iQyGhHNhXKozsGVzeIq4WUGW3k=;
        b=hK+WqM+t96PiNuHXnWPqKHQPZc1JGNjJWJT5mEzKRTCelbFKPswB36sT0fKUvXoF6k
         O2ceUOlo8V6WR/TmUKoHcnZZXePSwNxeVe/xlEr/Fbbu6mge5v6VoQBxguXpNmvImQ2a
         uNEhY+bbLVSmRdItQ8b48Zd4wUUsA1+ogPBcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=HERDNU5OH+PvjNlr9iQyGhHNhXKozsGVzeIq4WUGW3k=;
        b=ABfmp8MeixrCoVI5ReFItQzI5ptw0Fsf7s0ziqsU8MIt+aElrFrTGx6ANvuuZXSX8w
         IM0oW+3GWjk2Zwl/962NLm39FL5JW35F3EGQZRCW3UCAIwRHP+qvo1VZ0VsgDjdn/tXK
         2Mtb753WRvwSwTkGRMkEveYb/3Cb0wGKHEMxS0/1+ljSVvEXSByX6QuYbHDHm3/GMV/5
         Lgiay9BUDYK7/1+rSuDlAbaCwkVLRf6isOY9KBwcvVLNcgdz1jSGrGMe0qDwprcFuwyx
         SWB8nGyjVp/H7GTdQIS4vm7r/Ocr7ljC5AA+xj0kFwHPotx4XLAaSFTopc6jwhUyVHC+
         tKdQ==
X-Gm-Message-State: AGi0PuaeSvGt/6cNOqvel4sEXIqklH+aTnXpmvg6U3nLSERcVV6pGcIa
        rbmMk2MjU4OGY112T+/y80AtuA==
X-Google-Smtp-Source: APiQypKf1Cahutocem0pTsNwiMfVJ7pWZwqfgLYmUySDTv+Vq+QdlltB30vGfcmlfX5PJ1948DUtXg==
X-Received: by 2002:a17:90a:718c:: with SMTP id i12mr750180pjk.58.1586818999764;
        Mon, 13 Apr 2020 16:03:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s62sm9126455pfb.53.2020.04.13.16.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 16:03:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.10.I2adf93809c692d0b673e1a86ea97c45644aa8d97@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.10.I2adf93809c692d0b673e1a86ea97c45644aa8d97@changeid>
Subject: Re: [PATCH v4 10/10] drivers: qcom: rpmh-rsc: read_tcs_reg()/write_tcs_reg() are not for IRQ
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 16:03:18 -0700
Message-ID: <158681899842.84447.11598381397445180535@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:15)
> The RSC_DRV_IRQ_ENABLE, RSC_DRV_IRQ_STATUS, and RSC_DRV_IRQ_CLEAR
> registers are not part of TCS 0.  Let's not pretend that they are by
> using read_tcs_reg() and write_tcs_reg() and passing a bogus tcs_id of
> 0.  We could introduce a new wrapper for these registers but it
> wouldn't buy us much.  Let's just read/write directly.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
