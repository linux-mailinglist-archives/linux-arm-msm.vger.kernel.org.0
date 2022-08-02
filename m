Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67292587A08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 11:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbiHBJog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 05:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbiHBJof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 05:44:35 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E7B39BAC
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 02:44:34 -0700 (PDT)
Received: from mail-ed1-f48.google.com ([209.85.208.48]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4K6z-1oJ5ZB3F3Z-000JkT for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug
 2022 11:44:32 +0200
Received: by mail-ed1-f48.google.com with SMTP id x21so4172470edd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 02:44:32 -0700 (PDT)
X-Gm-Message-State: ACgBeo1unv6fwxdTmvXjqyeGoDXTllYi8smea5TWNMuEt7XcZbuAFCUY
        FwpZ66xsHhbSseGkvRQ4w0+mfczUe2YzFx3RBos=
X-Google-Smtp-Source: AA6agR5nyzdX8IbHsNPScb74HatdyJTovCmzu8DEh/pFcD3bW6ovAqRjoT3lZ2cQp4Zvm04iz5zqjb0cuDwEHwyUgAU=
X-Received: by 2002:a05:6402:100c:b0:43d:9009:c705 with SMTP id
 c12-20020a056402100c00b0043d9009c705mr10098254edu.49.1659433472407; Tue, 02
 Aug 2022 02:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org> <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
In-Reply-To: <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Aug 2022 11:44:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>
Message-ID: <CAK8P3a2KeNRSfVdd8F5cVp4oU+K+Nwo0bVx_kEVHXEx_0AkZAQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Mz0n96uHdrimgObs1cWaYs/B3fijdlxH87lDfoS80WetX16ePOl
 pzPyRIlEQAgNUBBKFOQo0ou9aU6JzVTzgU8G/9p6EYEa2w5PdMfF2nvDK7iDxvSRpv8dxD2
 u8IdYgG+94wIphD0csiB3V19Tl5VK0QN5k0AfTwDGjUkh4cbIlQShepIwFeSR1mlRhxg4Ch
 9EifPDAU7C/74omS9lsQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dq8RNgHabmc=:ltzYBfWMwRIhONBFElXMAJ
 eaXCzEN9jyfpDYFx/mH/mU7jFRo93QBInxJroAuA9zXvfxriVeMvegh+bRdCjcAl9NRIuQhxU
 vZpTeGj/a5P7IHmJTDV2xmqf+I3RArhoyyU1bamuqlFBX7CAj16XOBxGhlaofjaHXRNIHNCAz
 wvYlg6lQwC3nAoEWkY++JR2R1EpUn+pSbKHHoscRmSwofhsJiReM23/ClW51M5AsKY6T3FIHV
 6wK5/CtKwrcImxyI03fzuZd6dOTYU805zmlEhIZHPShwtEIc3C8teA5126gJMAcDGBZTZy67Q
 Ye817/AGR7VhCfXvOjiD2EGbr+Ff9hqcSrewFJOuHYfwEr74N5dTX0xej1B204Rx46EMWyPSt
 lVqAsosDfWG58EhtJbzt/6FBFloGJucShLPyv+fl4eX/SQLYfjANT2IWxLGiL9HV/dRB+Eing
 jWE639EDpn+LldPZHYC2zU7JvOhMpOr+leolAqFGLyoqa7vK4Nk5Q2hsvXDzg5RU38MR6p3ci
 TldLbsqJT0D8SbtlBk2yYWta9YCpJhcHZqELCaRTRvGsiGaadG6tnMspg5P1E+o+bZUlzIdvf
 9X1i2o8wR/L2Hf2sNbE3N9dWWPkUC3MIv5IRqNtaxvnh8a9+XbMlKgdI6TiZd5TXHMtHwns4W
 KRs+aJsqC6GYqSk3KhKHAx/43fS02At/UGt0atzCDBTOgKbpm6SNfhH73nueUTXzTyJ4t+xGA
 LQM70KpNAtxueouxvoRWBkOm7afU5Od5t9vSnUAljQ/fV/seMUdtJCIRC/3e0eEbRjVVqEGO8
 CRj0jx7SOZ+FnFDZ1D+IwWIl5HQT8HUXQXHymJjCQtd+wZr+SlRdq8T1CdFCR2WZehfsjKu7n
 SC/gti4zPeyaGuyVbuyw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 1, 2022 at 5:35 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
>
> I don't seem to have received a response on this one, can you confirm
> if you were able to pick it up for v5.20?

Hi Bjorn,

sorry I missed sending out an email. For some reason the automatic notifications
don't work for some senders and I have to manually chase those up.

You can always see what I actually merged when looking at the
arch/arm/arm-soc-for-next-contents.txt file in my for-next branch, which is
also part of linux-next.

        Arnd
