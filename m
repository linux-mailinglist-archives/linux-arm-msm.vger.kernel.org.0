Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC47512039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 20:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243672AbiD0RGj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 13:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243653AbiD0RGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 13:06:39 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2A52AC7
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 10:03:26 -0700 (PDT)
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N1xZX-1nq7oj3HmT-012JYu for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr
 2022 19:03:25 +0200
Received: by mail-yb1-f178.google.com with SMTP id m128so4544004ybm.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 10:03:24 -0700 (PDT)
X-Gm-Message-State: AOAM533Udz99fILBczTSFM1smauVfoD1cg/wJyscrACCw+wv3DHYxphM
        woeGX0uaHLxtdLdyDrgGk6HG+zbPEEi0N3zu7sQ=
X-Google-Smtp-Source: ABdhPJzLjeye9A9OWhShH76hys3ishcYLuK3veH+wxcTEvEyq9x/yk6faCk7GM7cQVbAcpTgBWV2wb3Zfj0ajrT/jKo=
X-Received: by 2002:a81:9213:0:b0:2f6:eaae:d22f with SMTP id
 j19-20020a819213000000b002f6eaaed22fmr25858625ywg.249.1651075171676; Wed, 27
 Apr 2022 08:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1644824638.git.quic_saipraka@quicinc.com> <9c7ff199d826b60e019c0eeeb6aa280abfdb9a82.1644824638.git.quic_saipraka@quicinc.com>
In-Reply-To: <9c7ff199d826b60e019c0eeeb6aa280abfdb9a82.1644824638.git.quic_saipraka@quicinc.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 27 Apr 2022 17:59:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3_Ea2Szn61D-t--52V-zk+B-sq2mi5YbfMbTim7M9ZAQ@mail.gmail.com>
Message-ID: <CAK8P3a3_Ea2Szn61D-t--52V-zk+B-sq2mi5YbfMbTim7M9ZAQ@mail.gmail.com>
Subject: Re: [PATCHv10 4/6] drm/meson: Fix overflow implicit truncation warnings
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Marc Zyngier <maz@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        quic_psodagud@quicinc.com, gregkh <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:o4N3DdaOsOCzHWpx/ie91UPxK76+P7YAiY9nx4DtDLTxSnM83R/
 xwkhFEgGZYHxYNHKA6FuAjj5x2A9yBBLQuv4JqWWQazmC88gKRyjfrL5u1OR5KGdqW2sBJi
 LMCNZWvtx3SRwc1vcZIHA1Ardo+MhhM+LKnLoex+lkRVa2LTtYu87NxYp/FXtt5ngGtEugU
 aXfvxIqw7jp3WBNQZRRrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SnOym1iCv0U=:4rohQYe8Or3NngCy5Ue+3H
 Fss0en8z4zm6pTY5kJ+0Qn7owZCR40xJ8h+0/x2SxB7gr+s5R+MzAu7/p+h3BrE04YWiQA2qu
 QcKQRSiiJjFI7x6gBm5rJ7RnFJD/if30Y5Pa+T+Kcw962VoPtiPwSchzeP9qtsUmBXqZMmWuy
 YrzhYDxyWWqhFb0NvTzWJOzPQ2yWEhAEiSmuL25C7HGCiDCiNLRuH4NXQBAlR3ZeCNcYBrAuo
 ueALXitD2fnNGQBW/Vq8ow/Pt300tw3+u+NvYPJcD/kaG2YpYHWe9Futw0oJXXJc4vqx6iJA9
 nOdQNl9hsteiYQMULhXYk/94/DMmhM+6Ac4InU9ULIrAK1fdxJXl2jJFBMroUwal/FBJZfk2a
 E/mfaixFW3bdNef43L4NeaSa9UeBx2QTeemIPdCpaz0BunoWs5RTZpU1VTvp4WFGHIxsz5/zU
 j9W8mtieUMmTP4MbVEeyQw4p2DFqwsMvNbI+4ZL1qQjS0IhZ/bSydtTEuX8PQ8gcJHa8bvcRd
 EcfBUUysB8u21H8Q8xgkNK6PYIbqVnytg4cmzHAdlIevv68WDBcKwaFevrwTOpMEdpodgDGPL
 MZ9P5RahapfNoe7q7ETfRtP+I8qrhzRKQyXVu9E7vPL1RXfaVr0gk23jSFhT28gKUGdOIfxW2
 uYjTdZ9Xl4JRiDaFaGjDaYl4YJXU6jRJTpHzMiBwqv/3bbF4AuETDfjLGKx6XmwgACpXnQ30l
 Cx8qxMkcLjtnQCnPWQVDtZsnLHg1TokU+0mZeleJ8RCxfRNRboNs1j5xaTbmqfaccZD+RPSxE
 f+JI1vVNK9PbGqE+uv26DGAxtPynC0mYOBpCxcdEIVT5mLjrwQ=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 24, 2022 at 7:07 AM Sai Prakash Ranjan
<quic_saipraka@quicinc.com> wrote:
>
> Fix -Woverflow warnings for drm/meson driver which is a result
> of moving arm64 custom MMIO accessor macros to asm-generic function
> implementations giving a bonus type-checking now and uncovering these
> overflow warnings.
>
> drivers/gpu/drm/meson/meson_viu.c: In function ‘meson_viu_init’:
> drivers/gpu/drm/meson/meson_registers.h:1826:48: error: large integer implicitly truncated to unsigned type [-Werror=overflow]
>  #define  VIU_OSD_BLEND_REORDER(dest, src)      ((src) << (dest * 4))
>                                                 ^
> drivers/gpu/drm/meson/meson_viu.c:472:18: note: in expansion of macro ‘VIU_OSD_BLEND_REORDER’
>    writel_relaxed(VIU_OSD_BLEND_REORDER(0, 1) |
>                   ^~~~~~~~~~~~~~~~~~~~~
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

It took me a bit to understand why we got the warning in the first place, but I
should have just read the patch description, it's all there....
