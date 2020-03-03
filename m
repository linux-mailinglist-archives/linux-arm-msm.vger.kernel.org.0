Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D178177190
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 09:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgCCIw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 03:52:27 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41511 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgCCIw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 03:52:27 -0500
Received: by mail-lj1-f194.google.com with SMTP id u26so2566716ljd.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 00:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qP4l3miEhOsGvhCQGfIOAAIiSzN77+8PwgJ0ybST1SE=;
        b=oE18UWg7uB5RWxPJuwXndW24hkOzqPIoL99H1Qv9tUnv8DHc3rMf1f0zZcReU+suxK
         MR3AxZ4g8LYDpIwSSwwuNXt2h/5wYtIXq/9ywWs48ntVpfmob3K2z9XKR1NyTe1DcdLJ
         rWIBVGOFRVEFBss2E+R8lG/26kUA5GJeIvCB//3pCq1aUo5U4cTt2ro7DlsZfdmSYnyp
         GwWVvc3Q+29uTT6yUq/mZIPEa9uNGTtxNw53PeUQ/X8+EwfZ18BFtQXOXqXl7p56vxsd
         3NfHITA92j/M9QzGVcq03JDG80DEYjMdRSOBePH0vVPAT06WR+Rv3flSq7igtB5TlvQD
         BIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qP4l3miEhOsGvhCQGfIOAAIiSzN77+8PwgJ0ybST1SE=;
        b=TPopwtj3mP3ZUesnvXwLyJ2L2GrffxBeP11sQKXqp5NYVw72rasn4OqZlzJh/ETXg4
         LbO1R8EkHaRVoC0nu+yPEyZ2/B6KBF9p+JRWAE4dnFMMTXpZC56FiAw+GrZU0NEhiV3E
         4sdXbLv+LY87mYCAS9yQg7En6z3QquxT92zCcdv933Knj1wep6GbNjO5whlnJNXxNbNc
         jObe2+kflcORE7La7XITRrZutdVGHaHTcCn/FU0cnGRsjL7AcXQIMj4hWcHHoNx79FqG
         gheLMy8n+bNaZMfZ3l6mQcfAkjhmYpZBUi9doK8057y5adH//Fq9UmGJ8lyXHvLKJ6iY
         3WLA==
X-Gm-Message-State: ANhLgQ1HvZr7HytYOSr53tysujGQrVkF5i7weyNqsY4M+cHeOacuPbKQ
        rZErNO61CDngoOdN609jp6TTg0JAe2rxJqb4cw/P/w==
X-Google-Smtp-Source: ADFU+vs8vnVGsuXNBfltlkRNIaMr26/HznbXiZTa8hZpumUN/ioJsPKL3uAefOfYGMsXkzIw0k0q1oJs8IuresWlrLc=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr1754799ljk.13.1583225545328;
 Tue, 03 Mar 2020 00:52:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582871139.git.amit.kucheria@linaro.org>
 <8309e39737c480b0835454cbc6db345c5a27ecd4.1582871139.git.amit.kucheria@linaro.org>
 <a3903db0-302d-a0f3-0515-b248e24e19cd@linaro.org>
In-Reply-To: <a3903db0-302d-a0f3-0515-b248e24e19cd@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 3 Mar 2020 14:22:14 +0530
Message-ID: <CAP245DWhzOHBrQNhqMjVC2+8i-P8bkuM3w8bCSqGfjWemR5WvQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: tsens: Add entry for sc7180
 tsens to binding
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 3, 2020 at 1:35 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 28/02/2020 07:32, Amit Kucheria wrote:
>
> [ ... ]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> > index eef13b9446a8..13e294328932 100644
> > --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> > @@ -39,6 +39,7 @@ properties:
> >                - qcom,msm8996-tsens
> >                - qcom,msm8998-tsens
> >                - qcom,sdm845-tsens
> > +              - qcom,sc7180-tsens
>
> This change is already done by
>
> https://patchwork.kernel.org/patch/11319259/
>
> I've applied it.

Good catch! I'd forgotten I'd even reviewed it when I saw all these
warnings with dtbs_check :-)
