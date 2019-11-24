Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF13108570
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 00:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKXXAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Nov 2019 18:00:33 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:35307 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfKXXAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Nov 2019 18:00:33 -0500
Received: by mail-il1-f193.google.com with SMTP id g12so3011559ild.2;
        Sun, 24 Nov 2019 15:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odza52ilBwlA3qR/sWBKfuk+gEqR3R+QpYiXACzCFos=;
        b=lEnE6f+4W6HZwageKml38lXSUMQYQ2zwYrERviQkywOciokwQJlcVArXQlhb5DNI4T
         hAu+vPMlYTsH/QUWiOtkNPaFE43mo0DdOLwZQJinp1qP007Q1pYUN2YBUuWt68JLHnyw
         QhjqYawiKtrk5pFnpodSFBhlHA1AraKCTw34bJnzIlblBlNTv4/59OcR26uXVSGnjbqu
         8CMB79FUGM4F07WVpg0vuECMFzvaOLgmF4MTmNWvW5qfYi/K2vzduafn/JNvjmTFq34Y
         hUYaQjHCNAeOXyLnd886cq9Y7e/gh0knc8cpAUvTI2e5O0lEfter1xwvnZVV1VBmSrI8
         Rh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odza52ilBwlA3qR/sWBKfuk+gEqR3R+QpYiXACzCFos=;
        b=tH6iiZLNYIEyWPN4spluiKyvo1ujzEoHj04CVysUYeAYUQ8iQrem7lmWX2gUmQf0KK
         BQBhci+YbFaj+0rMST9SXWcwIOAn5GuId2t7QKui5SqbwW+FPpUeloja3r91SF8UZsRf
         L6aTX9pvUO1NCLOp/FMfXQSORMR7VQdUPYmBspZYSvHGMevB8rNdrmpmW7Slfjc4b7CN
         Ct3seN9mboCeZbBF17i5JJyojhEBrZP3cs3gNCZcxlcFr0S+T4gCcYxnJ3lpyAyaDIXb
         K60pClFMI+hTKtJGSH5KxIIg4LS58Exmls835ARKyU6IAXLIZjyEpfzKVZTwZ2da0d0X
         IFKg==
X-Gm-Message-State: APjAAAXmKmIEEeeR1UCrrsaiAmKyzOWTNoMZZERVSd+ah4/LWcGOzH8k
        ahZeL2+7JKfaL9d76uAp73pA5erQZioaW3Ju5qc=
X-Google-Smtp-Source: APXvYqwOO13A41HtjuUQe4sv4eu4rVgFn0OC5AVd9V0cE3MSGxeqRZPuKbTrJ/y4K1egU01KhMONsaCryETY/yND3W0=
X-Received: by 2002:a92:831d:: with SMTP id f29mr31049248ild.263.1574636432052;
 Sun, 24 Nov 2019 15:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20191124154334.15366-1-leo.yan@linaro.org>
In-Reply-To: <20191124154334.15366-1-leo.yan@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sun, 24 Nov 2019 16:00:21 -0700
Message-ID: <CAOCk7NoWR4cFepACH_r=tmZ+bX6uXsM4HWNr5uvm6CoRdQTw-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] tty: serial: msm_serial: Fix lockup for sysrq and oops
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 24, 2019 at 8:44 AM Leo Yan <leo.yan@linaro.org> wrote:
>
> As the commit 677fe555cbfb ("serial: imx: Fix recursive locking bug")
> has mentioned the uart driver might cause recursive locking between
> normal printing and the kernel debugging facilities (e.g. sysrq and
> oops).  In the commit it gave out suggestion for fixing recursive
> locking issue: "The solution is to avoid locking in the sysrq case
> and trylock in the oops_in_progress case."
>
> This patch follows the suggestion (also used the exactly same code with
> other serial drivers, e.g. amba-pl011.c) to fix the recursive locking
> issue, this can avoid stuck caused by deadlock and print out log for
> sysrq and oops.
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Shouldn't this patch have a Fixes tag?

Was there a cover letter?
