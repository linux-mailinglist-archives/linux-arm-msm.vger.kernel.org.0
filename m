Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD9B4139FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 20:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbhIUSV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 14:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbhIUSVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 14:21:09 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4662C0613DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:19:40 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so29582560otq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 11:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9a6GBrx/qSFw/ie+XQORJdjht1FCHVFNpc+pdYB48NY=;
        b=RQvO2IdcaQx2P37AdgMZFoufmTJNKUWFTkLOM765TEfVmtGzaCpJK3uKQ7pev68A6q
         GfyWfVsKRVGFlGIfWpBA6mfOdmvRa9Yesaxtimbhnai6LOSxGEdjvW+Ew1UcG6eAqbO2
         nhPZVd+5OPZMI9oIeZFkDyGk/wa2LlaiNESt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9a6GBrx/qSFw/ie+XQORJdjht1FCHVFNpc+pdYB48NY=;
        b=EGR2MfX/CX0e4tuRd9KqtTqDbL5GHVdZ0sqJj+OwnLRbUEH622KDxxxOTxn5uFJx8A
         WE4SIxMn4BOFL1AWwq8GAvK8F67HmIl6v4kmLCH3dzABhvnOo3H5LGgMpjFtEtMaeB1v
         gjwZ1hqje+zH+hOgy6LDGip2S8k9TncsLvSFqYbhZawCwkJgTwYOvryE6WOlqFONL5t+
         ml60+WAl9iQWmlW8BvGR/UN+/yEHFgTa7YPOCnw5vUw6EFG14dG3vGdeYwW/j9KuIKRK
         yRwed8qf56bKODKDixmjKrRofFvp8Y8G5yp8ylzJNPYQsrJhCqEIUDGwdD6S0l+oDAOJ
         sVng==
X-Gm-Message-State: AOAM532qjjXnKbseL4YWygWTsKtP75RZYObhbByl7Dky81tCC0lsS5CU
        z1cKZ3eB0ITTIVopLQYnOf/Z11uBYu37LQzeCCjwvw==
X-Google-Smtp-Source: ABdhPJyERFNaz7SjKbyvtUzEQOfzQ5FoHjTtDxu+rHthbnkCzz9/POzqlbcAUVGGVbL5mZygovmAF7FutH6TmAE3VsY=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr3786102otn.126.1632248380036;
 Tue, 21 Sep 2021 11:19:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 11:19:39 -0700
MIME-Version: 1.0
In-Reply-To: <20210921152120.6710-1-stephan@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 11:19:39 -0700
Message-ID: <CAE-0n53f3=HJkmMAOdG8TXFadbzgRVW6KT1vdhCrA5ox_tNdsA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Add unit name for /soc node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-09-21 08:21:18)
> This fixes the following warning when building with W=1:
> Warning (unit_address_vs_reg): /soc: node has a reg or ranges property,
> but no unit name
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
