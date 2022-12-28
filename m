Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2521A658583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 19:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbiL1SN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 13:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbiL1SNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 13:13:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BD71707B;
        Wed, 28 Dec 2022 10:13:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BBF25B818B6;
        Wed, 28 Dec 2022 18:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD0DC433F0;
        Wed, 28 Dec 2022 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672251230;
        bh=cgi1jbpfNjvn/SivMLG1eJl833/bfJr1z4dM7x4OlBQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j2UFhjkGEILqfiOpT5kfRbre83XjbNhB3tsJNlET7L6MLrmZbeBBDFQjSN0Cg1Vpc
         Do+mfIjlwyryQbs2cXWXApfF1YlpCHnZB2I3odXZ3EQF388wLNXVeMBAbbUQK0Fj+i
         oNNvyEjqEE1KPRF809TqZDVFTlnjLzKU6b0eaq8GEbhTYd/euDkpES2zy5+xwUgQSL
         /LzDRwmm+g73Rgg8TobHq6GRMyxvRizCmDzV8mdUxzRpCzylRQMgreBWc788vO6zAm
         +1XUUKPTmQ/U9kL/TFPNfPlhBql6SLyXk4omW1d4+NhptpVoh3wTKYzStAcEWhSkMY
         tP2P57WSYOzsQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robh+dt@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, mailingradian@gmail.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google-sargo: keep pm660 ldo8 on
Date:   Wed, 28 Dec 2022 12:13:44 -0600
Message-Id: <167225121526.949655.10512627918015321328.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221205225237.200564-1-mailingradian@gmail.com>
References: <20221205225237.200564-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 5 Dec 2022 17:52:37 -0500, Richard Acayan wrote:
> According to the downstream device tree, the regulator that powers the
> I/O for eMMC should not be turned off. Keep it always on just in case
> the eMMC driver fails and doesn't enable it, or unloads and disables it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm670-google-sargo: keep pm660 ldo8 on
      commit: 861b67fbdccd62a9319d7350b1924d95f597db09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
