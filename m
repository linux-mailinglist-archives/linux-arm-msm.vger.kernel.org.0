Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D416572C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 05:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiL1Ehv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 23:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbiL1Eh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 23:37:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0E7E034;
        Tue, 27 Dec 2022 20:37:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1632761238;
        Wed, 28 Dec 2022 04:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51D7C43398;
        Wed, 28 Dec 2022 04:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672202237;
        bh=oIEqNrfwRib/AkTpqJ7BlRqXrp7abJUUNS1xQMGrKD8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YJfJPlF/eTaD0ks7EJB5jBOonMWQpnDQbVIAgFaygNQ7WiWoWveT9Dnz/kZUQyL5T
         iBBDUFJVlMGdRNP/DAg3FQsaGJfTcI5pGqSfbeIoDgbZVfCoe1YYrdpK6baQMWuNC0
         Y28RlkE4uwxAnFSTL6FLOhsQzn6bdV12Xj4Yo0YHpLg23D8NP4JplkATpDSk6Ux1/J
         cNF5OxH/lCo8v2SpCEKzg2FpcwylPK4YI2aWhNSL8GEihUch5YDonxxkxKF0N7Q08Q
         gMqbfsiLbz/c36rttb0RJJfYR+Od6jY6OYsiS+eG259H9Hn4PtQSQJB619atSNkUuK
         2ngP5QZHXgRfA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     srinivas.kandagatla@linaro.org, mailingradian@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] dt-bindings: nvmem: qfprom: add sdm670 compatible
Date:   Tue, 27 Dec 2022 22:36:52 -0600
Message-Id: <167220221222.833009.16118082855825958568.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221206231729.164453-1-mailingradian@gmail.com>
References: <20221206231729.164453-1-mailingradian@gmail.com>
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

On Tue, 6 Dec 2022 18:17:28 -0500, Richard Acayan wrote:
> There is some configuration in SDM670's QFPROM. Add the compatible for
> it.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sdm670: add qfprom node
      commit: 7bff6f4351bf82c0b9279fc711b730d2d28b8b8c
[3/3] arm64: dts: qcom: sdm670: add missing usb hstx nvmem cell
      commit: cb98187a6883c498b0702cedc1f59247e7857bea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
