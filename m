Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBD5645E1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 16:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiLGPyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 10:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiLGPxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 10:53:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5273B9FF;
        Wed,  7 Dec 2022 07:53:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7C88FB81EE6;
        Wed,  7 Dec 2022 15:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE404C433B5;
        Wed,  7 Dec 2022 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670428416;
        bh=RiEi5i1ctupOkm/VaLqqkDEtlaG0sNcBrKejQWjDkyU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dbS8D0i1HhdxbalfmSleKy27gGkzkOXJ6WSrt8iof1Rz/kKTDWpjKLefkhQmcNdHN
         tnsPK/ffI4zScbX4QIZgSkFUUAExb8gNtxi2Uh5HZtHm+7fILXaLzt0EUUZDMixF8+
         3XP68Rf5wWmbFJhe/Ot72FWqINWc2wa5uCJmZuh5xCVMFYu+ZNS43LmaJpfJXl7qbR
         FaqpOUIuoXHmuVs4DF/cvgYY+W1zhaDjyuyBQAp/Uw1KU4n0R2iyUC2WrpL5PZobkM
         FYwmgigf3jkCRJvFTSBxYifCl12FQ3aiqNAW+3ExpSdDCk40wnH7hsTP+FprVP0H1W
         j8tpi4pat1DCw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-remoteproc@vger.kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, yuancan@huawei.com
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Fix missing of_node_put() in adsp_alloc_memory_region()
Date:   Wed,  7 Dec 2022 09:53:29 -0600
Message-Id: <167042840345.3235426.4264182836968113938.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221203070639.15128-1-yuancan@huawei.com>
References: <20221203070639.15128-1-yuancan@huawei.com>
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

On Sat, 3 Dec 2022 07:06:39 +0000, Yuan Can wrote:
> The pointer node is returned by of_parse_phandle() with refcount
> incremented. We should use of_node_put() on it when done.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_pas: Fix missing of_node_put() in adsp_alloc_memory_region()
      commit: 38e7d9c19276832ebb0277f415b9214bf7baeb37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
