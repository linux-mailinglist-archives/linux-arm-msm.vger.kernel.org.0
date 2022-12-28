Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2813A65721F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 03:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiL1Cll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 21:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiL1Clk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 21:41:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D87ECE30
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 18:41:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9914612AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 02:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B021DC433F2;
        Wed, 28 Dec 2022 02:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672195299;
        bh=kua0sllAp4LGqVCHXVb9XZiP3/Wup32A59kmTgv28kI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KE1YEdtS2fFZDbbCAtg1tjrzEfsifh/UUtqwTFfvf7ngoWWAJXRpOIYul0X8Dliof
         YccjZdb+UYpI/fBKbQiUstYPtCz8lpuCQDYSzH1UL1xpLpSZ9bh+2fvAkTB2TkQUj+
         VuNZXP9fCbMD1DboaGXMR7MBd89cfAH0udPXDmMRFFNAVRF+1DEt3KrSDqSFsBYcmZ
         jIACVWYB8Wwt1gFM1SryyWKAgwLVpjjpv5JkU1drS+r2dD9zqkCpoXld6WQChuY74j
         W/GJn28aXAdMEW1F8mdX1V/B1Oc6pwKOQ5mNY9EdEYYOlBAbAd8Wo5X+MKmqU3fiVr
         8NNzq/KTQ6Jaw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org
Subject: Re: [PATCH 0/2] SM8350 Sagami PMIC lane names & SLG51000
Date:   Tue, 27 Dec 2022 20:41:32 -0600
Message-Id: <167219529294.794508.2539154159958921585.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221118152028.59312-1-konrad.dybcio@linaro.org>
References: <20221118152028.59312-1-konrad.dybcio@linaro.org>
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

On Fri, 18 Nov 2022 16:20:26 +0100, Konrad Dybcio wrote:
> This short series adds PMIC GPIO line names to Sagami devices and
> enables Dialog SLG51000 PMIC used for powering some of the camera
> hw on PDX215.
> 
> Depends on:
> 
> [1] https://lore.kernel.org/linux-arm-msm/20221116123612.34302-1-konrad.dybcio@linaro.org/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8350-sagami: Configure SLG51000 PMIC on PDX215
      commit: 8875b1d71f112b30e4c7e65ed337096bc0cc396b
[2/2] arm64: dts: qcom: sm8350-sagami: Add GPIO line names for PMIC GPIOs
      commit: 7c679f2a2af84edbec0c28171af8c42c6da9af14

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
