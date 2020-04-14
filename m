Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5AD1A8C6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633101AbgDNU1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633097AbgDNU1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:27:44 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF61C061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:27:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i3so434206pgk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=5RliaQQNnLJGpwVof7AGBkAovyUlF93NpEx2vg6GNe4=;
        b=iOcrYMBcdiFRcFr0faRBE/ds07jwz/BEpLwqistfEEFf6yRAe8whtW2CQkBWGZfBsG
         Ywb26Ql5Z/gsMuE8AlDFDpqSPdgIY16FIZDFs5sZascRUrD6fWCXip3cEB65CrTbj3St
         WntNTNQJuzqZQqOkyWQdlR20ejSDlr3lM5/mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=5RliaQQNnLJGpwVof7AGBkAovyUlF93NpEx2vg6GNe4=;
        b=AtO5viOYHmUft9zeYwXsim9wAhj94UHRIB59WXrcjsTx5SC9bJHe2cou8S7fEDAa5X
         YVNDr1ZeN8Sob6H446QxWl/PQlTXkWuZKVH3Y+WIvtlbgmnv1PfQIqsvAQt5HE23Uw88
         0JM63CvsUw95IiYWBf67/KAoC34u0uI0LBJY5titSYAC8Jji9HVh/uKqbnXGpuN9khU7
         hZ1+OJreGt0/TZ4a7sm3io5a3+JQsCi0YpJ0H8F3k0in+AcEiSk689Ylha5QCXlaQD1h
         7lNit7EMgo8I9GJAMX7DB9R2DNQ+deGoA0ksHWFs4cr96GRFmjOoZUD9be9ZYNiQ7z0S
         481A==
X-Gm-Message-State: AGi0PuYWq8evQf/5O8iwNhPfrqaeIP2CZcQidMf/bk+vnU336zw6Sd94
        f6+h4hPdyEuBmxuSW4PfX/IykQ==
X-Google-Smtp-Source: APiQypI31Wb4q3OPBM1+ulbl2yfyn2IeuOw9HklrX+6xp4oesOVGYL42/oWbtNCZaqIQk93D9uOWJQ==
X-Received: by 2002:a62:6204:: with SMTP id w4mr2667614pfb.273.1586896062457;
        Tue, 14 Apr 2020 13:27:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j6sm11873666pfe.134.2020.04.14.13.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:27:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
References: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
Subject: Re: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Factor "tcs_reg_addr" and "tcs_cmd_addr" calculation
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mkshah@codeaurora.org, joe@perches.com, mka@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Tue, 14 Apr 2020 13:27:41 -0700
Message-ID: <158689606109.105027.1689640688969579125@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-14 13:10:15)
> We can make some of the register access functions more readable by
> factoring out the calculations a little bit.
>=20
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
