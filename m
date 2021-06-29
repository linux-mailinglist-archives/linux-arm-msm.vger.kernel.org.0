Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D533B7966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235501AbhF2Uck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbhF2Ucj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:32:39 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69710C061766
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:30:11 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id s10-20020a4aeaca0000b029024c2acf6eecso4780981ooh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=89liKa7K31BgmbxzziYmgcqbdDlAJhF4yMUEOH5c/D0=;
        b=DG9unyCJKzOEQ2lPlMfo3laA2BXIgUixYrrfr/EARlBkRgnM94rfIMFkElGNcrUO+Q
         rcyCWYLNsTjX3lBKzA4RH2aCRtz4VqCVU4ddQQ/izsZ9xWbViDWa60GwWy556Q/bMfmQ
         hPgIURmPZJAxEMxYLEekqe8q6BcoImuWhMRUhE2wNLGBO25peygPrMPb5sceWIhbxctV
         wNovgON2tnDoNxuLhZS2LFQ4bsolQGJ53nSb4jIrKWNuzke9kgXy2FAyCancpYFjvUj1
         8wtBCtaGJKVymHbpxMz9fgbU5DzCYktruq7tR3BBVHqeW6hl8xyd5R1L2xKQ7oMbfrQJ
         1N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=89liKa7K31BgmbxzziYmgcqbdDlAJhF4yMUEOH5c/D0=;
        b=Yjlm5iaZ+jrSPzdSudVbFFtKDSeWmHA0p6KsGHMwRodjwPBmUtxdZf8TwBcWNAP3+C
         uKvRG/eFeB+n+KaZa+hPxrUpcq0AZFMa2VdZhlkILpoJQ/8R55iNDYWDzHrHsmVfLsq2
         hmiArrK58okMjrgFoqen8vE9u9Mx9ihdiQlHJv13MFHDD5RP32MKxvMQ5fBbVSO674UZ
         fhb8XPN+g8BQ5HuSJyDqK3zOTdBBCCjfZLmbW8RVeXmXqQ5mXEFavyzw0GGCU1Ug/ifv
         wLTVdlzGVRSTyeornW4MMKHtflYc7JjgEsbGd68jItbB/6VcL5Yxj8xfiYthM0rw+Jy+
         WuNw==
X-Gm-Message-State: AOAM530RHl4uwrQgprQJDKHckznQiXkIWt16uxLs/E3BDhx2wbYFQKJw
        6/KfPpOsjN4edPJNrvJVe3TlUA==
X-Google-Smtp-Source: ABdhPJyiCKX1EZQ72LfvwTp+zT59bG0Tg4drEMqXZ5CzO8CcR7yp42bnuKgXBz/N9u2RiDX+Jjkm0A==
X-Received: by 2002:a4a:d448:: with SMTP id p8mr125569oos.87.1624998610771;
        Tue, 29 Jun 2021 13:30:10 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p10sm4622326otf.45.2021.06.29.13.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 13:30:10 -0700 (PDT)
Date:   Tue, 29 Jun 2021 15:30:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and
 register role switch
Message-ID: <YNuC0Njwr4B1Q1xZ@yoga>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
 <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
 <20210629200228.GE25299@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629200228.GE25299@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Jun 15:02 CDT 2021, Jack Pham wrote:

> On Tue, Jun 29, 2021 at 08:23:46PM +0100, Bryan O'Donoghue wrote:
> > On 29/06/2021 16:48, Bjorn Andersson wrote:
> > > What's wrong with the switch that dwc3_setup_role_switch() sets up?
> > > 
> > > That's what I've been using in my UCSI hacking on Snapdragon 888 and it
> > > seems to work...
> 
> Bjorn are you exercising dual-role or just host mode?
> 

I remember testing switching between host and peripheral, but given
your explanation below I doubt that I actually validated that peripheral
mode was functional.

> > A good question, which as soon as you asked it made me completely doubt if
> > I'd tested the tree without the patch applied.
> > 
> > I reverted both on my working tree and indeed it breaks role-switch
> > detection.
> > 
> > In TCPM the connector is a child node of TCPM
> > 
> > https://git.linaro.org/people/bryan.odonoghue/kernel.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?h=usb-next-5.13.rcx-rb5-tcpm
> > line 1396
> > 
> > We use a remote endpoint inside of TCPM to hook up into &usb_1 line 1303
> > 
> > Not entirely sure what the graph tree looks like in your USCI case but I
> > guess the connector is a child node of the controller ?
> > 
> > But I think your question is why bother with the role-switch in dwc3-qcom
> > 
> > dwc3_qcom_vbus_override_enable(){} is switching bits that probably ought to
> > be in the PHY but for whatever reason ended up being buried in the qcom-dwc3
> > wrapper.
> 
> This. When switching dwc3 into peripheral mode we also need
> dwc3_qcom_vbus_override_enable() to write those registers to manually
> drive the UTMI VBUS valid signal high to the controller since our SoCs
> are never physically wired to the connector's VBUS. These registers
> (QSCRATCH_{HS,SS}_PHY_CTRL) however don't belong to the PHYs but are
> part of our dwc3 wrapper's IO map and hence dwc3-qcom is the only
> appropriate place to handle them since dwc3-qcom has over the years
> paired with several different PHYs depending on SoC.
> 
> Wesley's approach in $SUBJECT was to designate dwc3-qcom itself as a
> usb-role-switch-able device so that in the DT the connector graph
> endpoints would wire to the dwc3-qcom device itself instead of its dwc3
> core child. The idea would be for dwc3-qcom would intercept the
> role_switch_set call from TCPM/UCSI, call the vbus_override_enable() and
> then pass on the notification to the child to let dwc3/drd.c handle the
> rest.
> 

I really do object against us adding another role switch implementation
just to, once again, circumvent the annoying split between the platform
specific and core part of the dwc3 driver.

> IIRC there had been an alternate proposal to keep the role switch
> connection only at the dwc3 core but in order to handle the vbus
> override business an additional notification would have needed to be
> done either from the usb_role_switch class driver or as an "upcall" from
> dwc3 core -> glue. (found it, it was by you Bryan [1])
> 
> [1] https://lore.kernel.org/linux-usb/20200311191501.8165-7-bryan.odonoghue@linaro.org/

I liked this, and it worked when I tested it, but iirc it suffered from
the problem that the core's probe may or may not have finished
successfully at the time that of_platform_populate() returns.

But fixing this problem would save us quite a bit of headache.

Regards,
Bjorn
