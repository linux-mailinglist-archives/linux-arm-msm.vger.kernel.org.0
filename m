Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35FC74CB87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 07:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjGJFEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 01:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjGJFEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 01:04:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFBFD1;
        Sun,  9 Jul 2023 22:04:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5492360DEA;
        Mon, 10 Jul 2023 05:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C48C433CA;
        Mon, 10 Jul 2023 05:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688965461;
        bh=3IkkOqyjdQzBfRkTkL0qsFR8irq58N9WwCnPHASnkaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XWx4CP9SBm3lRjN0nfxMpQgLuPzTtg1w9/zOUEFn2LKiv/fHMFv47oVShoj4JUw/9
         mI7TS50hNKBe0CZ16xMu00HPZJ8v1okiRaArdrdsNkdsvsXIqiKgJVHFGvgOo1Aetf
         QeRAOoFcssjV67+c+/Id6GwQkoUFPVaWPWnz1vc+iyrZbjKvMaWtaccK7n383IZDKo
         zsSyb5FQ3ieCDRqqQJUIxjEXpdVqSanVcLj1yHiNPsIw7DzBNhxB05SnY8L2slzyWk
         IDqpPwiF4wLE30VEFl70BJLYYCVbq/4GVWjQR7E4bV+pKc7PQ5nnc0fQV5lAD2iAsO
         MoRdzbdWYz/bQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: use proper DSI PHY compatible
Date:   Sun,  9 Jul 2023 22:07:05 -0700
Message-ID: <168896565948.1376307.14380079067566336168.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
References: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 12 Jun 2023 06:16:23 +0300, Dmitry Baryshkov wrote:
> The DSI PHY on the Qualcomm SM8150 platform requires platform-specific
> handling. Use the proper SoC-specific compatible string for the DSI
> PHYs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150: use proper DSI PHY compatible
      commit: 3091e5820a367f3368132f57e0a9ba6d545da15d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
