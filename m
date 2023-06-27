Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22AA7406A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 00:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjF0WxH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 18:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjF0WxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 18:53:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9BD26B6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 15:53:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AAC7760FD9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 22:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7679BC433C0;
        Tue, 27 Jun 2023 22:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687906383;
        bh=KSJ/CrpZ4erhUoV/q7ajdRaNy+k6LuISa/Yrsa2n3d4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rvkRfGoWP9kyANS23r1P/v1HIUYUZkstu/uuADlj4RS3ZZAkgpAiwRDUVPgX8ixz0
         jj/jTOQvnLzlfZfyFGaAHYhRWTKlGrx1incoYX2Wa6X5OTM5XhgTpRtlcW5g9Xr7nn
         XjQDcf7nApZKG1AN/nHjB1GiT2o+z7EHoT/QAoG+5Ndet3RP1Y+BhOKDT5F4DC9l3Z
         H6jPVqZBTrXlovhiK4uVHY5rwWhbsqQ6ZD+dWJ0BH8noyEPr+J6efdRiX/UTWg4qIk
         vGhDmAV1hHtCluqvCLrNw7cL/hOP/zqyAyIwAQcplgLYZiPiwCh071JHvBTqcdzP3M
         2i2ewoot34jUw==
Date:   Tue, 27 Jun 2023 15:56:55 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/3] phy: qcom-snps-femto-v2: add system sleep PM ops
Message-ID: <lgikty7hqbysz42zpfyg6tymylijashhz4ask6q362cicogg3u@xnsruoe3loof>
References: <20230622194021.80892-1-athierry@redhat.com>
 <20230622194021.80892-3-athierry@redhat.com>
 <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
 <ZJsmnTKFJMb4rBeR@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJsmnTKFJMb4rBeR@fedora>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 27, 2023 at 02:12:45PM -0400, Adrien Thierry wrote:
> Writing another email to not muddy the waters in the previous email.
> 
> I discovered that the femto PHY PM count doesn't seem to be right. Even
> when the dwc3 core runtime suspends and calls
> phy_pm_runtime_put_sync(dwc->usb2_generic_phy) [1], the count equals 1
> after that and the PHY is not runtime suspended.
> 
> This is because on boot, the count is incremented twice because
> phy_power_on() is called twice:
> 
> First:
> phy_power_on+0x120/0x184
> dwc3_core_init+0x68c/0xda4
> dwc3_probe+0xc84/0x1304
> 
> Second:
> phy_power_on+0x120/0x184
> usb_phy_roothub_power_on+0x48/0xa0
> usb_add_hcd+0x94/0x604
> xhci_plat_probe+0x4bc/0x6e4
> xhci_generic_plat_probe+0xa0/0x104
> 
> That makes the femto PHY runtime PM impossible to test at the moment. I'm
> not sure if this should be fixed on the dwc3 side or the xhci side, but
> this should probably be a topic for another patch series.
> 

Thanks for digging into this, I had forgotten about this discussion.
Unfortunately I'm confused about the (lack of?) outcome:

https://lore.kernel.org/linux-arm-msm/1648103831-12347-4-git-send-email-quic_c_sanm@quicinc.com/

Regards,
Bjorn

> Best,
> 
> Adrien
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/core.c#L2005
> 
