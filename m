Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8224A20967B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 00:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388711AbgFXWjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 18:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732806AbgFXWjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 18:39:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10BDC061573;
        Wed, 24 Jun 2020 15:39:23 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g1so2686202edv.6;
        Wed, 24 Jun 2020 15:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gRvXdVDFOL2nNC+UTdN9/1dh3APtBhSu9xe02kERmtc=;
        b=FDiKCZY1+dAftJp9jkdsMliH8I5tgu2wSLQUC3MN2SNYdH8TLg/zSCCPr5iaftRG81
         6msrCMfMgM67nSl19Tq6INqN0NMInn1m3eSPOx8TZ2dTIA3GQqancmIg6JWmMguelg/v
         toElg+vdrbhLBFRZtyrFGXC1/7KZca0SNobFhxqlplqTyDUdRCgvGUlmI4kCq3llyO/h
         okMh7NrfdPH1U2skuoC5eMnSSt8JopfjpgAjXvgVAKZ47dour/VYlp8TX6np3rTyoGRJ
         GtDg5hlrzFiEprK0r4cgXB8NJ77L8y+um625JfCZpX9MAK4yiQN1bTFUw+D8WiSUGD38
         rEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRvXdVDFOL2nNC+UTdN9/1dh3APtBhSu9xe02kERmtc=;
        b=bLDSFyHpZ39WDGYDmkc24rPYr9v41h2HUHLpzn44KR5ytm3vfbFs3OVW+xR7hMBUyB
         exczezsHElVnJmclacS3Q5/vU0HV5XG7a0MlNLVVvw0/tIRdSl253NrDu/PLBZMeIwyZ
         cE/HGBHV0gAn6stuCt/Xa0Gbqxq9buPmvP/ummjBfYXFglcph55TBOjvAhsWIIsWu436
         sDN8dHP/ioHO5erV5VTJbi2xmllM1L6nP9crkWMMD20j7MXW01xx1WLo3II9rkMPlEK5
         1HVl/3HJ5pD0ZpZBT/Ksr0OOtNMj3XkUdtIP+fMvj/YE0/Vn6Xcwfv6F0cEUkm3O6POb
         Gbfw==
X-Gm-Message-State: AOAM532p1RipSDOiq45h2otTQaMx2XJ9WuaXeb0mcnWVyziwa+8Uf/x6
        K2xBbN2eq9/Ih7k6TQDrCTCOvLMfNikJIBeSY50=
X-Google-Smtp-Source: ABdhPJzc3AhSjYn3zf3cKkc3+5Rh+L/SL0NkuH5klMlptZ+xrvmJkm92f+X9/9g7BcyecThEgbHhM8mvyglwCsuBQDI=
X-Received: by 2002:a05:6402:b57:: with SMTP id bx23mr9809887edb.304.1593038362635;
 Wed, 24 Jun 2020 15:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200623230018.303776-1-konradybcio@gmail.com>
 <CAMS8qEVHxnAwC9fK69Pb4MEMWVEa9N7ZdkQCkXwvqC-JfQEfRA@mail.gmail.com> <159303797640.62212.15039388585433005717@swboyd.mtv.corp.google.com>
In-Reply-To: <159303797640.62212.15039388585433005717@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Thu, 25 Jun 2020 00:38:46 +0200
Message-ID: <CAMS8qEUK1tSnaVOEyhcZoSXs_8Fqd+rwrRfy8=xT4jffvnsW-w@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Nah, it does not crash. It just does not work properly.
If my memory isn't corrupted, rpmcc doesn't load and regulator
voltages aren't brought up.
It is safe to merge, as the worst case scenario is it just
not loading.

Regards
Konrad
