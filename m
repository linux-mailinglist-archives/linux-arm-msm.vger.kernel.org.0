Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63D966083B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjAFUYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:24:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjAFUY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:24:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FF62638;
        Fri,  6 Jan 2023 12:24:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56452B81E93;
        Fri,  6 Jan 2023 20:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB8DC433F0;
        Fri,  6 Jan 2023 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673036663;
        bh=62nxf5aNBYDvGdXhyDdjTj6yHB6Fp13Om6wUB5lwOZw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lY1mco5A1QWWjL2vwwUkyFzMKZ1pRLhUDUDaPQeOiFxOOkjAjKdu9QQuhxOphRVJP
         YU2aSyEQW35dWt4hOBa1vlFhEp9nmJ+FzSruVQteZXMjObaEKDyNVj31mMz+RYxXEE
         08bVAp9dgNAmAkuySkJslUXwkWp9k0De8ESdQVQyX/fvwwxBXcjtDnp4Ny4aFQIXOt
         Of3FfwOBBQDNfmbBE/1xti47Ym/wAGx4UrA49CP1UUc2I9zTLqiKez2Yhn66kr2kQi
         2Jttz58DDl+J2N3O5wJ2Ayk4EKs//paFKROKfRFUdzTkga6FnO3B3raVIYrSx9f/yn
         QME2akopsw29A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     stephan@gerhold.net, Andy Gross <agross@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, konrad.dybcio@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jiasheng@iscas.ac.cn,
        robh+dt@kernel.org, bgoswami@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, Mark Brown <broonie@kernel.org>,
        srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 0/2] Fix APR audio regression on 6.2-rc1
Date:   Fri,  6 Jan 2023 14:24:18 -0600
Message-Id: <167303665353.1802272.239146565837187502.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221229151648.19839-1-stephan@gerhold.net>
References: <20221229151648.19839-1-stephan@gerhold.net>
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

On Thu, 29 Dec 2022 16:16:46 +0100, Stephan Gerhold wrote:
> These two patches fix regressions in the Qualcomm APR driver that
> prevent audio from working on MSM8916 (and likely MSM8996). In previous
> kernel releases the "qcom,protection-domain" property was optional, in
> 6.2-rc1 it is now required. It should remain optional because the
> protection domain functionality is only supported starting with MSM8998
> and is not present on older SoCs [1].
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: qcom: apr: Make qcom,protection-domain optional again
      commit: 26658868354963afbff672ad6f7a85c44c311975
[2/2] soc: qcom: apr: Make qcom,protection-domain optional again
      commit: 599d41fb8ea8bd2a99ca9525dd69405020e43dda

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
