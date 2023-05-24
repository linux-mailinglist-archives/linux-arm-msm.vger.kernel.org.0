Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9B3710190
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 01:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjEXXK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 19:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbjEXXKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 19:10:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3B8A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 16:10:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 84CD764177
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 23:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3F6C433EF;
        Wed, 24 May 2023 23:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684969850;
        bh=xc+vGxKn9dNhSNFBqyxkDcXu5G90NN+jy0FXT2D5lJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bNCxkDf30oJ1kKyfE+xjNQve5pKHvBgLJyNpJEwXmUaJmx+qDiUw4b1RA5aPvUTYz
         +/m0nRmrRInm2gm7G7VqYsM97j1Dz9i5hy9FKkrpawGcTi1DhX2bhZhypUDYXPSKEU
         6PgDx6MeRqaUWQOn5LNFVrJPUxR9J2vWXLW/h7BJQlW8mE99HUUpRiUCvMHEoEfWWK
         wFO16PBd/6FKFTThEO6pKk3Mtq3B8l5678bRbOr4jtlI/BtNLjNwiGbdIk18mwroYA
         gxAqhrEyStMMlqzn1EZSPUmkZFkRonZkwiMMzP0Q1TiXplIf5ffplR5dvBPbE2JZNj
         BWJNhmNbgaoWQ==
Date:   Wed, 24 May 2023 16:14:41 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: defconfig: Build interconnect driver for
 QCM2290
Message-ID: <20230524231441.5zcdp2vms6s7giz7@ripper>
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
 <21baf481-347f-d4b1-87df-833ed16cb729@linaro.org>
 <bacae75a-6030-ff8b-179f-7d662140bae7@linaro.org>
 <179b8c7e-d355-4051-beb4-ac44808bdaaf@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179b8c7e-d355-4051-beb4-ac44808bdaaf@app.fastmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 24, 2023 at 08:36:20AM +0200, Arnd Bergmann wrote:
> On Tue, May 23, 2023, at 23:11, Dmitry Baryshkov wrote:
> > On 23/05/2023 20:30, Konrad Dybcio wrote:
> >> 
> >> 
> >> On 23.05.2023 18:54, Vladimir Zapolskiy wrote:
> >>> Build Qualcomm QCM2290 interconnect driver.
> >>>
> >>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> >>> ---
> >> Do we know why some are =y and some are =m?
> >> 
> >> I'm for =y either way, if we can.
> >
> > I think this might change from platform to platform. What is the 
> > condition for selecting 'y' or 'm' for the core drivers? Is it 'should 
> > boot to rootfs without modules' or 'should boot to UART and load initrd 
> > without modules' ?
> 
> I think we are a bit inconsistent here. I'm generally fine taking
> changes that are required to boot into rootfs without initramfs,
> but would like everything else to be loadable modules.
> 
> Android tends to want everything as modules and require an initramfs
> for loading them, so I think platforms that are mostly Android
> specific lean towards that even for core drivers.
> 

I (any many other in the Qcom community) do most of my (our) testing and
development using a ramdisk-only approach and if systemd isn't provided
a valid /dev/console at launch, things doesn't work as expected...

So the inconsistency here relates to the fact that not all platforms has
the UART defined to depend on interconnect, once this is populated in
DT, we tend to be forced to move them to =y, together with GCC and
pinctrl-msm.


Looking to storage etc on a modern Qualcomm platform, the dependency
tree is growing quite a bit (regulators, genpd providers etc), and we
have UFS, SDHCI and NVME to support. So I think it's reasonable to have
the generic defconfig require that you use a initramfs to get further
(on the Qualcomm platforms).

Regards,
Bjorn
