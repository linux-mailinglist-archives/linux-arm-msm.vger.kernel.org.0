Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292C17254E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 08:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238466AbjFGG5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 02:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbjFGG5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 02:57:02 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926871732
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 23:56:58 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d24136685so221315b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121018; x=1688713018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbZJHWFvG7e+6T+OE9cOP6p9FlABT7Ry2hM+Lk72cDc=;
        b=AtcviKsaV0B4EF556reyoOW2LCZy7pRGbV+sJGDClAn2lPnwzATJsG5mpYhK8i8dNL
         rseOQqvTvv4WaQ9N7c9S6/LsTJ0+q2eb0aJHEySbPdL/HoZRGpPjWszxwMTEu6IJGgYg
         TbOrqzyeV99mw3VRkFrzlFP6Eh+bBw6cl00E0SMgqC2DAr13upNgOdCA2v6PYTuhdV8w
         HS6yTwT1m9EBKM9aByNiND/7HvIDN/HsEXcXcfwY88XdpTj1g29XlNCAgEpiRcPdFjmA
         DqRjQyzx3zQYZAyMm4kwEDgTdRGRhiljnDQVggkouQHgqkl/3zedF6ZIraXp78C21WsV
         +3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121018; x=1688713018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbZJHWFvG7e+6T+OE9cOP6p9FlABT7Ry2hM+Lk72cDc=;
        b=ko8Wi4As38bTx6OvLkrO2jJfOYyHyPzcGJ23FwV8hM2oUw+PfSnQj0BWScmD5BP0rm
         TwTc2FzQMc8JtilqSeZIT0UnPE8Q/Mni+NVmCI2bMV70Ajo0l4SK3CFUAExvT3/bkkNp
         RYrKL+FdMWUxL5AfGkDJQkig27szfMgBhX2vVkM/B9QQv7eQSmE6nNwMN4pG6p81nXcM
         wEARru9yU6ny1w6C4T+KYtX/cgDtocwlNEaGFD156r6Xt+Rw3X+qjMr95Ts5TrAYBgty
         Uc4oMjj7iFkSe5itm+jgFq6U+ZEBe7TKqr5Rd/aNM3d+P/hkkLdyXJwt/41ue7YlvKuT
         jF0w==
X-Gm-Message-State: AC+VfDxT/57gK568Ay1B5BQZohD/3UX6o748jj7D9o3r0WXvZBhBN2oj
        Qep8ULftDye4Vo+73C85Nog1
X-Google-Smtp-Source: ACHHUZ6cWKiLSdxkl6dJrjEECAzxAPc6F+Sm5bcROs9nSVpcodcj9uJ9abskwUWFmI9Do8QHxlEdSg==
X-Received: by 2002:a05:6a00:2e0e:b0:646:6e40:b421 with SMTP id fc14-20020a056a002e0e00b006466e40b421mr5004834pfb.1.1686121018003;
        Tue, 06 Jun 2023 23:56:58 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id t17-20020a62ea11000000b0065c8c5b3a7dsm3962043pfh.13.2023.06.06.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 23:56:57 -0700 (PDT)
Date:   Wed, 7 Jun 2023 12:26:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <20230607065652.GA5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c769c95d-e8cb-4cf6-a41a-9bef5a786bb1@lunn.ch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 06, 2023 at 02:59:00PM +0200, Andrew Lunn wrote:
> On Tue, Jun 06, 2023 at 06:01:16PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > devices to establish IP communication with the host machines (x86, ARM64) over
> > MHI bus.
> > 
> > On the host side, the existing mhi_net driver provides the network connectivity
> > to the host.
> > 
> > - Mani
> > 
> > Manivannan Sadhasivam (3):
> >   net: Add MHI Endpoint network driver
> >   MAINTAINERS: Add entry for MHI networking drivers under MHI bus
> >   net: mhi: Increase the default MTU from 16K to 32K
> > 
> >  MAINTAINERS              |   1 +
> >  drivers/net/Kconfig      |   9 ++
> >  drivers/net/Makefile     |   1 +
> >  drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
> >  drivers/net/mhi_net.c    |   2 +-
> 
> Should we add a drivers/net/modem directory? Maybe modem is too
> generic, we want something which represents GSM, LTE, UMTS, 3G, 4G,
> 5G, ... XG etc.
> 

The generic modem hierarchy sounds good to me because most of the times a
single driver handles multiple technologies. The existing drivers supporting
modems are already under different hierarchy like usb, wwan etc... So unifying
them makes sense. But someone from networking community should take a call.

- Mani

>     Andrew

-- 
மணிவண்ணன் சதாசிவம்
