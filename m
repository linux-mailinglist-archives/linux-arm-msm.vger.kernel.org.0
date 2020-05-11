Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADA81CDD16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 16:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgEKO0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 10:26:13 -0400
Received: from mx01-sz.bfs.de ([194.94.69.67]:55480 "EHLO mx01-sz.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgEKO0N (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 10:26:13 -0400
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-sz.bfs.de (Postfix) with ESMTPS id 106C920511;
        Mon, 11 May 2020 16:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1589207171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9kaEHvBtEYSLwOSsd7oE6EH1nwQqWqDHGfHfs4bqpY4=;
        b=rS2fU/naCneek6a1qDKkudR28Kx4o67i7xs5aSSlARr4NrGg0FFlNoGBWOcC/g+Mxp/VnS
        ISpkZl7/8p3Z2F5MVf/zbA+X+aiCyfROYhLDTtxY+YkaA6RF2LpnxtQzvNDZBycD4hKS/M
        z/S0aFSoZmhYlJp6GzHodceMJvvYulkvQIc3uj7r430wViUlIqF2+K9ggPw4LYgXJyUV21
        5J/FjeHbPJGxScAOy/+IKHcz7yqPPG69I3bM9MLXXzzFrSlhnyv4ZNAA1cms97i52RhLA1
        nbGPRDsh9qjxiyH/+WH/yS9dniHTdUg3tvt8+AZB54mqYUUVbGvWkrhETwR7sw==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 11 May
 2020 16:26:10 +0200
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.1913.005; Mon, 11 May 2020 16:26:10 +0200
From:   Walter Harms <wharms@bfs.de>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: AW: [PATCH -next] bus: mhi: core: Fix some error return code
Thread-Topic: [PATCH -next] bus: mhi: core: Fix some error return code
Thread-Index: AQHWJdbmJCUP43lzz0ivM6Xt7/S4/aiikW4AgABhdDQ=
Date:   Mon, 11 May 2020 14:26:10 +0000
Message-ID: <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>,<20200511103124.GA12753@mani>
In-Reply-To: <20200511103124.GA12753@mani>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.39]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.92
Authentication-Results: mx01-sz.bfs.de;
        none
X-Spamd-Result: default: False [-2.92 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[10];
         NEURAL_HAM(-0.00)[-0.989];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         BAYES_HAM(-2.92)[99.67%]
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello guys,
some nitpicking ...
the prefered kernalstyle is:

if (condition)
   set error_code
   do something

from what i can see it is

 set error_code
      if (condition)

jm2c
 re,
 wh

________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Manivannan Sadhasivam <manivannan.sadhasivam@linaro.=
org>
Gesendet: Montag, 11. Mai 2020 12:31:24
An: Wei Yongjun
Cc: Hemant Kumar; Jeffrey Hugo; Greg Kroah-Hartman; Sujeev Dias; Siddartha =
Mohanadoss; linux-arm-msm@vger.kernel.org; kernel-janitors@vger.kernel.org;=
 Hulk Robot
Betreff: Re: [PATCH -next] bus: mhi: core: Fix some error return code

On 0509, Wei Yongjun wrote:
> Fix to return negative error code from the error handling case
> instead of 0 in mhi_init_dev_ctxt() and mhi_driver_probe().
>
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations=
")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index eb2ab058a01d..1f8c82603179 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -291,6 +291,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntr=
l)
>       }
>
>       /* Setup cmd context */
> +     ret =3D -ENOMEM;
>       mhi_ctxt->cmd_ctxt =3D mhi_alloc_coherent(mhi_cntrl,
>                                               sizeof(*mhi_ctxt->cmd_ctxt)=
 *
>                                               NR_OF_CMD_RINGS,
> @@ -1100,6 +1101,7 @@ static int mhi_driver_probe(struct device *dev)
>               }
>       }
>
> +     ret =3D -EINVAL;
>       if (dl_chan) {
>               /*
>                * If channel supports LPM notifications then status_cb sho=
uld
>
>
>
