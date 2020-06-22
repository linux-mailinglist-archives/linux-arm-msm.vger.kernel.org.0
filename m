Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247E02038BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 16:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgFVOEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 10:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbgFVOET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 10:04:19 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D23C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 07:04:19 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w16so18128662ejj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=AkXgQz4f6Jb/SfgaY94+eCp/+t+YH9GzfLxXy17qw1I=;
        b=miQD36o/JVjj5qBA3N2E8kQsw3fyaP5shHvUmpQxO/WwB1W6F7TkFAu7FqDbqJycGX
         ZbeQWR2lKhtbYP//aapUtjeRUXbixUHgYN49PT749c4rJMWYqQ94jitfnK2fNizM3qLV
         JfGYxFe2V7sES1ZDIN5R6a4kRzHwxusjH/P6ealaz9HEjzYsgvKtQT1HXe/komoioEHB
         7igQ6Lz1LBp1TXvdZnfydpnd6UVM0Gp/eqiTwXd/jzlbfJ7eAjrHAeMlcHXavgR5Zcud
         QWPbD6neGomrMu2L3fqSTWi3FZbTIgBxcBKIlQwBPnzekCnOuCr4f3M/TppY18mdfq9x
         lTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=AkXgQz4f6Jb/SfgaY94+eCp/+t+YH9GzfLxXy17qw1I=;
        b=G/j27zKyokb9nO537mTMqozQMBBrTw8/NP7yMvNtWSOWtSuJW4AnTlVQeqYMImYQ1o
         efAkBFyLBHIe8HQoBoXGgsbPWF4EX2v/FJo1pGBlLjxJGYM9HZBT6cGy2EXA7D/I2SKx
         Rcy1a00825g2S360m6rbv47t3ZA2eFTCxy1HWjVepOI1LNMy+ZYaZa2L597rquXsG7Yq
         XHdDBSakIVPZCk1Z9lYpu2HsGI7nxkidyky8Iz6XeyqvQs7kRsarseeEpgJ+sk4mhluX
         GWH6irTyj7ypLgO6y2J/k4bUtduw5KMq1M/kFglxCJhFgmA0EHdJJVd47bRpI6DN8xEY
         fVIQ==
X-Gm-Message-State: AOAM530rIVetvdf5KTiLHjcjP5vbvYAen8J7zG+IHflwUI29fRuKWZk3
        ivR+tcgs/wI/SqHyh6oxE5CjhA==
X-Google-Smtp-Source: ABdhPJx13jRteSsX752kFTZR7wYlw7AZQfoFikTlKm6sVUt89ZqX2jnk7bahtoLDO7GiSW+vMYhcyA==
X-Received: by 2002:a17:906:5e08:: with SMTP id n8mr15834673eju.132.1592834658428;
        Mon, 22 Jun 2020 07:04:18 -0700 (PDT)
Received: from [192.168.2.2] (ppp089210109128.access.hol.gr. [89.210.109.128])
        by smtp.gmail.com with ESMTPSA id w18sm1217980edv.11.2020.06.22.07.04.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 07:04:17 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
From:   Pantelis Antoniou <pantelis.antoniou@linaro.org>
In-Reply-To: <20200622134145.GJ4560@sirena.org.uk>
Date:   Mon, 22 Jun 2020 17:04:16 +0300
Cc:     Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8C9C4D5E-D92B-426D-A597-C784D1611967@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
 <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
 <20200622134145.GJ4560@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> On Jun 22, 2020, at 16:41 , Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 22, 2020 at 04:32:46PM +0300, Pantelis Antoniou wrote:
>>> On Jun 22, 2020, at 15:04 , Mark Brown <broonie@kernel.org> wrote:
>=20
>>> No, you're encoding use case decisions into the DT here - for =
example
>>> your example will break use cases like ring tones and shutter sounds
>>> which should play through both speaker and headphones.  It's also
>>> setting volumes which may be inappropriate or may be not and =
interferes
>>> with userspace using those same physical volume controls.
>=20
>> It is completely optional whether you use this functionality or not.
>=20
> It's optional for whoever writes the DT and flashes it, it is not
> optional for whoever's doing the OS configuration - these may not be =
the
> same people.
>=20
>> In that case you don=E2=80=99t use the automatic routing you merely =
set it to off
>> and everything works as before. Or you merely use the route setup for
>> the function from userspace.
>=20
> Userspace shouldn't have to be fighting with the kernel for control of
> the device.
>=20
>> The device in question is not a mobile phone so there is no =
requirement
>> to have speaker and headphone active at the same time. It is possible =
to
>> create a function that would be headphone+speaker active at the same =
time
>> for that case.
>=20
> That may be true for your OS configuration but that doesn't mean that
> some other user of the same hardware won't want to do something that
> needs both simultaneously.

Let=E2=80=99s step back a bit and let me present the problem and what =
this is about.
Disregard the automatic function selection using external state inputs.

The problem is that for sound card that is composed of a number of =
component
like this one a pretty non trivial setting of controls must be done.

Tt is not atypical for a card like this the set of control being a dozen
or so, with some requiring even more.

Someone has to do them, be it the kernel or userspace.

Instead of having userspace do it, bundle everything in DT so that =
everything
can be set in one go, and without having the user-space engineer read =
the
a few 10-100 pages of reference manuals.

This is arguably a hardware setting (eg. the set of configuration =
parameters
that enables routing sound to speaker).

Now this is not going to perfect for all cases; some cases are very =
complicated
and indeed user-space has to be engaged and perform the configuration.
This mechanism does not preclude it.


