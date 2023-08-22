Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E1C784428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 16:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbjHVO3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 10:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234326AbjHVO3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 10:29:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75508F3;
        Tue, 22 Aug 2023 07:29:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1353965925;
        Tue, 22 Aug 2023 14:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E76C433C8;
        Tue, 22 Aug 2023 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692714553;
        bh=u9i/0PUen8f4rveR8y6uxO85lsX6aoVBjb6AiC+3E2s=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=uejb3yBbdq2oejaRhdnGIf6fYrLDQ2MwbWT+/0a0VhwL/LQUcprMuyMPwqmFK38Fp
         Q3wITevqwf9VzF/EjJlbcjKw4DBhqo7fSWJ8/dA8DFwsUTpLn889SpTw2+52E5W2ep
         ecSWcE6p7g0yCXp0Rxh+T0UrWefZdi2phNzAPpZDBtk1HQtrBgXsoXpvYqsM2cbPUH
         Sn9snYp/YViH4885oe4vNCcQF/N9RVQMvp+edRdfZwP1RDoCam7uihK1+cXJIXMqc4
         8k15ZhT/S+V8ihL3FMOfEjay0QZlbNo4n1KfhgYgcvaA9DguFmh2j8Izr09V2rYKWu
         4YIa5ZfiGI3jA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v3 00/18] phy: qcom-qmp-pcie: convert to newer
 style of bindings
Message-Id: <169271454911.280543.9764973402688206000.b4-ty@kernel.org>
Date:   Tue, 22 Aug 2023 19:59:09 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 20 Aug 2023 17:20:17 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made it clear that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[01/18] dt-bindings: phy: migrate QMP PCIe PHY bindings to qcom,sc8280xp-qmp-pcie-phy.yaml
        commit: 505fb2541678944ae90e110088811eebba883efd
[02/18] dt-bindings: phy: qcom,qmp-pcie: describe SM8150 PCIe PHYs
        commit: 377107bcc64a446e017939cf6b59bb97873cf967
[03/18] phy: qcom-qmp-pcie: drop ln_shrd from v5_20 config
        commit: cfe0d203813420e643db08264679982a31fea95c
[04/18] phy: qcom-qmp-pcie: keep offset tables sorted
        commit: 86f703762a9b6c1a8e3ce9fd62fd5353379be3a0
[05/18] phy: qcom-qmp-pcie: simplify clock handling
        commit: 067832dc0387f12d264f449f9eba63cb587c21c6
[06/18] phy: qcom-qmp-pcie: populate offsets configuration
        commit: bf46fa1dafacebedb9de56626fdfa71e6198cfd7
[07/18] phy: qcom-qmp-pcie: support SM8150 PCIe QMP PHYs
        commit: 4807ff70e228b5e9c6ea6c7c5651a3fd74a5cfda

Best regards,
-- 
~Vinod


