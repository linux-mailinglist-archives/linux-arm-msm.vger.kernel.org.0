Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F506724CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 18:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjARRZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 12:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjARRZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 12:25:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDFDB741
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 09:25:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 927B66192D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 17:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF57C433D2;
        Wed, 18 Jan 2023 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674062723;
        bh=UIp2ALbIFR0Kr3XIHCm3swFVg6WKF4rhWXfWgkuD9RI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JZPZ4++CcKb4VyCvUMPQLY8pXtPk3mDtvwFZsuwlqizjNh24ZTtheR7+kGG08iozK
         qIcRcLenFxaIH8w1hBj4e0Gcho7ebM7p7GJP70eGRecTmSrz6KHTbMfB0qJHUmnc2w
         Lm0lRc35ZneGAJRZP3YSpfs9rdjZBgsaSZwTLssWdr9pBa7b8iTlRFNm1e4P+Bxm7W
         W6uY7v/G9TuwGelIYWczxxt4NCtof59qnf6ev/4snIlbBI51IzbsF5cgcMvVE9fHfp
         uILAEgwi8r+ImvBBCy28Q3FmKNr+yEQc52XHK0aaLExUMHZ2ZTKtyrxVrrAQmuZGqD
         4+pcJmQJ/RZfA==
Date:   Wed, 18 Jan 2023 22:55:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp-combo: remove
 QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
Message-ID: <Y8grfoRvV558Y4UW@matsya>
References: <20230113212102.421491-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113212102.421491-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-01-23, 23:21, Dmitry Baryshkov wrote:
> The QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register is not used, remove it from
> register layout.

Applied both, thanks

-- 
~Vinod
