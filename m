Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B97189E54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 15:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgCROxa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 10:53:30 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40017 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgCROx1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 10:53:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id t24so13815054pgj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bSaxZBsVRIea8O40s0gHrKvIQTpUv4EQDwjpsfPtStE=;
        b=NEV6EJQW31fosLEZPUCOokfdbTYH1j7rUiseYyd6QgUgtHrRqj+93AzTz7m8uRrRiG
         4BreEt+HW0kBLtONJiUYNkgJCVLQ5zU1GlIF1w7mRlvmuRmDywBS5NkXXZjZAnog54vc
         IeLrTSzY9OnB73V/xqqS3Al9r61Flh5u4JmurAG5NsRru5gRIu8ZsYFf54BDm8j3/OFC
         GNWDOdEIU8ubLKh5KQFeWhvKKex+wG0fPPbmX5hifT/GlpUsSph6VGdRNvpU0N4GmWXe
         wJ1H4mJflNc27T+PaCXgu3u4Te/n39pbHVI5UCaYAxhzsONBST58vgGUqB0oTaoSng5/
         yEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bSaxZBsVRIea8O40s0gHrKvIQTpUv4EQDwjpsfPtStE=;
        b=dTfkveCNZoJ53tZvsMG3/1K9xR15fKDvEOePbOwS0V+ajVOrRW67lijqrD0fLMjk1O
         bsNn8mMBXweXuTrv02l4VBev2UT+2AEUroUuNAmbqhr4TYC/fFJKEyhIKgiq0Uc5uMzt
         mjSsXJqMcojmC+FVuw6kljcTkpSpmDg96OsR6sd+ShErjMKnNex/dU9iFKNnm5UFFJeY
         tg9GWj8/FOc3C8nkJ1bHaHPdPNh8oaokZ6NzmM4/e6VU/B/1jkM8ZCI13KJzrmTLGXqh
         y/7uzMOwAaXNQAVM8PBnnwJ6OE9+tO94NnI2YH4sEMtiGpeU2oyKsa9b2VlgUo3kvnj7
         ozRw==
X-Gm-Message-State: ANhLgQ2KCgrrHV+HBFanqB1xTU7PhZivjRJuAFn8FofgYz7QMIQin14a
        4jyAC8xgFP3rD5D+0Obc9nRAO+tAxeMU
X-Google-Smtp-Source: ADFU+vuXpSmTOZZFpFy5a3s/b2DTUpsn73W0gqi1O00Pb7jORAvFfNssj1yafPoPZwYiilrn4OdSrw==
X-Received: by 2002:a63:e551:: with SMTP id z17mr5003569pgj.21.1584543206241;
        Wed, 18 Mar 2020 07:53:26 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:199:25eb:1005:91b8:c500:d4b4])
        by smtp.gmail.com with ESMTPSA id u9sm3085926pfn.116.2020.03.18.07.53.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 07:53:25 -0700 (PDT)
Date:   Wed, 18 Mar 2020 20:23:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 14/16] net: qrtr: Add MHI transport layer
Message-ID: <20200318145315.GA12709@Mani-XPS-13-9360>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
 <20200220095854.4804-15-manivannan.sadhasivam@linaro.org>
 <20200318144246.GA2859404@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318144246.GA2859404@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Wed, Mar 18, 2020 at 03:42:46PM +0100, Greg KH wrote:
> On Thu, Feb 20, 2020 at 03:28:52PM +0530, Manivannan Sadhasivam wrote:
> > MHI is the transport layer used for communicating to the external modems.
> > Hence, this commit adds MHI transport layer support to QRTR for
> > transferring the QMI messages over IPC Router.
> > 
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  net/qrtr/Kconfig  |   7 ++
> >  net/qrtr/Makefile |   2 +
> >  net/qrtr/mhi.c    | 209 ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 218 insertions(+)
> >  create mode 100644 net/qrtr/mhi.c
> 
> I stopped here in this series, as I do not feel comfortable merging
> stuff under net/.
> 
> Can you get some review by the networking developers and then I will be
> ok with taking it through my tree.
> 

Sure.

Dave, can you please look into this patch? Greg merged the remaining patches
to his char-misc-testing branch. And if you can provide review, all can go
through Greg's tree.

Thanks,
Mani

> thanks,
> 
> greg k-h
