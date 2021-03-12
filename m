Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C3B339910
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 22:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbhCLV2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 16:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235163AbhCLV2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 16:28:25 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43B3C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:28:24 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id 73so4973197qtg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8axFXEbeUUKhC51b/Zbb+pz1bcSRSZPhDQ6IrijfhIA=;
        b=B28f+Z5CSKc5xbTKtMVU9/m1anUyDUmueNMuPUDLur4M9F/uAgVBH8EzrHsY1lVfNf
         1JrINUh28Q8zXAo8zMB+DeM8pXXDJHTcIcfmQWioYBZ/ccrJkVpKc2BNeb8A77/RRsQu
         PUdGRPUHIa5J6ohWMcFxrYEyfWOoihlNosARk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8axFXEbeUUKhC51b/Zbb+pz1bcSRSZPhDQ6IrijfhIA=;
        b=f6pnwM4ksslGSPVw28ire7U2Cnm+dZxMpid3w1pN8DCYcqZUGzZqttlFRLbYO3Mg56
         1M6CnMkqg9Zqoi5fyabbD2Y4NdMmTnWtbxSTzmSEhuObsXWf3DtI4qP2GiCyEeCl8eSz
         IieWFCvgbFygPhoYuKpvvlPkeASImu9Fly767dBVWcyBinaR2pBIlHGo4FOVAJDaEZrW
         u0YOehtRP3BCgT4f/nWYc99BKvh6HvxNMz42OEEr3Q4rA6uQ+zZEJEjzETFuCwb4A76E
         V4e/mw6Osmf8o9oibpyVYxDbGeOJgCMuVlChcIEhSdCtzOaGSASCWskKsIvT2VLQ882J
         g8kg==
X-Gm-Message-State: AOAM531Wew/Y+cOAvJP/SzcH7YNW/NCi5AeYC6Nz1S90s2FR0c9u8BJN
        wDqoC5anPd8PWJNEaLjBB3RTXX7pJCsAqw==
X-Google-Smtp-Source: ABdhPJz7LuSGU7gHmIwOyW+GCcR8CTFYg6zhYnvzp4RfFItUg0iYYsK3f/F8hx8mGQnMTIpNocMrtg==
X-Received: by 2002:aed:2981:: with SMTP id o1mr13393835qtd.386.1615584503926;
        Fri, 12 Mar 2021 13:28:23 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id w78sm5333963qkb.11.2021.03.12.13.28.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 13:28:23 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id b10so26856100ybn.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:28:23 -0800 (PST)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr22419877ybi.276.1615584502806;
 Fri, 12 Mar 2021 13:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20210312160622.24165-1-srivasam@codeaurora.org> <20210312160622.24165-2-srivasam@codeaurora.org>
In-Reply-To: <20210312160622.24165-2-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Mar 2021 13:28:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UmLh+RBucrcW=Y3HgD-E4g9vAEK-G4Aj0enszETwBciA@mail.gmail.com>
Message-ID: <CAD=FV=UmLh+RBucrcW=Y3HgD-E4g9vAEK-G4Aj0enszETwBciA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for I2S driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 12, 2021 at 8:06 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> +               dai-link@0 {
> +                       link-name = "MultiMedia0";
> +                       reg = <MI2S_PRIMARY>;
> +                       cpu {
> +                               sound-dai = <&lpass_cpu MI2S_PRIMARY>;
> +                       };
> +
> +                       multimedia0_codec: codec {
> +                               sound-dai = <&alc5682 MI2S_PRIMARY>;

Please change "MI2S_PRIMARY" to "0". "MI2S_PRIMARY" is a numbering
system for "lpass_cpu" not for "alc5682". I'm not aware of symbolic
names for the alc5682's DAIs.

From digging through the code and testing, it appears that for alc5682:
0 - aif1
1 - aif2

Thus you could be a little more documenting by doing:

sound-dai = <&alc5682 0 /*aif1*/>;

-Doug
