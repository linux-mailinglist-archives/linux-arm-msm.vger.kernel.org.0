Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B96D4D91B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 01:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbiCOAqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 20:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238996AbiCOAqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 20:46:07 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1EC764A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 17:44:55 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2e2ca8d7812so122992997b3.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 17:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jEkFayPIDB1RNjoiUDuf+V2OKliYd5+T3pgx7Thk7gg=;
        b=bL3fKoAoMykFIgH7ZxnXDIE562Y6z1Q6y/SufWRsbHGmz4FKivPrebCtpPZPzJTOiI
         J5LsqatfrUqhwIcVzWqPkjkvoM5DlvNgaPZ/3K+e1FBqXxCK69BYwemnf+dRypVpFl69
         TtzQEe/3wkREvrQg48+EQjWDVYYRJq6AAl2nlhNmoCN6XibPDqVS2SkErdkO9aUtktwn
         5/t/YshrSityVBmM+BR1bvdaOhfUkZC4qzgodyQSUjhFAlKT4xXLuMkR0LkkcM5ySDlQ
         0izpSv6qmqe/xjdHglqcgx3OA/Gn3PHQOpYtS30eFmgbuSRNhBB1+qpMjEVfVsZgaTDh
         YQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jEkFayPIDB1RNjoiUDuf+V2OKliYd5+T3pgx7Thk7gg=;
        b=AEUBV/Y/bzlbFeHXDwYm8E1jcI/pZM5MHgM6PhHJA0GTIR9/ExAVkC0EzLrLEb6sOI
         4Th9yuoe5JvSKZSndeF33CTbdtHd/O6KfBTfXmFgGdWWjyUp+8Q1CDpwTE5D7SZlDIVw
         Gc+QSihb+pmZ75CJ4vGpwCa0eQvgtUnTTsl/YDXuWiwQ9W3m4nl2hTML+FlJyO1oPkyg
         0qpYDav6KG+kVBHLbGsAy5OdkVEb37W0tpvIeNizt8NUGBDiTICaQJXjRkZGJ9YRwBEf
         352shBUtfWDd+W/F0IHz8NJZDltFAgyHZ+wJPaBsCm+74wu1UimP2vnXLz3xMyptAsEC
         q3ww==
X-Gm-Message-State: AOAM530CC5mQjNxE5/I/WAMsW7BhjxmYxt9czuXnk+1a6Ssu+f+MA4hK
        /nwdHR1AvkvtzqdDMAplu5gcFTTLMGxWyth++eXTbA==
X-Google-Smtp-Source: ABdhPJx31x0UXfPpdB7LTHdtBCI8XhPtpVVFdO09FHH6OzPWjC4LS9RCuZfEqjL+N4I/t7jVkHPjIcDwKmiV0oG4cBw=
X-Received: by 2002:a05:690c:9b:b0:2e4:da22:2a71 with SMTP id
 be27-20020a05690c009b00b002e4da222a71mr15840602ywb.126.1647305095068; Mon, 14
 Mar 2022 17:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220223154405.54912-1-maz@kernel.org>
In-Reply-To: <20220223154405.54912-1-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:44:43 +0100
Message-ID: <CACRpkdbEDoPeu=TWmsJ_t-4+NtyiiSCXoj9rymspZt0nC+yrsQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpiolib: Handle immutable irq_chip structures
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 23, 2022 at 4:44 PM Marc Zyngier <maz@kernel.org> wrote:

> I recently realised that the gpiolib play ugly tricks on the
> unsuspecting irq_chip structures by patching the callbacks.

Sorry about that...

> My current approach is to add a new irq_chip flag (IRQCHIP_IMMUTABLE)
> which does what it says on the tin: don't you dare writing there.
> Gpiolib is further updated not to install its own callbacks, and it
> becomes the responsibility of the driver to call into the gpiolib when
> required. This is similar to what we do for other subsystems such as
> PCI-MSI.

OK if there is a precedent it is usually wise to follow.

> I'd welcome comments on the approach. If deemed acceptable, there are
> another 300+ drivers to update! Not to mention the documentation. I
> appreciate that this is a lot of potential changes, but the current
> situation is messy.

I'm happy with this approach as long as the 300+ drivers get fixed
and the old way of doing it gets deleted.

Yours,
Linus Walleij
