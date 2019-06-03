Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE08632EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 13:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfFCLcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 07:32:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47574 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbfFCLcT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 07:32:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B389660E41; Mon,  3 Jun 2019 11:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559561537;
        bh=u888gqwF5NhltRBK8QKDhfIseMU8jp8wEFqDIraWQdM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nMoCQMTLHHj4U+Y6FJPQlUokPulCRDfdG0mnglE0VnYreDcFAvUhXAB7ZhZ/xf2Xz
         pouMdu8/KphryGpg1bFGyBNHNsstHJel/gO7lr5J0Qq0aMTJlUZB6ANd9dRXN6B0Vc
         Cl59+jU74fIKLw40uoPLawLkGv6jueo9kTOf0vGI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F7E760E41;
        Mon,  3 Jun 2019 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559561536;
        bh=u888gqwF5NhltRBK8QKDhfIseMU8jp8wEFqDIraWQdM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hxQLPhaQslKp9q099I3Z4uSekA0WGa7SAv077w193RpFzKvwqHaoZFDupcsWhOy3h
         GS2T89RpACK5+kgV4Wng/QklehjK4cseEogNCONidArZowYO3qBvJZe5pMx4HynvCG
         CZfmelntQRr2W1WyuVQK9105rGLlFYPQCojwHpoM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F7E760E41
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f51.google.com with SMTP id w37so26465096edw.4;
        Mon, 03 Jun 2019 04:32:16 -0700 (PDT)
X-Gm-Message-State: APjAAAV0KbyQjbqlQndVvnGfWb1PbCgzre2dVzrSdXq6LM3Hyke1bASl
        X3nCWQmm++a3b7KhyC+dDYRMUSl8gu4qiu9LKH4=
X-Google-Smtp-Source: APXvYqyiIFFrNC2dS0VKPCYWX1j2jp1tB7QsnH94XhbngF15E/fbqVAiXipU+Z4bYlGRkMHto3FDPg70mdWqFQgEqKg=
X-Received: by 2002:a50:85c1:: with SMTP id q1mr25059239edh.253.1559561535071;
 Mon, 03 Jun 2019 04:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com> <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org> <CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
 <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com> <20190603111705.GA27163@lst.de>
In-Reply-To: <20190603111705.GA27163@lst.de>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Mon, 3 Jun 2019 17:02:03 +0530
X-Gmail-Original-Message-ID: <CAFp+6iEULiB74ecZQ4E+Jouj0AYZu4cDBgy3S2LuT6Ud4uf+KQ@mail.gmail.com>
Message-ID: <CAFp+6iEULiB74ecZQ4E+Jouj0AYZu4cDBgy3S2LuT6Ud4uf+KQ@mail.gmail.com>
Subject: Re: [PATCH] of/device: add blacklist for iommu dma_ops
To:     Christoph Hellwig <hch@lst.de>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Archit Taneja <architt@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Will Deacon <will.deacon@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 3, 2019 at 4:47 PM Christoph Hellwig <hch@lst.de> wrote:
>
> If you (and a few others actors in the thread) want people to actually
> read what you wrote please follow proper mailing list ettiquette.  I've
> given up on reading all the recent mails after scrolling through two
> pages of full quotes.

Apologies for not cutting down the quoted text. I will be more careful
next time onwards.

Regards
Vivek

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
