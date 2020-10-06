Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EF928542A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 23:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbgJFVwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 17:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbgJFVwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 17:52:46 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E556C0613D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 14:52:45 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y194so68377vsc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fBB2dN7PdVdzeo2GaMVbE6RJ04Kn9xtAgetaWZ+zY8=;
        b=j8ntnkFTswigoDlM2kyeqSJnc2fj4esZFkzvc+ruGDYe/EKQ32ogWQakV7iq525v7z
         bR0JIdfXxMtuGKKbkC97ikiGOh7EOcbTBoXZXD1aIuwSEEFV/PdWgWZmSjmtXw6A172S
         AShlaJNKVdo9XefO6oV2tFPa9wc1RaopZv+K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fBB2dN7PdVdzeo2GaMVbE6RJ04Kn9xtAgetaWZ+zY8=;
        b=KAs2TqTzVVJrz0ifNCpbX4Num8v5um104OZJGADGuThsFNETyGOXD+R/oXmrvlCu6B
         NcQak6E2cmCRtw25m0flRmA1KOzV6XYSKGlHNp9ultnjFKBagK0SQtMxE3ek5gaaPuxn
         KTpzz1079ngHeI0ahB0rSTkkJWIdVjySQzhF1bsdkJTibFQCy4diqI5XN6N/qjFKJ15G
         2OtjEiotnj7Dr6TiZihhpcs8RzQZi88lKuPB0hKiwO/JkOKnmhaz+6Vd6GIEis9vHhsM
         twAPKAirDqZlUgOB32ysh5e3PDNknIPyijFyw/C8+pIlLWfGc69SwL6v4me6zM51lM4c
         s3qw==
X-Gm-Message-State: AOAM5316VZJgTf+ZakYUWju/duUEnA5CkiOx+fXWOL70Ve6/NWqcOXjy
        JjMgW3wBTiSpP9ZAOgbgcVtdzOlP4VJ5DGSPNSw4VQ==
X-Google-Smtp-Source: ABdhPJzneCJCHYv0M1DrM76Ar6uigcbc3WG3NIajdN24GCsJGLRUKR6frfTDFPPkxH5b41lK85jBVXzoSJwinIYY7OI=
X-Received: by 2002:a67:f857:: with SMTP id b23mr57260vsp.10.1602021164282;
 Tue, 06 Oct 2020 14:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <1601997621-12056-1-git-send-email-bgodavar@codeaurora.org>
In-Reply-To: <1601997621-12056-1-git-send-email-bgodavar@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 6 Oct 2020 14:52:33 -0700
Message-ID: <CANFp7mWU6DEuHxQqq+hnWfCnqrJLo=kY41J+uM7AfjEpTnzH4A@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Wait for timeout during suspend
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On Tue, Oct 6, 2020 at 8:20 AM Balakrishna Godavarthi
<bgodavar@codeaurora.org> wrote:
>
> From: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
>
> Currently qca_suspend() is relied on IBS mechanism. During
> FW download and memory dump collections, IBS will be disabled.
> In those cases, driver will allow suspend and still uses the
> serdev port, which results to errors. Now added a wait timeout
> if suspend is triggered during FW download and memory collections.
>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
