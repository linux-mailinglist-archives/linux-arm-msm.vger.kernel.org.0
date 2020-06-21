Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44E6202C18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 21:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgFUTGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 15:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgFUTGE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 15:06:04 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4540AC061794
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:06:04 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x202so13681569oix.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2020 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o53PdA9uPCJnfRH0bPZtJEfl2g77G3rHoAKUfp/7kUo=;
        b=Uv29zYAVX0tqPL1HplFFe7dbL1EPjMyH4TJF2szni+U9GYruN0WuhWks/JS+IaTOH+
         CX+scc33/HczNRmVNRG8B9PISC+uFAmv6rivLOFuC7xQTtUUW5+IqrduxfQfTdDSUFOt
         r1+DA9dE6yIDNaBieTpNekHldFWe2JansxxSJPdROdjFbXTIjIWy001OEyZncJrWfu+w
         miwX4BzeePlx8QJfSbSakQnr3D3N1BPzSM/zQ1rckuVi+LEz8Sxbn4oC8MDopTlk0Dth
         9d5E3qusi3Zj8KoxRug/my8K35mpTuMrrbgQGb5z9i8+XhpthdE2k9EUGa3A5TE4nzZz
         5hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o53PdA9uPCJnfRH0bPZtJEfl2g77G3rHoAKUfp/7kUo=;
        b=leV4JQnRFcalnJFCXy+uxpHcqKJ5v1XU8tB6oZei2Svz0z178e5P2+c+ebV8inCKob
         xr9qumWJjPXmm0lttm+8ktV0L2pJDSX8dPcpEmd6GA1Ro7+idW14Q2c++1I3E8rBstod
         3NiW1Kwuj5tWi2jrZBGGgLq4XC0xwGhM5pIKVLkrOBptY+euD5hShrCxegyHQxHD77/w
         7nv9cLDzrxRtq+C59Lu1IA98ZhfpbXye8go+dlIN50hyqYGh3pJx6Ao/nlPRItKqGJU9
         KU36qYdVjLWOxxMbgHRoUym8193UnFLrYT8+aZdqxMfyDtMFdYDJlo6hp9D2d+DbHGHJ
         IHAQ==
X-Gm-Message-State: AOAM531HXojsQuonwtmjoLSoJkbRdbhd1hDYvdziJe05rAPaCenLmTJY
        rMxWJ96kPNldEG1kxaiFitxYyF/TcmmaB0ApuLdW6Q==
X-Google-Smtp-Source: ABdhPJygSlEpGfYIODM6AAcGtxNLcZ1X5a2YfsVSiuNr/u6qm+cdiZexK56Wk++E/vmwlJm975sl0rcKDkXuh6ny4Vg=
X-Received: by 2002:aca:f40e:: with SMTP id s14mr2385939oih.92.1592766363735;
 Sun, 21 Jun 2020 12:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200606131300.3874987-1-dmitry.baryshkov@linaro.org> <20200621072655.GH128451@builder.lan>
In-Reply-To: <20200621072655.GH128451@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 21 Jun 2020 22:05:52 +0300
Message-ID: <CAA8EJprHke0=OhpP2WwPtJ-ttzOvx63j5BjHhZL0N1JO6uJZEQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: add I2C and SPI nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Sun, 21 Jun 2020 at 10:29, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 06 Jun 06:13 PDT 2020, Dmitry Baryshkov wrote:
>
> > Much like SDM845 each serial engine has 4 pins attached. Add all
> > possible I2C and SPI nodes for all 20 serial engines.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> This looks good, can you please give me a r-b or a-b on the patch adding
> the TLMM node so that I can merge the two.

I don't have it in my mbox, sorry. But anyway for TLMM patch:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
