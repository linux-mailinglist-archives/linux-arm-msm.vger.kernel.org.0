Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344D7DC7C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 16:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439557AbfJROw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 10:52:57 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:35007 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394114AbfJROw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 10:52:57 -0400
Received: by mail-il1-f193.google.com with SMTP id j9so5803768ilr.2;
        Fri, 18 Oct 2019 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utSOLik7GjZ8tmaygvRuxaRmMUvN6dgih61xSu5Jmm8=;
        b=Q9FkMiMVEAJCDWueSjnSLm4tQPO/Wgdi9ZmU82lozZglM5JzA2FleaeSfYEEHGeOmo
         Zot9oAH1NnjKktG+vjJ+w9xtHNDcCYf3myzEYdC6yoeMDGnA6FRbr587bNeKNbFlZ+8h
         yoAYxYMBgWqAPgAl73p3QS4LHp0/BoBe15VnFIDntGhjlYCGAbVQ1uuB8BSU2JK7whZ5
         i8jc8Amq7ODjcsbg5fIcHM6Ngn/fJ3/CoS3w1UgYOBWNcP6Csggf2WVdQXUclzWhWQAj
         cyBNJBLt76eOHtEWyIoQ48arr1lAr43g8iA51ug/cRW82JD8lAjBF8JI0/qorQ0t2OZi
         QsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utSOLik7GjZ8tmaygvRuxaRmMUvN6dgih61xSu5Jmm8=;
        b=lWX8TvoKzQV9bTfgiReq7XVNihB+EoWL4Og3ZbxqXlT+C0ORnfyVOHUSXsD0NZjugu
         kK7IIKlxdMBXK/7KvqQwWGzSGrjp5ot1jaqxkdHuNpyiwsOsn1YMPctxNij892+8qMbZ
         2lajwLv+0rvtAy3xIE90O4jJJ/mc5RWJbkzyXs7DjsgLVrN8czbwGMburoiQmrUQtmF5
         3xKd+rJmSmHjvVXMOx7o5G+VJ2Et9Ac6uJYShX9BSCc87aE1Ijnsc1cYUb6qQuMC9wbP
         WOW7pjGWFfuAp5Rj7wv6mdkSTdeMqQ0VcCXZKSwxVoI5+b7ZLS8HpSKK32e6AiM80F9+
         +roA==
X-Gm-Message-State: APjAAAUGT6S7/FBP3UVgPIy7W+0qgh/PFU/jwpaM22qzPyHVstp7pNgJ
        CdjX41wZe64uDAt97XQaFoQYVk6kxTK6NGASDgLbCg==
X-Google-Smtp-Source: APXvYqwZxihDJyEb880wxWXfeqFOnRr3tF09KeOIwu9FrNA6Q2cP1nvDvMOx62kBjxb6j+N7lp7/MBejPahYpRTbDxA=
X-Received: by 2002:a05:6e02:783:: with SMTP id q3mr10176592ils.33.1571410374919;
 Fri, 18 Oct 2019 07:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org> <739222E4-F173-42A9-8D67-1BD8FEE227EC@holtmann.org>
In-Reply-To: <739222E4-F173-42A9-8D67-1BD8FEE227EC@holtmann.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 18 Oct 2019 08:52:43 -0600
Message-ID: <CAOCk7NpHVFBiWTh0Wk2fPAJDQxg8e36vGSP5mXRUUuOf8a57CA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Bluetooth: hci_qca: Regulator usage cleanup
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 18, 2019 at 1:59 AM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Bjorn,
>
> > Clean up the regulator usage in hci_qca and in particular don't
> > regulator_set_voltage() for fixed voltages. It cleans up the driver, but more
> > important it makes bluetooth work on my Lenovo Yoga C630, where the regulator
> > for vddch0 is defined with a voltage range that doesn't overlap the values in
> > the driver.
> >
> > Bjorn Andersson (4):
> >  Bluetooth: hci_qca: Update regulator_set_load() usage
> >  Bluetooth: hci_qca: Don't vote for specific voltage
> >  Bluetooth: hci_qca: Use regulator bulk enable/disable
> >  Bluetooth: hci_qca: Split qca_power_setup()
> >
> > drivers/bluetooth/hci_qca.c | 135 +++++++++++++++---------------------
> > 1 file changed, 55 insertions(+), 80 deletions(-)
>
> all 4 patches have been applied to bluetooth-next tree.

I know this is already applied, but I just wanted to follow up and indicate:

Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Thanks for the cleanups Bjorn.
