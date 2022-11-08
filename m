Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A80C6205CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbiKHB14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbiKHB1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:27:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FCC29CBD
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 17:27:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 404646137D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 01:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D32FC433C1;
        Tue,  8 Nov 2022 01:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667870869;
        bh=hNW6cdM8XUgP1+OBAZJiqcVOd0NEQAKcJNXIvmlqhxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b9v6XFDL7u+YS4nFjNOb01/Z6Zv7XW6sH4RzGbpRblV8N2YZHQ3Z6uDvCb8Nv+UVP
         8pgb8JEygdmv29b5CJiUEqSPUIDF9eydwlHM3aG0cM+6+jegE+odKR7eNF7UeXXbPM
         +VXJb6nUMzQ20o/L8c/sdFq2ctBhWifn9ydZdpVzdFkXPU+acwamibRntJkmUhQRnC
         gugmNogpKAPWA9qkH5lv0qoPBZeW+v1AVR8ZgCWmhjS2zy+AEzperWmduAIT/rtqqL
         IRf2R8Hqe7SrY6ANDy405xcNDZ8hLSLRDFhojTNe1YVQGBcnaJcFS3YMuZYlbYlTJN
         rLdL3gU0ebUfA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org
Cc:     patches@linaro.org
Subject: Re: [PATCH 00/11] Minor DT comment cleanups
Date:   Mon,  7 Nov 2022 19:27:22 -0600
Message-Id: <166787084686.599230.9474429787573398205.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
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

On Mon, 7 Nov 2022 15:55:10 +0100, Konrad Dybcio wrote:
> Ensure the usage of C-style (/* */) comments instead of '//'.
> Make sure all multiline C-style commends begin with just '/*' with
> the comment text starting on a new line.
> 
> I also capitalized some comments differently and trimmed some fluff.
> 
> This patchset brings no functional change, purely for cosmetic and
> code style purposes.
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: msm/apq8x16-*: Fix up comments
        commit: 4bb376f6cc715fb9182942df08d492965d5f0127
[02/11] arm64: dts: qcom: msm/apq8x96-*: Fix up comments
        commit: bd95b48a591cc0fd767b3c737b8d59cea5ff428d
[03/11] arm64: dts: qcom: msm8953: Fix up comments
        commit: 83e8692144fbda4a8f86087170d9ce26e64993d7
[04/11] arm64: dts: qcom: msm8998-*: Fix up comments
        commit: 689469ea4ce0fc17f1ddf2f5f730cb565bb5ef9c
[05/11] arm64: dts: qcom: sc8280xp-x13s: Fix up comments
        commit: b47fac7ab95b2567b6b39dae8dd66926368f2713
[06/11] arm64: dts: qcom: sdm845-*: Fix up comments
        commit: 108162894a5db9d1eba20650d050de27e730d818
[07/11] arm64: dts: qcom: ipq8074-*: Fix up comments
        commit: d5d8e59f356d426ba164ea37adfa629196b4fbd0
[08/11] arm64: dts: qcom: msm8992-*: Fix up comments
        commit: 290d43062d261cebd17ff590dc91f1d1e3fe6eed
[09/11] arm64: dts: qcom: msm8994-*: Fix up comments
        commit: 79b185d055703004aeb9252f2aa60ab03c868803
[10/11] arm64: dts: qcom: qcs404-*: Fix up comments
        commit: 3e3a2be79035a9e554ee5f62faf955601f85fca9
[11/11] arm64: dts: qcom: pm6150/l/pm7325/pms405: Fix up comments
        commit: 5d9bf21088fddefe681a70d061b78b9b58fb764b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
