Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DB547E1C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 11:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347801AbhLWKvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 05:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347797AbhLWKvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 05:51:43 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EF7C061401;
        Thu, 23 Dec 2021 02:51:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t18so10590746wrg.11;
        Thu, 23 Dec 2021 02:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=tfudTAdmdFICh0t1yWXo5ult410djfzaHfSac/cFTho=;
        b=EtepVCtbNbfLKdFqxofhcNeMNA2fnGQ2Dq/BaoQyfo/VlMG7WjR7BXDwroranIbeOl
         sOSZwC1j78o53SFa2Zdk+HW2q5K/VKYYcL3hh8i28qEHh+QiwsOhI896Uec9dwWUEscK
         YS2ZRAHbbSxPE8AEAYAVTmBDhMF9HEOqyzSPylKDIZsU8qQxrTa8rBMee+tHdChDDEjr
         Mr5nTSXndm9AoEP9r6ouebhd6lCYZGsZPaCCl3NMO8+hn0Hw7vIzY7e1BHhnzGzLLJ9d
         knfhsPY2AFeS7V9tQ23bYoH2fPKq/LWqHcNlyHM5oYZpEqPkoDiyeZiJPu3gm3Iv2CdL
         5BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=tfudTAdmdFICh0t1yWXo5ult410djfzaHfSac/cFTho=;
        b=liMosDSSZ8SAXcRYX6Swobywl9RhffaWS7XYr8pqIfl+HPVO6QI6dzekDuIRJQ55hd
         Z6GrAv6xGn16xQc+9oq1ywGAWiRB14mVtT5ORzfKRxGvJEHK4joccgkZwsZpX4Egxh3a
         ff1Omh+D3mEZqon2YXEqOhkcVWz3yY8W73ovypypax/TQtlR2yPO60UpbZEvKzyms/Cc
         7S1pMXwjvpUFz0z2xVdAjKZYAyDywcsp7v1fcynHkWpDa10Szpk0bSTGU4JwJgZxi35T
         pX1+92M5UzWAntpPGhpiyky09DUsUXHqLvKOO3UXGHVEePNI9+b6jdyS4VJx033qwNwP
         NOMA==
X-Gm-Message-State: AOAM533AIyzhV5/LHbwu9L2A6m+MVHgre30uJBzhoIXIRc7KDwxTRU4u
        +Clqd8i0DqjugniB+k07KmU=
X-Google-Smtp-Source: ABdhPJx7SykAVW+xk4EnHCHEfh1R9jeM72DtNKdsBhroniwqEOuywn8lw1rZ71wtVjaCByRW1+IByA==
X-Received: by 2002:a5d:4c44:: with SMTP id n4mr1315528wrt.4.1640256701357;
        Thu, 23 Dec 2021 02:51:41 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id y1sm4452464wrm.3.2021.12.23.02.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 02:51:40 -0800 (PST)
Date:   Thu, 23 Dec 2021 11:51:37 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: Add compatible string
 for msm8994
Message-ID: <YcRUufUB5xlVj/b8@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20211223083153.22435-1-petr.vorel@gmail.com>
 <CAPDyKFosa+V8E3pRBcwzOp48KfXZvLVmwCAro66gsWKZdAMmag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFosa+V8E3pRBcwzOp48KfXZvLVmwCAro66gsWKZdAMmag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Thu, 23 Dec 2021 at 09:32, Petr Vorel <petr.vorel@gmail.com> wrote:

> > Add msm8994 SoC specific compatible strings for qcom-sdhci controller.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> Hi Petr,

> Can you please re-submit this to linux-mmc too, so I can pick it from
> the patchtracker.
Sure, I'll try. I've acked 3 times to majordomo subscription to linux-mmc, but
still no confirmation about it.

Kind regards,
Petr

> Kind regards
> Uffe

> > ---
> >  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
> >  1 file changed, 1 insertion(+)

> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > index 50841e2843fc..6a8cc261bf61 100644
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> > @@ -17,6 +17,7 @@ Required properties:
> >                 "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,msm8992-sdhci", "qcom,sdhci-msm-v4"
> > +               "qcom,msm8994-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4"
> >                 "qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
> >                 "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> > --
> > 2.34.1

