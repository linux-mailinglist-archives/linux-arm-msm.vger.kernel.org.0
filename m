Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8E0285422
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 23:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgJFVwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 17:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgJFVwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 17:52:06 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F172C0613D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 14:52:06 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id 5so63851vsu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YeppZLiu9tLWSM88xn2T8mZXPgzIZZbq1gb5kP8VyQ=;
        b=D0CViFWicaJSRMBsvFS4k9lLoXmgiJv4f+Oe3aEX6L4BH+k+fQhTgdb9RxiwKym9Ty
         AkO2ovhUXu5tvyDDEePWlNObPVa79S2+YzukhMfrJ9jZf1XRLwO3+RjZXEfIgXAWezfA
         xLAB3c+qvgTS9/AFEvykcnXHHS93FRYNsfSFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YeppZLiu9tLWSM88xn2T8mZXPgzIZZbq1gb5kP8VyQ=;
        b=Wf6Ma0mwczYLtEz7nHpjtFh6lqzaxycUxmRbHnvdK2Wv0iZ6EXZW8j0+++oEkKnPnN
         FbBcUv4FS4LfuF7qUrOObtBB6t0M6KfpPw2k/019QTYjF1B0bO6q/u8oMGgm7TEX9amH
         +Jlhxf++OXjgUo7wPTA5n1Q90FbJtq94kyW400cz7kfExwLDfWYx1H4A3jgZJquE7LLy
         SuhIruh4Xa9IYpJoun7Q4QzWndfqVESfeX0cdT2pdhnSqLKNnWlAJcajq5EfPIdz0fzm
         0veL+JFLvRrmgTEslm64ZwFLAvDNraooE/mFaq6lB/7I1GNHV9ZoynPsDEMSWWfR8nHL
         a/Iw==
X-Gm-Message-State: AOAM532Ypa0g1upVVHdvwASbdpuOdTFjv48tLJDp/x/GU4bPsCMgkYfn
        1VozioRQ2jeR5JStsxrLDbzP7tc8W+ASgOZW237oNg==
X-Google-Smtp-Source: ABdhPJzae7J4+h5AoXghKCrPweh+Hv6Ybexc6cVhxtGSicYb/I/1mNGUDtRerOoUkrWc9T1RPJH+P6YO7cOVFUSgGYE=
X-Received: by 2002:a67:8b45:: with SMTP id n66mr72042vsd.45.1602021125669;
 Tue, 06 Oct 2020 14:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <1601965767-18796-1-git-send-email-bgodavar@codeaurora.org>
In-Reply-To: <1601965767-18796-1-git-send-email-bgodavar@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 6 Oct 2020 14:51:54 -0700
Message-ID: <CANFp7mXYsK=+aAmHoNwTnE3+b0HbTa+k1NQb_1MD9FaLBYXdug@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enhance retry logic in qca_setup
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Hemantg <hemantg@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On Mon, Oct 5, 2020 at 11:33 PM Balakrishna Godavarthi
<bgodavar@codeaurora.org> wrote:
>
> Currently driver only retries to download FW if FW downloading
> is failed. Sometimes observed command timeout for version request
> command, if this happen on some platforms during boot time, then
> a reboot is needed to turn ON BT. Instead to avoid a reboot, now
> extended retry logic for version request command too.
>
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
