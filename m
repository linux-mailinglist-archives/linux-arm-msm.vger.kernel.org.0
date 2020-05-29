Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF401E7984
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 11:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgE2JgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 05:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2JgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 05:36:21 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A0FC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 02:36:21 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id d191so1993360oib.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2020 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fWC9mFwdb/sTGcJVbmC/E7dvGoWX0ipuEF4o83/3TTY=;
        b=xfIhAUOSReKKsQs/hRm2VJ4Jq0uggWVCpICOHGe8w6zWIZzx1Au0H1Qk61eUsbzTgi
         3Ci0Ce1HTxRMmvPy9Ss587g3ZN6x4jTlo1U/BpIC7mVx0vGQXVwthBcuYXYIauZY889G
         27qoep9RV4qxinsGbtFgMR1MHtZPxwUgZaFkLmo2ZPBDFmWx8opBLgnvkR7unEue2RqN
         snsBoQwdFNgDZEMWE4n9jzehscZTF05ANygobVuuQzkF0iOyySyvLYi97xZkxIyk4bAC
         Ed09Y839uB89UZYkHnpW03uPXxnFTqaNhpwAjWtfNhTxx/JzE3wV2Po3CbuBhBkkXH6N
         PNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fWC9mFwdb/sTGcJVbmC/E7dvGoWX0ipuEF4o83/3TTY=;
        b=U8EJAu/vGIWZXGIT/lGbpO/qLu7QbHZe8TPYpjo3HyQJhD3rjc4hXByh+vEDHAzszJ
         jx5OAnkWk8WciSov5eGDUEm2LE90TfLWWZZtWys8NG/5LOYtY/B1qRxQ9MiyeHkNhL17
         kzyZ+GSZXNbzt84msnm2WjwCzoicJGRZdgPAAepkaO7txx6vjqdpnVW+VerwHSIWOtYq
         QH0jbka463kJeRhC05kvxrecQMt9phDWLm3UT/gcFlYNesT9ZJnw+7ogBwyKUNSDbZ8x
         CqHxWg+by2e04Dl14/sCYRFSgUWCSG5WOKnjahsOrnP/tPBsHo6d7wUObf4Jsxp49ha+
         SLiQ==
X-Gm-Message-State: AOAM532w+N2MQ1uUwC+QHQFRjG9kN/22Z8ObeIk7pZUX/nZGvv9SqBUn
        9HozibrUv+0jCajj60f3d0/WvhVphUZMu7BbS06Hew==
X-Google-Smtp-Source: ABdhPJwXtpTuUA91P1AUPcbP8wpLOoGZnz+TNZUWWVHXWHFimcQxq/KQIPyQ0xEj6UyvG6cfqUnKUODWSspb97RS2/o=
X-Received: by 2002:aca:a8c3:: with SMTP id r186mr5029193oie.173.1590744980879;
 Fri, 29 May 2020 02:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-3-robert.marko@sartura.hr> <20200504073914.GQ1375924@vkoul-mobl>
In-Reply-To: <20200504073914.GQ1375924@vkoul-mobl>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 29 May 2020 11:36:09 +0200
Message-ID: <CA+HBbNEiB+o4KxonAu4-ra+P11Yb649v6AFaPjFc8JQDQ8T=CA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 4, 2020 at 9:39 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 03-05-20, 22:18, Robert Marko wrote:
> > From: John Crispin <john@phrozen.org>
> >
> > Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>
> Bjorn, I have picked the phy and dt binding, feel free to apply this one
>
> Thanks
> --
> ~Vinod

Any chance of this landing into 5.7?
Driver and bindings have been merged, but I don't see DT nodes queued.

Regards,
Robert
