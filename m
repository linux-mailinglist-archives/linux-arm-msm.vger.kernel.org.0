Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3874FDBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 20:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfFWSyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jun 2019 14:54:39 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44677 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfFWSyj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jun 2019 14:54:39 -0400
Received: by mail-ua1-f65.google.com with SMTP id 8so4837575uaz.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2019 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwiVA+zdiXVtcAA48z1FRqgt/DlrA/D4evtHSh23uZY=;
        b=WXW9FMSzc1UsTJ9rcjpMCaBxf1C5ZoHQ14UHz9qlPWDHQ33TLNnXHqXeCW1ClW/+ST
         XQwra40eUZSCdu4HdPc9kJ1NmaHLfVy1gGjvaL1awaEzqtNkPwTte9x7gYkuYF0fhGnF
         GU5wQy9BmQqlbvy6M6Z44zI4no0tW6MjFIU/7bFpx7Tl3VPemNK1v+iApt6V8tkbxPPB
         pr3hMV+RUiwIsvrH15F4EshfYsykku4k2+kHzf2Cpz0WEDF/utrZSZBCbTYCw/jLYpor
         O++P00M0YlBYp2h7ISt02IDLepKg3z9WgCBPolmvzaWqrpK92FeNZwoIYiCLcEXPSgvM
         ekMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwiVA+zdiXVtcAA48z1FRqgt/DlrA/D4evtHSh23uZY=;
        b=HOGBMGqGXTMqCtcFFXVBGH8Nu2sme+YbA9x50Enuwcc01D5qtC3hykuYV5X9EEDBQm
         Cdd0oCGTQMt/JtbwCltu6Npo2oadid0LN8i0w0FowthuPOLUxqxlhZBFphvHLtkgl8d4
         3yfUq8aWi9xqdVfbp8cWp2hjcYevRP8n3jL/Is9PlijkoZlrn6pO6k+N8wUAxwD90LqQ
         wr2+UjgYa8lQb/mVVql1FYVYYx9doYHO2KbyH+g7V1m5BbIyjntQm0UOTmokv2XyT+Zi
         iwUAkCnYcfuviqO1TB01cEedJisMRVtrf9YXVN4zhR74bvgosCpP90am1ssehCQOn0NG
         9dnQ==
X-Gm-Message-State: APjAAAXMZ30oYcopxnv6y279twXYL4i/SPqUya65eNBKiCf5D7WcGtpz
        0IP68V2r2bYWMLh0SJ/E6raTc1ZIvzB1STH15iO54g==
X-Google-Smtp-Source: APXvYqzCzRAym8rh7cPGxz5P73v27dCWRwG4pG1j4xoLUfqZS/QTXvBWM1/a80OjBJmtJ0Ubodh9P1H1ZuNsZ8OVOQY=
X-Received: by 2002:ab0:23ce:: with SMTP id c14mr9036423uan.77.1561316078413;
 Sun, 23 Jun 2019 11:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr> <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
 <d6f20e7b-2609-faf3-3dfa-aba644d8a9b6@free.fr>
In-Reply-To: <d6f20e7b-2609-faf3-3dfa-aba644d8a9b6@free.fr>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 24 Jun 2019 00:24:27 +0530
Message-ID: <CAHLCerP-dwpEdquSJ8F-tWatp97LHaF-uCxPNrvB4FStdTw0gw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 21, 2019 at 5:06 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 19/06/2019 15:47, Georgi Djakov wrote:
>
> > On 19.06.19 14:44, Marc Gonzalez wrote:
> >
> >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> >> built by default. List them in defconfig after dropping the default.
> >>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> >> ---
> >>  arch/arm64/configs/defconfig | 2 ++
> >>  drivers/clk/qcom/Kconfig     | 2 --
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > Sorry, I wasn't very clear. IMHO the defconfig change should be a
> > separate patch and the v2 of this patch is ok as it is. It would just
> > make things easier to merge.
>
> Oh, I see. Could you give your Ack on patch 2 then?
>
> Would the defconfig change go through the clk tree?
> Or maybe through the qcom tree?

This defconfig change could easily go through the qcom tree IMO.
