Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A703A710508
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 06:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239955AbjEYE6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 00:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239626AbjEYE4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 00:56:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7ADE59
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 21:52:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C4FE642A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 04:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3556C4339B;
        Thu, 25 May 2023 04:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990328;
        bh=GqihnpYXpUv1Kc0keEdlXYyDgQfAylypBphV9yYJm2Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oWZ/Y9u3c6ca9TGwSsNx6yveJ9fDJ7e9eI2xyIji8oJ8OnzfzltBQiFesqkTvEXjQ
         Mq6YfBfkjxdY1QGtdfGJxAbpy6MoSuB39WqBZ/hAAPLsJ7pGvB4znwRxjTdmro5Tww
         9CxiT3ct+/jdA6/MUXlVvoEuT6cZ+wTjlN+nCx4OHT31OaXtOggw8cBtXzukoRf6ek
         /MYS5XqZ7h3bgj2EJq95Vcnm9oXIKpWLfrnolg4oXgCjpG9LCFpRLCwPbTgsEohV0U
         r1jCjdePk1V4dNw8OfNy41x5Fpo0M4f8PZOq95sW7XcObM8Yz0+ynjWHxThfrsDn+K
         iKk7kIg6UtBQA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>, kernel@pengutronix.de
Subject: Re: [PATCH] soc: qcom: ramp_controller: Improve error message for failure in .remove()
Date:   Wed, 24 May 2023 21:54:46 -0700
Message-Id: <168499048181.3998961.14520004474661838756.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415201848.3779001-1-u.kleine-koenig@pengutronix.de>
References: <20230415201848.3779001-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 15 Apr 2023 22:18:48 +0200, Uwe Kleine-König wrote:
> When a platform_driver's .remove() callback returns an error, the driver
> core emits
> 
> 	remove callback returned a non-zero value. This will be ignored.
> 
> . Replace this by a more specific error message. Then convert to
> .remove_new() which is equivalent to returning zero unconditionally in
> .remove(). See commit 5c5a7680e67b ("platform: Provide a remove callback
> that returns no value") for its rationale.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: ramp_controller: Improve error message for failure in .remove()
      commit: c72e31718a8fb9bc070ee99f273446e05caa687d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
