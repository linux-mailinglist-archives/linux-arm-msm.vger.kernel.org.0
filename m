Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE8D50B900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 15:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448148AbiDVNt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 09:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448028AbiDVNt1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 09:49:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E9B2DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:46:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 91578620D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 13:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F67C385A4;
        Fri, 22 Apr 2022 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650635194;
        bh=I7N7mXlIeYjI5hIjBZo40RuqRK7Suv5Air/qzKkySa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pp2PCell+RYwCpfxPYhwQv5mwF241mC6CTMWu452Ndmn1D1DIPUzjmRGUy/EUj4sf
         NsL9Se8+rQ8I889Uq5G3ji1e+DUyrCFAzQFjyhsIXmIreVEq76AUD/ubNrWXnG1HX9
         WEE0WSM/lfUIEdbHAIoGnfbHO9Tm0QTExDStP6Wo=
Date:   Fri, 22 Apr 2022 15:46:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] MHI fixes for v5.18
Message-ID: <YmKxr5TswPhLGo2d@kroah.com>
References: <20220413085954.GE2015@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413085954.GE2015@thinkpad>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 13, 2022 at 02:29:54PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-v5.18

Now pulled and pushed out,t hanks.

greg k-h
