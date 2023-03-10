Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CDB6B49C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 16:15:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbjCJPPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 10:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbjCJPO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 10:14:58 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468AE132BCF
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 07:06:21 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id kb15so5580679pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 07:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1678460724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI9SynFLOYtOEHXFt34hbbK+yCygpvgICPPgvO9gfV8=;
        b=VJ1dnBmXbkWcmPGgaIqe8y1AjzPkpkCDA30L72GW1BCNILg9Ux93MdjuFClsREO7vk
         lPuzSZIDtThvsRkSsKGr3zO9rAsKWjoosj6IS8v322FG/klrkxUO4FIp6lMfqPuj4TxI
         7iye1Ahz/4AiFFf6VAwHflCsxCwez6c0dgsKDphb107iKdmAqMvuRIOUZ+bfwhCgORMs
         iHbeIn5DKK69O/9p0RZAo34CKsm8KqzEPsCeBsRVrQgTElcQ7BdUZWM4zM+YwjZmMWwf
         jpTB1yeDWY83Dl59FnSeE0Klte9uU8zLnIN4Ka4GVeK62dZ/tM49vJHupbAcFDxR1gnt
         LTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678460724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI9SynFLOYtOEHXFt34hbbK+yCygpvgICPPgvO9gfV8=;
        b=tQ4Q+/GAFOyTD4yktVWhklCKAMaXu4I6if0Ca98ug2bytoEoHLyWbMVjdxb9LYToLj
         +X9lS8s1CFoPIyqqvI/ORUoLSjZLDsw93sOxrmhvQW30ufqpHs/z3vzk98fmxWD+1EeE
         jHZ76/Jaupj93ocKEW0DYPUT96OcYM2Atv+EqcmYtcG9kLF+LFrI89256T4FLwy+5rG2
         uXnULgGNl8RyZaJyZebEe75Df3qk4FiOnUnUq+ACVM0KhdZu6y+pTXys8p9pXTwYfrPc
         tI9aq8VhhpNim8dTA3skKg1RWne/DazsGJMvDsV386sL0915jL/FFgPeKcHrFCUhsAjZ
         TsIA==
X-Gm-Message-State: AO0yUKX2KgfUOSrJzrLnnTEvG4CLO3i4pMjc5RfqOb2Cx+XvDb0IT6qx
        E6aIUqZ5okqn8b/IH6h62NvzXIPtPiOynARbiMlsrQ==
X-Google-Smtp-Source: AK7set8IWRb0c5QRI0mCvofn+53toeLUf0QAqBXeiHkxJiCHSENVWUwl0Cn9xhaO9TH0b6aLOo+bYIjEMz5NYxW8+6s=
X-Received: by 2002:a17:902:7e09:b0:199:6fd:ecf6 with SMTP id
 b9-20020a1709027e0900b0019906fdecf6mr9641502plm.9.1678460723997; Fri, 10 Mar
 2023 07:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230130105423.1338554-1-mk@semmihalf.com> <20230130135418.1604455-1-mk@semmihalf.com>
 <CAJMMOfNJV+eOqTgUoLLWKQe2MJ=6fXL3aaP6d=YrSBQvfhOXiA@mail.gmail.com>
 <DM8PR02MB8169B2AC8918F8E31628F61AF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CAJMMOfN-6fgN0VohA5ViwVXmNWtA13ycfZFoO4ys9_CLes0feA@mail.gmail.com> <CAJMMOfM41dfqx0NoiHGE=8X5hoRHo1=qPEp4KXLP1kygestEJQ@mail.gmail.com>
In-Reply-To: <CAJMMOfM41dfqx0NoiHGE=8X5hoRHo1=qPEp4KXLP1kygestEJQ@mail.gmail.com>
From:   =?UTF-8?Q?Micha=C5=82_Krawczyk?= <mk@semihalf.com>
Date:   Fri, 10 Mar 2023 16:05:12 +0100
Message-ID: <CAJMMOfN6tUzGZOkP6ZXbKCr-vszqf3nnRM-dhXfpOUSiHr2EHA@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: dec: Fix handling of the start cmd
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>
Cc:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mw@semihalf.com" <mw@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Any update on this patch? It would be great if we could make some
progress there (and, hopefully, finally merge it :))

Thanks,
Micha=C5=82

pt., 10 lut 2023 o 16:18 Micha=C5=82 Krawczyk <mk@semihalf.com> napisa=C5=
=82(a):
>
> Hi,
>
> I'm wondering if there are any more comments for this patch? I would
> be happy to clarify anything that's unclear or improve the code if
> needed.
>
> I know it's pretty late, but it would be really great if this fix
> could land before v6.2 is released, so I'd appreciate your help and
> review.
>
> Thank you,
> Micha=C5=82
>
> wt., 7 lut 2023 o 12:15 Micha=C5=82 Krawczyk <mk@semihalf.com> napisa=C5=
=82(a):
> >
> > wt., 7 lut 2023 o 10:54 Vikash Garodia <vgarodia@qti.qualcomm.com> napi=
sa=C5=82(a):
> > > I have reviewed the patch, and the drain sequence handling looks good=
 to me.
> > > Could you share some details on the test client which you are using t=
o catch this issue ?
> >
> > Hi Vikash,
> >
> > Thank you for looking at the code!
> >
> > I've been testing it using the Chromium implementation of the V4L2
> > codec [1]. Meanwhile, we were running a test suite which changes the
> > encryption method in the middle of the video decoding. This triggers
> > the flush behavior and the Chromium sends the stop/start cmd to the
> > V4L2 kernel component, and the test expects the video to continue the
> > playback normally. Unfortunately, it was causing a stall of the video
> > at the same time.
> >
> > [1] https://source.chromium.org/chromium/chromium/src/+/main:media/gpu/=
v4l2/
> >
> > >
> > > > Thank you,
> > > > Micha=C5=82
> > >
> > > Thanks,
> > > Vikash
