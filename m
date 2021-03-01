Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C8B3276A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 05:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhCAEWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 23:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbhCAEWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 23:22:35 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1B4C061786
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 20:21:54 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id t9so10212184pjl.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 20:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=NjN8Uc4qcy6FksZqQ1QHgGaJrHny90tByxw9vbwCOUo=;
        b=PfsZPlWhBn8pZsUVWOFcD20gH5ailRvQvDC6DSLnpucjO8Hn5TM6j7hAxblpnxh/ww
         h19tg/qridAAO0JbIjYEqlPjlq1M2aUsyn5Xtx2azr7AZwaHOgP4D8t9TnL0gshPQprl
         IVliQU0Wp2qRY0XqD+/6i8P0dUy5LqmFSGF/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=NjN8Uc4qcy6FksZqQ1QHgGaJrHny90tByxw9vbwCOUo=;
        b=SZ6KtfKyUM34yghh0x/Y/9JEihPovanjNXKfVuwJ6bwDcKsc8k00GD0tKIZrGxVOwv
         pjGEDaWzlY5S6Vv4UX7qSdxk50g3T09zst1VFjmwn2sNQPvtbW1ime9njQQi7SdI+xqM
         U8mXjLvScocPGJ2poasq+wMDyGQ2Qf0oVdWSMsPCJLORXAgw0gJ+GUWJ0kAodS18JuYb
         Qv3geL181ZXw1LfkFKNzsaVMC+UwkMF/UYq4290LmzWiTFviheiBiBuo8CoGrVucN4Gj
         2j0sflrk6AHk/yZrp1MYXmC23MutXFVChcfuaXcvKPhTuw6S+deZ4nbR8nywPcxNL9UG
         4fNQ==
X-Gm-Message-State: AOAM531FtkCZHDwoog3VoJMTi5y0Re5H3uXeIEt6vyEe6jAFSAyyqf6r
        1qbMVZHT6U0wdehbpkiTG3amuuGaU4jZqw==
X-Google-Smtp-Source: ABdhPJwkJzEI6yu3W1UgBfWt0bhhbDNa9CtCsRIPj1jn7oK8x+Mt6RNsDO6AOQ4URYdLK9AzZjnIpg==
X-Received: by 2002:a17:90a:31cf:: with SMTP id j15mr5674186pjf.41.1614572514205;
        Sun, 28 Feb 2021 20:21:54 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3c20:df33:e36:93df])
        by smtp.gmail.com with ESMTPSA id i22sm8751971pjz.56.2021.02.28.20.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 20:21:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <48278c3db41c3f46eac8892d1383444c@codeaurora.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org> <c4b7ae4dd009f563e6786f4a41f09efa38636fb6.1614244789.git.saiprakash.ranjan@codeaurora.org> <161428185152.1254594.1426736986245389798@swboyd.mtv.corp.google.com> <a35e6dcba758be4af3d111fe92cfbcd6@codeaurora.org> <161436514295.1254594.2789904935200051795@swboyd.mtv.corp.google.com> <48278c3db41c3f46eac8892d1383444c@codeaurora.org>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Add device tree node for LLCC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Sun, 28 Feb 2021 20:21:52 -0800
Message-ID: <161457251211.1254594.17265407085456881480@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-02-27 05:58:25)
> On 2021-02-27 00:15, Stephen Boyd wrote:
> > Quoting Sai Prakash Ranjan (2021-02-26 00:04:27)
> >> On 2021-02-26 01:07, Stephen Boyd wrote:
> >> > Quoting Sai Prakash Ranjan (2021-02-25 01:30:19)
> >> >> Add a DT node for Last level cache (aka. system cache)
> >> >> controller which provides control over the last level
> >> >> cache present on SC7280 SoC.
> >> >>
> >> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> >> ---
> >> >
> >> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >> >
> >> > Should add system-cache-controller to the devicetree spec. Or just u=
se
> >> > cache-controller for the node name.
> >>=20
> >> This was as per discussion in [1][2] where dt-schema throws an error
> >> since it expects cache-level to be associated with cache-controller.
> >>=20
> >=20
> > Ah right. Can you add system-cache-controller to the dt spec?
>=20
> Sure, I'll add it. Hopefully that won't have to block this change?
> Because I might need some time to get permissions to add it there.
>=20

Doesn't block it for me.
