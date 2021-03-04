Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E609932D10F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 11:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbhCDKnn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 05:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238891AbhCDKnQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 05:43:16 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6A4C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 02:42:35 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id p16so29186190ioj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e3WJ8tkB0vH/2/UrMdjK19WTqOngozUVR61JEO5HLN0=;
        b=CTjCdwIMxemme7/QRWNuatcdETXi0CFXLRQxW1l3H3bKZWkWi5s9osWWgnd+B1dRzv
         2tOIInvdv0s9rmqtIlWYZr98HXY2ghcB2r5savwVfnypuTyLvgg3+e19U1pPLbILT1HO
         fGtm1kJcYUyqexIPaHAdvdDnwzFjxE5ELcPDjS5XJOPBwASRcdg+lAVJNpH0rzN8LpH+
         Pd2+btvgQWQdATEe/l4YNC7JTiPGDIVAXzz+HAG7myDEjzcDV7QGzcc3vRYHhPuo7Pni
         aVAFjkne2BVqhdI2HpecUKWvSXQbtpiAgI3SiwiSF414OS8LZqx+G3/kmqeXf2egIqkL
         XJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e3WJ8tkB0vH/2/UrMdjK19WTqOngozUVR61JEO5HLN0=;
        b=Lh/hobQwPrzZsTgdKHv/xIy09Vo72Z8WzLs0DVkGDauwHF0NmnmRJReRm+W3MjyzmD
         nnQr+eCvNYTPAQCYswhf6i3iZxWGvn+bO4SKJs2JwmJp7BCJOAb+rvggLZD/1JM1fvjO
         NULutlWjCmhdJR7pIVX3xouUlSwIo5aFwC+gPXlePrCTNunDqPgPLUlI93BYFoURtg5n
         IDhmq7DJt79jIEZ0QC1N23pGYh1vwAgEmsQA6Bl2oaVbytJZUTh9qWK5Aakcl9DgchjZ
         DleFpH1oacp11jY2Mo/4TPuadLwPMFfBj8mD84/VuhIQSjoY5wnzoQlBZPSkfq2rBWrc
         hA9A==
X-Gm-Message-State: AOAM531xrf4gLtCZq1MhFnLu2Q0FUxq8Eg/b0S8/hLjbLkCeUcJQ7z8i
        eUUc50PyMp/WDQKCHclKLqESo98JZ+aiCBCy4rNWLHNU6JqoLg==
X-Google-Smtp-Source: ABdhPJxKHmLVlEgGIs6hMVDFl/gJXhdBnMkF2p6k9BAgjYOmmXW2nJuF6zqOktPQtrSkWEDnLaN14i5Gt71tJsNw51k=
X-Received: by 2002:a02:9645:: with SMTP id c63mr3421813jai.84.1614854555410;
 Thu, 04 Mar 2021 02:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20210304100423.3856265-1-weiyongjun1@huawei.com>
In-Reply-To: <20210304100423.3856265-1-weiyongjun1@huawei.com>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Thu, 4 Mar 2021 18:42:24 +0800
Message-ID: <CAAQ0ZWToj9Fq5bRce-f+JUnO6iPPdJEU=P9n5k+-zmyUfKPE_w@mail.gmail.com>
Subject: Re: [PATCH -next] cpufreq: qcom-hw: Fix return value check in qcom_cpufreq_hw_cpu_init()
To:     "'Wei Yongjun" <weiyongjun1@huawei.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 4, 2021 at 5:55 PM 'Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
>
> Fixes: 67fc209b527d ("cpufreq: qcom-hw: drop devm_xxx() calls from init/exit hooks")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
