Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0620F2076E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404478AbgFXPJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404289AbgFXPJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:09:55 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C4AC061573;
        Wed, 24 Jun 2020 08:09:55 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id ga4so2779010ejb.11;
        Wed, 24 Jun 2020 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xqA0JkwflkTobMLTCr0ZvM2/SSPlycQMaw9fn8Bg9K4=;
        b=IZWCTTbvlGPqVMTEvL+RCNLvtkr9ymy95LhJvsvrwruvDDDqo5l0my86UnhHTO7gVt
         6OEg0WbvFoNuzHtr6gEqwafjZjinhukdU+JqzI4ImfvTa7Gps/iP/e2iws9tbIi3OOtE
         4mqR0BKXcSEDy/lhdwjZe8KzJVQSf0dbyeiG7eMCJ03oGo1APEmJSLM2S3gtoGxqMI//
         im5+0Abzi5O0tB4sApp5nb1fWpXXNhNplFggfPfoIK75ZaRH6Bm7VxstsH8X+rM2Ia1y
         M4xTfNbtNL/6fLaoyf5l6/N5XC5BHgrqnbJ3HT6X5JGg8OrvQTB/bdVWIJRvvPN7zWjj
         dlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xqA0JkwflkTobMLTCr0ZvM2/SSPlycQMaw9fn8Bg9K4=;
        b=N7xDPRnwwrbZwgHgzOIh8On7Q5kTK1DtsFuyzRHVSZfqlDAw6J7LzTC7vc5fY2Ievi
         xWW8jvYAdSo5YkaDrCGrDh1+3OH/pglTZAxbbDMz9vVz5WP4yNy5Cf3KABav46ZT1mYo
         8OSxHcGkHaDZphYGqDkyZoLVcwS8A0Gf/XTkMpsDYUf5gMtIFtAvqeRxflyMVsmwg6K8
         8sUP1YOu7HPeYaJvilpQoQn843++CFvdwTs8ksEJoiDNVeymtd7aD0PZZ0pK9nOlyzG4
         NVKsTz8+WGAGkgafXFt3LCNqVdYVhZKdUo48a3/rV+02eNsob6WFFQ+Vt/KFt4yNiasN
         Bv5A==
X-Gm-Message-State: AOAM5321Efv9wlELZ4ok9QNnjLWNS/D/6XOxcQnxG7OezMOwFr6+bjNs
        tY0z7XgdHagYFSNbh1xG/k4D+gSBJlOgKRPwAc0=
X-Google-Smtp-Source: ABdhPJwqURAScm61PUoBnTTiAvio3Dy0kQw/f3E/f1hDwhw+981uq2BMzaiXIVf+D/uy7kNOieVVEHrsxWb61i75Flw=
X-Received: by 2002:a17:906:7002:: with SMTP id n2mr7502548ejj.340.1593011394401;
 Wed, 24 Jun 2020 08:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623230018.303776-1-konradybcio@gmail.com>
In-Reply-To: <20200623230018.303776-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Wed, 24 Jun 2020 17:09:18 +0200
Message-ID: <CAMS8qEVHxnAwC9fK69Pb4MEMWVEa9N7ZdkQCkXwvqC-JfQEfRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
To:     skrzynka@konradybcio.pl
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I should also note that for quite some time a hack [1]
has been needed on some platforms for the RPMCC to register.

This includes 8992/94, 8956/76 and possibly many more.

With that commit, RPMCC registers fine.

[1] https://github.com/kholk/kernel-upstream/commit/5df7bb6e337c0a41b2cc6477cddc718d622d7545

Regards
Konrad
