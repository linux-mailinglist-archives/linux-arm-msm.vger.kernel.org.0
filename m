Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8834402B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhJ2TEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbhJ2TEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:04:11 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11549C0613B9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:01:41 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id g125so14700960oif.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TVdi6Fl/MB/KZRsgDzQbukqjgZZAtYkijpdGcF4lmLs=;
        b=MzXdmS/4QiP7cYNzBGEEG80o+PYN5LU/WzOdNbM7Wmsq/moQK7lgMJNg2Lg+WE6JVB
         DmmMtuKqDZP9s6K4K6Wb48SjzZ1WpFD69doHDWGMe2Oi2McGvNwu7A5Kr2Wbze9/wVzp
         tWo8uMFP7Docoe5tO62X0zga0xREye+jI222Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TVdi6Fl/MB/KZRsgDzQbukqjgZZAtYkijpdGcF4lmLs=;
        b=LOV00zBpBCdhQOI7NIfA3mKKeI86Uzr71xAGmtRA5TmKmP/x2N19I7wU1l9KzCuO6R
         ZEs4OCL3+8WMaj9Ts43ViXhfYNdtzpj8h019Gq/JRtOAlOFekgV9wqvtksdemkk3Sm+F
         FDfDAEYOMw9HRvmyYrMy2Qb4ijUMzfIjEarD6pIGcREIhYvIWCARpwhAjpVDhLeMXgs5
         tfuAqYBb3GV45+MhxBFPvcIas0+t6WQKZzMI5eKfOs7IM1Dr1e5I976rciGMF/glgiQx
         /0hJAK8YnjFpYlAKWwg6IV3E76DD4TOqWBIZ/H5hUFeGxiVIodJmcEjItrhxPEN3vewE
         dwEg==
X-Gm-Message-State: AOAM531V+oRTRFAwtxhhz+u3KBcbtgao55b+qTjRKJ2UzzsJY4S9wYyK
        /fuPfOMz0IWHYUYrjXpmvHO7qUFa5H9+Oy1SzMa0iQ==
X-Google-Smtp-Source: ABdhPJwQlGvsBPbd7Afpn6FwkrBTZ1o9iZWKjlIZ/CCM3AABnc3sMrHfvoL9Q2sTgQvJLiS+2ORNuI2alq53l5/KmWw=
X-Received: by 2002:a05:6808:2307:: with SMTP id bn7mr1203456oib.32.1635534100470;
 Fri, 29 Oct 2021 12:01:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:01:39 -0500
MIME-Version: 1.0
In-Reply-To: <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com> <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:01:39 -0500
Message-ID: <CAE-0n50MZAYkQs4=wmq0oBb3KxFGa9pKevEEtkOtjZ=35PV15Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/4] leds: Add pm8350c support to Qualcomm LPG driver
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     mka@chromium.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-10-29 04:44:51)
> From: satya priya <skakit@codeaurora.org>
>
> Add pm8350c compatible and lpg_data to the driver.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
