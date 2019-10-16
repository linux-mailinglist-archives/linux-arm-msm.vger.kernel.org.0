Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33F3D9315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 15:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393732AbfJPNxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 09:53:46 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46446 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388087AbfJPNxq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 09:53:46 -0400
Received: by mail-qk1-f195.google.com with SMTP id e66so2233558qkf.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3MpqWuXCuED4lPwTmYmfLDrEaS8sTh/GqrnlfZctaE=;
        b=ZTpnmoyqnGgVdoOocqBKv1ocwCh2S7f0PpiyMV4dIdRuoP/uwZW5d6ztsvG0pAgtSw
         y7sVez2MZV86WJ5SQ1FShYHwPnWzykBrjjxkc4rCYBN3SCav7pp+VHGTtX9rAVrtAK4H
         ujkbkv5zB+bU8JukhvrmMxuKH7g0lukQWC8MJVPgkJDaWnaU8fRWA92YNR41ZCoVw0nX
         0AxbTtXKFIFMGENcQziYHggTX3O3CZiFjFIoz4Drfop4J4isyb9btpuo2RobmLyWxqOt
         MUbZdLOH/rpwVQrKtXY5M+h3A9UpdQ1cSCRJ4bwACNIwr+oNXke5DTIyNS0CrGofY8cb
         /67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3MpqWuXCuED4lPwTmYmfLDrEaS8sTh/GqrnlfZctaE=;
        b=oRzI/S8cHcfGdkfO34CTeRWS46FN3VNfMwpaKS58QF/y0rsM1xietpQorVBwZv+GOL
         f3ADnNDkbKXwM/On88Bz2RCOOQT+6ttfF7eNOjIj/iPtWoNNB2/KwaLt+xEG1htusB/R
         z2wzH3bbSqz3E0sAfl/77OVnokKjX/zYKLibrR7Y5VeSEr/whMAPySjlmSHrAQ6B+wkO
         x1Y3m8iKXvqsvEYEdymZc+HJq4jlI/fFMkBjfBRkxD8eNqDy0RTKflumV3CcoPWIbc4j
         mbzSbM3HEqE2sSNEmOY90ii1D9oPBy8I/vH2I7yNeBfMgmoynZpSuIeERHfqvBB9Hd4/
         XoQw==
X-Gm-Message-State: APjAAAWD+DAm6RqnCTnPeJubX6WbaWnGbQqMjQFozfc++kkM4fnq0+It
        nWhacAr/r461/biflNqs8tbIAxXQLdiLVAvv6173EA==
X-Google-Smtp-Source: APXvYqzLuVyub2/mFLs66z7+S1u7CxXVvwqKq63XhUOVOUahZi0oy4vFqDFB8kLVPHKNosuPfckb+bt652CkfqxFknM=
X-Received: by 2002:a05:620a:751:: with SMTP id i17mr40220819qki.340.1571234025322;
 Wed, 16 Oct 2019 06:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191005105936.31216-1-kholk11@gmail.com> <20191005105936.31216-3-kholk11@gmail.com>
In-Reply-To: <20191005105936.31216-3-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 15:53:31 +0200
Message-ID: <CACRpkdZRdSo+4ZrSbt+4FzRD7X5PaPQCX4A9eLnw5=Aa4bdfMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add MSM8976 driver bindings and documentation
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 5, 2019 at 12:59 PM <kholk11@gmail.com> wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> Add the documentation for this new driver for pin configuration
> with the pinctrl framework on MSM8976/56 and its APQ variants.

Fixed up the tags including SoB and applied!

Thanks!
Linus Walleij
