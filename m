Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C627A6794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 17:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjISPIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 11:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233042AbjISPIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 11:08:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4ABCF4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 08:08:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E638C433C8;
        Tue, 19 Sep 2023 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695136114;
        bh=czDJHRpcAR6BNkFpOvyDtvqKNrVlVuj2/gAeQgeuUeY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=hZBfzz7xXUVah5tPGzsdhbSkSRbvAVJMkiagKx1B/UtvUhe0dgPV6zAQEraA8XOhq
         176Q7Esss5Td9HCVXT46wwk3ftH0BZzUwdU2UJSOnMRmq9wJhUCqwJ2rJa4mI31wxw
         28Qc8EKGZ9ov8miIYHYOWCx1UbC5vS5cN9FNRR0NeAtzDK8/QFYg//u8HVbVOOXvK/
         r5uPJDMIWfZjzeObW8UjQWaZh6Z99NJnIfXebmR5c6kysryPhoboFBUUUdpG/leIBP
         uWIk4H8GhGHS66h2iGzdYSc9wr5mLhvukeuIUJkYv4Rp4PMUjpopUIRBFq42/mZf8E
         PIeNCuj7aEsUA==
From:   Lee Jones <lee@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230821232532.3110607-1-dmitry.baryshkov@linaro.org>
References: <20230821232532.3110607-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom-spmi-pmic: add
 pm8450 entry
Message-Id: <169513611189.3257807.3120090917293713051.b4-ty@kernel.org>
Date:   Tue, 19 Sep 2023 16:08:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Aug 2023 02:25:32 +0300, Dmitry Baryshkov wrote:
> Add bindings for the PM8450 PMIC (qcom,pm8450). No driver changes are
> necessary, since the PMIC is handled by the generic qcom,spmi-pmic
> entry.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
      commit: eec152967faf6befb34ce4828798d699aadab6c5

--
Lee Jones [李琼斯]

