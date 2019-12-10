Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00AD2119246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 21:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfLJUlV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 15:41:21 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:44168 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfLJUlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 15:41:20 -0500
Received: by mail-io1-f65.google.com with SMTP id w3so779369iot.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 12:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wFg8ZEWJIN7vey53mkr4mIFmYCyQyvthzeZbaGJwPkw=;
        b=a6cnK+73982+3Kq5xHFk7AV6S2kIJzbXAeQjdiuU/quDeRHtvjScGn9NdiBzAl+ehr
         YObqKIw+0lJPMEvJ2S4WKhnhjyPdQmeaAfUXnzZrpkSItd5rvp+KOq19FUd9FR3Xc07s
         PSqfT0D1aQ/Apqo1M8znUmPBZWMMbjplC9MMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wFg8ZEWJIN7vey53mkr4mIFmYCyQyvthzeZbaGJwPkw=;
        b=aZfuLhPUuMi0eG1MdfhmbRF+cLlGwMeahUvMIo6sc0lYTbrCyfkmWBv7SUiREGFXCp
         swzZoRzmF/ntS9Wc8P1JmX/ammUWKG1qGE9hkDPraXit0t3317Ctq2OO8bkSPMP25zag
         dBeWXnFV1DBDQnFAsBXIXG48Vuy316DlfqOM1YRwF1gGnHkS7mF8bEWkZ1jHZl3LJ/wG
         ANvL/baEFmKahg11+Mhudfjm+OKLCZqzchYpFsoBN1gFIxsbQl4DLJXzyZ8WNDD06T4V
         j+MV29CPzzYfhfXAdLx85eYv3SjsrcNLkZEPvpbJTXymExUg42Rklb80G9hvhbE7FF1s
         +nAg==
X-Gm-Message-State: APjAAAWvoWSclLs4dpj8H2wmJnFUkejmRh7nircenoW6ufg+OM1HvvO5
        WNpqk20uSOgZTt00X7ITc0mnUtcMYBM=
X-Google-Smtp-Source: APXvYqxDk1+oammm51X1CHOAjfCCXUDp+yh3hFe72qtB14w56soGKDBTPaIDmqgDIgkzU++74BwRFg==
X-Received: by 2002:a6b:fa08:: with SMTP id p8mr5861611ioh.1.1576010479592;
        Tue, 10 Dec 2019 12:41:19 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id k22sm922022ioj.24.2019.12.10.12.41.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 12:41:17 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id x1so20266563iop.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 12:41:17 -0800 (PST)
X-Received: by 2002:a6b:be84:: with SMTP id o126mr25960550iof.269.1576010477101;
 Tue, 10 Dec 2019 12:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20191108092824.9773-1-rnayak@codeaurora.org> <20191108092824.9773-14-rnayak@codeaurora.org>
 <CAD=FV=VUoj1egZqw9koNHDPBCCEh_XZ5nZAPNKcnya2UACG8hw@mail.gmail.com> <0101016eef5f3e37-2ab48ced-3543-4680-82f8-2c1950b012cd-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016eef5f3e37-2ab48ced-3543-4680-82f8-2c1950b012cd-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Dec 2019 12:41:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UgqcO0zELnopP9DXSqc-AZpJVwT24CDxrt_P39eWK9Lg@mail.gmail.com>
Message-ID: <CAD=FV=UgqcO0zELnopP9DXSqc-AZpJVwT24CDxrt_P39eWK9Lg@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 2:33 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> On 12/6/2019 5:55 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Nov 8, 2019 at 5:29 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >>
> >> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> >>
> >> Add QUP SE instances configuration for sc7180.
> >>
> >> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sc7180-idp.dts | 146 +++++
> >>   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 675 ++++++++++++++++++++++++
> >>   2 files changed, 821 insertions(+)
> >
> > Comments below could be done in a follow-up patch if it makes more sense.

Just to note: looks like your patch is now landed in the Qualcomm
maintainer tree, so I'll look for the fixes in a follow-up patch.  :-)

-Doug
