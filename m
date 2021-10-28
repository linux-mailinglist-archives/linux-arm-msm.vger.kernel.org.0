Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A97C43F238
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 00:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhJ1WEP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhJ1WEO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:04:14 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761DDC061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:01:47 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id y207so10342258oia.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kmwgHIUyfSQ6BfCgMiv31EIWkb4KtS9tXlC4mVfy3Iw=;
        b=gN5xGu8a4JJPCBhhbQEvdKwVpBl+w6OqLRm2f7vkVsZp2n7jyXq1GGexcbQDRstm6+
         pSaUsIeukgW4o/UppKIiUAxFVWEZFNwnIljG7Qw1UvKBqhiB8XHGS8BgmptYF1hVGxVt
         BT6/wbMTKqtaxmyrCi6WBLqmC0c8Eo5BIASLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kmwgHIUyfSQ6BfCgMiv31EIWkb4KtS9tXlC4mVfy3Iw=;
        b=TvGHccToCkrfKvgMH1KaQBa7QVm3nAQ3bIflUdEZDAQQsoBHw7NSYCFiBPG8v821Qf
         DqVdxgw4tMUiKJXe+/1WyizU1v8Fpxu38+vh9scemXlym4fVGFhaKDzXFKkoyX2H5JGr
         cwMYSzaEkbCXPDul+c1RZhldWapnD5SwgDUXpM5h5UnHyeW8Wp7dKyXDRrjBn8nqmEA7
         HNKrJsnJTn5JFoJszKYJopnaCDFsOX2wbm6hIyWiWo4IW7Dy0ckbHixX4HOahNkhcaWU
         bk+ect9pDRZmGVbmWTelfyVYTSoKc9hwAh9b54lNFVcy7hTb30696tOTEj1mUxUk/w0F
         w4XA==
X-Gm-Message-State: AOAM5323LiWj3MEBHS4nyECFCPG/pzyKvA0DDeAxxn/jLSTkEB4VBNBF
        hMfWFJhzw6+M7kPlhSHjyjTjI9pjL0HOkDs8PMXwJQ==
X-Google-Smtp-Source: ABdhPJzzhpqn43FGuWlx7LrCWvU8e3n/+ToKKqYdn7jIiVawi/ws1aXxZzBYb0c8kaSvso329auJPQ1ZnsMw1vqxq7Y=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr10986132oib.32.1635458506879;
 Thu, 28 Oct 2021 15:01:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:01:46 -0700
MIME-Version: 1.0
In-Reply-To: <001401d7cbfc$f0d1d700$d2758500$@codeaurora.org>
References: <1633330133-29617-1-git-send-email-pillair@codeaurora.org>
 <CAE-0n53rkv5SKO74M+7bkuMgaD7tS0k6a8m7KeQL8j3DTHdB_Q@mail.gmail.com> <001401d7cbfc$f0d1d700$d2758500$@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 15:01:46 -0700
Message-ID: <CAE-0n53KCUoJWdKTY954OviRX4yShigByHB4L3OGTAGQEaHoqQ@mail.gmail.com>
Subject: RE: [PATCH v6 0/3] Add support for sc7280 WPSS PIL loading
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, ohad@wizery.com,
        p.zabel@pengutronix.de, pillair@codeaurora.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting pillair@codeaurora.org (2021-10-28 06:08:39)
>
>
> > -----Original Message-----
> > From: Stephen Boyd <swboyd@chromium.org>
> > Sent: Friday, October 8, 2021 12:05 AM
> > To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> > bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; ohad@wizery.com;
> > p.zabel@pengutronix.de; robh+dt@kernel.org
> > Cc: linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; sibis@codeaurora.org; mpubbise@codeaurora.org;
> > kuabhs@chromium.org
> > Subject: Re: [PATCH v6 0/3] Add support for sc7280 WPSS PIL loading
> >
> > Quoting Rakesh Pillai (2021-10-03 23:48:50)
> > > Add support for PIL loading of WPSS co-processor for SC7280 SOCs.
> > >
> > > Changes from v4/v5:
> > > - Add yaml conversion for adsp/cdsp dt-bindings
> > > - Change clock names in wpss dt-bindings
> > > - Correct mistake in signed-off enail ID
> >
> > Can you keep a running tally here of the full progression of the series?
> > That helps to look back and make sure we don't make a comment that has
> > already been made before.
> >
> > One more request. Can you add support for 'firmware-name' like there is in
> > Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt so that we
> > can install firmware into some namespaced/versioned place instead of
> > having to put wpss files into /lib/firmware?
>
> Hi Stephen,
> I have posted v7 with the support for firmware-name to be provided in the DT entry.

Thanks. I didn't see it in my inbox. No Cc for me?

>
> > It would also be nice to load a
> > single firmware file instead of having to split the file into many pieces.
>
> This would require lot of changes and lot of code duplication from request firmware.
> Also the base ath11k firmware files have been posted as split files.
>

Other firmwares have done it so it seems technically possible. So
nothing is preventing it?
