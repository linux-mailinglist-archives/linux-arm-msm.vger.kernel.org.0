Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A3C6D8E2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 06:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbjDFECA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 00:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbjDFEB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 00:01:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680E89765;
        Wed,  5 Apr 2023 21:01:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EF4D261A36;
        Thu,  6 Apr 2023 04:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5ECC433EF;
        Thu,  6 Apr 2023 04:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680753717;
        bh=T9nDARy5iwxXa4sP3h8hwn99CQoojY0jJHDrZW+fD4g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KLCuynsmXf8V/2NzoPAvY/+ZKUAHZwd3Ai94SVyL1GfqvdbFd1Wg7/HjzZjlOJJFp
         oEzZPlqZRI9rW2BOV5oxqj7CcggAFtO51G5SXq6ENkuhmfERgmJTujBRZDv2v6bC5x
         8zaNyYTXiG9YYgBSw/kgsStlIO8R09mhqXReX9GF97jJicR691WielmBet2HqgOdMX
         ImVnG1+OevrkG6o8k3gW35OqwbRbK4Jj2VO+zfV+gWiB6r65AkLIUUiDbVcEkK+sbb
         qTakJhiHyMBAvcBsB/mA+qAaHs1bI2S4vbspsSEj/sBQFl8yVAgLrEofNFVz+1xZxk
         zwoFLYaBLH3Tg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>, kernel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/3] rpmsg: Convert to platform remove callback returning void
Date:   Wed,  5 Apr 2023 21:04:50 -0700
Message-Id: <168075388558.1823704.17933577891574287675.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
References: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Mar 2023 16:40:36 +0100, Uwe Kleine-König wrote:
> this series adapts the platform drivers below drivers/rpmsg to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> [...]

Applied, thanks!

[1/3] rpmsg: qcom_smd: Make qcom_smd_unregister_edge() return void
      commit: 810c03d9d7c978b4ee5287d8987043a9be1d614e
[2/3] rpmsg: qcom_glink_rpm: Convert to platform remove callback returning void
      commit: 49446e573bf591eef71c1e8c7cf87ec19aa2569f
[3/3] rpmsg: qcom_smd: Convert to platform remove callback returning void
      commit: 38be89514b88f53ff772d1e016a68b59814aef72

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
