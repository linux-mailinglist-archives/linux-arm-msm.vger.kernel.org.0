Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF987D9446
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 11:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjJ0JyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 05:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbjJ0JyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 05:54:05 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8F21A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 02:54:03 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9ad90e1038so1346894276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698400442; x=1699005242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OT690yrTB37R58Wx087fNpmf099NwY0U4lYROeFLtIU=;
        b=v+aPxACk4PzpMG3hmUKjjrFSfyqnas7nRszoBX1nxv2yQpr0E1EWDH0UqLwIp7qRy8
         QUHiqpSej61/q2OvZxPs+BMD0nnYTWQpFd5NbSR65EBLqXYjFiAagVxpPQadQYCAN39e
         kWHWaMosFqZvo4oi2E8NOnwaA0WeOfrBJdhRlXhZ1Lq0MrvAz20+I6hHTooQgJrkuTg8
         CafvW7aNs45cNEJuvCIFVvrO2dl/CkexCf46Fue5e+JytEsMTHFCkQaTtsf6EHcWozGR
         At3puar2R3lFdSJey5PmTIs8n0PADNkW/bpkXXfAbSMEInpXWYZeKFanG4kctaSgnccC
         u7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698400442; x=1699005242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OT690yrTB37R58Wx087fNpmf099NwY0U4lYROeFLtIU=;
        b=c82P7ZrSjpsqdUrD4ZgkKHZBz0v+rcLFyD+B+I573jD4a2Cb4/oXXDpuqesTmox+eW
         z9wzP9mjwX2TvAI5FQkZU9o2YSCeYj5GonTEBfDVy8YjPybxCGTk5gwlnN++a1gf8isx
         q57nA7y88cCmZPmEKUC+2TnLEVeSMiTGHx3yIwxqXbBFmua7XtO67LVT/9Zn1WjyO2mn
         QRYk1/aIsF+qvJ0Vsv8ZTlEdk7BkifjPPTFybUF3hJQU/rqrja3f2VdmeX/w9Z6hecla
         PiWEpnqmJ7qTyxJrnew44OuGmRxh9Awi+FMaADRde97/J+5YKiZO3HPxvzZat32Sjlem
         7qdQ==
X-Gm-Message-State: AOJu0YygmtWzknolj3ToHdO1Q9vpbU+WJCH4DC7x72lR8TeTbnrrXNIj
        Q+08xxi/gOqFZ/U/XvL6pKHGaOPNHdCvOin6zSobGw==
X-Google-Smtp-Source: AGHT+IG+DRX4R8Q5TQwxGzP8grfUXk2MJF6xsZ0+0K0783cla3RoRj/g9sxNaNgy7jKMlmu1m6W6heerlEG1/l77gH0=
X-Received: by 2002:a25:ab10:0:b0:d7b:9211:51a5 with SMTP id
 u16-20020a25ab10000000b00d7b921151a5mr1856013ybi.44.1698400442328; Fri, 27
 Oct 2023 02:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231019054612.9192-1-quic_sartgarg@quicinc.com>
 <20231019054612.9192-2-quic_sartgarg@quicinc.com> <CAPDyKFofS16AsQeTVNiDi_PHUatGoQ3no-1+Azo+yqG0SPTe4Q@mail.gmail.com>
 <21208de0-79bc-42c7-b32f-355daf5b09f0@quicinc.com>
In-Reply-To: <21208de0-79bc-42c7-b32f-355daf5b09f0@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 27 Oct 2023 11:53:26 +0200
Message-ID: <CAPDyKFrVNfqUxU2iGEDXrshOEKm1KROCHTPpSyDAgZPMPojfsg@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] mmc: core: Add partial initialization support
To:     Sarthak Garg <quic_sartgarg@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
        kernel@quicinc.com,
        Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[...]

> >> +{
> >> +       int err = 0;
> >> +       struct mmc_card *card = host->card;
> >> +
> >> +       mmc_set_bus_width(host, host->cached_ios.bus_width);
> >> +       mmc_set_timing(host, host->cached_ios.timing);
> >> +       if (host->cached_ios.enhanced_strobe) {
> >> +               host->ios.enhanced_strobe = true;
> >> +               if (host->ops->hs400_enhanced_strobe)
> >> +                       host->ops->hs400_enhanced_strobe(host, &host->ios);
> >> +       }
> >> +       mmc_set_clock(host, host->cached_ios.clock);
> >> +       mmc_set_bus_mode(host, host->cached_ios.bus_mode);
> >> +
> >
> > Rather than re-using the above APIs and the ->set_ios() callback in
> > the host, I believe it would be better to add a new host ops to manage
> > all of the above at once instead. Something along the lines of the
> > below, would then replace all of the above.
> >
> > host->ops->restore_ios(host, &host->cached_ios)
> > memcpy(&host->ios, &host->cached_ios, sizeof(host->ios));
> >
> > Would that make sense to you too?
> >
>
>
> I didn't get this completely. Do you mean that we should implement a new
> restore_ios callback (e.g. sdhci_restore_ios) similar to sdhci_set_ios
> and removing all the redundant code from sdhci_set_ios which should
> achieve the behaviour same as calling all the above mmc_set_* API's ?

Correct. Would it not simply the things in the driver too?

>
>
> >> +       if (!mmc_card_hs400es(card) &&
> >> +                       (mmc_card_hs200(card) || mmc_card_hs400(card))) {
> >> +               err = mmc_execute_tuning(card);
> >> +               if (err) {
> >> +                       pr_err("%s: %s: Tuning failed (%d)\n",
> >> +                               mmc_hostname(host), __func__, err);
> >
> > There is already a print being done in mmc_execute_tuning() at
> > failure. So, let's drop the above print.
> >
>
> Sure will take care in V4.
>
> >> +                       goto out;
> >> +               }
> >> +       }
> >> +
> >> +       err = mmc_test_awake_ext_csd(host);
> >
> > Again, I don't get why this is needed, so let's discuss this more.
> >
>
> This is just a safety check added because ext_csd has some W/E_P or
> W/C_P registers which gets reset if any HW reset happens to the card.
> So this will check for those cases if any other vendor is doing reset as
> part of suspend and compare a subset of those W/E_P and W/C_P registers
> and if they are changed then we will bail out of this partial init
> feature and go for full initialization.
> We are also fine with removing this function but just added for the
> above mentioned case.

In that case, I would rather remove it as I think it's superfluous.

More precisely, I would expect that we fail to wake up the card with a
CMD5 (get an error response for the CMD) if there has been a HW reset
somewhere done before.

Another reason to *not* read the ext_csd would be to further improve
the resume time, as reading it takes time too. I would be curious to
know how much though. :-)

[...]

Kind regards
Uffe
