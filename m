Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364013B34CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 19:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbhFXRcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 13:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXRcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 13:32:45 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00271C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:30:24 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id r7so5388895qta.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+rsHIuusfgMY4pqsH67Cui+AEpTgqc5yU+NQJneTe3I=;
        b=nBGujxlend0FDFpaE8uA1VUl+5W3aXuZOEudrIKeZDfQ/+pPr4z/II/WEyNd+uPN26
         soAHBGP+8BikRpyXJAG3b8cFuHlgqAS3iEFezd2Ak3P1sLNeJUFtACX4Ma/t0C5DxnCj
         gDadjhrj4RKoBq1/dEScJTk1qx68aEBMsAMaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+rsHIuusfgMY4pqsH67Cui+AEpTgqc5yU+NQJneTe3I=;
        b=jvD6PpgxfcTfzF24EHN5zYg12Mvyq19VhCcoAAK3c7+jWOgyhuyhuSmsbd7H++gSVx
         SQ43kjlrSFh90m06/EnkaqwAieKxaRV5jxUAzBjrEvawDaofRwNGivLriL19TE3vRxno
         L1mKUeTWau65qlWsxL5AxhKlFYFiqT/V1wk7+GKE3xmGmgHKByI+7xNfae7mZp+Sakm6
         f8m7EhsZKjHGka8lEngq4X9bJpk9Je3H/GW0XsxcvD/XvsmTufMWxoEhNTX84mSAdOrJ
         9RzPZwfbSX7OShxZP5k6th5ARlrdSgP23QcodpOUhSZba214UFd1JnDS2E4rUL0MWr9l
         7ePw==
X-Gm-Message-State: AOAM532/w1dEs7YnFJGxrI5Zq0PS4XQouOuFW9LHIJUj5c7uDuhr+fQq
        bF9aeJjIU8NpZbUEgCBOUL3RQf2Wj6ZfEw==
X-Google-Smtp-Source: ABdhPJxS9T/fIAH8suLJdlObzkLcHX+uYRf4Yr+8R0wDcEQXP5s0kmgNtHUSh85aw9AxiR5NzodVVw==
X-Received: by 2002:ac8:5a81:: with SMTP id c1mr5924328qtc.194.1624555824049;
        Thu, 24 Jun 2021 10:30:24 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id s81sm3012113qka.82.2021.06.24.10.30.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 10:30:23 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id p15so403663ybe.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:30:23 -0700 (PDT)
X-Received: by 2002:a25:2405:: with SMTP id k5mr6470962ybk.405.1624555397076;
 Thu, 24 Jun 2021 10:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210621235248.2521620-1-dianders@chromium.org>
 <067dd86d-da7f-ac83-6ce6-b8fd5aba0b6f@arm.com> <CAD=FV=Vg7kqhgxZppHXwMPMc0xATZ+MqbrXx-FB0eg7pHhNE8w@mail.gmail.com>
 <498f3184-99fe-c21b-0eb0-a199f2615ceb@arm.com> <CAD=FV=UQBRY4hobBWVWtC8y07NLRLhpejdvUAD+7UWw-jqP2UA@mail.gmail.com>
In-Reply-To: <CAD=FV=UQBRY4hobBWVWtC8y07NLRLhpejdvUAD+7UWw-jqP2UA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Jun 2021 10:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4ZrUZagtE8qtRXwFEdw9FqGt-tpX-yCO3Hvi9Aw22UA@mail.gmail.com>
Message-ID: <CAD=FV=V4ZrUZagtE8qtRXwFEdw9FqGt-tpX-yCO3Hvi9Aw22UA@mail.gmail.com>
Subject: Re: [PATCH 0/6] iommu: Enable devices to request non-strict DMA,
 starting with QCom SD/MMC
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pci@vger.kernel.org, quic_c_gdjako@quicinc.com,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Sonny Rao <sonnyrao@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Rajat Jain <rajatja@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Andy Gross <agross@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 23, 2021 at 10:29 AM Doug Anderson <dianders@chromium.org> wrote:
>
> * Instead of putting the details in per-device nodes, maybe it makes
> sense to accept that we should be specifying these things at the IOMMU
> level? If specifying things at the device tree level then the
> device-tree node of the IOMMU itself would just have a list of things
> that should be strict/non-strict. ...this could potentially be merged
> with a hardcoded list of things in the IOMMU driver based on the IOMMU
> compatible string.
>
> Do those sound right?
>
> I still haven't totally grokked the ideal way to identify devices. I
> guess on Qualcomm systems each device is in its own group and so could
> have its own strictness levels? ...or would it be better to list by
> "stream ID" or something like that?
>
> If we do something like this then maybe that's a solution that could
> land short-ish term? We would know right at init time whether a given
> domain should be strict or non-strict and there'd be no requirements
> to transition it.

OK, so I have attempted to implement this in the Qualcomm IOMMU driver
in v2 of this series:

https://lore.kernel.org/r/20210624171759.4125094-1-dianders@chromium.org/

Hopefully that doesn't fragment the discussion too much, but it seemed
like it might help move us forward to see what this would look like in
code.

I'll also note that I removed a few people from the CC list on v2 of
the series because I'm no longer touching any code outside of the
IOMMU subsystem and I thought folks would appreciate less noise in
their inboxes. I've CCed a boatload of mailing lists though so it
should be easy to find. If I dropped you from the CC list of v2 and
you really want back on then I'm more than happy to re-add you.

-Doug
