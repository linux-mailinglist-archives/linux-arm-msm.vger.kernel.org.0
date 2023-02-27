Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6107D6A4F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 00:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjB0XNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 18:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjB0XNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 18:13:04 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F39CA17
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 15:13:01 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v16so5101575wrn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 15:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJgi4IboWDAeEB/+pYFtMZQnVuI8I/vNjiJArKeJCpg=;
        b=fLMrL7BhFmzvZE38KZfkQpFgQLaJY681zzslH7qtjAPSVLR7jPRTyEFaOfJ+Q2Whfm
         L5oAQ04AaWLilq/JnqPsgPI3kspckLkvGyEkKVtfjyKcfAjCnC5Qmz/wZnQ2WAOdFqNE
         qs2VVQk1F6xuvgQsuJkV6qzKABFf0NxYMSsAOj1AmJFREVw/i5G/kAnQXXwBE8k8Z7l5
         scemQRGPjNnT66NWwH2nYhrVc33t1gvgGu1B5mpvU4U61chFMUWnYvyvmsvhcCdvfF/2
         +NgShAfTm0sCT7wC3NqRsXu4TFZGcr8JtEipWmqeOA7XeUci4vf1uwn2ZQLFHPG+CsM5
         NENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJgi4IboWDAeEB/+pYFtMZQnVuI8I/vNjiJArKeJCpg=;
        b=uX62UAKPiMJU1s6GaHKTjSrDYBlVCuRIBSTlkoiylOqy3OtYqtgnEZkRYfIebJN1At
         PaAzpQAQcfnh1TmiCbMb/Kfp5zqfNJ/1ZvmYbABuKJj5V75oYSnYcixGOnZaI1Xv1YZh
         NgZyca9YwmH8mNQrUZIh08T+Eg3RF7Zv6pnR7KU5R2jqGWW7065uKz/JgtzKvBzjI1ps
         DF9P7hVOSHQhFyo2JR8nSHs5BM8mroDCUEQB56C0XVMubOsKTr1gUh+whactc5dyRRrr
         +PfYxiFRBuRHUQddFDM6iZdp3CL+QdiARNH0z4iCom1PiPU5fPxXaEnW4Lej/z2dnWYx
         27jg==
X-Gm-Message-State: AO0yUKVyx4VuZM2lJ2Vx/5zrIvYMBGOpXSKckXmBXwpjVuuwoqyqx4Hm
        l7fFtdNAkCfFzGK/VprmQ0cZH5Z3KOh5Pbf55OY=
X-Google-Smtp-Source: AK7set8mxBKZ/grkn/tjz3ozBfd7zbd5al14FvASLZIC8HWQ7Uso2iV5HUgWmbT5oqq+V8b5c7XQydvZ0lV2uTAbwXA=
X-Received: by 2002:a5d:5141:0:b0:2c9:2917:4e2b with SMTP id
 u1-20020a5d5141000000b002c929174e2bmr176786wrt.1.1677539579719; Mon, 27 Feb
 2023 15:12:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6000:1009:0:0:0:0 with HTTP; Mon, 27 Feb 2023 15:12:59
 -0800 (PST)
Reply-To: Advocate@tptlegalfirm.com
From:   Larry Aaron Riteman <denzegreg7@gmail.com>
Date:   Mon, 27 Feb 2023 23:12:59 +0000
Message-ID: <CAM68aUF5zRnnriieS5e-a67Rb2zbEm=Ch5KcdJQtdRTX3jtYWQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello.

This is my second message to you regarding the estate of your late
relative. Please contact me via my email ASAP, for more details.

Regards,

Larry.
