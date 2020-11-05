Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D277D2A831F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 17:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgKEQJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 11:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKEQJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 11:09:26 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2CCC0613CF;
        Thu,  5 Nov 2020 08:09:26 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id m9so2304783iox.10;
        Thu, 05 Nov 2020 08:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xwjlExn+W+KWBo/FsD8eLuZyRQVT+IStf87o+GP6rc0=;
        b=RLgM8NUWnkmagYEos+A/wuhviv7JmlwJ8Q8Put21oCRTxdiATw/FY33ffWY8yj6iSl
         nCe+nAh9vBV2UY5+8Ak8vNiegSh45Pa8d156Rcp2D323P9MmnJWAlbuMlRWKS50063l2
         hiLBuTP010HMX7eR60jbAVDLpilDc49WDjuY1x2AQeoRQLK9ajjMVlDo189TtAmFPLGv
         tX2u44gFOAXgqoXHaZPNkhIgJdJDAL6VDjqtqKZ1uqwAV6xNM/ani8eAZKXrpDzR9LYt
         JEFsRiX/XN426cUKE2iPPPw/NfXaHMHj60Y3xUy60CSZRS+S9mSrqhK+dIgO4TqmHD29
         RjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xwjlExn+W+KWBo/FsD8eLuZyRQVT+IStf87o+GP6rc0=;
        b=sOyP5qqym9ubdtzjAn5YP9zPu9wgs4alwg24gzi6IaPcfGzvx0kVu9VckwpYLwuX2p
         /eofC8afVwVDP6Mi4BTER7yIIJs/jzI2zIVcouH1PCOvpiYZ72tQD68tkeUkJg/V9Wr9
         uEsUpviFsHYd1lxghz3ETtoNNRpzKpl1WH+L3KVjPKra7bAlTqzBN4dTs90UYG3rLARw
         vZMyCu43YXJoYizkvwD/QCSm/OPSYMJjfk5jOJ6U9ABC/tlGI7zAnvZD+dF4uWfUmtCL
         YSKSCNyC64x0zMsOM8DyKqF8u6/91Dvv3YdJDAKCLf4ElTSyFwdaxAVsw8E1AIz66N3x
         E47g==
X-Gm-Message-State: AOAM533tDXXlBnP+V+StQwFqLxgCTqReEHd1oUgqy9w/E1Zo1M3tyWNs
        rLEJhs0SvPUYApwhDYfF9nJSz4jGj9Ma9zzCFRE=
X-Google-Smtp-Source: ABdhPJxlCxBo94xGv3LGC37BaVFxcgnsIjBQT50pIui/chmBKW1v4BRkhzORVTui6O3Z2om6ra2eWdYUe2emDHRa9+g=
X-Received: by 2002:a6b:1505:: with SMTP id 5mr2253101iov.3.1604592566137;
 Thu, 05 Nov 2020 08:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20201104193549.4026187-1-lee.jones@linaro.org> <20201104193549.4026187-21-lee.jones@linaro.org>
In-Reply-To: <20201104193549.4026187-21-lee.jones@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 5 Nov 2020 09:09:15 -0700
Message-ID: <CAOCk7NqxfPshimT0TJGoVAX9+evzYcb=uCcy67XaiEZvV3Es6g@mail.gmail.com>
Subject: Re: [PATCH 20/36] tty: serial: msm_serial: Remove set but unused
 variable 'status'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Robert Love <rlove@google.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 4, 2020 at 12:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/tty/serial/msm_serial.c: In function =E2=80=98msm_complete_tx_dm=
a=E2=80=99:
>  drivers/tty/serial/msm_serial.c:429:18: warning: variable =E2=80=98statu=
s=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Robert Love <rlove@google.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
