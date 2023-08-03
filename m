Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1852376EFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 18:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbjHCQf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 12:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237170AbjHCQfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 12:35:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A686F3C15
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 09:35:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BC5761E37
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781E4C433D9;
        Thu,  3 Aug 2023 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691080518;
        bh=2KOY/3m/wx5AKJhEmlkJ54h6l4Uujo75+fi8grjfQqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fcNHbzQIWjgNCV9fXwygM0a7grsSGAoUpKc85c2Jy2Unj/lg5eECEs1nxQkn64k7E
         sWEwz80i/jMmawPRHYFK87B8kFWQas8RF7Y+Mazl3LBfvP9u6GIwj/WErCMmSezZFs
         qL7iIQ69vFzQ0YSfbH6z9P8lhvyTPO+BTinfOuEsEz8h6lhnr1BvhCCYxo4RJCTKao
         Z0txPSQ8XJ8HuDnV9NaPxA2gSR42UI6MYIpqgYXUS0zkfPMgBHVEi+WE3y2Pfrfiew
         gbxbxlT1F5OpkbsORNkfW7xqkz+hmThw7hG27VRUQNEGJlt2vs8M4Mlbr6rcQg7Pd3
         9odKTn3xe+3cA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, luca@z3ntu.xyz
Subject: Re: [PATCH -next] soc: qcom: ocmem: add missing clk_disable_unprepare() in ocmem_dev_probe()
Date:   Thu,  3 Aug 2023 09:38:09 -0700
Message-ID: <169108064631.108343.16561343689116333269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802024855.2521895-1-yangyingliang@huawei.com>
References: <20230802024855.2521895-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 02 Aug 2023 10:48:55 +0800, Yang Yingliang wrote:
> Add clk_disable_unprepare(core_clk) when enable iface_clk failed.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ocmem: add missing clk_disable_unprepare() in ocmem_dev_probe()
      commit: 4d6e0a1bf8f7a6b44d20162e29a87d0bd9526bb0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
