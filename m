Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857D1587A97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 12:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiHBKWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 06:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbiHBKWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 06:22:54 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A906F4E851
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 03:22:51 -0700 (PDT)
Received: from mail-ed1-f44.google.com ([209.85.208.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvbOA-1nTTFX2lCo-00sgtK for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug
 2022 12:22:49 +0200
Received: by mail-ed1-f44.google.com with SMTP id a89so17018484edf.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 03:22:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo2fLTnTXd9yCqrMV0naPvSUfLU5drjZHz/pv+azcdWggxT7O4f1
        4b9Vo/44OctPgUzVnp1oL/IAeA6semghzWO2aMs=
X-Google-Smtp-Source: AA6agR6xKqx9vTN/nOHiBt/gtZKmltW+NIUpk5T+BocdKNPd4v0uhMXoxwpsOzxJ19d7mha1tdAcdxMt6WaspG541vA=
X-Received: by 2002:a05:6402:3495:b0:43d:d76e:e9ff with SMTP id
 v21-20020a056402349500b0043dd76ee9ffmr5302294edc.227.1659435769265; Tue, 02
 Aug 2022 03:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
 <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
 <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com> <20220802095357.uibssv3s72rvlj7p@bogus>
In-Reply-To: <20220802095357.uibssv3s72rvlj7p@bogus>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Aug 2022 12:22:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1acYba+g+6zLm1F8o=9U6BdKNDMgapQT-vrV+7hGHg4w@mail.gmail.com>
Message-ID: <CAK8P3a1acYba+g+6zLm1F8o=9U6BdKNDMgapQT-vrV+7hGHg4w@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7vF9L3gEdYoOvbUU04eLQozqu3u2NZUKOESYe9Tyk3qQhRxTLE/
 WO9agH7dc3nafyqv4Fw7TR4x/QYwGU1wSL9XR8Qk1NfR9G/KSNJhI9KpFR5hXKN4XQZ7b1M
 8zGpvHUb1Y3dn16SNaLKRryjOR4ce6Jf5n7AfkQ/fDIqDx6Hx6xjE82cUR+s/nlTD/gKYy7
 Msr1yElPxHoIz0RNA9GMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kkdA53pCsfQ=:/Y9FV89OSbFt0fRRmtYlAu
 ooB+sTjFnJfl7GlPfduNwlFKShv3pW32YpyBRckVlrrJgA85UKcJCsgNMN8Y8lB+KD/jfVQkn
 mG0UMrR88KfdsVnSmv4Ex7ChL2ojuLloVif/HW1tq6PeT+HCMjxjNFEFzWhUNPO6vG70jUzQv
 7jQNtemCPZm6+wK4LEQnlMvWmVNwn9hNb0cX3Hs4D9W2SwZ3fb27d7xI8/+l/l8Q6/3g0hjy1
 H2miTeU79eiY5wTvEpvlcgS97p6LOt1/LVI7oJjX8x/2N71SF8fqACcvwF3if4trq+wv0uSe0
 ez8cZ9CmGOY4oiyylKhzZ1m8eLold7A8wz+/OwJp7gJvu6nwIj/8751jRphxtoCm8IeGrktLl
 WjQSKi71bF8pQEGvkVNs3j7ObxSwce0heZy9ZUVBWG3O4zdPNADBDPUhzPKMErAJRHjI/nfDW
 NVh4mC5GsnblczxmAkqWwdJvIXJrqW3WMBzm9ircen/IfH0buFXLHSwDAzNcivrpwnszl77Af
 56UkCMXnim0cS9xj7PBnvuFJ5GcZTJjlsrEOk6AOqvkQwb8cSnQHqi2WFsELlK24EoXSfBipc
 5c1H7K6zPzrI/cmgZ3kBWhIZX/qQIIjE6GVFDXvVYSEDUwX5/FpBRmrQkJvobx1ZyHe87wmSK
 7WGdMQSnOhH/BQqcdspaNCE74sJqh0yO05S6M5EaRPTscnwMDn5zZu/ERlK6FgwMIn2I9n30D
 rCqzHhoXyMG0iZ1BiEYAJQLpNqqZ0Mxz4rwERVEWEcyp41bAOoMobCK+et+NuWN5rGfzkOvZS
 QiQxM60n3xbkp7c/551rVQdEu4Y9joVJ7vyQQLoHETLYljugMH13yfzkEWYFCG7rL+yNcM4aC
 CGQpNKs2yD7BFL7VxJCw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 2, 2022 at 11:53 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Aug 02, 2022 at 11:44:16AM +0200, Arnd Bergmann wrote:
> > On Mon, Aug 1, 2022 at 5:35 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > >
> > > I don't seem to have received a response on this one, can you confirm
> > > if you were able to pick it up for v5.20?
> >
> > Hi Bjorn,
> >
> > sorry I missed sending out an email. For some reason the automatic notifications
> > don't work for some senders and I have to manually chase those up.
> >
>
> Ah that explains why I didn't receive notification as well. I noticed
> the changes were pulled. I didn't bother to ask, but now that you mention
> it is likely to be the sender address as I can't send you email to your
> @arndb.de and hence I always use kernel.org. Are these automated emails
> sent via arnd@arndb.de ?

I don't think it has anything to do with my email address. This is about pull
requests that get sent to the soc@kernel.org alias. Patchwork monitors these
and puts them into https://patchwork.kernel.org/project/linux-soc/list/ from
where I can pick them up or reject them using pwclient. Anything sent there
requires an action to get it out of the list of 'New' entries.

In most cases patchwork will then notice when I push out the merge commit
to the for-next branch of the soc tree. However for some senders (Bjorn and
Krzysztof notably), this only works for patch emails but not pull requests, so
I have to use 'b4' to to send an 'applied, thanks' message myself, which I send
using gmail with my kernel.org address as sender.

         Arnd
