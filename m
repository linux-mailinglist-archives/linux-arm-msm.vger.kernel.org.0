Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A1B667D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 18:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbjALR6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 12:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbjALR6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 12:58:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3A87D9DE;
        Thu, 12 Jan 2023 09:17:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 880F5620E3;
        Thu, 12 Jan 2023 17:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA5AC433F0;
        Thu, 12 Jan 2023 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673543836;
        bh=946nuW3ZeOOlefD+SB1EAI5Sfidnxq92FXIl/3/TxQk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nUean0f5ACSHOCPcPKDOG3P/jh9TCQ6Tmx5/xkFd8l69vlxHTkMCF+duRJj9mZvAm
         DUZYL7BR3WwFRJaXmF3vkK1KBAByj1ua6mmp0cV0Ul0xCaxJM6+vviGp9kRrc5mvo6
         Tj98i2NP30o/onCGEG8oSdLiqfqh4BTrPYbyxXy55JHan+V7Mq5biAs3UgYAW9pY8i
         LHrVqK+x4ACRpgl0ItHvWdBOD9JrhHgLCZO3x+ziM1G/Oud2BM8GYNcEyQfZXqbfKM
         B2fmK9Dw/6mc9NUwg4a4CV1uRnFEMpoLL2aepTkLVcBVbB+Iprr4uZCf9czxnRBWzV
         FN1c+7MGb4q6w==
Date:   Thu, 12 Jan 2023 22:46:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v9 0/4] phy: qcom-qmp-ufs: add symbol clocks support
Message-ID: <Y8BAeEbIDQPajiOm@matsya>
References: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-11-22, 12:44, Dmitry Baryshkov wrote:
> Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
> platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
> be used as GCC clock parents).

Applied 1-2, thanks

-- 
~Vinod
