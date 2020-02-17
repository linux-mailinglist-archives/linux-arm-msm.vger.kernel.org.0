Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442EC161778
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 17:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgBQQNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 11:13:55 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:51501 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgBQQNz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 11:13:55 -0500
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MjjOl-1jj40H0Ug7-00lCVz; Mon, 17 Feb 2020 17:13:54 +0100
Received: by mail-qk1-f179.google.com with SMTP id b7so16649892qkl.7;
        Mon, 17 Feb 2020 08:13:53 -0800 (PST)
X-Gm-Message-State: APjAAAV975bfiCQe/Wz/vCDY+evKlNrgNFxaN0lqQiKNhrL599vlysZr
        lU9DaaimsZVvrYI4LvTLBFp9AZUarqFuAkiUjjw=
X-Google-Smtp-Source: APXvYqyu0Ibghd5qjbxWZS5GA+WuNzfu2Ul5vdxP3b5BWP8tzVI94dY8XVcyUAgymnZPYfNBsJKDJyIFd/E9Zt2EVNk=
X-Received: by 2002:a37:e409:: with SMTP id y9mr15169463qkf.352.1581956032902;
 Mon, 17 Feb 2020 08:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org> <20200131135009.31477-12-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20200131135009.31477-12-manivannan.sadhasivam@linaro.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 17 Feb 2020 17:13:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DOta5Uj3dNFWVqwgyPKs0cQsoymXE7svcOZoPiY+YGw@mail.gmail.com>
Message-ID: <CAK8P3a1DOta5Uj3dNFWVqwgyPKs0cQsoymXE7svcOZoPiY+YGw@mail.gmail.com>
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
X-Provags-ID: V03:K1:EBlLmQcY5WAk8oxakAHM07INbyDmmQkMgamLnBJq5di+FAtxhga
 BKfH7CyuIFyvwcSnP8glnfsooiLGmbbDpV2RbGVRB7qUCacKbvOPoXY10P8U6C2XmWpxC69
 HwJvf0Mm37dJy/VPLvvqi0dzu7VuWFnPpQhr54z0fFwFDdeDyKhpT1etjSF9Vmw508lkS5H
 Cc7cb4y0BgLa/iQ2eSVjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:linODcjJZeI=:0KG5tqodBxiKTUcee1zCcm
 8OrUvD5xLQsr9ZHspgCc/L73edSFP/BYx1xdn3HIRyIpsmyyZ0Tv9qWTKf288U83Loh0d6TUB
 PQUahOQNiYeOD26ca3mga2CuKMyOf84BZyFWJm2Z6gztDboNtP5IW9wpT8FOcMuGppQni9o8g
 5am/K5XL8QHelwEBGCcAjQQZZwMKzPVXyIrjc+eXPj9yX+MI8DPmJCBMY/25DKMOtj5wYA5dh
 Uj6J5etYHAHptefOBdu/wKHvzlnya3YW6AqnViiA5dk07rvfZBL/uHxUsu49fGIQO1W2XOuUJ
 XK4XA4GpPvZyWyKCX1rGIsS5fxyYFtoRxotTNSMSRCfgnI+pAeq6rCd63xfOFa9hsF6E0IPwD
 uk9cw8OgS5XurOEKOtyACDzbwc2me7/0ZI1rOx8AR/6HGfbQfpM2wgM/T3E58NTlHYE9dXWbR
 LoEl5bPkB7mZq63Ovo5+zSeYc+zJKQD45FFZguCAsjURV+82shT/vtmPhgiL8NhteMAOVzX14
 ACfLp7WRMabKfWDdIL3EwNinWfjKbXnMaDrBpVQnrXqaJh7abPBCXZxiU8ft2dzoTkftprXTQ
 Hp7p7VwJpSNRLEqLB8CBis+AgvQsBw53nKcOQCY+d1xzr9B1AnlV3wXSAxxTERYD6Quae6PqD
 rb8xcpjxhydw+Qfke9hnMA242W6ns6CdFGRrMKsR2kWk5dWxeV0HeCRc196NmZmbT6+ZLV4/w
 JRjXntoB6luvnqreBn3Kw9/gtFm8qliyNtCj4CquktvpoVnICPeWkPRDj5FMnWU3cBLpzZ7fa
 XNWT8DWMEjfbVV2+5rHcCFnoCZTJP7ThuOED7RfsgOvMsKKIZc=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 31, 2020 at 2:51 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> @@ -648,6 +715,31 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>                 mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
>                 mhi_chan->xfer_type = ch_cfg->data_type;
>
> +               switch (mhi_chan->xfer_type) {
> +               case MHI_BUF_RAW:
> +                       mhi_chan->gen_tre = mhi_gen_tre;
> +                       mhi_chan->queue_xfer = mhi_queue_buf;
> +                       break;
> +               case MHI_BUF_SKB:
> +                       mhi_chan->queue_xfer = mhi_queue_skb;
> +                       break;
> +               case MHI_BUF_SCLIST:
> +                       mhi_chan->gen_tre = mhi_gen_tre;
> +                       mhi_chan->queue_xfer = mhi_queue_sclist;
> +                       break;
> +               case MHI_BUF_NOP:
> +                       mhi_chan->queue_xfer = mhi_queue_nop;
> +                       break;
> +               case MHI_BUF_DMA:
> +               case MHI_BUF_RSC_DMA:
> +                       mhi_chan->queue_xfer = mhi_queue_dma;
> +                       break;
> +               default:
> +                       dev_err(mhi_cntrl->dev,
> +                               "Channel datatype not supported\n");
> +                       goto error_chan_cfg;
> +               }
> +

While looking through the driver to see how the DMA gets handled, I came
across the multitude of mhi_queue_* functions, which seems like a
layering violation to me, given that they are all implemented by the
core code as well, and the client driver needs to be aware of
which one to call. Are you able to lift these out of the common interface
and make the client driver call these directly, or maybe provide a direct
interface based on mhi_buf_info to replace these?

      Arnd
