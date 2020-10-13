Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B0E28D0D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 17:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730845AbgJMPCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 11:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgJMPCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 11:02:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4B7C0613D0;
        Tue, 13 Oct 2020 08:02:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id e22so260354ejr.4;
        Tue, 13 Oct 2020 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAM7EfDFr9OR4YTNHPZeLuBVp+G6gnuevym7qFvJmzA=;
        b=cCFzG0nSIoaJVyZq/8/NbfYxRPJPfh6g979j0moPFY6+KCJnnsD+YbMdtLeN5jL8Ao
         XX9VFC3sz29NyQWOg+jqJftmwVTKFcQBNFAHKVqSHI1uk7su1Q09NvlSVzbwi1lZTaeh
         xCRU013Dzdm/Al8TuOjcIsA8+AZM5wcLMtNhHqsgMYjP+nMAVzxoULw1SHutBjM0sl4M
         Za53Ym9fumir8CxXAHEPqxTF3nACdLpFwmsfhmSG0F1zjpADE6JNQPQ943qtzwTkTvNk
         UMHsOW1wj+RFxvwwjhcsa6ixiWPyTENeiOEbeToPfArvd7kvlVH9zuvRUAk3ERVKmqUo
         UViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAM7EfDFr9OR4YTNHPZeLuBVp+G6gnuevym7qFvJmzA=;
        b=QRMhBd/F4OcmUG9WqHHoNP5OZUoDyJc1AiBVKd+wx4lmMBg9QZc+Z8cBzyzAjSK4Xx
         vvIcQdSdd4ZnqZPVmp65V89h/hODQkwDsHxGe6B8hZK7Om7Pw+D4s44RWbr0hC9rzQUY
         bCZmhcIo16DlA9ul2q9mfj7TKZk9UOltPkplTnlRdm00wx69CEO8jQVhQViEyrWXloVp
         0HP1Msdb+dBdJrvyyA+emlTCpr0AFRFl/ClFk0dFEQanfDGCquntTEoiHz+1LDV3CzUP
         pYwJ1ko2AUESP8V0biN7whtQPKntsSQq0iizMtga1B+9U+He+0WO3IlWg347G8hqboLc
         z9Tw==
X-Gm-Message-State: AOAM533OeKyEO0NEIFfSlXG3n0IGCkd3i9ablZwXHFPZLiS546YNGo++
        YiEZvYGKpNYJ2ZSU5SyyKxypjndy3aTNC+wh5O0=
X-Google-Smtp-Source: ABdhPJwNJpJ3E1wbgnfSaQUJh1ehigdh2cdQqotQ19UT/u4WKtCnuc+Jb/3TAXQ1geS6WfT2Afr2CpRStFl2IbGOlYw=
X-Received: by 2002:a17:906:234d:: with SMTP id m13mr109679eja.497.1602601323813;
 Tue, 13 Oct 2020 08:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200926130306.13843-2-kholk11@gmail.com> <202010010401.JGjaiuVi-lkp@intel.com>
 <CADQ2G_H7ey8tfneOjtmDx1-hyzq1RvZzLeLZPtTM=2qOezrinA@mail.gmail.com>
In-Reply-To: <CADQ2G_H7ey8tfneOjtmDx1-hyzq1RvZzLeLZPtTM=2qOezrinA@mail.gmail.com>
From:   Martin Botka <martin.botka1@gmail.com>
Date:   Tue, 13 Oct 2020 17:01:51 +0200
Message-ID: <CADQ2G_E2-CYMADwwBjhmhOmHWXEVrzMTBxxVb7UHqn=ReLH+HQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: qcom: Add SDM660 Multimedia Clock Controller
 (MMCC) driver
To:     kernel test robot <lkp@intel.com>
Cc:     kholk11@gmail.com, Andy Gross <agross@kernel.org>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Actually, correction. This parent is used by cpp_clk_src.
