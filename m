Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A667C1A9342
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634873AbgDOGae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634870AbgDOGac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:30:32 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AD2C061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:30:31 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o1so5427479pjs.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 23:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yGGn5XTCbWcKi7Iz4ZvzEMH9gkvTDAhtX+3N8PO+tS4=;
        b=ahiCzMjp6V+NwmmzlcNCIGWifnAuzqI1W8lasAUN1ibrkqsrPfuzK6zus4oCOUQnrr
         xLNWIlCaFETTQsgYPvPjKRA6JgQSf2Bn7dwoVnjTCx0Ly4lDyGBdNJAuvKCoWxSAO3fG
         o+9ej/Q9A6H7a8RQ4DNEDAzuKE7MH6smLnMes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yGGn5XTCbWcKi7Iz4ZvzEMH9gkvTDAhtX+3N8PO+tS4=;
        b=Tbfo9ZIqNZQ0TOupI2SlvKSAcyM/vWvfqgJV2Du1PvN28MX3POBK0e4FBndjXCsfy1
         xboaBDqukAZwSqKLYK6kQi1mIrYmChi/IGOuV8fUaWfAqPBm5SxQitbynMBNbi2mHRxt
         q3SKsSp+1QKbJ1aAbVUn8jxQ0TgbkYFTBKgA7ELea/o/5XZl7e8nD2gjJHZdV3ChAaiI
         T2EfbECPMFFPBWtlPZNCw45drhUgLEkJbGVPN5K189JFmhuYd//FBTN0120YkAkx4WxC
         mfN36ecMzmMmD0CtNr6FG2bnWA9b6xdS/b8eTeTbTW8bZPjoBJYB7y6B10sXGE7KiTXm
         Cr4w==
X-Gm-Message-State: AGi0Pua2ANfq06kIYnrVIbFglHHX/n7RIzYrC/Hy8AGc3/PiQ84hjAwq
        cjLVNNQz2RUK8p4j6Dx7hPO2rg==
X-Google-Smtp-Source: APiQypLoYzi6cQvDYS4SLRHjsOsSYtQ8yGvzT7IocHvn1SRrjJ4FP11zSvpaFPCHG0OzveLcKbK6UQ==
X-Received: by 2002:a17:902:c211:: with SMTP id 17mr3617261pll.152.1586932231411;
        Tue, 14 Apr 2020 23:30:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h6sm10871129pje.37.2020.04.14.23.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200414215015.GA3820@codeaurora.org>
References: <20200309185704.2491-1-swboyd@chromium.org> <20200414215015.GA3820@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: cmd-db: Add debugfs dumping file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>
Date:   Tue, 14 Apr 2020 23:30:29 -0700
Message-ID: <158693222998.105027.13298557609451842017@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2020-04-14 14:50:15)
> On Mon, Mar 09 2020 at 12:57 -0600, Stephen Boyd wrote:
> >+              seq_puts(seq, "-------------------------\n");
> >+
> >+              ent =3D rsc_to_entry_header(rsc);
> >+              for (j =3D 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
> >+                      seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent-=
>addr),
> 0x%05x is what we would have for a resource address.

Sorry I totally missed this because the mail wasn't trimmed at all and
it was really hard to find the one line that wasn't quoted!

5 vs. 8 sounds OK to me. Send a patch? Or I can do it if you prefer.
