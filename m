Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5773B22CF64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 22:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGXU1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 16:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgGXU1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 16:27:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2BFC0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:27:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t15so6105866pjq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=FvJp6KRxuCLfQ1LrQuFAFBgfAkQQ7QvIAiuIgT4S7HI=;
        b=bLLtK1ZeE35eR4FeMC+fIRZcgm/BS04TxFnqA147MIiBhcPUrpTjQ8mBLU2R2PtCm9
         CUVySufyEYz8uVUJpQ49823cuD7nd7ZhKLAi1xYUsl3Pn6QhRjbfekw074vqy7qJrFyO
         OmkvtFikiS+cJRmGZVH7c4nQhXUT68Q9nduVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=FvJp6KRxuCLfQ1LrQuFAFBgfAkQQ7QvIAiuIgT4S7HI=;
        b=tw49SnFvAqTcWLAxqbnqqKvuK0VvQ10TyzTULZlKtd5yNURo6CcN80gczUvyAhG1ru
         D5xR5u8DWG1B6pdWuYfJQxmMHwAxmPpXpHC7YB6FXdS52u6G8H2vfC083+txCbAi2KYL
         z2DyEb6/5zHiwxvKa+mwZ4xs+MKQoJNKGGhS0UUPU0c+yMQjVvu2V06/2OfRFjyP2+Oc
         151aXHCkYx/oSumMqyQPlFpRGuGFBik1lCtSBH0iOXIt+SOehtfywO9CCYJc18VnUuHW
         LSG/2NVCDKdIRB9uv9k+PEStGsmRh8U5WN4cftH7C/mjNHN/X6xeEZeUaYG1OcCVfI3E
         V21g==
X-Gm-Message-State: AOAM530TrpiVzkqsOiRuPQEfd7Evbjpuk3XS/eKoYBYvzJzo7TcXeL5U
        fiMYA6zTOoezqFEaqCfvohcMUw==
X-Google-Smtp-Source: ABdhPJzNm0R7S4KH72z9GGjwL6AJWsQTruzmVb+ywN6nSy348ghglA8LdzPaCVFFbhqmejehPPY8sQ==
X-Received: by 2002:a17:90a:d181:: with SMTP id fu1mr6839522pjb.60.1595622442012;
        Fri, 24 Jul 2020 13:27:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id nh14sm6590084pjb.4.2020.07.24.13.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 13:27:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VUSwsP_xrHsufLjZqbWdn5V8rybtv2DWad2nBfU+VJ9w@mail.gmail.com>
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com> <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com> <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com> <159562087212.3847286.9484527206999948907@swboyd.mtv.corp.google.com> <CAD=FV=VUSwsP_xrHsufLjZqbWdn5V8rybtv2DWad2nBfU+VJ9w@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 13:27:20 -0700
Message-ID: <159562244072.3847286.7905035931282026601@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-07-24 13:11:59)
>=20
> I wasn't suggesting adding a timeout.  I was just saying that if
> claim_tcs_for_req() were to ever return an error code other than
> -EBUSY that we'd need a check for it because otherwise we'd interpret
> the result as a tcs_id.
>=20

Ok that sounds like you don't want a check for -EBUSY so I'll leave this
as >=3D 0.
