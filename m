Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C2363652C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbiKWQA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 11:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbiKWQAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 11:00:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF8963B80
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 08:00:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 631EE61DD8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A8DC433D7;
        Wed, 23 Nov 2022 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669219221;
        bh=4ShBNb6RMfiZagbVwM+drZkgOzvEom40KzBlvW1E2S8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=VAiqI1aGdkBVoOokmTa2p4dOJpvouu9DB6ICJN5u/hAmEI7oR5JKBzAGQLmBaQ5Sf
         d6EdKXaqEBuxwq/4PKzdvDnDgMrNKIxvD/vFLNbhuvaAa7R1tkAfFughQh7geQCjBJ
         vmJASWomNEUQf8ptNig5peLGMpF/j+EwlndegCRUcUTOveSY1B1RAMHj0Mpr4nYF8H
         lTmvQj5w7EMcsPHbMUPbI79jEV95vRJzsqQuKPw4M/eVYBM8qS6l1y3xwN5TZXjpEZ
         jeyDM4FywgRWnZ/mrR1yrglBg98ghX9Hgcew0iTxrRRZpM1DTxGJKgSmJtTTCwchHx
         BumUGZTWeMfjw==
Message-ID: <71357ac1-62b5-2ed9-4b78-3c5d8fb2078d@kernel.org>
Date:   Wed, 23 Nov 2022 17:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Add NFC
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
References: <20221119153903.770853-1-luca@z3ntu.xyz>
 <20221119153903.770853-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221119153903.770853-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/11/2022 16:39, Luca Weiss wrote:
> Configure the node for the NQ310 chip found on this device, which is
> compatible with generic nxp-nci-i2c driver.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++++++++

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

