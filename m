Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4288146752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgAWL4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:56:20 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43447 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgAWL4U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:56:20 -0500
Received: by mail-pf1-f193.google.com with SMTP id x6so1426805pfo.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wbXnjmrkqvBt6f4g6j+6Le954VeZ1mA97XslVwdtdqg=;
        b=eeNOlwR1NX/QMY547bzl+w56Al8LOilLh8W0x1hv/8gE9ItFHudxm0o8XD56w5/yO0
         c/kV+4LDt5rKEkmkQqJFSon43zKsJC5lGT5U8sETfXLsDF6Kz/ua0YIx6KjdcpJJz79t
         jFUQRTMTu56G6UsJ2/AfDh34SkOMDaYTwLaG4r48XpBSPWujVyToQ09gKNPeCR/J0zRq
         nEwu+b7p3G87N7cBTqW2YByQL18Pf49EmkjXse48C/NTwT5gzHLAjTvUXFX+Il8J3A+6
         TwpXvU9QFaGkwwUavMyXiAAba964mbpwDFEDXv3C8uSfp1XsexD7nHUKo0VtJvIdRYa4
         Zvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wbXnjmrkqvBt6f4g6j+6Le954VeZ1mA97XslVwdtdqg=;
        b=OcoEdzINiNYqjmj4FKaB3g8rdMXAs/B/2fbyv5ranJiA+mZtYKhh/WEQBk/Y7GMQN0
         rJU1FDoqicfuaTZpkKDDmsswTn/YVZKrxS1lge7odx33zsoTZyQBFOJZOTagjJADoo8C
         Qv7THnB1qeL9ACYO4oz6wFU7clvH+A962nXa16U4uaU4n6ne8n9Ss8jZjfn8i5T11GPQ
         PVbCyL8NPMiOe/whTuIhxze9QVA+MA1rXKRhdNwCWnp2/Ox4k/EJFuEVEZWCjlBTt/xx
         jX7sInqPB06V6sSAEo7FSb5VNi5k0GB0opaQpLudY78Kf5+FZQtbshSYA88loRaKdAYh
         e7/g==
X-Gm-Message-State: APjAAAXL4sl/50J+CYLsoMAbKti+PS9n92ldsIiiqpqt+cJpx2uXACN1
        UDoP79ut079EiouBEhNmtGqY
X-Google-Smtp-Source: APXvYqzWCezSsn1ODLuHyU7/ZB41028jnzs8+W0H1tijaffsrEV5+m6bkGYtfCO+s/2DABJ0KWd7aw==
X-Received: by 2002:a62:e511:: with SMTP id n17mr7073594pff.187.1579780579743;
        Thu, 23 Jan 2020 03:56:19 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id s18sm2496455pfh.179.2020.01.23.03.56.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 03:56:18 -0800 (PST)
Date:   Thu, 23 Jan 2020 17:26:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200123115611.GA8937@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <20200123113342.GA976687@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123113342.GA976687@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Thu, Jan 23, 2020 at 12:33:42PM +0100, Greg KH wrote:
> On Thu, Jan 23, 2020 at 04:48:22PM +0530, Manivannan Sadhasivam wrote:
> > +static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
> > +				      struct mhi_device *mhi_dev)
> > +{
> > +	kfree(mhi_dev);
> > +}
> 
> You just leaked memory, please read the documentation for
> device_initialize().
> 
> :(

Ah, okay. My bad. Should've used put_device(&mhi_dev->dev) here also to
drop the ref count. Will add it in next iteration.

Thanks,
Mani
