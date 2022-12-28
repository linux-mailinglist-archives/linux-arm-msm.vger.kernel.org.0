Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7A0657228
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 03:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbiL1Clq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 21:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbiL1Clo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 21:41:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96134CE30;
        Tue, 27 Dec 2022 18:41:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32E67B81235;
        Wed, 28 Dec 2022 02:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7EEC433D2;
        Wed, 28 Dec 2022 02:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672195300;
        bh=+PyFzQy+OfK3ZaQohAllbx2HnUKdCNIRS1B3dMTyMh8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lcoiq2aIInOo6v7xs9XGLCDXtAfSl4al6jvKvvUasR2uwjaM3hQJQnXqEvXcQ+P6j
         jB6BCFweHqf9zEfpNXGdQZ5YuCY0UtvLIQK3rMWJIhODRgfT8BdrCsAEAax0rzIf0O
         in04FkPEmmyzUIEsGsZDsf4qddjv8fcZSaSAO7IxbJYym2VBxedHQa1hwxGWEm5fgD
         d4T95/RP0UHRLc1hHM4wgjdP6JVzDCgdji0bfos+kpJoVjSSOj40Tu+MOGYWArzIxc
         94fqBB5177T3Dt7sRnF8p0AFMw6j48p5v37pnkJRyahB9EDz+v6nG6pzvVEBamZm4X
         QFYPDWvESPu5g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linmengbo0689@protonmail.com, devicetree@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        open list <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-grandmax: Add properties function and color for keyled
Date:   Tue, 27 Dec 2022 20:41:34 -0600
Message-Id: <167219529291.794508.14219200055798435553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221117144717.17886-1-linmengbo0689@protonmail.com>
References: <20221117144717.17886-1-linmengbo0689@protonmail.com>
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

On Thu, 17 Nov 2022 14:48:19 +0000, Lin, Meng-Bo wrote:
> keyled is white, and used as touchkey LEDs.
> Add properties function and color for keyled.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-grandmax: Add properties function and color for keyled
      commit: cc8619e893297ac90e7796751e39c4ea46123e69

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
