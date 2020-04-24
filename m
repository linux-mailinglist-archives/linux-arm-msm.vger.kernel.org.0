Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4959F1B7CD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbgDXRa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgDXRa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:30:58 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D65C09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:30:58 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d17so4952549pgo.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=TOBb8tCU+3Fv4RLirkHqozp62T3jFqkHmjZCX1AUHss=;
        b=WnMKbOXATmMVX+/JnFpn46xCVeikJqcSBOdbeMX3N3DpZrhxmjsjo57fDbr3W9VWpC
         TcE7CgbneyM/jQBr1Pi/cUJWbjwaEdtqNaHwJVizLARUcNN7T+UDDQogWoHWjrS26K6u
         vC0pUnPBvXbBEmFfG1vvw5vF2RJtdCTiftISI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=TOBb8tCU+3Fv4RLirkHqozp62T3jFqkHmjZCX1AUHss=;
        b=fZUvUBuyhzDQkNF6f5TUd7k+biVVE5JMwjweOxBvg2c5535e8S8wIdqDhYxwD/oNXO
         g7gpJD68A1NAWYRhtcwsziSuQ7v7h8TzlXe/xFrZnMdqHH+wXhpbxv6UhBOgIkBXmRao
         tkBVPvSVhrig4FuIcGrXs6iSLEbfV6n+EoRIbXBdPbxc/XH6/CaSnaBo0M/U7NmZ7xDD
         U2J0Q08Y/s4uzyGMKuZt+OKC+YqPC6x0GCMiXUvZpqQOH6yhPHkyV6GhqSImBg0mFuDr
         avjrGfCgCM4D+iWYRU9iTTKG/ZN5ZyKZdLKl2rT9tpsydaOxOwg64aohKXxJP3rBfEpj
         tosA==
X-Gm-Message-State: AGi0PuaZF+nieQfPhvgTWAvEWPRTv1L4nN49UJjlal4hf7GlY++Tcm8a
        0JP9PCmUkn+JKigISgeOVMshJNfyaI8=
X-Google-Smtp-Source: APiQypImO36tpAKh2oeXCPUmadf8WUrHRTwkQw1gC/IsCIl7DU9RdVbXTFkOkiSZi7o4fTi6gvDQ4A==
X-Received: by 2002:a65:460f:: with SMTP id v15mr10229432pgq.24.1587749457668;
        Fri, 24 Apr 2020 10:30:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 10sm6200760pfn.204.2020.04.24.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:30:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424094610.v5.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
References: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid> <20200424094610.v5.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
Subject: Re: [PATCH v5 4/5] soc: qcom: rpmh-rsc: Simplify locking by eliminating the per-TCS lock
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     evgreen@chromium.org, mka@chromium.org, mkshah@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Fri, 24 Apr 2020 10:30:56 -0700
Message-ID: <158774945643.135303.4651711262492851591@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-24 09:46:56)
> The rpmh-rsc code had both a driver-level lock (sometimes referred to
> in comments as drv->lock) and a lock per-TCS.  The idea was supposed
> to be that there would be times where you could get by with just
> locking a TCS lock and therefor other RPMH users wouldn't be blocked.
>=20
> The above didn't work out so well.
>=20
> Looking at tcs_write() the bigger drv->lock was held for most of the
> function anyway.  Only the __tcs_buffer_write() and
> __tcs_set_trigger() calls were called without holding the drv->lock.
> It actually turns out that in tcs_write() we don't need to hold the
> drv->lock for those function calls anyway even if the per-TCS lock
> isn't there anymore.  From the newly added comments in the code, this
> is because:
> - We marked "tcs_in_use" under lock.
> - Once "tcs_in_use" has been marked nobody else could be writing
>   to these registers until the interrupt goes off.
> - The interrupt can't go off until we trigger w/ the last line
>   of __tcs_set_trigger().
> Thus, from a tcs_write() point of view, the per-TCS lock was useless.
>=20
> Looking at rpmh_rsc_write_ctrl_data(), only the per-TCS lock was held.
> It turns out, though, that this function already needs to be called
> with the equivalent of the drv->lock held anyway (we either need to
> hold drv->lock as we will in a future patch or we need to know no
> other CPUs could be running as happens today).  Specifically
> rpmh_rsc_write_ctrl_data() might be writing to a TCS that has been
> borrowed for writing an active transation but it never checks this.
>=20
> Let's eliminate this extra overhead and avoid possible AB BA locking
> headaches.
>=20
> Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
