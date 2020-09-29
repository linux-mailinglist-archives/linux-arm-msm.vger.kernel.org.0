Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137BF27D72C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 21:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgI2Tqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 15:46:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:43474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727700AbgI2Tqa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 15:46:30 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6A9C2083B;
        Tue, 29 Sep 2020 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601408790;
        bh=jjEzi8lg/fixZ8RSJmRBsh7VZs4uZ4cmuyV6enGSxv4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kpj8AilVQM5xcmwB1Vb5LrYlzGb2bJ3ug0FO3i3lKqqT6+bQVh7OTRej29MV5LnRV
         psaTnlyAqXAIu8B02xUOFooNMugUfaHjJwE7dKKfCJFzGf7f6aln2133qYvfH/UIrW
         uYKbeYC+vvdFVf3B0Na3rUddE8UxIy8jMDLBlGNk=
Received: by mail-ot1-f54.google.com with SMTP id m13so5643364otl.9;
        Tue, 29 Sep 2020 12:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM531UbWK847ffND11rL5wNQ6uTrCI7j5D3ljb4HBtlYZGHOJ3kfbR
        xhnFSqO5QOQVNjY8Vr37ipcgNrptxpi/uTUXww==
X-Google-Smtp-Source: ABdhPJwn8glarH4xnTwvOThxWuXdjV7eB4z3CGp5Z7Qqwtx9a47NmAh96i2eJuXIc3W9IlW8LNcb2k3TadFysAdRT+g=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr3933936otp.129.1601408789102;
 Tue, 29 Sep 2020 12:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200926131157.14633-1-kholk11@gmail.com> <20200929191254.GA984478@bogus>
 <CAMS8qEX_eB1pMLfqVCh5sHVaRevCYnpr+846LyZf9dH1-DQvzQ@mail.gmail.com>
In-Reply-To: <CAMS8qEX_eB1pMLfqVCh5sHVaRevCYnpr+846LyZf9dH1-DQvzQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 29 Sep 2020 14:46:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJF6gxtFMtQ7A3-rT7LSH07T8u=PdfVFAXtTDm4peiFEg@mail.gmail.com>
Message-ID: <CAL_JsqJF6gxtFMtQ7A3-rT7LSH07T8u=PdfVFAXtTDm4peiFEg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Add support for SDM630/660
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        marijns95@gmail.com, Martin Botka <martin.botka1@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 29, 2020 at 2:25 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> >You should just pull this from the driver data.
>
> I reused 8996's phy_cfg so as to change one line and not repeat dozens
> for what's essentially the same thing, so I don't think it's the
> better option..

Okay, save it for the next person when the if statement grows.

Rob
