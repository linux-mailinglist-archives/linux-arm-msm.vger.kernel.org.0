Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5C8416787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243336AbhIWVgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243292AbhIWVgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:36:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82175C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:34:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i4so31688841lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwjuFFEYUw6qLa4G4t6xm8xsFy3ftvS5x0wrGV04jCI=;
        b=jZRRTpXoykphrWtGlmCGTQm7+dQBcpLvtXMU5q9RLQM0B7ggtcFJa3+gDaU0MTRjXb
         qrf8++lzMfJ9Su9/48gHLCX+Xkj05jEIg6OM1kHpfLvAYl0CM6ADq1aMAY91cVUxdaOn
         teJAnWphmD6obyQ58pohl3myJKlJuw+X7RTja2JlOKjLePie59S9v83OuJpbvxgJOvGi
         cLV2/2rmV04Z7cOrtT7m1lM7q1zvh2DpQcH4FRVIWf8GEuo1zaI2QM4fyaP2y4PwuNGl
         fpAlC0iafp/00PEmOMRggaojTHb+O94Coa1B1TOkuCpsl4jYpyVH6W/eFHj/wzzR+WM/
         KTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwjuFFEYUw6qLa4G4t6xm8xsFy3ftvS5x0wrGV04jCI=;
        b=vnyuu2jRiofSd9jztISVbPdsOTuepKzgLS6hhr7CA3qmB9sIk63lQK3SK6gFIofsFI
         W509FrWbvlMgHRjwmeJXzJMEEazS3lFAa1K1QL/cs4hQjDjpv4trAYYH7KwWWbOQNrxQ
         GBIzheflVHxru+EEpCeN4Zo3DwtK2VdmmTaEatPUBQXaCm+wVCr5/1OdmonmlqmgaUsH
         jXVh3DV4YEkRJwfg5SHYgTLbDcJr4BUpjzi0ZZM/xMEaNRRnLYoHmrSz292oprLusBlh
         jQUS98/o+id4TJe6cVr7xwwU4UigYyihwUNcQTVmHV9iD5zugWE6JBDBtizs1PMxjWBT
         08AQ==
X-Gm-Message-State: AOAM532iPEdQDxty65j60koYS4G08W2cEvvQ9yDy+0SuBngQZkVZBg8R
        ITHn7Ht8zn+tvYQ7LcB7c/s7qNw6SmfbH0ilqzcKmg==
X-Google-Smtp-Source: ABdhPJyZtA3tDkqn1sMYlY6x+GteCF64qDi14tvZqfNnSjwpru/kvnvXoFyvMmItzPeo5xawCArcnw1gMI5lGq9oC0c=
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr7854021lji.259.1632432887920;
 Thu, 23 Sep 2021 14:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com> <1631588246-4811-2-git-send-email-quic_subbaram@quicinc.com>
In-Reply-To: <1631588246-4811-2-git-send-email-quic_subbaram@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:34:37 +0200
Message-ID: <CACRpkdYiK+KPjz8RZKcS6sgTk6-RgB=zVtbim6vaQyVszhhk7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add
 output-{enable,disable} properties
To:     Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 14, 2021 at 4:57 AM Subbaraman Narayanamurthy
<quic_subbaram@quicinc.com> wrote:

> Add support for the pinconf DT property output-enable, output-disable
> so that output can be enabled/disabled.
>
> Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>

Both patches applied! Thanks!

Yours,
Linus Walleij
