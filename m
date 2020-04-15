Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7883E1AB1B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 21:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437644AbgDOT3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 15:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2411824AbgDOT3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 15:29:46 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B7FC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:22:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id n24so376670plp.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2G6Ppm6S3yDtcLs073bFFvyTtzzj8G77IKge+inQALY=;
        b=Ac2G13fDGKHLvowWSXOVwAwAw5x1iFQyzhRdx7GF5kVg4aB5Phh8tEMuxboIKJqxHm
         B5cvqQA4u5O+sddhg4tyP6Eofl69zfR+4bNTUr6t0qV2CfbazBQeEYMJA2t+u0S5Bso0
         IEUFbEa+B8Cbv8q/pgnFhY5N8s2OfrG8ktMH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2G6Ppm6S3yDtcLs073bFFvyTtzzj8G77IKge+inQALY=;
        b=etVMo6ZtC+DqgHyxa4A8afL41wTt9BpP3t3hISuLC8ZJVPJ942a7jnX0EskdrNfQ0H
         4AebF/MGZSDjMMNWIKcgEcNnflk+HrFfr6QtDrxViR66/KqXezrb2oOIjnfWpBrmo6vL
         13lTZTmD1EyeXtGrNvRsGNUiwRsr9dZ/9/zLs9VEkEev8LOhvunHaQ2145BnosdrO3j4
         Fm0xIUWcLya4aF7PzM3mDbhfBLYd0RFoEWiycn3e4g8j/4HXno2Ci4gjkBZgyhRdmOZi
         BOdAL39ySRIanXTrpyUbuGzgnEM362naoXV4IYE2meXdT7t0sonunXIkhQvH7VWzmJVD
         cHEA==
X-Gm-Message-State: AGi0PuaX65fgWkDzIjxQkeSSEwR88BExmAu5tZnkRBXaP75mTydhgPpl
        Gygvfs5NRcTnjHnrLGfFlyHQyg==
X-Google-Smtp-Source: APiQypLELTVr4j+fjkSgAB7n6Lhqk9TCQuapKh/6qd7zA4qgNHTPFw7PmI+jfp5rV5dcZFXg8gHcig==
X-Received: by 2002:a17:90a:df83:: with SMTP id p3mr891984pjv.66.1586978568434;
        Wed, 15 Apr 2020 12:22:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x70sm14127677pfc.21.2020.04.15.12.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:22:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415141754.GB3820@codeaurora.org>
References: <20200309185704.2491-1-swboyd@chromium.org> <20200414215015.GA3820@codeaurora.org> <158693222998.105027.13298557609451842017@swboyd.mtv.corp.google.com> <20200415141754.GB3820@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: Add debugfs dumping file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>
Date:   Wed, 15 Apr 2020 12:22:46 -0700
Message-ID: <158697856675.105027.14667274133002675067@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2020-04-15 07:17:54)
> On Tue, Apr 14 2020 at 00:30 -0600, Stephen Boyd wrote:
> >Quoting Lina Iyer (2020-04-14 14:50:15)
> >> On Mon, Mar 09 2020 at 12:57 -0600, Stephen Boyd wrote:
> >> >+              seq_puts(seq, "-------------------------\n");
> >> >+
> >> >+              ent =3D rsc_to_entry_header(rsc);
> >> >+              for (j =3D 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
> >> >+                      seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(e=
nt->addr),
> >> 0x%05x is what we would have for a resource address.
> >
> >Sorry I totally missed this because the mail wasn't trimmed at all and
> >it was really hard to find the one line that wasn't quoted!
> >
> Sorry, my bad. Somehow didn't notice the quoting has changed.
>=20
> >5 vs. 8 sounds OK to me. Send a patch? Or I can do it if you prefer.
> Apart from the nit, I think the patch looks good. Feel free to add -
>=20
> Reviewed-by: Lina Iyer <ilina@codeaurora.org>
> Tested-by: Lina Iyer <ilina@codeaurora.org>

Cool thanks. I'll send a patch given that Bjorn has already picked it
into the qcom tree.
