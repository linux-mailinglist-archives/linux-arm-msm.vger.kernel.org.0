Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314E55B7D38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 00:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiIMWsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 18:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiIMWsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 18:48:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043F058DCC
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 15:48:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9A404B8116D
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 22:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9834C433D6;
        Tue, 13 Sep 2022 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663109290;
        bh=J/sO9CkD4zUoIsMujZnXWS8Xr6PPGfy+9DCb71BRnr0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FmWtLBSQFgirZ3ZIXDYAWVALl6VfT+dOYr43mcZY+5AO4dvrTk7IWGYRjf5Z0b0zg
         hkEfoESbMVVw0icWevLKtKGi0okQr/TzsqzzedsGNGnaZc9ONVAsaRBn4lvK2/f3ZF
         9MrQHocDIV5sTiP/kCA6Nq5g+IaphAo+oAOP97wNdn163WkYTV61p+RFcNlZFpmj5k
         bODOxDixb7sj/rXBIFls4rF/WYInZ+rLh7hszITrqN/xSGqF4dm8XUe3z5EJ8JAgyQ
         gXFhSapPkzc1JX/DcnfJiZwn/A664Jf8twVnjlJ0cjl8TLyVk0fR7+TBkjj5m4fqgY
         Mp9GA31PUuBIA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     cuigaosheng1@huawei.com, konrad.dybcio@somainline.org,
        agross@kernel.org, eberman@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: remove unused __qcom_scm_init declaration
Date:   Tue, 13 Sep 2022 17:48:02 -0500
Message-Id: <166310928490.670084.18272207920717489224.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220911092912.3219132-1-cuigaosheng1@huawei.com>
References: <20220911092912.3219132-1-cuigaosheng1@huawei.com>
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

On Sun, 11 Sep 2022 17:29:12 +0800, Gaosheng Cui wrote:
> __qcom_scm_init has been removed since
> commit 9a434cee773a ("firmware: qcom_scm: Dynamically support
> SMCCC and legacy conventions"), so remove it.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: scm: remove unused __qcom_scm_init declaration
      commit: e66fee7519ad5eb82de2fe03682e056757216a0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
