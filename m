Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3AF16283E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 15:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgBROe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 09:34:27 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:60043 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBROe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 09:34:27 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N17cq-1jRTqs37es-012Zsb; Tue, 18 Feb 2020 15:34:24 +0100
Received: by mail-qk1-f174.google.com with SMTP id c188so19653118qkg.4;
        Tue, 18 Feb 2020 06:34:24 -0800 (PST)
X-Gm-Message-State: APjAAAXU8S9gsbnFNkQ7k1CdHe6e5fnkN0RRBjLBv3sSruTQGuqg8jAB
        aPXnEnbjH+BiH6jq/jjsu44a9/I0EHfcFlHNEtM=
X-Google-Smtp-Source: APXvYqzVLXPOr/slJ4h40kCQ7NGmZHgZaZtwK8/kywQm3UCxvrjssvSyFwAP9OUhRcye0POKwGuKwNWR3BSxkzm84ok=
X-Received: by 2002:a05:620a:909:: with SMTP id v9mr18633385qkv.138.1582036463546;
 Tue, 18 Feb 2020 06:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-12-manivannan.sadhasivam@linaro.org>
 <CAK8P3a1DOta5Uj3dNFWVqwgyPKs0cQsoymXE7svcOZoPiY+YGw@mail.gmail.com>
 <20200217164751.GA7305@Mani-XPS-13-9360> <20200218055142.GA29573@Mani-XPS-13-9360>
In-Reply-To: <20200218055142.GA29573@Mani-XPS-13-9360>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 18 Feb 2020 15:34:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2gxgsJskSVVGLBRkYTqBbJs20Mwe-x1FExiUeNBN9eUQ@mail.gmail.com>
Message-ID: <CAK8P3a2gxgsJskSVVGLBRkYTqBbJs20Mwe-x1FExiUeNBN9eUQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] bus: mhi: core: Add support for data transfer
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wHI0ayzfTGVitXbd/Vd26MMT06cd2aWO16fIFCN0Y/yUDOmnBRF
 5zcgc+uC2DC/LuoEs8q4WeD7Gfdg8Vo2BAMsvmgihyO5h4BqUqsmsN08rBoYwkGLgn5uWe0
 KnvXjOyJ62B+8VHdmzln0tYswe9saWTE2g60i24hLHV08fub/pfdQbYXNo5wtaP8IdqZN0G
 R+mm7UMfzMAIbMrb4mkgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Se8YxxOWKU8=:vaNZusZ/eh0dHzLXNBJni/
 W6VFub7iImA0LrzCNiGhs9nxX0ilhRMpX4A0YvCUwGA7gnU81VL8hf5pPY341QdIT1HnvdyLZ
 sQYWPP4Rg5MigIh7AjCeYCS1P6cdv0xsBNmhkcBQ5euLQm2pndL47BkOSeMAT76nqEAOFAAhg
 6tRdj5ZBMBDomrTez4g9j4k8/FRTZFp+vDp+/rB7EHgcf6+/E1dovSiUysY51e7ocnVeLUNkt
 VHjXjefgFgmbRkPoI2fLYdElDcVmDuKTG5P1kQwezq+L4Z/OV3ride6gSNyh+yg/wbvpfIn62
 ISrQWJIkqaB9AjhrYIxZGzrzJeVFO69F0sHY5Mn8LjflyE/htRnTErEwqnLG8k3uXV4Tgc2Bq
 665lxJSbndA24DSc0piN5qLfsh0YqWDrQUWw0If6FDUKQ1O9GcWt/6TlheDyO1YE1+AbjObGS
 annJDdxehHfvA1RDrhoa5BwrhZ/O8cwl6kfvDdouJHLbwkSqJp0RJVoQse7HXimlxfgYMat2R
 7Fzm1god3LR55LAhUrq0BJkgkMbV9Ms0ZptS/eFXYUxtH3M8WN+gxgmWjG9Q1ihFJAvI+T+0w
 3UK14UIO4+r8Z31hz+vZ8miJWxN+v3uzqbEWNignspTkYdcP3DbT7QtX6mmOjvI9WXICTgUOa
 oSNO+kVvQgDau1gGTMgZFkA6L8gg35EG0f7grdKn45gywsULQh2R/fj6zasbzQMbnJEBY4sRM
 oSj8F2kqZ7SPi630QV0/7Q44oDFyvHBqDV14NOXF2HewWuhfbagkn0VCnnQZdW8W9uUi6KhFZ
 kVde7xqr19/qzLXpa4fHFrNfXcDWXILsdlXzMWdYu8LZtl3pqk=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 18, 2020 at 6:51 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> On Mon, Feb 17, 2020 at 10:17:51PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 17, 2020 at 05:13:37PM +0100, Arnd Bergmann wrote:
> > > On Fri, Jan 31, 2020 at 2:51 PM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > While looking through the driver to see how the DMA gets handled, I came
> > > across the multitude of mhi_queue_* functions, which seems like a
> > > layering violation to me, given that they are all implemented by the
> > > core code as well, and the client driver needs to be aware of
> > > which one to call. Are you able to lift these out of the common interface
> > > and make the client driver call these directly, or maybe provide a direct
> > > interface based on mhi_buf_info to replace these?
> > >
> >
> > It sounds reasonable to me. Let me discuss this internally with Qcom guys to
> > see if they have any objections.
> >
>
> I looked into this in detail and found that the queue_xfer callbacks are tied
> to the MHI channels. For instance, the callback gets attached to ul_chan (uplink
> channel) and dl_chan (downlink channel) during controller registration. And
> when the device driver calls the callback, the MHI stack calls respective queue
> function for the relevant channel. For instance,
>
> ```
> int mhi_queue_transfer(struct mhi_device *mhi_dev,
>                        enum dma_data_direction dir, void *buf, size_t len,
>                        enum mhi_flags mflags)
> {
>         if (dir == DMA_TO_DEVICE)
>                 return mhi_dev->ul_chan->queue_xfer(mhi_dev, mhi_dev->ul_chan,
>                                                     buf, len, mflags);
>         else
>                 return mhi_dev->dl_chan->queue_xfer(mhi_dev, mhi_dev->dl_chan,
>                                                     buf, len, mflags);
> }
> ```
>
> If we use the direct queue API's this will become hard to handle. So, I'll keep
> it as it is.

Please have another look, this is exactly the part of the subsystem
that I think should be replaced. For the caller, there should not be much
difference between passing ul_chan/dl_chan or
DMA_TO_DEVICE/DMA_FROM_DEVICE, so that too can be lifted
to a higher level.

      Arnd
