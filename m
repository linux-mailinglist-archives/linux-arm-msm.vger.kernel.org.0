Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4D139C2FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhFDVyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:54:18 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:35429 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFDVyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:54:17 -0400
Received: by mail-ot1-f51.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so10519820otg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=dyM/pGSjOHd50Vg44ExyUz7raaakuo5RxeNcX2qCcbo=;
        b=Xp2syEfwS8n5MownjsGHoZZPEL0o7Dt/L3jsFzKaiqFI6dfI0YUJaNMM0JyW10GRbA
         NsxoUIr9alS+PHpSJnqfeth3/b7nJvJC3/0ctEMe5WWntY8qblH7oewDYynk30P3IPCD
         fPOqVBNxF9vNW9W6r6vcqXtod1x3Dl1gEMMK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=dyM/pGSjOHd50Vg44ExyUz7raaakuo5RxeNcX2qCcbo=;
        b=h9pSV2kAqV1VXeb6Zfgs7lEIpEdhinNhQGboCoqbtjEHLbBp12eacnA3/MRfhaE00C
         eQK9ZpUz0l7BbLnBIpMbh7KGwTX/4qwmEDOqxnTLytnZVd+OpFSZGbsz3sTNkFi1HH8S
         xazoOel/J9Ae/gGbJlYWscR1dMg1TUCP4jFHc8MB4niXQh2zeA8aYU7OL0t7E8pKSPI6
         Gapbmwnt25aK6oRL7aKWljFB/1sXld+7xxV4+ceaggv0zEvZkByOi2rozOF0LvR0QHTi
         bzLa5HKPvdpdSNe4nNHdWFuHfUnP+O0eGCiqjlYBB13bshBSMJentttRku6XDVtCatRK
         s5vQ==
X-Gm-Message-State: AOAM531Lf1FOPdZAVYA1nIQV+b0bdctg7gr4rjRB5V6MmAvPnRTdLf6N
        3zdka0XWgNFzgXAjn1TYSzGda0v+CQn6vYGSoD01pg==
X-Google-Smtp-Source: ABdhPJzlROhW5qRUQJy+duE/Z3VHQar2kQt9G1VpCb+njSOjmrPV/nmcHDyQbIGDhGpVqYm3LL2bxveZ6eGMFMa1JW4=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr5304003ote.34.1622843491053;
 Fri, 04 Jun 2021 14:51:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jun 2021 21:51:30 +0000
MIME-Version: 1.0
In-Reply-To: <20210603081215.v2.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
References: <20210603081215.v2.1.Id4510e9e4baaa3f6c9fdd5cdf4d8606e63c262e3@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 4 Jun 2021 21:51:30 +0000
Message-ID: <CAE-0n50uU=zuU0KLY2XUvB2cH_MUvXo231wj4T6JdQDbda=TnA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: pm6150: Add thermal zone for PMIC
 on-die temperature
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-06-03 08:12:34)
> Add a thermal zone for the pm6150 on-die temperature. The system should
> try to shut down orderly when the temperature reaches the critical trip
> point at 115=C2=B0C, otherwise the PMIC will perform a HW power off at 14=
5=C2=B0C.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
