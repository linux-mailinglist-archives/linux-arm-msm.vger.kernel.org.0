Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DF066E6A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 20:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbjAQTNK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 14:13:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbjAQTKm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 14:10:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB3A37B40;
        Tue, 17 Jan 2023 10:24:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1732261507;
        Tue, 17 Jan 2023 18:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C97DC433EF;
        Tue, 17 Jan 2023 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673979877;
        bh=lRFwpAKdAYE3kwmieJAq9DQx3YaX1gDTwYemwH6BSiw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IRHLfRKvCchsVE8EgOtguM10LltM6kmiC1LW6jaXZ0si0wCbK/n15Fchh8ybLr4HP
         wtRhevHjtteiE09zucHpRNot+oCg2HS69kmd48Bj22gMioTLKBlSsCgjIuAhBujYbA
         CouF0NNPAl/V0Op7EL07mENxtMlKH4CAPzM/fXCFCAZt/xTZzDzVOZ8Q2e0GACD7A+
         FFe4vz9CR+IKzJIf+nenvJx1rCyT3z8ubU0u4GxM3P8umS4ps3zWS23i64bBUWfslB
         vbd334uK+ESZfn/ALkJ5FmLdfZYAzLuTnZEsJ+4D4APNJsKG79UrxPw9+elA/fQpKQ
         kSp1pme05klbg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, kishon@kernel.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org, agross@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, p.zabel@pengutronix.de,
        johan@kernel.org
Subject: Re: (subset) [PATCH v9 0/4] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Tue, 17 Jan 2023 12:24:22 -0600
Message-Id: <167397986254.2832389.17639980033848881749.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
References: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
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

On Wed, 23 Nov 2022 12:44:39 +0200, Dmitry Baryshkov wrote:
> Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
> platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
> be used as GCC clock parents).
> 
> Changes since v8:
> - Send proper patchset this time.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: use UFS symbol clocks provided by PHY
      commit: 86543bc6eec499f7fd12e1628a29838aa90c288a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
