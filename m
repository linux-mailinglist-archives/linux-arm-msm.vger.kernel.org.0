Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6F81604D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Feb 2020 17:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgBPQf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Feb 2020 11:35:58 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43367 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728239AbgBPQf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Feb 2020 11:35:58 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id C45ED5966;
        Sun, 16 Feb 2020 11:35:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 16 Feb 2020 11:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=SQA1PLeoVk+BW+GTPAF4AsP3llw
        ambjLeI+Hxm8q8jY=; b=nmcy0E9UGTIhkYGrQYahCZthdxt5odOdVHcvXfHU+XE
        NdCbXPiKGVLHk2RRmmiHwQMEklhsyOkc/47HVt/+/E2topOCBJERfsiny2lXLnvp
        UDzmHt1g6J1Z4iilSqw69Q7e2Ku/UVbQQN/LtsbvNsFwW2Uiv/VoYuchgasnzsUn
        z/0VXXoVIxtkI3CwMP15OPveLRplrhdO4ut43gD9H27xwAApjywQbabuhPb1QNnW
        P+jRXfi83jrarJAHIjZiWk/zkdMCVnbhyBZhcJ3oP3BEEhB0z+CFuMUUXTUVo404
        ihTIDZjS3Ib/0ng2aWvBg80i+TTvjq1jtjPiicVKoVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SQA1PL
        eoVk+BW+GTPAF4AsP3llwambjLeI+Hxm8q8jY=; b=GZhEBWLo/hc1Yy9zGMY7RI
        3qIhXoV7Ggjjr6b/JovvJpd9a5rltQ7iwzSpwNsOzQIUdJpEnyeqVpcMpaBD0pvF
        IyoP/unIXL6PcBglNdE0bZu+L7zptqzYaNibkKMImwE7KC1NZWGqZ+rXH4yW5n0l
        /PLc8YaUYAGg/2FsEelBXp3uVoLK2evW/GJXhzQ4ffNTMzjayHzdXrvpleFklJyp
        unySdOsE5b0MQYxyRq3MsZQ9cu3IVSFQIGFIBUXT0kh8ETqE5PP4cv81tTsMV7by
        W5uG1rpIgEiiltxLrSyVxIbxl3K/IOMQcoW+8NKHQk0pWCyyUr4vq2OJ3v3Im7og
        ==
X-ME-Sender: <xms:bG9JXpqk52gGd1F_j4h6-vVKhPYSpg4pQP1HjUQiInJGnf_XpQTYrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeggdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledruddtje
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
    gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:bG9JXuSwcKY1qeLkTwBf8f3sdU9lOxSXwsGqCAwFT637D82o8df1Iw>
    <xmx:bG9JXlvXMUGUkhSjXli6qZKkaNjJX-4o65eSHea4SbiOf5IvanjJWg>
    <xmx:bG9JXmNnHqugDnOijxA1h5xBRJluRUnKRLWhjyjk3cTjFt29SsPrug>
    <xmx:bG9JXq_vmNs6tYMHPHDaGEbCsvnTTO8kuzf64adAWBQ0P5NpUtrudQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1ADBB3060C28;
        Sun, 16 Feb 2020 11:35:56 -0500 (EST)
Date:   Sun, 16 Feb 2020 17:35:54 +0100
From:   Greg KH <greg@kroah.com>
To:     "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
Message-ID: <20200216163554.GA48157@kroah.com>
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200207100438.GA627905@kroah.com>
 <06d21fa5-0115-9478-5cf1-e710446f8311@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06d21fa5-0115-9478-5cf1-e710446f8311@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 16, 2020 at 09:52:19PM +0530, Dwivedi, Avaneesh Kumar (avani) wrote:
> 
> On 2/7/2020 3:34 PM, Greg KH wrote:
> > On Fri, Jan 31, 2020 at 10:13:31AM +0530, Avaneesh Kumar Dwivedi wrote:
> > > Add support for control peripheral of EUD (Embedded USB Debugger) to
> > > listen to events such as USB attach/detach, charger enable/disable, pet
> > > EUD to indicate software is functional. Reusing the platform device kobj,
> > > sysfs entry 'enable' is created to enable or disable EUD.
> > > 
> > > Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> > > Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> > > Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> > > ---
> > >   Documentation/ABI/stable/sysfs-driver-msm-eud |   5 +
> > >   drivers/soc/qcom/Kconfig                      |  12 +
> > >   drivers/soc/qcom/Makefile                     |   1 +
> > >   drivers/soc/qcom/eud.c                        | 329 ++++++++++++++++++++++++++
> > >   4 files changed, 347 insertions(+)
> > >   create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
> > >   create mode 100644 drivers/soc/qcom/eud.c
> > > 
> > > diff --git a/Documentation/ABI/stable/sysfs-driver-msm-eud b/Documentation/ABI/stable/sysfs-driver-msm-eud
> > > new file mode 100644
> > > index 0000000..d96ae05
> > > --- /dev/null
> > > +++ b/Documentation/ABI/stable/sysfs-driver-msm-eud
> > > @@ -0,0 +1,5 @@
> > > +What:           /sys/bus/platform/drivers/msm-eud/enable
> > > +Date:           Jan 2020
> > > +Contact:        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> > > +Description:    Enable/Disable use of eud device.
> > What are valid values to be used here?
> it should be bool variable relying on 0 or 1.

Then document it.

> > 
> > > +Users:          User space debug application which intend to use EUD h/w block.
> > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > index d0a73e7..6b7c9d0 100644
> > > --- a/drivers/soc/qcom/Kconfig
> > > +++ b/drivers/soc/qcom/Kconfig
> > > @@ -202,4 +202,16 @@ config QCOM_APR
> > >   	  application processor and QDSP6. APR is
> > >   	  used by audio driver to configure QDSP6
> > >   	  ASM, ADM and AFE modules.
> > > +
> > > +config QCOM_EUD
> > > +       tristate "QTI Embedded USB Debugger (EUD)"
> > > +       depends on ARCH_QCOM
> > Why not let everyone test build this?
> EUD is Qualcomm IP, shall not it be associated with ARCH_QCOM?

No, why can't everyone buid it for testing?  What about when I want to
build a generic arm64 kernel to run on multiple SoCs?

Do not put dependancies in here that you really do not have.  There's no
reason for this to be limited to that one chip, right?  And if you allow
others to build the code, you will get proper bug reports when things
break, and others will fix them, which is what you want.

I think the ARCH_RANDOM_SOC_NAME is totally broken and needs to be, at
most, just an arch-specific thing, if even that.

Look at almost all other kernel drivers, they do not have those types of
dependancies.

> > > +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > > +	if (!chip)
> > > +		return -ENOMEM;
> > > +
> > > +	chip->dev = &pdev->dev;
> > No reference counting???
> you mean get/put_device?

yes.

thanks,

greg k-h
