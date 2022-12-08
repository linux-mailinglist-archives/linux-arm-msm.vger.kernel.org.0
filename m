Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128406471F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 15:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiLHOjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 09:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiLHOj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 09:39:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A7C27B17
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 06:39:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5458EB8240B
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 14:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09DCC433D7;
        Thu,  8 Dec 2022 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670510364;
        bh=LYMGKodo6vTo8OeueN9+vTagFl2UxYugdsHobHbuSdo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kFV7ghmfxEY3Z1c/ON7gFV+M1VIr0iS/TrN2hPvWlbBH3phABwaitwHO96S6Cun0n
         D68h0vZSRSMjzIG5gKpne6FMeP7qC9OYDkUxZ9GdTTvnk+PUA4XJLX0H4tzA0S92Sf
         D78l6T4/1lptrq7rqsNXXWoLKK3vAHyqY7xr/LiRaBRQMWM0E0UCBLotkrd8GTaEjh
         q2eGaNOk+Zvh8el6L9IO9C+rf2XDZteSDet6p28z3x3oNNKF3OFvlR5A3+Z3peCETX
         0+tZ8BcRpbsn82o6BDIbGJ5Lc0uqNbbe7d7jXAHDoHmDD3l5jVW9eMHRc0knSWaGlo
         pJL7Zl4LM0QBQ==
Date:   Thu, 8 Dec 2022 14:39:19 +0000
From:   Lee Jones <lee@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, gurus@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH resend] mfd: pm8008: Fix return value check in
 pm8008_probe()
Message-ID: <Y5H3AFT08cr8adUK@google.com>
References: <20221125073626.1868229-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125073626.1868229-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Nov 2022, Yang Yingliang wrote:

> In case of error, the function devm_regmap_init_i2c() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
> The previous patch link:
> https://lore.kernel.org/lkml/20210605022446.4119978-1-yangyingliang@huawei.com/
> ---
>  drivers/mfd/qcom-pm8008.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
