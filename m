Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B262118FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 19:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfLJSsk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 13:48:40 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35945 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbfLJSsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 13:48:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id n12so14593214lfe.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 10:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOSCVw9bioi+5hxnz7bz/OpGazg6+xs3kBeEbrtXG48=;
        b=Pcg4dJHJx81bsDelVo2J311YXVKJfxTmtD9q4K/3ixqYZ3o9fcUZASvkvpmsNECc2m
         goyWlV33/Y8CabpTc3jtAu198H4wWXtuNEOLsTX9j6W1blZgb9ZTwXUjsO0keytLEoFo
         HSRPniaTF99B5LfPCNLoU/RQTDtXK0m3ygND4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOSCVw9bioi+5hxnz7bz/OpGazg6+xs3kBeEbrtXG48=;
        b=biwTreKdzlI/oKNcfQt1aU5m+139E7S+s4wCss2EeiL5HKv5ybHAaTz+LmVub+YWo7
         +x1ndMxXWwpkyr4QrARRdcc9X1V6EheZI94+5ZOIUvFx2BjdU7iGNF324AXpHiY5XGkH
         gvHvbgBG4+WSaVj+up+zcMzEIN8fAO4UIjI7dWZaH65jv92fzNSzWRi5Cf8z5YuT7heu
         uVenhvo1OSuXbhCn3CigMDqIvkuJh0tWde/FspkP+rY1mHNtHZndnzuS1rE+7N0sLXSg
         7d9Zo1br0di+ge9sHQZVIbKebWKXUQMVUAdPzNbOysBNlwRfTGWtkMgOFxr68378OgDV
         tzTw==
X-Gm-Message-State: APjAAAVynzvqoCfpVcXYb1caUTXn78SJyd8E96jRvDKNYrL8RkJ9OtPu
        0hMzPnns8SPSx3VKfJedopfHCEMwPhU=
X-Google-Smtp-Source: APXvYqwjzR1IB8RVOxlJbcIUdvhqnHCK0nqES3Yk0bV8M+1fC6Z1QuI8mrgt4QF8NuQHPEt85oSUSw==
X-Received: by 2002:a19:4f54:: with SMTP id a20mr20406421lfk.39.1576003716036;
        Tue, 10 Dec 2019 10:48:36 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 140sm2099515lfk.78.2019.12.10.10.48.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 10:48:34 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id f15so13749731lfl.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 10:48:34 -0800 (PST)
X-Received: by 2002:a19:23cb:: with SMTP id j194mr8691484lfj.79.1576003713698;
 Tue, 10 Dec 2019 10:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org> <20191107000917.1092409-3-bjorn.andersson@linaro.org>
In-Reply-To: <20191107000917.1092409-3-bjorn.andersson@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 10 Dec 2019 10:47:57 -0800
X-Gmail-Original-Message-ID: <CAE=gft5mLSqsJzj=DtesH3G68_wSKUr8rZ5iubOerimQmZKegA@mail.gmail.com>
Message-ID: <CAE=gft5mLSqsJzj=DtesH3G68_wSKUr8rZ5iubOerimQmZKegA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] phy: qcom-qmp: Increase PHY ready timeout
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 6, 2019 at 4:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> It's typical for the QHP PHY to take slightly above 1ms to initialize,
> so increase the timeout of the PHY ready check to 10ms - as already done
> in the downstream PCIe driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Tested-by: Evan Green <evgreen@chromium.org>

Should this have a Fixes tag for 14ced7e3a1ae9 ("phy: qcom-qmp:
Correct ready status, again")?
