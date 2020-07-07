Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15CD216D1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 14:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgGGMsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 08:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgGGMsV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 08:48:21 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A87C08C5E0
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 05:48:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so49755357ljg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gwFkr9PneqZ4BhGceqJcWLMBZ8ayMTmUffDRY3KogpM=;
        b=C8GJ0AEZDliCyMztSZ1Ndjq2eS0XawACLjHxvQBVSC41f1JQyvBNO0ltCwFvJ+V3Wp
         FuocpbPZlCwKmG9B0Znl774ZjJ61Hdrthc/ejy+RptFvHBL39dz0DnJyE64ihYHgm1ib
         TiabjcFpoEc8J08Rk8lLIbNiPp74m4juJnhe7M2q+WvfkKJ7TAaGI2tPqMg6JhvX6kxk
         1m6LRktdHE2kCLlVyuIeUdKDj6ThiAmxEyLUB9uzWDwB3CqACC33zI3jM5PJfTp4Upxe
         HgTmMk9Q9BOFOY62P6KR2fJV/CJVSakQ2J2x5L5OB4lsIXDCJPAAR1TgixQgdDONKE8S
         aQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gwFkr9PneqZ4BhGceqJcWLMBZ8ayMTmUffDRY3KogpM=;
        b=WhEl7voFivUa2J84ij1z354udyeZP1QXFLbClOcwnjn7ByL0QF1FptOCAY788jEBAm
         JK9UGww8YrP8k1dsugsQES9zmxMiz1eqYa3WWQvyTxqBJW6rNo1h5vzPc0ncHHkFqZFZ
         CZ2qTKbHzjLfGLK/LtdsFT0hz3aCDR23htlkUR7Ei+xJoeZffTKiRpIsb0+2Dp6K8QUF
         8/qTamuQJxiyt9KgkV1t5OJg1rhp5ob0FtphF9cQl1cKhmrA8O7fl9KgbaYexZyBQFWG
         SPO/83BKLLj3f6jI79zC+/HCgTmbfgvsCpGEw8rY4guKRSdmrV/NzOajbsblYqsqo7MU
         mUlQ==
X-Gm-Message-State: AOAM530D7ZVj7/u8BVtPgz42g92Fkau06xVWEP1g/xDTEyct9ECpZET5
        +O3l1Q2caxBcmBYvPtC/4wxExL6IJdIZ1FqYGdRQgw==
X-Google-Smtp-Source: ABdhPJw9YFOFLjB0RSApXXWHfC49AyKtASlEPy7NeIw7/vvd9BnOj3rZCXjqZMc1E4Q/oQmgHVx15nwCJxmyXW+poWg=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr31300548ljj.293.1594126099519;
 Tue, 07 Jul 2020 05:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
In-Reply-To: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:48:08 +0200
Message-ID: <CACRpkdangAYj6_M7=P5yVncATozZUtb=Fo3zNKYCa9FwHLFfxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Qualcomm MSM8226 TLMM binding and driver
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 27, 2020 at 9:34 PM Bartosz Dudziak
<bartosz.dudziak@snejp.pl> wrote:

> Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block

This looks good to me, but I'm waiting for Bjorn to review it before applying.

Yours,
Linus Walleij
