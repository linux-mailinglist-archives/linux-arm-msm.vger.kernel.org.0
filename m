Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917AA1CE70E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 23:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgEKVGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 17:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726946AbgEKVGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 17:06:55 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43373C061A0C;
        Mon, 11 May 2020 14:06:55 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id s10so11495208iog.7;
        Mon, 11 May 2020 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ueyDxErctHSTRdHdQtC1WB7REi3NqF34PG0me2FzsY=;
        b=LxZGLlzYiXXZFDJqEDO2gKToEoZMfLTFUJL1nrt4xthMX1vCvFQr2DCm0Y52vHZny5
         dyffsk+Qp5EMwMYyIlwsSNKssXJBYq61PDEdcxeBfej5+kaMmedCoPJHqQhKr3Ff2qo4
         iQYRLKvfoHe4exPEZi4mUfSoVc2Di9fsa4UnRcXnuxsl+qovV1JpVoYHpcLzu5dtVDFT
         Aerk5ucfrto0LQBEK8yju7tmhhR2Gd32rhgWxSwuRctV/0iewh4OPYFieKeGdyt25ENt
         ecIgX/ExeQEcQVAHXC/59o0kwfbOkQZkMZ3lnaoXakPRv0hTyDrb5Yi//Hgaa1sZ6S+m
         2pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ueyDxErctHSTRdHdQtC1WB7REi3NqF34PG0me2FzsY=;
        b=uKnFFoicR70xiay82Vw7EgG4LTo8gdsUvzkqMu3dT/FGgZH6GM2hGpQvmjUxKkAeoI
         Lha0UJmLWy70kssVjxuJ0hg74r4pGxedrXErbpOI2KgRmBNLt/yh5C/hvR1p7sB7JNN0
         VTpvDcCHL9N7R91Qejy0xiIZXXuNm+Szu4ZFxyfyUzMwIbzHLOrBLaRxrh9+4qaX1a4N
         uo3qRK4dXbQfsUcoTrUGBXeCNdRSvM8rj0FrsvqXTH3B0U8UtpMh5GgwqrKCQPv1BmQ/
         PE8kQ75RPT4fzCxIAPf1MjcXi9OWNPlsQI/GZsigbzHn+/Z/M4aWnpgmtPYzPAbgITe2
         TypQ==
X-Gm-Message-State: AGi0PubBGjWJqLlYYg8Q9yQVW2/jdG2Nm0isV3I0NSfJEQ15kXR4e9QX
        zXVx3ygLrESMNyxcUKUPhjjv7S3Gv6dYilfKIOA=
X-Google-Smtp-Source: APiQypIXeT2hw5xoo/BASceF3qnkTblBRgFVpJQUnRLWUxlPki1C+wwZoEefIYG+Cwy8D3bgBamhrbcwqD91QXmRVD4=
X-Received: by 2002:a02:c00e:: with SMTP id y14mr11836302jai.15.1589231214644;
 Mon, 11 May 2020 14:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205201.149804-1-konradybcio@gmail.com>
 <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com> <CAMS8qEWNuuo5t+D1Xq_aNbh5-GSvVSMJM6BpKX4SR=-2eBegpQ@mail.gmail.com>
In-Reply-To: <CAMS8qEWNuuo5t+D1Xq_aNbh5-GSvVSMJM6BpKX4SR=-2eBegpQ@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 11 May 2020 15:06:43 -0600
Message-ID: <CAOCk7Nr3bLD1vY_1LXNGZojxdyZZjt8Ghrdfb1spa5vF5ptYDw@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and
 its derivatives, such as MSM8939.
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 3:03 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> >Is the "| 0" really adding value here?
>
> As far as I can see, it is present in every other config.

Ah, I forgot about that.

Nothing to see here.
