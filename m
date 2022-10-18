Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E206021AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiJRDGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiJRDGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19248A7E6;
        Mon, 17 Oct 2022 20:06:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4ED7EB81C63;
        Tue, 18 Oct 2022 03:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DD9C4347C;
        Tue, 18 Oct 2022 03:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062388;
        bh=NnrVKokllz9eIEMxY6MqRrY97lBDjhsNXsYkexTqSo0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gNSk3RW3QC6E+fYemaRGby+bjSgXq2xMshBNghg6WO/1Tkr1nAPIeNhQw2aNBtMuh
         EhjhIXPCAlkqlex9J6gpJuGWO/xG1pGnhHo2ROJMWtsRP8lWTVGW5EMbjoHyhBJSib
         MG2tkA1k3DkCSvJo+CoKbu9ofBxFsRyqN2S6/M4wjdGgInbN47R1R7fblQJyiYTRA3
         thNSoa2ZQc+AX7BZ8sjD/4Jq6S1vFOhcxbBI1F+a7wFm5x1VNj04mlXaxnUlvCqpdC
         TaKKZOT18F9Q4NbEUqpBlG3k3kTvCvvcZQwNN5Me5ld/KA4P2ZhrhViAPEcs08jVAG
         vnWgeq0AUPiVw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, yassine.oudjana@gmail.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: msm8996: fixes for CPU and GPU OPP tables
Date:   Mon, 17 Oct 2022 22:05:09 -0500
Message-Id: <166606235842.3553294.6362175122717235472.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 24 Jul 2022 17:04:14 +0300, Dmitry Baryshkov wrote:
> The commit 90173a954a22 ("arm64: dts: qcom: msm8996: Add CPU opps")
> added CPU OPP tables to msm8996.dtsi. However it went unnoticed that
> MSM8996 and MSM8996Pro have significant differences in the supported
> CPU frequencies. Moreover, differences between various speed bins were
> also not handled in the DT. Fix all these issues by splitting msm8996pro
> and fixing different opp-supported-hw.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: arm: qcom: separate msm8996pro bindings
      commit: 358ef0c03e7ce62ab197af02e91b843b92ef4717
[2/7] arm64: dts: qcom: msm8996: Add MSM8996 Pro support
      commit: 8898c9748a872866f8c2973e719b26bf7c6ab64e
[3/7] arm64: dts: qcom: msm8996-xiaomi-scorpio, natrium: Use MSM8996 Pro
      commit: cea41be7ca66f0cdd0fa8e76ca799eed149d91c3
[4/7] arm64: dts: qcom: msm8996: fix supported-hw in cpufreq OPP tables
      commit: 0154caaa2b748e7414a4ec3c6ee60e8f483b2d4f
[5/7] arm64: dts: qcom: msm8996: add support for speed bin 3
      commit: f1646de452ae8a9b858cefc2087c0ab93ac5c0ad
[6/7] arm64: dts: qcom: msm8996: fix GPU OPP table
      commit: 0d440d811e6e2f37093e54db55bc27fe66678170
[7/7] arm64: dts: qcom: msm8996pro: expand Adreno OPP table
      commit: 1ae55caf9e93b9b24aab6bc81524bc33f11b3dd9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
