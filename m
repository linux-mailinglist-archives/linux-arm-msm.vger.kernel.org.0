Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD2D40F251
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbhIQG2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhIQG2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:28:04 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFB1C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:26:43 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w19so12603260oik.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=evM8dYW25rUmoo+jhaGEhb/KiP/SeJMcvT7KRQQj0k4=;
        b=GloPPC5iQ+gAScdWkJeOIsSgsZ5BSp9BiCqP1rzXOdxccRDtfeoX8O0HsiM7fJbpE9
         tUSl/aQESeWKK1uPMUO7DCltaBfer5Uo3L92ywAfuAXPYyuw0Q6UkoscP2In/ZftAmou
         tpYiHFxNgvo/7eg58Bk7Zn4HkLVXoT+1ihqFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=evM8dYW25rUmoo+jhaGEhb/KiP/SeJMcvT7KRQQj0k4=;
        b=dycYme3zgAi5t0bK0zqiawsTkr12WrTQv8/xk4svb48eC9lC3B0B/UqWu9Y/Yu4Zia
         H/nZFbUzT68ANTERz8xFSlWzaCWCAFdSemVvc8O/Nv6fFhPxHuKuZo7l0iykNeel59Zm
         jByFyQpeZNH0C3Qx4KTaXiJ67mu9HlaXTidtFPy/r1EnOVkeMFsyfCHcQ7hZgAA0/W1D
         IQrm38HECLOfwTxjxdvGW+yJPdb+A+x4NhYM5yR7To55OLV0mC7UI0kL1/EP/gOYH2bU
         I0QNKar39bnRnPMGBKucbXbjutG0TGzcsF+zRkgFZOIG3iBcawW5J2tHqEg6SU3CKOFC
         ixGQ==
X-Gm-Message-State: AOAM531dmfNJrR/jOEHhfLSCvs9hrR9sv3r9vd2uYGKuhqHN2e4uoicl
        ovlkYjFObA7AC0BRgA7Dq+LUtLkNwvTVSeY4BnB+ww==
X-Google-Smtp-Source: ABdhPJyrkQzCWSDEUH1Rd5lLaPb2mxQs/iP6fiO2b9602AYM1Z/L3nqb7ScjuiLu6cPKzfoKXdFQgYK/XitKb8oyxGk=
X-Received: by 2002:aca:2310:: with SMTP id e16mr2823690oie.64.1631860002668;
 Thu, 16 Sep 2021 23:26:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 23:26:42 -0700
MIME-Version: 1.0
In-Reply-To: <1631811353-503-4-git-send-email-pillair@codeaurora.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org> <1631811353-503-4-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 23:26:42 -0700
Message-ID: <CAE-0n501fpj13snR9Q+RyOW12zPqyY8W4ZqzFcrmeqiwA77GVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] remoteproc: qcom: q6v5_wpss: Add support for
 sc7280 WPSS
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-09-16 09:55:53)
> Add support for PIL loading of WPSS processor for SC7280
> - WPSS boot will be requested by the wifi driver and hence
>   disable auto-boot for WPSS.
> - Add a separate shutdown sequence handler for WPSS.
> - Add multiple power-domain voting support
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
