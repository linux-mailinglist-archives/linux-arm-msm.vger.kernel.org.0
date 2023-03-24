Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145476C7FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 15:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbjCXOOW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 10:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbjCXOOP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 10:14:15 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC38FF09
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:14:06 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54184571389so35295037b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679667244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Eck/bb+D3Wo7CqwBsejFq9JyEtd/ZokuSoWl55rfhk=;
        b=J19GZxr6HfIlsNMymj0Dh0QebxGKp/9XJgwS8o+6YwGHsBWA6Prhd/2XIgnJ78agYT
         lzoi2yU/ywMCpJU4G1MuiCqna7+xKwHl67yAfjtg2uPpjsI3ekpa+J2qqppvD0LreX/K
         wnuEtx/asLZz4bvorfwisAvCX1JeAXZPyE1ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679667244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Eck/bb+D3Wo7CqwBsejFq9JyEtd/ZokuSoWl55rfhk=;
        b=pB8YQzLE6xf4P5IEFmX6GZTYtLfHks889sL0iggT2x6UkgaaMykeoFAPNj5XVfIswi
         xdnyOHvSKomJTJTZKTqzFIcGb65jKjTg35Jtah/TjBrqUoLYYF1cbsX559z4P6AXdeLr
         iGAuGWM0vGl0YG/Rhbci6ADTrkZDTGsNwQ4tbN5Ddual8Vk6WP67RJ3DrWAA4Fh5TE2s
         sZFhavl0HHQgvRmTXdXCmGHCh5LCcVZIl4HjoVW7Dq0i49+XbQYNcQw89a2dO0IldIhH
         R56voomQzT4GWnxpjbcYmPGRLV0sP5hn+bsvMXDefrkhdxYxvZEcCIEg57C2+5HKsph3
         w0uw==
X-Gm-Message-State: AAQBX9fwltAu/Qyu1LyTNkzZGHpEn9ANqmb9Mx9g7l8ULlno5VzoyD9H
        qWQkAVQRJxG8w9YwcTrsxQSjFfAdIpmkrvoY514=
X-Google-Smtp-Source: AKy350bKnixasr/eTTcPKxR1934pvKWChxOZR8zrTI8OdZKC1e35GNNGrGYo+0X4zanITEts08uLJg==
X-Received: by 2002:a81:71c6:0:b0:541:66d8:eee with SMTP id m189-20020a8171c6000000b0054166d80eeemr2539517ywc.4.1679667244539;
        Fri, 24 Mar 2023 07:14:04 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 202-20020a8119d3000000b00545a08184bcsm425165ywz.76.2023.03.24.07.14.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 07:14:03 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5456249756bso35238297b3.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:14:03 -0700 (PDT)
X-Received: by 2002:a81:b620:0:b0:541:8ce6:b9ad with SMTP id
 u32-20020a81b620000000b005418ce6b9admr1146200ywh.2.1679667243445; Fri, 24 Mar
 2023 07:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230323220529eucas1p12e5e1bbe2a31fe775cd9e6244f9282ce@eucas1p1.samsung.com>
 <20230323220518.3247530-1-m.szyprowski@samsung.com> <CAD=FV=WfREMuL6Z-aseAWPKXqpkutPofrWGy4ySH-WgbTHC-fg@mail.gmail.com>
 <a45c4b18-0fbe-1e75-9b47-6c26217c97e3@samsung.com> <20230324141200.he2rpj4x6tdtre27@halaney-x13s>
In-Reply-To: <20230324141200.he2rpj4x6tdtre27@halaney-x13s>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Mar 2023 07:13:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WW01k0XQHT=L_Fvg-bT=k83bw=AqKMmQjxgTPFtoA-Wg@mail.gmail.com>
Message-ID: <CAD=FV=WW01k0XQHT=L_Fvg-bT=k83bw=AqKMmQjxgTPFtoA-Wg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 24, 2023 at 7:12=E2=80=AFAM Andrew Halaney <ahalaney@redhat.com=
> wrote:
>
> On Fri, Mar 24, 2023 at 12:18:53PM +0100, Marek Szyprowski wrote:
> > Hi,
> >
> > On 23.03.2023 23:08, Doug Anderson wrote:
> > > On Thu, Mar 23, 2023 at 3:05=E2=80=AFPM Marek Szyprowski
> > > <m.szyprowski@samsung.com> wrote:
> > >> Restore synchronous probing for 'qcom,pm8150-rpmh-regulators' becaus=
e
> > >> otherwise the UFSHC device is not properly initialized on QRB5165-RB=
5
> > >> board.
> > >>
> > >> Fixes: ed6962cc3e05 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for d=
rivers between 4.14 and 4.19")
> > >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > >> ---
> > >>   drivers/regulator/qcom-rpmh-regulator.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > > I don't object to this patch landing temporarily, but can you provide
> > > any more details, please? On Qualcomm Chromebooks I'm not seeing any
> > > issues with RPMH regulators probing asynchronously, so I can only
> > > assume that there's a bug in the UFSHC driver that's being tickled.
> >
> > You are right. I've analyzed this case further and it turned out that i=
t
> > was my fault. In short - 'rootwait' kernel cmdline parameter was missin=
g
> > and root was specified as '/dev/sda7'.
> >
> > UFSHC driver properly retried probing after it cannot get its
> > regulators, but it happened at the same time when kernel tried to mount
> > rootfs. I was confused that this is really a regulator issue, because
> > the mentioned /dev/sda* devices were properly reported as available in
> > the system in the root mounting failure message, but adding the
> > 'rootwait' cmdline parameter fixed this problem. It would be safe to
> > revert this change. I'm really sorry for the false report and the noise=
.
> >
>
> It looks like this got applied, but reading your above message makes it
> seem like this patch is not necessary. Did I understand that correctly?
>
> If so we should see if Mark can drop / revert it?

Ah, sorry. I didn't reply with breadcrumbs. The revert is at:

https://lore.kernel.org/r/20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c88=
4ad220a35@changeid

-Doug
