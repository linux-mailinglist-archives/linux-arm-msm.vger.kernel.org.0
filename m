Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFD1644B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 19:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiLFSVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 13:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiLFSUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 13:20:10 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970273F061
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 10:20:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 80711CE1AF6
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 18:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAF6C43148;
        Tue,  6 Dec 2022 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670350803;
        bh=Fn7Y0Ftqm2vJOV6xtvjNs/+8JWVde/BllNoID7LVWc4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nsWG7CVR5iwVAg/DTbtgx4fZjng5JMGMgMftWjGq6/uVgsos2g7+BnGI9wmVMgDlc
         sld3zqUB3zBf6IJyNquRLMJGoGDbQhCCiu7Z0oEXEr7crTbFAtTBrphwNuqnQO8SbX
         qSXe0wh0xnEuoVNC633zPotdm561goG0gmyNjFzsjZtqrxDYvNeUiuy9YCC+z3dRfl
         4GM3KdR/LxD3vJFBMIxi1n0ta8sFWkpc1v+zUWLaEPalJkhWwX23dTtWJeMjn+3Ni9
         rQjs1dfq5KjMq3NB9/CKhBAlyK5l8iiGm/+t+Lx1d+nw3gQ+lRHeULhpvt8wInYgBT
         58irMHDJZTBSQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org
Subject: Re: (subset) [PATCH v3 0/3] SM6375 / PDX225 SD Card support
Date:   Tue,  6 Dec 2022 12:19:08 -0600
Message-Id: <167035076334.3155086.11546552674635300516.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221114105043.36698-1-konrad.dybcio@linaro.org>
References: <20221114105043.36698-1-konrad.dybcio@linaro.org>
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

On Mon, 14 Nov 2022 11:50:40 +0100, Konrad Dybcio wrote:
> Add SDHC2 for SM6375 which effectively means SD Card support for
> PDX225. Nothing unusual here, some regulator dancing was required,
> but that's expected.
> 
> Depends on [1] and [2].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20221114104222.36329-1-konrad.dybcio@linaro.org/T/#t
> [2] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-2-konrad.dybcio@linaro.org/T/#u (merged)
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sm6375: Add SDHCI2
      commit: 6f196ab2ad1e2b56c67cc247293ac2c5b73dbe90
[3/3] arm64: dts: qcom: sm6375-pdx225: Enable SD card slot
      commit: ecbdcbcd6f78fcf1c50e804b9baf065a36b61d26

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
