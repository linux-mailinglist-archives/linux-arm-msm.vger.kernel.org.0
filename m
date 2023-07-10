Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C9E74CB86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 07:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjGJFEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 01:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjGJFEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 01:04:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8E1CE;
        Sun,  9 Jul 2023 22:04:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5087660DF2;
        Mon, 10 Jul 2023 05:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EE1C433CC;
        Mon, 10 Jul 2023 05:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688965460;
        bh=BxSXh1DqezhaMiAbBc6UANLX0uDeostURSEbPVnEQjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XACmZkxibD9R7DGjnJ3mGgynmFome341Fbsg/5ir0/krOJTnRBy9dgETEeinc19FY
         q9Axz44a1HdvAs77y1tmqPQrmjSnsViML/ePKHUXC3nD1PVy3TH8pZ/L25ncLL+fRG
         roFJiveaFu7WM5gGjc9iILn/TGRWh2wTqSuIFLa/GxbTFaaZRjzFGP2BJoSJ1VYDpL
         +x/ngV1lQ2k3Y4xOO+wEqFQ6pe+cld1Jbp7qO2NcVhnGJl0HoUEF/Gk1jzAiRk9peZ
         MPOpv6Lcfo8WLwWaPNLwCZ3tvLx/H1Y3YTRQk61ev6lqOyI1Y0LZpEIxZLy33fbchO
         TEag4ZFNdPYjw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
Date:   Sun,  9 Jul 2023 22:07:04 -0700
Message-ID: <168896565948.1376307.1430927295932643336.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613131224.666668-1-dmitry.baryshkov@linaro.org>
References: <20230613131224.666668-1-dmitry.baryshkov@linaro.org>
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


On Tue, 13 Jun 2023 16:12:24 +0300, Dmitry Baryshkov wrote:
> The commit 3a786086c6f8 ("arm64: dts: qcom: Add missing "-thermal"
> suffix for thermal zones") renamed the thermal zone in the pm8150l.dtsi
> file to comply with the schema. However this resulted in a clash with
> the RB5 board file, which already contained the pm8150l-thermal zone for
> the on-board sensor. This resulted in the board file definition
> overriding the thermal zone defined in the PMIC include file (and thus
> the on-die PMIC temp alarm was not probing at all).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
      commit: 798f1df86e5709b7b6aedf493cc04c7fedbf544a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
