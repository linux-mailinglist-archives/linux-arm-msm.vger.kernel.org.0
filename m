Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DB91A6E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389184AbgDMVhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389182AbgDMVhD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:37:03 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C10C0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:37:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p8so5057440pgi.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7qyucYgyQkYga8+f4et90BVzvXhduqRHKSj0Lf6wTRw=;
        b=Ij6RHwAXXioOuRGQHNnZyMNnMYfsEskYPs+Wrp54L2nFCet3CZWAwNi/kASYJJe1+Y
         D8Z+p4MK9ZuUQGoURj6e6No07DqBsDFmXu/+6uWRtv2Ybw+j//xJnlkZaAYU8vur5WhJ
         6E03HRRhVpenOfmd77a1y/hy2AGZMjotHNFRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7qyucYgyQkYga8+f4et90BVzvXhduqRHKSj0Lf6wTRw=;
        b=fDH8pBQF3K+hxwVtxfZ0W2E8NxL2I5MHPiDtkPKSxAX6c/HsgNamj/YfDcrJMJ3VPa
         2Fh0yAqH7ODnNzYN8XTn+OPTSDRRX8BQeJM2Arp0+6AKEoOERC3LF+DQFTq0xEXZ6TyG
         4h+0i3stWIE9RucnSZXpm7GzPhPbQopMkxh0fVS3Y2mXkcyw4nESihPYN/tgQo7Tjdr/
         t6JJzQ8y8tfjBgddufkd2ZHP1OhkUBPuAHMfi+jsUEKzfazJ1V4TpLaaWF31RzmkxlbE
         2Q02yC56w5BTRHtZ60EkICaJxmzAqzRGqUTp+V+nohVP3OIVSTtdgzR36uyKitAnGV1+
         YtOg==
X-Gm-Message-State: AGi0Pua+hVNWQGcRnF4sZxE40bfc3aHfk0Kp4liEMBr8LwCpiyRyv99u
        L0cAZUkBBB59R8n3KHdZftVMW8cc/38=
X-Google-Smtp-Source: APiQypJKwt5rWWZnyYPNyNuJRifLWgS79KfBhedY4qcp7dbbw6tHoD0a/FnxezPRt6r0I5G9WUnzYQ==
X-Received: by 2002:a63:1853:: with SMTP id 19mr12063242pgy.108.1586813822914;
        Mon, 13 Apr 2020 14:37:02 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g197sm7948102pfb.54.2020.04.13.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 14:37:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200413100321.v4.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
Subject: Re: [PATCH v4 04/10] drivers: qcom: rpmh-rsc: Remove get_tcs_of_type() abstraction
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Date:   Mon, 13 Apr 2020 14:37:01 -0700
Message-ID: <158681382152.84447.13632615241826216057@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-13 10:04:09)
> The get_tcs_of_type() function doesn't provide any value.  It's not
> conceptually difficult to access a value in an array, even if that
> value is in a structure and we want a pointer to the value.  Having
> the function in there makes me feel like it's doing something fancier
> like looping or searching.  Remove it.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
