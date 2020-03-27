Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DE9196210
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 00:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgC0Xd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 19:33:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43602 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgC0Xd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 19:33:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id g27so11931524ljn.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 16:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=31OCCdsx5Mp+cw9g2eq/fgIixaxEpyfnaxTPFOvJXaY=;
        b=rROi4bYmrya2laI29eBwhRi8+o0B6pv0VQ0S87fTvDSOO1fI2+V4b0Vi3Qd9NE/cXJ
         mMu507vWPOzoHxkFh2PXEEBozO56iynS+gc+aU1gUJabRDrk2QYOHuA/j6obtc63r+sK
         lBRbPiCQBu8h/FWzdqlqAKITKpNDgAXfGSi07YfsXX/K2J4DNy6xR30fZIBi93GTKn1Y
         58Na3pTmM2nCqEvEDt3cI16oM911yve6Zu8EVsJZxVO9ub+FXvBuKgX9nwRB+iHbMBrZ
         gKGbaefg4CamnX8bzITzpgwiRzpSPf0giuE6Y5joLA+AG9CL5gVR3mH01HLuYA9oCTbG
         C88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=31OCCdsx5Mp+cw9g2eq/fgIixaxEpyfnaxTPFOvJXaY=;
        b=SoR7c3lQnuJTSsJrnUB8uZi+k3lsYZ7HJlkx6oTFafWdNXO6Se3QgOOSXip+zJHiJi
         FdvYqIV5xWV03dmJ6UFbG5LT7exxh0yGs3tswbF832TtmBgNUhRviKW5Jn8i+t9LAwVS
         jT1EhDMxH9MSQ8/hl26T6fLKwSGBwauJIEWp0RXP4qWD/QS0FFXxvAk5avf2X5T9k55y
         nfApSjTjvXcMUwbF/+TtHZq/mnPxWkSeVeFI8/Yrr9tsQoweo1PPfxVj4jodsQgR40KN
         xNlQ4vQfiQYIsT9/XVg1CkOKxzea7l4PAEO+H7GUnAqoRpEK99PhWNs4wGzdBqfw3bdE
         6yWQ==
X-Gm-Message-State: AGi0PuaPGMyGFaEDwDPSYHQkaYzUE5l3RiHTsersFUpUq4NcHNDzF8TV
        OOcrevZSJ+Cx34kD/cKq4Zi8lY3YqQ/3ZOzvJe/Ibg==
X-Google-Smtp-Source: APiQypI/NjrojqWxdb8e6IfCyjtcaINz+cXlEUyGidd5WOLU+ClWfg8pCJNKY7+Nnm9MsxpZbuwSJaUnMrtX8Xx3U+Q=
X-Received: by 2002:a05:651c:445:: with SMTP id g5mr723803ljg.125.1585352034393;
 Fri, 27 Mar 2020 16:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200327223209.20409-1-ansuelsmth@gmail.com>
In-Reply-To: <20200327223209.20409-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 28 Mar 2020 00:33:42 +0100
Message-ID: <CACRpkdaemQ_udn=TawvcSrUgmnw4eG0ASpjTC-0hjJCP-hCQ_w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: use scm_call to route GPIO irq to Apps
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 27, 2020 at 11:32 PM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> From: Ajay Kishore <akisho@codeaurora.org>
>
> For IPQ806x targets, TZ protects the registers that are used to
> configure the routing of interrupts to a target processor.
> To resolve this, this patch uses scm call to route GPIO interrupts
> to application processor. Also the scm call interface is changed.
>
> Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v3:
> * Rename route_to_apps to intr_target_use_scm
> * Follow standard design and rename base_reg to phys_base
> * Add additional comments in route interrupts condition

Patch applied with Bj=C3=B6rn's review tag.

Yours,
Linus Walleij
