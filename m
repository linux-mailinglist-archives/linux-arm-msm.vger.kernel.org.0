Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09F156080E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 23:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJUVpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 17:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJUVpM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 17:45:12 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF71115411
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 14:45:09 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w8so8382435edc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UVGxZi/73hO8MviVC4xecUHqVr/lDVcqvkrd/RkFDOM=;
        b=XAqbnqMkGFyZ1dNtMr0xbzqRv5qrPObhvClel/8VmUw3yCBqJcr0sQ37vQc1AsN9hm
         Uz3/YLQhUV6A0ERXzG86G1TGMYkbKlDqdx5N5bO6cJQ51BYhABIF1rtP+ngkJ3glljOx
         7pJ0EmnFYclQb/FqOBa/o727WjSGcAOP9Z+lLJdiTKKB2FFrMFzaMKXHKM/TUg7jOExi
         kW8+fXa52V2KNARe/X78iVZ6pDxYg4XR5BYbVx99c/qEA5TU5Yb6RBOPMU2Ac+Kfokjv
         9rqsvASTdtZxDHFhOdR7AfRGSu+M5guh2i1cFHzflwOrcwW+nkHjtVHsjlQ69N5Aesd3
         HRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVGxZi/73hO8MviVC4xecUHqVr/lDVcqvkrd/RkFDOM=;
        b=HDYsmuO9pugX6hJeqEGGze0h4jEOdCRxODP9xehfRr8W1Rx1pQAQhfNLcd73m+QC7u
         /lzG4rXMzW7x9NGvZDihAxgrnbEJyGMnkzuPQdm6bVBJ4899643DdFvnLTXcENxzxF0p
         0YLV9agOeVZ2Kj1vI0mSM82lTMqQ3mqTBAjJ/IUb8ZATEAwBNPnQ9d8u+LbfVMRT2KYo
         CTF7kEAhAieqR6V/OgRtxSfdLrYWqCZzpl7H73YIzkmPrmcx9DtdYqFPYtfUyHHT1YXN
         VHo7p5LKjWnRWN2dsDgwJDQGRj089+I12RJQBUrlRJ9CUQs5+6Vg/kLCLzHwMDE1YGjg
         oXlw==
X-Gm-Message-State: ACrzQf0tXlM23gng/lnLt3tt3m6+exut5YrOwD+65dl5iMxS2G4YdYAh
        547fXe7PXyUC7LJkyWpLxda0M9NtafC7QKt5ocJlz2/+QANzqg==
X-Google-Smtp-Source: AMsMyM58sC/dRsbG5dQfbcm0YyZpAHD0OGEwhgXByal7ylWgj09hZdhOOLQ3rgWC3L6116CvNENpg3ryPZdyEkW2+iU=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr17428124ejt.526.1666388708026; Fri, 21
 Oct 2022 14:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221021181016.14740-1-ansuelsmth@gmail.com>
In-Reply-To: <20221021181016.14740-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 23:44:56 +0200
Message-ID: <CACRpkdbfvr1pkVb3XhBZLnmn7vy3XyzavwVjW_VmFKTdh3LABQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: mach-qcom: fix support for ipq806x
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        John Crispin <john@phrozen.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 21, 2022 at 8:10 PM Christian Marangi <ansuelsmth@gmail.com> wrote:

> Add a specific config flag for Qcom IPQ806x as this SoC can't use
> AUTO_ZRELADDR and require the PHYS_OFFSET set to 0x42000000.
>
> This is needed as some legacy board (or some wrongly configured
> bootloader) pass the wrong memory map and doesn't exclude the first
> ~20MB of RAM reserved for the hardware network accellerators.
>
> With this change we can correctly support each board and prevent any
> kind of misconfiguration done by the OEM.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

I had exactly this problem with the APQ8060 as well, then my problem
went away. I was under the impression that this was solved.

Is it not possible to use Geert's linux,usable-memory-range in
the chosen node to make the kernel stay off the memory?
(See examples by grep usable-memory in the kernel.)

Yours,
Linus Walleij
