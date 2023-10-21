Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479B07D1DFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Oct 2023 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjJUPy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 11:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJUPy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 11:54:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516D8135
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Oct 2023 08:54:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7356BC433C7;
        Sat, 21 Oct 2023 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697903695;
        bh=HWo98UYfbw0UhK3vGgyWXaafm5tAJGwjK0+jUmOj2tw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K7r92sa5YYZ0eC0cCc3pbBDRoWk1o2H3yfrlDY0Tfpi+2+rfXvo7jN7Auz8/EuDU8
         mPFi6fUlGgfQZC5/GRvMX1OKn5lEkxChO6b4kHa1G/liZEUyfLejEqQARYujrrYiCj
         KCCA5UHJ01vr9Z9BOuBe1wEIDwoDaf6KnJeNz124UprEadvlLviJrlcWis8gUspNpA
         iKgHZF2TbS07UnHVksVx9iT8r3sXQbPoMrfmCIiohhrKoBN/TNY+wdTgKwXdyEqMvv
         6Da2I2MSDCOBiEAXB/REa4HwQxX2TyRqrHIxXXyW3KOSmmpJ0FtsJ2rOZDIS1VieHO
         UZvL2iCMCjogA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Date:   Sat, 21 Oct 2023 08:58:30 -0700
Message-ID: <169790390703.1690547.4994439260271212521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 11 Oct 2023 13:32:44 +0300, Dmitry Baryshkov wrote:
> Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
> devices like Qualcomm Robotics RB5 platform.
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
      commit: 323c7ec86446e8364cf338f40297194cc7a159fa
[2/2] arm64: defconfig: enable DisplayPort altmode support
      commit: f93b8a5705c6886a4c5ec6d142730927d891b6f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
