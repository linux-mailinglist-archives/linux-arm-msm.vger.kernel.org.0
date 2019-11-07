Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F268F30D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 15:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbfKGOGP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 09:06:15 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:42721 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKGOGP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 09:06:15 -0500
Received: by mail-vk1-f182.google.com with SMTP id r4so597819vkf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hfccBQDXdKkofhhfdt33ltAt0xyMjhjwgr+Vw2ehaGU=;
        b=Mlz5zdqk9lqu+fG5wQH6AtKKww0+S9o3Sjn/moVy8ybUyCwUpcA9cpwcBRGF1fl96q
         tWGYNsQEF9w0MPmlMtillsBwlO7fmhmprZPMCdx6tr+lf+httR44lwucHs1mSMIdV9sQ
         vuQ+UWXtgrxZunQJr3RucRO8ScYy1w76Ufwx/yD8m+fjpOPDuwfGBgiTrf03Mk53LWcr
         lqLHPSGDmArpGJPAwKUlpntO5p0590geNTchseiYXyLXCRhtwmWbfJ97mp+CWMp6tNvv
         dfaN2KnPilkNIhp6BPKZOMuwurN14D8dmS3lOhJxzuSMsUuR8wekEHzvoHigYLGi0abX
         lIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hfccBQDXdKkofhhfdt33ltAt0xyMjhjwgr+Vw2ehaGU=;
        b=h1/iL3i/eNG/WghG+2woPo8USP0B5KsW+h++SlX4Tuu60qx3P4r+V16ptfpJOWR2wz
         fO+KqZD2TcoEBmewDRzrbPPQ8WnhJp4mWt+J4La5D8SNjvHaFRJFKR4P3SLnAC9WqlTQ
         6erCZQu8R3Qdsi05ldzoIKWgZHkWiFUlEJSIUmHDfTH54PXL3JkSDM1dtpcBhAAW1sAH
         atvCOV2x3FEA+B/7VkiK4iPmnPtxTixHmVGPmBm/LFIeXGhQKzL2Vd5GSAfZGTkyTt0W
         E7VCMIfl3L9ZYC5EN7lFXwxvn7ZaurwLcJexv2v8/Y0n4gSXlSL4bZt4WdUm4aLSw8Ku
         NRIA==
X-Gm-Message-State: APjAAAXz1wad1WDdXut6+uQ1uj7Nm0GWuZOZAT7A5ZqF0ROLhhqWPbnN
        7t2AtSnh78KVrwuzcR0c0ftL1tUuE17OykRay14mDA==
X-Google-Smtp-Source: APXvYqy3/Q2k+TcLkmUJSckC+YwKpjDcsNUVnGIkRuGNn9Jn7imd7+88YzAMU0JnNqJhJzwEJdXaNf15e1nP0SrN1/Q=
X-Received: by 2002:a1f:7387:: with SMTP id o129mr2941513vkc.73.1573135574411;
 Thu, 07 Nov 2019 06:06:14 -0800 (PST)
MIME-Version: 1.0
References: <1573068840-13098-1-git-send-email-agross@kernel.org> <1573068840-13098-2-git-send-email-agross@kernel.org>
In-Reply-To: <1573068840-13098-2-git-send-email-agross@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 7 Nov 2019 19:36:03 +0530
Message-ID: <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(Removing arm-soc)

Hi Andy,

On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
>
> Arnd, Olof, and Kevin,
>
> I have one slight faux paux in this pull request.  A drivers: soc change got
> into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> without messing up a lot of people who depend on the SHAs not changing.  So I'm
> sorry for this inclusion.  I'll scrub this better next time.
>
> Andy

> ----------------------------------------------------------------
> Amit Kucheria (5):
>       arm64: dts: qcs404: thermal: Add interrupt support
>       arm64: dts: msm8998: thermal: Add interrupt support
>       arm64: dts: msm8996: thermal: Add interrupt support
>       arm64: dts: sdm845: thermal: Add interrupt support
>       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors

One of my patches to add interrupt support to msm8916 tsens is missing
here. Specifically this one:
https://patchwork.kernel.org/patch/11201853/

Will there be a second PR this cycle?

Regards,
Amit
