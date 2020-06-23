Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE53204A37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 08:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbgFWGvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 02:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730583AbgFWGvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 02:51:53 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B24DC061573;
        Mon, 22 Jun 2020 23:51:53 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w6so9135368ejq.6;
        Mon, 22 Jun 2020 23:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=dch8DSJUKjstoJDGxvg2f8JsX+5thmNCYdbKzI9c+Cw=;
        b=qdP3v74t8iJSWMwPKyL1xEELnGSVJcelKd6kRPXPLuN86/IYPVmVORIOpI5AuUt362
         xPrP7kTwe8PkYffuH5q0LYIsZQcp6czXYa1xI6Ke3k4ZrkaW0kNqcvdpD35DQo/QPyr4
         +ZZNBmBb+2OPZW4QETsuiCUEYw71XAoQOmGE9jnIPuYA5lYSJpnRfd9ADf/HqakcyHKj
         3E5dbgAgVL4VrhxrdikFNvQhD3F65BVKUiBk4UH08KQjHg1yKfciQnF4PmAEJpn3oIPv
         ICQSbDTUcO4eTWIW21cBt3jhIQA94o8e+K9nnGmg50UOzUkLoQQyS83nSuLprS8rloFu
         D4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=dch8DSJUKjstoJDGxvg2f8JsX+5thmNCYdbKzI9c+Cw=;
        b=ByIdB/6KgYJiDAQUeNLl4XSgh+QZpsZHPC7w/KHpeRmexpy1084IDxHjs0nJwaMBql
         e6uHU3GSVFo3bQc1Xe3xYO179VH+fu3Bt+F5FdotBO1m9Luu2rKmndrNbBy35aEC+Oxz
         +U7a21Sat/UWPnTsx+ABpnZ1JQ07ydZsqXPc2gO4wHo+JN7lndBuubPstfZ7SUyWpFIE
         T49yGsBmztE2CBr1WQzAv33cKTq6Suzm6mVb5/RXSENcD+cH23wK7L4HJ10x6GaXBQtb
         XhWi7c3Z29f/oinAXlb8iKC3O2acVN3ilyX7n+PcSMVTj1Pa1bfg8W9OU6AF6p31PcEu
         a+fw==
X-Gm-Message-State: AOAM5330qyXaVbsZNFiB9dd/UIneKKaI//LPVAvjbUZIl/GMinuStg9k
        Hpvle3icQPeE/os3mzFHCjZaGIZZLc+ggaQRzw==
X-Google-Smtp-Source: ABdhPJzx9O+cHuH892eckMmhm2Ul9TH73p8V/MJz8qJPCFfDof11CEP6Bv+JzPPp3sciBs0V28jLtNmDieEbDfwPCDY=
X-Received: by 2002:a17:906:4c81:: with SMTP id q1mr19233653eju.273.1592895112017;
 Mon, 22 Jun 2020 23:51:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa7:ca0e:0:0:0:0:0 with HTTP; Mon, 22 Jun 2020 23:51:51
 -0700 (PDT)
In-Reply-To: <SN6PR04MB4640DCE37D9D7F4CD99F2195FC940@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <cover.1586374414.git.asutoshd@codeaurora.org> <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
 <SN6PR04MB46402FD7981F9FCA2111AB37FC960@SN6PR04MB4640.namprd04.prod.outlook.com>
 <20200621075539.GK128451@builder.lan> <CAF6AEGuG3XAqN_sedxk9GRm_9yK+a4OH56CZPmbHx+SW-FNVPQ@mail.gmail.com>
 <CAP2JTQJ735yQYSeHgDPqnT0mRUTt1uKVAHacOHmSj3WK48PUog@mail.gmail.com> <SN6PR04MB4640DCE37D9D7F4CD99F2195FC940@SN6PR04MB4640.namprd04.prod.outlook.com>
From:   Kyuho Choi <chlrbgh0@gmail.com>
Date:   Tue, 23 Jun 2020 15:51:51 +0900
Message-ID: <CAP2JTQKu77risdNFBy5zwHoRU3qZw2dMi5Hxfi5Tyf6b9GB3XQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Avri,

On 6/23/20, Avri Altman <Avri.Altman@wdc.com> wrote:
>>
>> AFAIK, this device are ufs 2.1. It's not support writebooster.
>>
>> I'd check latest linux scsi branch and ufshcd_wb_config function's
>> called without device capability check.
> Please grep ufshcd_wb_probe.
>
I got your point, but as I mentioned, this device not support wb, this
is old products.

I'm not sure ufshcd_wb_probe are called or not in Rob and Steev's platform.
If it's called, hba->caps are setted with wb diable and this error not occured.
But (it looks) not called, same query error will be occured in
ufshcd_wb_config/ctrl.

BR,
Kyuho Choi
