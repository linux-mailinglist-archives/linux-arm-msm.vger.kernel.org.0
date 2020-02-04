Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4581521E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 22:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbgBDVVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 16:21:06 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34351 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDVVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 16:21:06 -0500
Received: by mail-pf1-f194.google.com with SMTP id i6so57pfc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2AtWtJixQXJEvwVUUWZ050sx2Cs96YdK2MYE0iBVoPE=;
        b=UZBAZtrO/decnADrW/v2Xq/F75VWYYRrSDbVnjsCcf9AJS2FNt0kg7UnEyl/QfeFR6
         SI077bR4Uq478O7uAWW5txLfu5k8GVz5TleXHXsrFC3tww/xt6hN2LnMR1SpRwCXT9Gl
         QB3p0Iz8uBk5yDlUouTsdUk4ehTbirgelCTJIgoH39zdUWTp4IwsnrYZ1y81/LGgPwh8
         XYi6jZdHnYEsXAN8cfAtsC4HSXkNPnl+gKPqebDcZueNCD9fBAwOP7hPHJSI3l9DyHYu
         wZ8VP79ux89OGQpXvErnQ3VxSC//losE9Wa4O90v30Twzl7G+SDjWTZTUGhk2Ypjbynr
         uBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2AtWtJixQXJEvwVUUWZ050sx2Cs96YdK2MYE0iBVoPE=;
        b=mOLCVdrUOx0GZv2yaSEIdJUNXhRjdZDEke5b9rliP9xqgMP5GoPF7RNi5pvTYPinKm
         9Br9u6gljSYZP8U09aXHcjNzaJRDqvmeY8/+hT8UDrLUnHWMt0iqbYaj84p5Gq29c+lv
         j6CbgXseCRy+1QwNQDWEaek97n6XeD5cp5LVT+Kjwru+Bm/N0pysaRaCIuPnxMMuh/FN
         PJSUs9QFRVSIMC86h6hrWIzb1wC0O06lHD/SPTIrYaWwqT03G75CF7NZnTXr5EcGzRYL
         k9pnch8IJbXqqxWbIW2Hrs0s9A++lBNcF1iNcHc9yRBkUPgFmtl6QSNflyW1P4hXJF95
         2zQQ==
X-Gm-Message-State: APjAAAWFwsh+xo7cBguyhrZb79v6G8HpPUZAqX+6j4dnceDcsKfEwUqz
        bov3W5+0dbDJWCPiWJhn9B0Hpqf/UMFdZIg3671WtA==
X-Google-Smtp-Source: APXvYqzjxjq2pg8zE+N4VlSkSAMXunGecpY+Ekkhv7Ev2K6ODumABErzxwV4JnVRPPf/71iLHE5bwPaoBjpsLoqkzis=
X-Received: by 2002:a63:1d5f:: with SMTP id d31mr33893164pgm.159.1580851263251;
 Tue, 04 Feb 2020 13:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-4-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-4-swboyd@chromium.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 4 Feb 2020 13:20:51 -0800
Message-ID: <CAFd5g45KEKd0NcorYyxpw84FX=H8yeBz8i+GJWEvrMN3Z9aGkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: qcom-geni: Drop of_platform.h include
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 4, 2020 at 11:32 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This driver doesn't call any DT platform functions like of_platform_*().
> Remove the include as it isn't used.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
