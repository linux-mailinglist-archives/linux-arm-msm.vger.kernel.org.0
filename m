Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA0AABBD1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 17:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfIFPJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 11:09:50 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42984 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfIFPJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 11:09:49 -0400
Received: by mail-io1-f66.google.com with SMTP id n197so13433066iod.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=niKGObTr56bvNkdm0qizJ7Oq57qitt2iJY01DiuARlI=;
        b=p/QS2Lsf7Mxv2TayK/TvWDjN/q4C+tI/S1DXmYnN8+vv+zm2j5qYI3GyQR6CJfjLqk
         Ag2WakTy72rKgzQHHfiyceqfAN3mktcXidTD/JCKN3xQbku1eO3jVLYCoHqTCzvAhkra
         74lY59ZimoKFTlzSY9s4J+YDockFXHy5mJb5cYi5d6BjXUC+B7meCLcqnEOSsZFjNO2B
         +z9GoZxq72TKyX8dq9h6IsqCu/0gAu8QcWAXoTB/1szRfL68SIX3BB4+rIpa+0rElRit
         9NFYmpHlpcoigJdYwUWYWj7l5dBU8nn6bxUeebX5w3qc4/BhIQktY60vZD+mI92Z9rMX
         4RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=niKGObTr56bvNkdm0qizJ7Oq57qitt2iJY01DiuARlI=;
        b=Ed+ZyhY1uKjkuZIL2tuAkpMVemUAwPoBi4Y51kXk30YN+QietAJWMyNSAVbGIg3PR4
         HkXEBtbhrcYusTyENzmJ2UHFwM9NFRmDaSwtMNg6K/sQyUTykHkVA2HZscgd+qU+29o1
         FruOlfu9py/8qPsSI0FCYR2cXvykoUrXibaeyaJe3lYhzc7AddMEGck19pLghHJpTwQe
         yflzbvZ4z1Bx0vfaMOmsoAbytlDa1rpFn1zvXrHV3Vnf0UenAMcxydkJuoh8ieA26fkN
         dmAzoxwx4GnTBV1BPthg/LW8NTIPLKeXnbEHPdAATeJ+ymScnGigXMkjLxLRYF2+2CZK
         7yOw==
X-Gm-Message-State: APjAAAWPnBiksWrc2stlhNNX27j8u1fgSH3I7qnqGVVXzSdEoar7QmKe
        UR1MxybPcWbIwmYP1Zgjj+thWIy/SchlvlKgQLe2hc0/Rvc=
X-Google-Smtp-Source: APXvYqySKi4XFQUYZkXd6fmFzCqVBPJG2/akE5w9Oyz6DdnptYMGJsrDZ9tEilRVyWTE2hvvSc8ZvPglZa1RLmZRc68=
X-Received: by 2002:a5d:8506:: with SMTP id q6mr4362757ion.43.1567782588685;
 Fri, 06 Sep 2019 08:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190904112653.22452-1-festevam@gmail.com> <CAP71Wjy3yR4vx-0e4E=EOAeKNaCp0KLyZaYyzRfRk0XefOBJFA@mail.gmail.com>
 <CA+5PVA73J6xCUx3CM=Nv15aXeSQLtcMc7M+PCDri--oYbWdTQA@mail.gmail.com>
In-Reply-To: <CA+5PVA73J6xCUx3CM=Nv15aXeSQLtcMc7M+PCDri--oYbWdTQA@mail.gmail.com>
From:   Chris Healy <cphealy@gmail.com>
Date:   Fri, 6 Sep 2019 08:09:37 -0700
Message-ID: <CAFXsbZokkQXh03Ci2oy63OhAHXuLXDZWec5N=n7u5QUM55piSw@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add firmware files for Adreno A200
To:     Josh Boyer <jwboyer@kernel.org>
Cc:     Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>, robdclark@chromium.org,
        Linux Firmware <linux-firmware@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi All,

I'll start by saying that I'm no expert on this subject!  My
understanding with this Adreno 2xx firmware though is that these two
firmware files are generally equivalent to what was distributed
previously in an include file in the following two files for the NXP
i.MX51 and i.MX53 which utilize the Adreno 200:

https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/mxc/amd-gpu/common/pm4_microcode.inl?h=imx_2.6.35_1.1.0_caf&id=61ade304d0eddc3f44fb2ee0b2b7ccf3ffcf85d5
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/mxc/amd-gpu/common/pfp_microcode_nrt.inl?h=imx_2.6.35_1.1.0_caf&id=61ade304d0eddc3f44fb2ee0b2b7ccf3ffcf85d5

I'm not suggesting we don't get someone from qcom to provide a
Signed-off-by.  I'm only pointing out that it looks like this firmware
was previously made available and that it did have a license that
perhaps we can continue to use for this firmware that's also for the
Adreno 200?

Regards,

Chris

On Wed, Sep 4, 2019 at 8:35 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Sep 4, 2019 at 8:09 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi Fabio,
> >
> > On Wed, Sep 4, 2019 at 1:27 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > Add firmware files for Adreno A200.
> > >
> > > These firmware files are needed for running the adreno kernel
> > > driver on i.MX51 and i.MX53 SoCs.
> > >
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > >  WHENCE             |   2 ++
> > >  qcom/yamato_pfp.fw | Bin 0 -> 1156 bytes
> > >  qcom/yamato_pm4.fw | Bin 0 -> 9220 bytes
> > >  3 files changed, 2 insertions(+)
> > >  create mode 100644 qcom/yamato_pfp.fw
> > >  create mode 100644 qcom/yamato_pm4.fw
> > >
> > > diff --git a/WHENCE b/WHENCE
> > > index a8ec628..5e46d33 100644
> > > --- a/WHENCE
> > > +++ b/WHENCE
> > > @@ -4418,6 +4418,8 @@ File: qcom/a530_zap.b00
> > >  File: qcom/a530_zap.b01
> > >  File: qcom/a530_zap.b02
> > >  File: qcom/a530_zap.mdt
> > > +File: qcom/yamato_pfp.fw
> > > +File: qcom/yamato_pm4.fw
> >
> > Where did you get these files from in the first place? On which
> > devices do you expect these firmware files to work? We were recently
> > discussing how to structure /lib/firmware/qcom more carefully. And the
> > general consensus that we reached with Rob C. and Bjorn is that if a
> > firmware is expected to work on a specific device (maybe it is signed)
> > it should be placed in /lib/firmware/qcom/<device> and if it's
> > unsigned and can be used on several devices based on the same SoC (dev
> > boards, ..) then it should be /lib/firmware/qcom/<SOC>.
> >
> > >
> > >  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
> >
> > Are they really distributed under these license terms? That's a
> > specific license that we came up with with Qualcomm a couple of years
> > ago based on their Dragonboard offers.
>
> So everyone understands, I'm not pulling this for now.  If there are
> questions on provenance of the firmware and the license it's under,
> that's a big red flag for me.  Ideally we'd see someone from qcom add
> a Signed-off-by or otherwise acknowledge these are meant to be
> redistributable.
>
> josh
>
> > > diff --git a/qcom/yamato_pfp.fw b/qcom/yamato_pfp.fw
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..61a576eb997ce2ee0d32b135adc5d8c789d8e118
> > > GIT binary patch
> > > literal 1156
> > > zcmaKr%WG3X7{!10-ZY7A3K1$6=_76G1N!h4AK=1^>7q~<E%;a!K{qZG{{WkEu`Vig
> > > znc9aU-RVwT2qFk+Q_@myY|Wy$6#N(5N<A}4Y7An+@Xef=?>pywGZ*xWlo-D@qsc1s
> > > zPiBZtq;Lo<?)jnc0FONz87grhu?2;tYGjUXtrI+jc!`*Bk|n%g5tAFK<$08Cey`T`
> > > zvx)jy!_iTK&JzB^96f&7=Jy2U|K?k+gt(ON1sa9FwHhv?DgHb|R9rnZ-6s0-6jM&z
> > > z<oUHc%}p<2ua40-x6P;G0z=6yT7xAz^XG{8D<toSI0F%~&MtQ~T=}{_nNy9j>b=By
> > > z8`b=UTDGpZL%olqwSLyuMi<gPtom*~LmSJCbZV|Tu6+Mc?V^V9)FoZr!s@x6yK8%C
> > > z_Iu;H3)M*(Z_;Vjwjatfch;}iOVyu=r@M4c9_##P#7|+_;(b9#$`3g#E&H)G(&EW#
> > > zxHmG)zn>;t$l(^GuMl!ic#FAX%}uRm#-DUZ1hd+EFuQ1Z%pKHqw^N~=sumk-JviU7
> > > z&1%0qeGi$+F4LlD>Nu(BfzF~^Ik@AK4f|)~+w9LSVPYeflWINSJtW>%jmAE-X`N`o
> > > z($Z#o#}~_Q`saDO4AgL=$zW+=$D6RMuoF#~Id3&ZPDx9}ei!DQJAO!1<Cne}H@=}a
> > > zw84=e&!8{|-Sa>8&3oD$%MmN&SySBjIZa%1lT+oXSj=m{xNPnN27?{z{g3~>S}*2o
> > > z+!Sjl6<_79MgKjLeBh|wK|hyBla<>kPV$Ih9y6j|j?+bkAujSpCsw$^Yp(K*QPvsb
> > > aBNKdPk}Yn^%`G{<%{x^na)+4oG>_jjN)4X?
> > >
> > > literal 0
> > > HcmV?d00001
> > >
> > > diff --git a/qcom/yamato_pm4.fw b/qcom/yamato_pm4.fw
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..b45ea20ba5773ef6da25e21abd29914ea9162c07
> > > GIT binary patch
> > > literal 9220
> > > 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
> > >
> > > literal 0
> > > HcmV?d00001
> > >
> > > --
> > > 2.17.1
> > >
