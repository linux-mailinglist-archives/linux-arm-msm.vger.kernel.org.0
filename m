Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22F8758B0BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 22:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241135AbiHEUIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 16:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240859AbiHEUIw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 16:08:52 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F378318E16
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 13:08:51 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id v185so2653775ioe.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=X3jszDKVbqc5LgLk/f19b+sABvMxiQhYlgFi+rpy6H4=;
        b=X/VN2EIwdNRbM6JFfB78DjMUfN7WIXuSZmfIDfZpYYECgbmEnkTZT/ppymsnTHgeOP
         WvxdNcAibtF2ehZI6Fj9VcyZ3ah4b9g99YXw1RZOo7/eanWDu6MCKw9TTKw8iHtzF8aQ
         SWb8ydZFr9s3zV3gPqynOpzKLamklgeSHbe3N2pFJ42hy4BVnGF87DVLRxQG7aLlY1jg
         eG05AnTNzKKdKhpzY3onFV0nGWRukDbTtIvmsyl09QyPvIiwlHE9JkU36qgAtZhn52jm
         L7EqGnj4DCBXMb8O4nnlpLiMQ19UJxIkKmjx1B3DhSGb37iWfxsxiXOtjltoQrWZXmmB
         N5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=X3jszDKVbqc5LgLk/f19b+sABvMxiQhYlgFi+rpy6H4=;
        b=HNO3yt1fIHv+EV85BafB4S7zD09gtv0cl5Qc3fkUMDJTn4g24kki3hQBAFg4D8E3GI
         SDzs01i6RY0mHB3Hp1MsaBAcEh7xaU+ze+a+HhJUFiIB6ZEFf6yQ+SyeJ3Ws0nYNK0at
         Y+ga5GJOsMk47DbCWX8/HkbzPis5dgYawEzjvQUQKOLRLz3jWluRI9KpBRGE4MfmjHMz
         CCy6TMVgV31V4GfGpSSjgU8OowGd6AXHW1LNQ6leHzZqbyRQDCUwvTfxZOqlgepTRK4H
         zL5cKSgrGHC32lZQhT3kJTTyNJPjsewJ+uoHAZt93vyWLwymOS5gJLJ9oaiaN2LCblwF
         B5VQ==
X-Gm-Message-State: ACgBeo3lCY8LzsVcaNwa/YUpw45iuHRSCBn0VQaXoU49kwZT8mbn3Tz2
        ixXlQpKLcFpl8Frz6fPDkX8nvaudl2BVKXS7Wg0=
X-Google-Smtp-Source: AA6agR4VQiaXWpr6VcITODd1FiPbC3w/NtDCVe6q4C6AtZ0RJhN1p8UghcxajJoGk4AtrYccK8vM0jathTcpySNZbvU=
X-Received: by 2002:a05:6638:1353:b0:342:9bfb:7382 with SMTP id
 u19-20020a056638135300b003429bfb7382mr3751680jad.129.1659730131310; Fri, 05
 Aug 2022 13:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com> <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
In-Reply-To: <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 5 Aug 2022 13:09:17 -0700
Message-ID: <CAF6AEGvdnrPn+rnDGmjza1-xoPaOQgdPLkSfaOL6hCPnB2ea5w@mail.gmail.com>
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 5, 2022 at 2:37 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 23:37, Mark Pearson wrote:
> > The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
> >
> >    amdgpu partially revert "amdgpu: update beige goby to release 22.20"
> > (2022-07-25 14:16:04 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
> >
> > for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
> >
> >    qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
>
> Mark, it's so great to see firmware packages for Lenovo laptops being
> submitted!
>
> >
> > ----------------------------------------------------------------
> > Mark Pearson (1):
> >        qcom: Add firmware for Lenovo ThinkPad X13s
> >
> >   WHENCE                             |   8 ++++++++
> >   qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
> >   qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
> >   qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
> >   qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
> >   qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
> >   qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
> >   qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
> >   qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
> >   9 files changed, 109 insertions(+)
> >   create mode 100644 qcom/LENOVO/21BX/adspr.jsn
> >   create mode 100644 qcom/LENOVO/21BX/adspua.jsn
> >   create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
> >   create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
> >   create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
> >   create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
> >   create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
> >   create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
>
> I think it's the time to settle onto firmware paths for the
> Qualcomm-based devices. At some point it was proposed to use
> qcom/<SoC>/device/*mbn.
>
> So, in your case it could be qcom/sc8280xp/Lenovo_21BX/

I don't think it is a good idea.. we should stick to a path that can
be constructed from SMBIOS fields if we ever want a chance to get ACPI
boot with acceleration working

BR,
-R

>
> Bjorn, WDYT?
>
>
> P.S. Can we hope to get firmware for older laptops to be published too?
> It would be really great if it would be possible to provide full support
> for Yoga C630 or Flex5G using redistributable firmware from linux-firmware.
>
> --
> With best wishes
> Dmitry
