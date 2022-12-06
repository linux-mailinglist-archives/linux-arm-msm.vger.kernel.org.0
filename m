Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2428B644B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 19:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiLFSVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 13:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbiLFSUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 13:20:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C853F05B
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 10:20:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4DA8B81B2C
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 18:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34C7C43142;
        Tue,  6 Dec 2022 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350804;
        bh=R0fEDyJC5T9PjUkZ9/Afm22+zus8e6vF4P7UCWpyS80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O/3zaGkHI5icyQBxAG3Rl/xOob3itqikhZAREGI17pTr1gHje/maXYCh68UW9K++8
         agzJrL/vwPWe5EkVm+2LFd+Xo7Zl9dfKIzsd20kRS8eab+ZQNLB1hdDZukYzATZCYg
         gFaz3XiWoJYswSRv1wbzwb7ikdv2mx1bPnKzH5BOFONI/U+XHYkd6fgJ0c0oU4ailn
         NLtJ7MGCXkh7gV7pc89GcgkEanuPV/P+s2LA6EF5ufrjy/G9Slh1BSRat9BLNVrcUV
         Nz3cYUPjq4ove5bvLtmlmKLaQOvpI3mEESvaB4ijTSS9wbxQOMOHHWUWTgntYzfnQW
         zhUT6SZn8xmyg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org
Subject: Re: (subset) [PATCH v3 0/9] SM6375/PDX225 GPI DMA, QUPs & PMIC peripherals
Date:   Tue,  6 Dec 2022 12:19:09 -0600
Message-Id: <167035076333.3155086.11271419336928858380.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221115152727.9736-1-konrad.dybcio@linaro.org>
References: <20221115152727.9736-1-konrad.dybcio@linaro.org>
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

On Tue, 15 Nov 2022 16:27:18 +0100, Konrad Dybcio wrote:
> This series adds support for:
> 
> - GPI DMA for 6375
> - QUP hosts & I2C / SPI controllers for 6375
> - pinctrl for SOME (check commit message of 05/10) of ^
> - pmk8350 on arbitrary SID
> - touchscreen & SMD regulators on PDX225 (depends on [1])
> - pmic peripherals on PDX225
> 
> [...]

Applied, thanks!

[2/9] arm64: dts: qcom: pmk8350: Allow specifying arbitrary SID
      commit: f73de026a49f05638b7dd260b055246846883266
[3/9] arm64: dts: qcom: sm6375: Add GPI DMA nodes
      commit: 42b8e5eeaf2d112ec20769b79a3fd45f6c347b67
[4/9] arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
      commit: 704edf03c022a7e58ba02e012adac138b0e9cc09
[5/9] arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
      commit: b0dfe3c9d63222367539a87296c8ebe11020dff9
[6/9] arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
      commit: 9d796b52bc870bb3397b9602092907dbd60ab0c4
[7/9] arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
      commit: 6742dca249f7df7dc682f7def252f3e544190e72
[8/9] arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
      commit: a4fb3dd848c80d43088383085a80bc1e43702307
[9/9] arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen
      commit: 51ed312aa5072c920f86c308565232e98e4d9079

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
