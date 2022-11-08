Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608756205C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbiKHB14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiKHB1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:27:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF40229CBD;
        Mon,  7 Nov 2022 17:27:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 806A1B816DD;
        Tue,  8 Nov 2022 01:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF1BC43470;
        Tue,  8 Nov 2022 01:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667870866;
        bh=+3+LpPqwGUUCGTiDcNTDku0jgbk3T2+Sh/IR1BzQoc8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BTs8Sz62aTH37VdzK0B2WjXjLBqS+l4qpB/QrEKDjPtmpdTZpWyTPW+dZC+vGxOj+
         G4XStjVCOceYal/qrzxViOEcIQKf4h/0AwQoxYe9ltrsB7nUaRHxXvFfrkxzkp0+v3
         qij4UPbpOUHswkjBHQh3WeYNNkt128i0mEZEbtVxFsbfSHiOHrjV5xDDK9DS7ya6fv
         FyUB8h7pXM9k18P80LZugKg9pRnRKtq1ZRd06bidVXRw0PI0+oJzXfvdA8v66qu4Yk
         x/3SqrhGqvwyh2YUV7zzhrhCBHv6+ddj1buX8deqMXmmOlNem+Obf6WCDjyNbA2VBF
         dQN7/yOKttqvQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: msm8996: use hdmi_phy for the MMCC's hdmipll clock
Date:   Mon,  7 Nov 2022 19:27:18 -0600
Message-Id: <166787084682.599230.9135449427549560190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221030161612.95471-1-dmitry.baryshkov@linaro.org>
References: <20221030161612.95471-1-dmitry.baryshkov@linaro.org>
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

On Sun, 30 Oct 2022 19:16:11 +0300, Dmitry Baryshkov wrote:
> Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: msm8996: use hdmi_phy for the MMCC's hdmipll clock
      commit: 65bebf78744f0342187e77124c8a8294a7a0f98c
[2/2] arm64: dts: qcom: msm8996: use dsi1_phy for the MMCC's dsi1 clocks
      commit: 830493fc13d8868fd5be0620d16936fa75c3b9a4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
