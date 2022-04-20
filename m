Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483345080AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 07:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245452AbiDTFjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 01:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244915AbiDTFjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 01:39:12 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762686560;
        Tue, 19 Apr 2022 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1650432983;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JLun0YrEgADl0EiMrgJKZfIPYsBXKlKt85NSwxmMW2o=;
    b=hHjIdCpF/CVuyZoPsrZw4AgoX/7oihpN76GzP2L8EZTMk97XiKg7erAxYs9WJUmfPk
    vsGTskJr5jm8D0aF4mpktMDehU/SyGYLjQpLT6yNlltA257Jgf1pSZYtBDkzGmdhc6ES
    yjVNL6BFPgr02OIqik425WWJOzpI9M11MfBvnqvxYQ4Z0wbvGZNVxrNUeUWpPWU16qyO
    uGuNLvX+xFEERMbzhOm1MJOwNrkPGQdnms0t+gE69pBWxr3xCt81HfVL1NWx1PVSM8eE
    DYIYXS6o8YkdCMNLQkqtBVM4RrbE8exNdGON1mZIkDPpZOm/u8QYtz/hK9rs+jb3BQLF
    nJtQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK88/6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.42.2 AUTH)
    with ESMTPSA id u05e50y3K5aMver
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 20 Apr 2022 07:36:22 +0200 (CEST)
Date:   Wed, 20 Apr 2022 07:36:21 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org,
        jun.nie@linaro.org, benl@squareup.com, jwillcox@squareup.com,
        jgates@squareup.com, mchen@squareup.com, zac@squareup.com
Subject: Re: [PATCH v1 4/4] arm64: dts: Add msm8939 Sony Xperia M4 Aqua
Message-ID: <Yl+b1bYpT19TgRDS@gerhold.net>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
 <Yl8NLldCWaecisH5@gerhold.net>
 <552547c1-36c3-8d7e-0fd5-1b22fd184b4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <552547c1-36c3-8d7e-0fd5-1b22fd184b4b@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 19, 2022 at 11:03:30PM +0100, Bryan O'Donoghue wrote:
> On 19/04/2022 20:27, Stephan Gerhold wrote:
> > tulip seems to have qcom,usbid-gpio = <&msm_gpio 110 0>; downstream.
> > Have you tried setting it up using linux,extcon-usb-gpio?
> > See e.g. msm8916-longcheer-l8910, it has a similar setup (it also uses
> > smb1360 for charging actually).
> > 
> > The advantage is that you don't need the manual role switching using
> > "usb-role-switch", USB OTG adapters should be detected automatically.
> 
> My understanding is "no new extcon" - certainly as driver implementations I
> assume that also extends to dts..
> 

It's probably tricky to combine the USB-C stuff with extcon since that
needs driver changes. But for good old micro USB stuff extcon is
(perhaps sadly) the standard and it's exactly what the USB and USB PHY
driver expects. So in my opinion you might as well make use of it. :)
