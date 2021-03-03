Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C6332C191
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389438AbhCCVhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236860AbhCCIS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:18:58 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B81C061794
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:18:15 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 192so8722108pfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=etDbu/Jc8DSP0ReRXwiySpUcMKSnU5m0Bp8k/7msBIg=;
        b=U9CPs7lWRQQQzxXHEQly5XVAdgZZ6TJnyisFz3MXn7lDCtOFVnY3KGUZLNRshg/PpP
         Mwh3HutyXg51L2IkLKpWo2+CqqiA2JlYQY7HBn95FbXnYMTn+bmBkukpGhHjGXGKmm2c
         QghsXOFzaDFHxx9Mp7i89oue1+uIcUOO9cV2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=etDbu/Jc8DSP0ReRXwiySpUcMKSnU5m0Bp8k/7msBIg=;
        b=OWosiIEEelhjpEAtZp/ypzBI76KT9TthLFOuAxUCPiLXM7zsAXZHfina4b2HauXuEN
         AScwg1WTusp2iAaDMvVpl1QF7+M1MeSnlfSH9UTmPNMyWACcD9fbLSkgUtJ81+qu07RM
         WU0/bsvLPNGHE8Z5/DSf9lvgs6VTX49d1fJ/nvf35GdJgCFromjiNvj5WgROG3aZsH/X
         lLzH0uXg0CIWaV6xkEqxWB6VCDIOCMeRMRaY/UhHVEbXwCYRCPUO5tqvfpdUPzrfLxME
         jU3y0uX2wwu1RsYGYvv6XJVQ9OjmLUXEb1qNPFTSr2Ana4licyFuAeZxmMlco/H/r8yf
         H0OA==
X-Gm-Message-State: AOAM531sBkkvNgiisKgSyzuNxQ90KO0KrCEvNXe90XNyZ/l7fgcUT1DP
        ZNd7bvhCu+TFqQPBrKr8p64htg==
X-Google-Smtp-Source: ABdhPJw2GLT90aaJtF6/DsDt1GQXRlXieOUK1wJ5RHl3hlvTNwBTu9/j9qm/fX0JmtYkeBM3exGawg==
X-Received: by 2002:a63:e150:: with SMTP id h16mr21890180pgk.308.1614759495529;
        Wed, 03 Mar 2021 00:18:15 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id t10sm5971833pjf.30.2021.03.03.00.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:18:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210301133318.v2.11.I556326b24441e22c8c429ce383cc157c7aaef44b@changeid>
References: <20210301213437.4165775-1-dianders@chromium.org> <20210301133318.v2.11.I556326b24441e22c8c429ce383cc157c7aaef44b@changeid>
Subject: Re: [PATCH v2 11/13] arm64: dts: qcom: Add sc7180-lazor-limozeen skus
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 03 Mar 2021 00:18:13 -0800
Message-ID: <161475949356.1478170.4345976627607852193@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-03-01 13:34:35)
> This is a SKU variant of lazor.  Add it.  This squashes the downstream
> patches to support this hardware.
>=20
> NOTES:
> - The non-touch SKU actually has "innolux,n116bca-ea1" but that driver
>   is still pending in simple-panel.  The bindings have been Acked
>   though [1].  Things work well enough with the "innolux,n116bge"
>   timings for now, though.
> - The wonky special dts just for "-rev4" arguably doesn't need to go
>   upstream since they weren't widely distributed, but since a few
>   people have them we might as well.  If it ever causes problems we
>   can delete it.
>=20
> [1] https://lore.kernel.org/r/20210115144345.v2.4.I6889e21811df6adaff5c5b=
8a8c80fda0669ab3a5@changeid
>=20
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
