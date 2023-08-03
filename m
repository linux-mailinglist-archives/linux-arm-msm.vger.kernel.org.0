Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 546D776EFAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 18:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237338AbjHCQfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 12:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbjHCQfW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 12:35:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B5B3C14;
        Thu,  3 Aug 2023 09:35:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D074D61E4A;
        Thu,  3 Aug 2023 16:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902C6C433CA;
        Thu,  3 Aug 2023 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691080518;
        bh=+4zOGsxuHaUp3jo09CLrcNbGCjBlDvrtijuJCvNqSmY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bE7jxRSpjxH172XEKmCKdpBBvAvx9ZNwlDvR6Brnq18bv44FO+g+Cn6hC5CM+PEnW
         vKLZZriGutPivNMuhDMdSYgjV8d2TPJB/hcWDmvGo4IHK2BH89x6DBtS+TxFQxqm+x
         Hzd70Nqn/Drpee6RQ1zwy8S384tmt7clYO8Y6Sn4xtknC3jnPRAFKCFxbzi8YW4b7m
         AziSk1GI4vDOX7ZN/EkSdAhIRae7rbpRcUTBr4T6BuAmkt0R8Db3BgHh4tHLRFItBc
         jjq8gOyI2Tgu8vLXuo1glAMpYH/N5+O233ZgY8C6Zd6LW2+xXjWnO32woCQHOvkOmk
         G0CXVWGDNsaPg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: Re: [PATCH -next] clk: qcom: lcc-msm8960: change pxo_parent_data to static
Date:   Thu,  3 Aug 2023 09:38:08 -0700
Message-ID: <169108064628.108343.10125718067545963164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803082125.521849-1-yangyingliang@huawei.com>
References: <20230803082125.521849-1-yangyingliang@huawei.com>
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


On Thu, 03 Aug 2023 16:21:25 +0800, Yang Yingliang wrote:
> The pxo_parent_data inroduced in commit bac4675a4d1b ("clk: qcom:
> drop lcc-mdm9615 in favour of lcc-msm8960") is only used in lcc-msm8960.c
> now, change it to static.
> 
> 

Applied, thanks!

[1/1] clk: qcom: lcc-msm8960: change pxo_parent_data to static
      commit: e39d0fa7309bebdc19218276279b9f119d4e9f2b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
