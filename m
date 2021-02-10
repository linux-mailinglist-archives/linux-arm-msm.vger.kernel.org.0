Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F4D31694E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 15:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhBJOm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 09:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhBJOmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 09:42:17 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADCDC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 06:41:35 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id h16so1611331qth.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 06:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHh16AZ5+NePKJhyUBd6l8W2kOR4vUwjNTFCjcAhGG0=;
        b=OLIbDAPQXSdbEmmL7l8tiwMn8yxAD7ncc2QLmG6kxQZ0Bs2lMyWOZ9QP2RgNk8r29N
         bx5vwR1o6L1cUsPRRybj7euyyfgNgQBM8EgvFhhyYB/suaYOfjaoR6PAtwHnGPvBYD3w
         d4vmgYMSF080sVopQ1z+N1BPLJ5SNGs4xiOoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHh16AZ5+NePKJhyUBd6l8W2kOR4vUwjNTFCjcAhGG0=;
        b=KVexS0elkSEiR03SvPYr/VIDiXwmnch5BHr2LdwktWeqtVfla2cF3lTarwmPscGhT5
         Ks+XG98lwmPsdDK8yMN9QTtrOnhqclU2oY/PJhrE7KAfz7OKO6oxvZ4uI++8xGOGnJ0J
         Aju6tcqaaQKjewdY+jof8MGUXshkQn7dmgatscCggcle+GDm1GEOXCLVG2Wk/P1fhBAI
         7+v1Rd/+g5BUyBuQXvIZndVEfkufc+n1iiRoVwR+g5c7YiVaHYDesQZ8DFHvtra0Xsyp
         fjnja79zFMkGc/1XQToZhLVcnFBzFL4XKStOnrLaiMhAIk5K/FxdS2euiCVnvKe94gec
         ICQA==
X-Gm-Message-State: AOAM532RIhMO4lfg2j5PEo6LqeefoiQBCyfVheB2aDeWBDxDKppEZzgG
        TkhnRahcmv/0guc6LhHhnXHio6Hvjy/3EA==
X-Google-Smtp-Source: ABdhPJwoMkSffc52816F5GV5G5svnz5WHhXV7GSy9zlKa/EVaCf1OPC2CYLkyva1+cnd2L9AitfJUg==
X-Received: by 2002:ac8:5985:: with SMTP id e5mr3077905qte.160.1612968094707;
        Wed, 10 Feb 2021 06:41:34 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id b206sm1540661qkg.97.2021.02.10.06.41.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 06:41:34 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id d184so2239634ybf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 06:41:34 -0800 (PST)
X-Received: by 2002:a5b:84f:: with SMTP id v15mr4565537ybq.79.1612968093658;
 Wed, 10 Feb 2021 06:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org> <20210210133458.1201066-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210210133458.1201066-3-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Feb 2021 06:41:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XFck7+d_d58wG8OJ4yBJrcJi-JKR3abfc_3V6ToP_nVg@mail.gmail.com>
Message-ID: <CAD=FV=XFck7+d_d58wG8OJ4yBJrcJi-JKR3abfc_3V6ToP_nVg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sm8250: further split of spi
 pinctrl config
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 10, 2021 at 5:36 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Split "default" device tree nodes into common "data-clk" nodes and "cs"
> nodes which might differ from board to board depending on how the slave
> chips are wired.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   9 +-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     | 220 ++++++++++++++---------
>  2 files changed, 148 insertions(+), 81 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
