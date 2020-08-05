Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F23423D44F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 01:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgHEX5s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 19:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHEX5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 19:57:45 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040BEC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 16:57:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id c6so5720747pje.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 16:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4ifd5xwQw/fF71sDAVj0NW6xVjjKI1lLoO8YrlRE1c0=;
        b=W6CnF3IFM1qV4vtyI4l+BsHliSAapqyzRfwP5beGaDhXjDfZFPIU6UStOC92nizOTo
         aWkDKwkFohx7OKn2mg8i/RSJrfwtBoR5s6iBJWAGa9yjAqbJVL7kn4mG5Ax8Ih/a0UGL
         b1ZjUdMSZyOOwYExEooYKVQan12BTOgKsSKo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4ifd5xwQw/fF71sDAVj0NW6xVjjKI1lLoO8YrlRE1c0=;
        b=GfSO+USnOa5rK88bJJL6IyKywT30ltw2RAZfhAkuDF1+cyKEjW7Y0SW/HgC8WPgscT
         jMgOzLt/B5arnoBQIq2USP/t9RjBi3377egUF9UnfQVmGPT9SYdbRBCA36ptggWpq0X3
         FEyBBWc0TJv0NYC7Cnyi12O0zacMrCF4pRRV6EazSH99JLLe0/T4lzf2maky7Bc0KdFj
         bD2yyDAVngVtnD0QPE9rOj8wKLYyjz7FGnBLU25tP8XC8Y2gtVggOOh+QHIhOk/Mt9S5
         DyoPj9qD9UqM9rR+zRwJV8QxxAIgXeBzIS9DeYL9Ek1diau843B2GQiikcYaiNNPcNBq
         7Y9w==
X-Gm-Message-State: AOAM530zJ0OI7RCSj9JZlie/oMAK4UU8CKE65Q8dQL3baUGE50sR7vWs
        JkRM64PcGNMdFNCgqzmwNlg+1X8qKhg=
X-Google-Smtp-Source: ABdhPJxdV4c+ByHIoyl3UTQ5JOq/H3l5NMy7snS9vWIKQev3DSMuRd8Yi8bmuJJTKYnajrrlgKX1jg==
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr5578673pjb.40.1596671864307;
        Wed, 05 Aug 2020 16:57:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id go12sm4214725pjb.2.2020.08.05.16.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 16:57:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <98050322-9ba6-303c-4ca4-07baa56ebd80@codeaurora.org>
References: <1596541616-27688-1-git-send-email-rnayak@codeaurora.org> <1596541616-27688-2-git-send-email-rnayak@codeaurora.org> <159660954201.1360974.5176671532597020049@swboyd.mtv.corp.google.com> <98050322-9ba6-303c-4ca4-07baa56ebd80@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce 'assigned-performance-states' property
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
To:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org
Date:   Wed, 05 Aug 2020 16:57:41 -0700
Message-ID: <159667186194.1360974.10053425753327700919@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2020-08-05 01:13:06)
>=20
> On 8/5/2020 12:09 PM, Stephen Boyd wrote:
> > Quoting Rajendra Nayak (2020-08-04 04:46:54)
> >=20
> >> +       device's performance, also known as DVFS techniques. The list =
of performance
> >> +       state values should correspond to the list of power domains sp=
ecified as part
> >> +       of the power-domains property.
> >=20
> > This is different than assigned-clock-rates. I guess that's OK because
> > we don't need to assign parents with more specifiers. Maybe it should be
> > worded more strongly to clearly state that each cell corresponds to one
> > power domain? And that it should match the opp-level inside any OPP
> > table for the power domain?
>=20
> Sure, I'll reword it to make it clear that we need the same number of cel=
ls
> as power-domains, and as you pointed out below that 0 corresponds to not =
setting
> anything.
>=20
> For the matching of opp-level inside the OPP table of the power-domain, I=
 don't
> think from the power-domain bindings we limit providers with only OPP tab=
les to
> support performance states? It could be just a range that the provider ma=
nages
> internally?

Ok. The example made it match so maybe that can be clarified as well
that it doesn't need to match any OPP table performance state.
