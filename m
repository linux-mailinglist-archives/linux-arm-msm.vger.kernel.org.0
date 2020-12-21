Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A5E2E00B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 20:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgLUTJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 14:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgLUTJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 14:09:49 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374B1C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 11:09:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id l200so12285466oig.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Dec 2020 11:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jXAyXLJC4KWo9rrWBVxmVGURyU5fnZ6Gi61AYM/JKV8=;
        b=gTf7Se48gkxwcpAJYcv8cAaQz2UrvCH1s7isDCNIyq/X7hbr384PNOSxSUNWhv2Q0p
         etVibyQQ5bANIQ3fISiKDr43FH+hMfWFU5OLgv9zzuD5TwskjyCCYQSHlHq07yn7WbfV
         KqesUZBR9KTiIl4MGDvCjYHqI9yzryQHLD8hD9QdL75DK1CLTDmaIDorqsEiIdR71H9/
         gldO+9NaO8nmINbNqyKaOSIXfJYnaFvqyAqrUza7GZRrpQXATjElCaDlnB5u7Nl3mvJ0
         24b1gIdXMRABezhTx52lqRIXANS1QuWFUQAbVPGJ65fPeUsCoaFX/9aZCIOPDFUx30Ng
         nNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jXAyXLJC4KWo9rrWBVxmVGURyU5fnZ6Gi61AYM/JKV8=;
        b=TEE9YL8sfIKeAWHguv2/LajiMCaepYPbsUx1dwfW6Bub7Gg5fbTMO9lfZnsR2nRRjk
         SvzTDjVPJ2tw8IBp1JeGlA/ckZuU8UP+1jJX9siwxMH3rphCqMFGMbyCa4LmnvgqiGLm
         viztga6yVnuwu2W6oksq62wqX/Y97yci0CTwNC5gS3yWjZI2p5aWSxkeh32bDlz+sR+P
         7bpEuqObaP6/68k6oXNGET3XzEneSQeMAwvuLmq7kdXNm0u53YsFyU/s5jEGYHiaOwTS
         iLK1eyEVOFt2Te2JYbIaAK+3lavXwGst2NFuSMCIF3g58UJ7TodQoNrkLLAcQjOIHuGV
         QgBg==
X-Gm-Message-State: AOAM531LM1/ywiXiG+tgzu3dgsyzoZipn+B5v/zkaAhVBqLzNp0zx2NQ
        A1EM6wtoI8FhAbyFE8SrGTTODasdiEEb3TqFS3+5+A+uzCG95x/l
X-Google-Smtp-Source: ABdhPJyAIUae1EOjHS0F39XAyUidcMrOP/DWQLvc/E6w8afke/ONJcTvldzORcQ/H7UJi2vVXDtIhyT6/bdVvcrpcW4=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr11288059oig.18.1608559736101;
 Mon, 21 Dec 2020 06:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
 <20201220165845.3712599-3-dmitry.baryshkov@linaro.org> <20201221090244.GA53991@dell>
In-Reply-To: <20201221090244.GA53991@dell>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 21 Dec 2020 17:08:44 +0300
Message-ID: <CAA8EJpo7oHVdDWjhnoknt0vAPYHL0LsZsT8q6MpQs20a+OiCAQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] mfd: qca639x: add support for QCA639x powerup sequence
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Mon, 21 Dec 2020 at 12:02, Lee Jones <lee.jones@linaro.org> wrote:
>
> On Sun, 20 Dec 2020, Dmitry Baryshkov wrote:
>
> > Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
> > being controlled through the UART and WiFi being present on PCIe
> > bus. Both blocks share common power sources. So add mfd device driver
> > handling power sequencing of QCA6390/1.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/mfd/Kconfig        |  12 +++
> >  drivers/mfd/Makefile       |   1 +
> >  drivers/mfd/qcom-qca639x.c | 168 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 181 insertions(+)
> >  create mode 100644 drivers/mfd/qcom-qca639x.c
>
> This is not an MFD, since it utilised neither the MFD API nor
> of_platform_populate() to register child devices.

It would use them if the WiFi part was not on a discoverable bus.

> Suggest you use drivers/power or similar to handle shared power
> sequencing requirements.

What about drivers/soc/qcom? Or drivers/misc?

-- 
With best wishes
Dmitry
