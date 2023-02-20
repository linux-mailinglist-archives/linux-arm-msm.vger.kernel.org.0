Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1EFA69C51A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 06:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjBTF7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 00:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBTF7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 00:59:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF8872BE
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Feb 2023 21:59:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C647860C79
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 05:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E13CC433D2;
        Mon, 20 Feb 2023 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676872751;
        bh=80zrX5DZqyiAM/9CJMVyLriJCfnAj/L6lQQq4guXpIo=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=LF9ZQwCyn8uY5wEmjcQmVafG8v8hGGmoyucwOKs3tBbn/pOznW6M88orRdVX1hD2c
         0R3StIWCCLl8qPjgqRmKBIpe6aDsUalJ5AsmcCG0MZyrQ9tarirxWpmzfDMWwdVwN9
         cs3/TYN1gCoi3hY+U1561Wts7fl9he+grZa8heWg2+7T8AIh++oSFDROsyjYUrCKMg
         3otbAJHBk9oJibiKXk8PsnYynP9rFHGeROx5sLJuNC/gXek/XE4M+YMSAoUEV1ohI+
         nk0fuFLRExsIQP7PeJFjVZnWkOFY9fpWKdnDbYVr5v0qHVFf7VmPAgedSmmInaHNcw
         tiwUyedzqjPSg==
From:   Kalle Valo <kvalo@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ath10k@lists.infradead.org,
        "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
        <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org>
Date:   Mon, 20 Feb 2023 07:59:08 +0200
In-Reply-To: <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org> (Dmitry
        Baryshkov's message of "Sat, 18 Feb 2023 03:33:29 +0200")
Message-ID: <875ybw513n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hello Kalle,
>
> On 07/10/2022 15:22, Dmitry Baryshkov wrote:
>> We'd like to ask for inclusion of the board file for the Lenovo Yoga
>> C630 laptop. It is
>> a WfA laptop using the Snapdragon SDM850 SoC.
>
> I noticed that you've updated the WCN3990's board-2.bin, but this file
> was not included. Are there any issues with the submission?

It's just that I haven't processed the pending ath10k board file
submissions from the list yet, I do it quite infrequently.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
