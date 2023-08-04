Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEDF770BDC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 00:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjHDWT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 18:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjHDWT6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 18:19:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F0BE70;
        Fri,  4 Aug 2023 15:19:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11BBB62039;
        Fri,  4 Aug 2023 22:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE8DC433C9;
        Fri,  4 Aug 2023 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691187596;
        bh=z5y0QGbwW3t6c+KvgHhK01t3+a50rXiFmEyHxyMH768=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7TlsmmYvq4OwzvmJyHvFwcp4maUE68qA5QsUJmzMSmB61oNt7PibOWgEa2SYK98Z
         distQc0VD89RDJd/7LLa0lBmYHWSK3n/oF3tDORAmJHMjb9Z/AbRpoudUJCORXroy3
         yy8jHE/43Y2lVjzdegelN+3w7VlAxgC3edcWfWhCzISPfAbDsC1cNRJbxSailL5sAh
         BxnlXs695ataZ6wrecHYStFjL5aA79iBmzfUxEqT1ap2DqKoObzIkV7LKgvbFBNRmd
         ioL0i4rHrc72nQw/gNzv8843HP1tLDYSDiBIyw8FNX12ArW8wG4PA771mkEwS6sWRo
         WMqDicmeTiRIg==
Date:   Sat, 5 Aug 2023 00:19:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/9] Use dev_err_probe in i2c probe function
Message-ID: <20230804221953.abmpboxdzy2upswe@intel.intel>
References: <20230802095737.3957587-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802095737.3957587-1-liaochang1@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Liao,

On Wed, Aug 02, 2023 at 05:57:28PM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.

first of all thanks for this cleanup which is very much
appreciated!

I need to ask you to add the version to all the patches, not just
patch 0/9. It's trivial if you do "git format-patch -v 2...".

Thanks,
Andi
