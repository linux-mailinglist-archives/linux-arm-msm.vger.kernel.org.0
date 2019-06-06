Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67053368CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 02:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFFAkE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 20:40:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42094 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfFFAkD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 20:40:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so343041pff.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2j6AeMQyqlvFrN/cZ76T3pXgzcnOXpcF30PXkUvG5XQ=;
        b=pD2wunXYqvfYwPLkqvphd1Nzp5oBP1ZJMlmbllJSDRqtIDW6GMm+JLMRRA0rbZiS1C
         +9pX2xQxEuN9NhtiVlPu2Jxh6vHv5pnFnYTwBGb5uvtA1DL8+Rf4kviOf5xc77dpWKSB
         rf8bStUliSESYC80DHlCn8Zkpe6fr6yqjkblYLgaVy0mUYWGe2eSvbKU5FdYiCayUKmB
         IS2+/HgohoC/dtOAoPVklaNzTd/4lnl4tVjaA8ytHMG8vSWNF8tHI4lhaEMgn3r1eDai
         XQyeR/zl4UZGvJsyrPL5pR5yxascYYXBmP2ViQI/Xs2NIXa0Fz4whXJebVBrtj4cuJto
         4/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2j6AeMQyqlvFrN/cZ76T3pXgzcnOXpcF30PXkUvG5XQ=;
        b=WWMSjm7RVSdsclK0d2Nd8y/ZDPNJge4c7OVlkDwl5cpxCJWAau+ABr2hkU/p+ddKYm
         GWIU2GD/r4aAbwLMfxxcmv8AHppXjkdsXj6zJz7sfPhXg1/1PgS8GsXGXNzL3Lizdcub
         4nr+UaCyJWX+rYpgAJAMMFz2o3dDcMQbpm4Kqu+c6DMem7e5vCLY6gVfd9pql1Iho/Va
         1+nZ9xIjoj7V4FwZ2VloON7rL6MVyts6PkQ7vZv3dN/I/TqjXTf+n7Nk+JKqGZufpUBR
         vXTXlzVmz2tOeh7zNkvW3YKoGLu8gsUsv0vneMmeLZMmkYjxyBLG/JM6uLowJXaFVI6S
         nMKg==
X-Gm-Message-State: APjAAAVvfrAUZVOlsqb2hspT6sbh57n3p1nVMf0yF6CLtwyaapAA0a85
        S8kwqC5G5/cGO7IXWbuB+xKqNQ==
X-Google-Smtp-Source: APXvYqzvXQ5ewa5JC1Giq17eXL/bIpyul2XvnitexIdi7NKOYgS8rm1aWJkbpisCuaALbZ2LP5zfhA==
X-Received: by 2002:a62:e511:: with SMTP id n17mr43614480pff.181.1559781602896;
        Wed, 05 Jun 2019 17:40:02 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v28sm89656pga.65.2019.06.05.17.40.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 17:40:02 -0700 (PDT)
Date:   Wed, 5 Jun 2019 17:39:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 0/3] (Qualcomm) UFS device reset support
Message-ID: <20190606003959.GM4814@minitux>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <CANcMJZBmgWMZu7Y53Lnx_x3L2UpCmEbFRHVW0SFCXfW=Yw9uYg@mail.gmail.com>
 <SN6PR04MB4925530F216E86F6404FE14CFC160@SN6PR04MB4925.namprd04.prod.outlook.com>
 <20190605060154.GJ22737@tuxbook-pro>
 <SN6PR04MB492521B7D2DB6F3462EDB7D9FC160@SN6PR04MB4925.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR04MB492521B7D2DB6F3462EDB7D9FC160@SN6PR04MB4925.namprd04.prod.outlook.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Jun 02:32 PDT 2019, Avri Altman wrote:

> > 
> > On Tue 04 Jun 22:50 PDT 2019, Avri Altman wrote:
> > 
> > > Hi,
> > >
> > > >
> > > > On Tue, Jun 4, 2019 at 12:22 AM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > This series exposes the ufs_reset line as a gpio, adds support for ufshcd to
> > > > > acquire and toggle this and then adds this to SDM845 MTP.
> > > > >
> > > > > Bjorn Andersson (3):
> > > > >   pinctrl: qcom: sdm845: Expose ufs_reset as gpio
> > > > >   scsi: ufs: Allow resetting the UFS device
> > > > >   arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO
> > > >
> > > > Adding similar change as in sdm845-mtp to the not yet upstream
> > > > blueline dts, I validated this allows my micron UFS pixel3 to boot.
> > > >
> > > > Tested-by: John Stultz <john.stultz@linaro.org>
> > > Maybe ufs_hba_variant_ops would be the proper place to add this?
> > >
> > 
> > Are you saying that these memories only need a reset when they are
> > paired with the Qualcomm host controller?
> ufs_hba_variant_ops is for vendors to implement their own vops,
> and as you can see, many of them do.
> Adding hw_reset to that template seems like the proper way
> to do what you are doing.
> 

Right, but the vops is operations related to the UFS controller, this
property relates to the memory connected.

E.g I have a Hynix memory and John have a Micron memory that needs this
reset and my assumption is that these memories will need their RESET pin
toggled regardless of which controller they are connected to.

Regards,
Bjorn
