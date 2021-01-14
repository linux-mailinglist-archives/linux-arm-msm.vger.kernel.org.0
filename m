Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C382F6E4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 23:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbhANWeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 17:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730686AbhANWeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 17:34:21 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A775BC061575;
        Thu, 14 Jan 2021 14:33:40 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id b19so11979011ioa.9;
        Thu, 14 Jan 2021 14:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1fbKz9R0Dhjm/LDcyUiYTutXyHxddPdBABWEIvnbtM=;
        b=IOm+puNzxjZtf+Ra2ciYM+7QJ5Z7JlHGm7jiXhjU6eb99TcmVjhF0/nSeheOsQLSd3
         dnGN6veQDp87ScjlyeIerg2dSuEDWebolyR81J9qkTPpmclNFbx1Tr/CCIC6u+sBuHsH
         QiMmJyO23gVzrfTqjiZZpB7S7QFOm9poBSuqEhVadsVJJsrWHeOIqUDDeD4J220jThkF
         nHo3nPFqzquJeu6NpjS4RWRduIDhUBWAvqc6pPsBXlPoVMLY5VBlSl31sIPaixaMue2r
         KmTYyqjv13mfp611GnhSYAm1vfPV9TV86RUvfC8hxqEZfZB+8W0w+8Ij4Zawl6I5N4jI
         tr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1fbKz9R0Dhjm/LDcyUiYTutXyHxddPdBABWEIvnbtM=;
        b=HHQiS0l126h5UMGY+l82o3XaSQo1CFw/LQkzq1GmZgeD25wjN9PFyjSxGXy8VOoN2b
         sXysjocDCSH+b8q83DR0IsTdIbzAuUT1CWkdUbLzPnJny3AAsDhdvU0aCxdkVWMZaH5W
         Y9AAV2MGHgpIaaT9qL4+ujFxmX1OG2KWLTlK8Vtsj2l4LdAd17cGSpZI79QaOASdNG8r
         K+qiwTtaa/IPQda40Wro7tu66DngdXqRbBSDubKSR8lTbHLerf8HGWDkAchQHhOyTo4d
         Sy2NF2RFwcQA+PbbSTfheSHkq2+TEX1khZjykWI/4p39iDQsyu5tL3OzqnFQ2tEp80Fb
         tBog==
X-Gm-Message-State: AOAM533Wo5vfsF8hELwOp3OXnXuzADZJl5bHI6DUOI2lv/A67PLZAYIO
        PQTvfgNorFUqov8UTLAIboT/vXbw+hTmDaPFdRg=
X-Google-Smtp-Source: ABdhPJzoWEtnQpIQE75WZZSLYvtSX6xTCvpZO1aFR2occIvmYxXUEr5QoS6zhIqCXDQ4SyeowFSochQO2ZB5UmUkioA=
X-Received: by 2002:a02:a02:: with SMTP id 2mr6135811jaw.27.1610663620157;
 Thu, 14 Jan 2021 14:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
 <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NqUpa0DqW=han49MtwUqNkNsQC3OPpO7B-872bvNukDJw@mail.gmail.com> <9942f98c-c186-5cd0-d6ac-a18a4e20583e@somainline.org>
In-Reply-To: <9942f98c-c186-5cd0-d6ac-a18a4e20583e@somainline.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 14 Jan 2021 15:33:29 -0700
Message-ID: <CAOCk7Nod9a+5EUUWGpso+EBb2dJVLMvjrOoMpqeTcm+L6mxvtQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 14, 2021 at 3:13 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 14/01/21 23:12, Jeffrey Hugo ha scritto:
> > On Sat, Jan 9, 2021 at 6:47 AM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> >>
> >> This clock enables the GPLL0 output to the multimedia subsystem
> >> clock controller.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >
> > Any reason why you are not also adding the div_clk?
> >
>
> Yes, just one: I haven't tested it... and my devices worked without.
> Perhaps we can add it whenever we find out if something really needs it?

I'm mildly surprised you need to turn on the gate to the PLL0 out, but
not the div_out.  The div_out/div_clk is also fed into every RCG that
exists in the MMCC.

Per the frequency plan the following RCGs require it -

cci
cpp
fd_core
camss_gp[0-1]
jpeg0
mclk[0-3]
csi[0-2]phytimer
dp_gtc
maxi
axi
ahb

Also, I'm very interested in all things 8998, and would generally
appreciate being added to the to: list.
