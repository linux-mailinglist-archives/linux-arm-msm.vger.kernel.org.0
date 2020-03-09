Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 761FE17E910
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgCITrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:47:52 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39769 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgCITrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:47:51 -0400
Received: by mail-io1-f65.google.com with SMTP id f21so6247274iol.6;
        Mon, 09 Mar 2020 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKbim7kyHkrPMGudkJ1vg0pEcBDWWCn0qINKqdVbA5w=;
        b=aQ6d4P7G+51cW8y0i8NEFCtsKyBIAmDQUSzYlkLtf9MQzoqQGdQwySUYgdQkPk65et
         BmWWjn2rjrHZIQjLlcNULODk5WgZGKexl56EwBzIjXJ2GiyoEJSk5cDo2hgN9YpBNIb8
         i2sMa23eSaQbyjhj2W3NPQDmtj26SJ/U1V3VzobgYIPUdOS2Cbpck23EfWzcEQdEyVTI
         /fcFr/U2P/oupRc223/fzVPBB+C5DOCFR1akIOVvpeXO5nsVE3EHbFMmaQpwIwPDAlTj
         smSK6qzxupxo+4IFoT6Bdzhxc4oyqdojunjeJjFrBJ6Bbs8sw1Ie34TVuOangoKlhGCz
         UXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKbim7kyHkrPMGudkJ1vg0pEcBDWWCn0qINKqdVbA5w=;
        b=KrF24B0nuBYnro1LPewWqK+aSWt2nDjXZWLjRNM9G2boLLbiciI4KMLzPojQiDvUgJ
         kpq61GGhTxq5EsZE2tV7VzvsJcdAHaSv5qDGcfSrOnZtb2uL17Qihg/PjGGFF+ndiQ+K
         Jli5L3dLEqSG/ap0irg1KeZdpxOFhAFwpNYTYmT3cYDSXhaSN6FPIQ3X6mvrG5UNTj5Y
         8CLkQXaDipbt/l0jbcUHy8CA8AZbGqn+KgM0W4BGwzH4U5obRR8O+Jj29WdGjNAM+xKV
         ByYUCX4bcoWoW6IgAMDe/AVELbpwMTFPpJUyWYcNmJ2jauDzfKMwE7c/46x1LchTyYH/
         kW5A==
X-Gm-Message-State: ANhLgQ1ICCLoeTeuSQlCW2ZAENMl/T7VtpEI9pD4DjoVo036tHL3tLZw
        IH6WcooghTtg+R3Y4+HkzZyYlzb05jvGZeTKZamVyBic
X-Google-Smtp-Source: ADFU+vu0kdCSLs3bzWD+F6sDXLWQMKarERkN7jRfqXBo+1Uyqq+GkdyoCW1iIkJTYgvcqSWEJbTCkD7eLiN5QW2hczI=
X-Received: by 2002:a6b:2c52:: with SMTP id s79mr14709222ios.160.1583783270045;
 Mon, 09 Mar 2020 12:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200308055445.1992189-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200308055445.1992189-1-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 9 Mar 2020 13:47:38 -0600
Message-ID: <CAOCk7NrYxPRsT+wqgW=ShkYNnkuLfuzzVACDL7Zn-phKSgqvfw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-mtp: Disable funnel 4 and 5
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 7, 2020 at 10:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Disable Coresight funnel 4 and 5, for now, as these causes the MTP to
> crash when clock late_initcall disables unused clocks.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

I'm guessing that these are accessed by something else in the system,
without properly putting its own vote or something.  Similar to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.6-rc5&id=12eced09cd301aa7b1868a67c50a651c2aacd363

If I get some time, I'll try to repro and hopefully identify what is
exactly going wrong.
