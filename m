Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E3A5F35CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 20:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiJCSrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 14:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiJCSrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 14:47:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275643A154
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 11:47:22 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so17913603lfy.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=sNHqaLvh9j7PQaVZTiLvLFSUg+LSJYbTo2qeLVIoD3Y=;
        b=deotAUsUURWwRjphlZdfLNEaHjwUp+MLHRyXZw6CM0D9vc1Gp7uh/G3Yx//Zp1hr0n
         yJAUSt8ogxQkJUcjJcSd3qvdQz+UK0behCYUSt8UTQFCS+rbRd9n9M0BN+AoaVPd2rFL
         N6sq+GD5SjED8LzF6f3J+8kU6mIVhjZdY9rWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sNHqaLvh9j7PQaVZTiLvLFSUg+LSJYbTo2qeLVIoD3Y=;
        b=7Q99Zj3x7RCYu+l1iVVL12ltKHQJnvjVRL3Y/ZeAaZ7mRzDhLRbYN4L0pJFccBRnYi
         GoSWJ3u3JYF0gzXy/ZsT0ioKTO68sHuEVhFX39cfcS7XS6oJOhupbzEedKlqJSHFxL2B
         7P7n8hAbqF1D7FL1okP14nKKaVoWOH19qbolPvF0Qq6XvXogzIce+Lb4hR9QAO16gUeB
         /lcs2MEwBY2m70y3PkwvymTSWfB6BcGiGyusZQgNo31mhf/rQz3rS2jFU2H5T/ijWZT2
         Xbzfdm1UfY/4lYvCpe9vWOgTdS84JwvxPVWMzBRUh9WeQJq+RLOy9/F4kxMUWZteC1pR
         2O+Q==
X-Gm-Message-State: ACrzQf29Sl4ig0Th+JfYWfAcU4tO/uWxbUTs3wAmSX7mTZqVgL+GNvhm
        GIGFcu+JT3d2bjrFc7WCDjv6/lLShUq7XdI/rHogxw==
X-Google-Smtp-Source: AMsMyM4Egg8t2NfbF9XrWUC3S5gmlEK1LZAho5qwWLHUfSisoykyIi/tyV7UdyDv/HxJkTxuD+6qZ3eCOHOx+TYUOOA=
X-Received: by 2002:a19:7518:0:b0:4a2:4593:6e14 with SMTP id
 y24-20020a197518000000b004a245936e14mr1461955lfe.82.1664822822563; Mon, 03
 Oct 2022 11:47:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Oct 2022 11:47:01 -0700
MIME-Version: 1.0
In-Reply-To: <YzXdhVN/Zp7DDIzB@google.com>
References: <YsLhxx+L3+GJDRyO@google.com> <Ys1tYAO39LKzEAOE@google.com>
 <dc737abb-041b-491a-14f1-a584f9e64a3d@quicinc.com> <CAE-0n528QaTtZFp=WAaHShegFRpKVN_67jQfUJTtsRPr6s--zA@mail.gmail.com>
 <52039cd1-4390-7abb-d296-0eb7ac0c3b15@quicinc.com> <Yuz2O+lZ5W7RviuA@google.com>
 <CAE-0n507SLeYB7XVzGFk=RO6YjOPoGpux+_N2AyrmL354mQJ-g@mail.gmail.com>
 <YzQf7hf15vvLeGse@google.com> <CAE-0n50cX5ky3By976RTecKkpeMoAjoBA4tYuWSZ150JfS9wiQ@mail.gmail.com>
 <YzXdhVN/Zp7DDIzB@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 3 Oct 2022 11:47:01 -0700
Message-ID: <CAE-0n53q-8u16_7KGZ0jbm9ES=dsSJL7rbGdz6hzLWf3xvm=bQ@mail.gmail.com>
Subject: Re: [PATCH V15 6/9] mfd: pm8008: Use i2c_new_dummy_device() API
To:     Lee Jones <lee@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2022-09-29 11:01:41)
> On Wed, 28 Sep 2022, Stephen Boyd wrote:
>
> > Quoting Lee Jones (2022-09-28 03:20:30)
> > > Wouldn't it make more sense to simply separate the instantiation of
> > > the 2 I2C devices?  Similar to what you suggested [0] in v9.  That way
> > > they can handle their own resources and we can avoid all of the I2C
> > > dummy / shared Regmap passing faff.
> > >
> > > [0] https://lore.kernel.org/all/CAE-0n53G-atsuwqcgNvi3nvWyiO3P=pSj5zDUMYj0ELVYJE54Q@mail.gmail.com/
> > >
> >
> > You can continue reading the thread[1]. My understanding is it's one
> > chip that responds on two i2c addresses, thus we don't describe that as
> > two i2c device nodes in DT. Instead we describe one node and use the
> > dummy API to make the second i2c device.
> >
> > [1] https://lore.kernel.org/all/Yk3NkNK3e+fgj4eG@sirena.org.uk/
>
> As Mark says, it's probably 2 separate dies that have been encased in
> the same IC and are otherwise unconnected.  Not sure I understand the
> comment about not requiring another 'struct device'.  It will still
> require that whether it's a platform device or an I2C device, right?
>

Yes a 'struct device' will be required for each i2c address no matter
what happens.

It is also useful to describe the hardware as one device node in case
there is a shared reset signal or power supply. That allows us to have
one driver probe the DT node and deassert the reset/power the chip on. I
think this device has one reset signal, so we really need to do this and
not treat them as completely independent i2c devices (the 0x8 and 0x9
addresses).

Can we move forward with my plan to have another i2c device made for
'pm8008-regulators' and have that driver be an i2c driver that probes an
i2c device manually created in the pm8008 driver? I think that would
handle the reset ordering problem because the pm8008 driver can deassert
the reset and also handle the regmap passing stuff by letting the i2c
device at 0x9 make its own regmap.
