Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6F77AA029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 22:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbjIUUd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 16:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjIUUdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 16:33:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322E586135
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:37:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850EEC4E759;
        Thu, 21 Sep 2023 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695306373;
        bh=2++/YFBh55cXJ6n3YekHfxDVcknebtLcmOWyG73zSoI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=NdZj15U9ei2kE6ljm78/Q67BgZX8bUyB7M/lpYZqKZibNC3djB7gpL+zMKPRhvsu3
         Q9/kfZNsluV38XiFKHfxbuxR7Q/uPJmmmXbgtgcaX7YPGwfQx1WdNYcZzJE/WQuNu9
         +QgF1aEXlPDV6jZyGEsu+axkXYXA4b+9JT1LqsBKgyNnqQg77kbPIRhletyN6Z3WLu
         I/ZRXuohSwyMMDEQT1WLbD+tKNMeRy7So/R984y7P8llOCWXjLUvlqrkIXg2XHo3LV
         3ObJ4n5ojEwa7okFefvQUKoq7BV29V9CvntfMv7ddjCO+WYIwz836RRFn128zIokz+
         k4FvKawZEjD4A==
From:   Vinod Koul <vkoul@kernel.org>
To:     linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     quic_varada@quicinc.com, andersson@kernel.org
In-Reply-To: <20230824092356.1154839-1-yangyingliang@huawei.com>
References: <20230824092356.1154839-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] phy: qcom: phy-qcom-m31: change m31_ipq5332_regs
 to static
Message-Id: <169530637215.106093.2062943843024168234.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 16:26:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 24 Aug 2023 17:23:56 +0800, Yang Yingliang wrote:
> m31_ipq5332_regs is only used in phy-qcom-m31.c now, change
> it to static.
> 
> 

Applied, thanks!

[1/1] phy: qcom: phy-qcom-m31: change m31_ipq5332_regs to static
      commit: 426e05ce126e8febc21fae643139a1072d2670ad

Best regards,
-- 
~Vinod


