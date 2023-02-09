Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6636068FEA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjBIE0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjBIEZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:25:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E649D10244;
        Wed,  8 Feb 2023 20:25:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0BAC561862;
        Thu,  9 Feb 2023 04:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B39C433D2;
        Thu,  9 Feb 2023 04:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916523;
        bh=pWb8srnh/6vP1j3+hB5jTwb5AWP4bjdEHn9lWhsOAq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PGyTZ26y8cjh7KRB63lq+yCCZqed60OYJbCn4nPVvgULAFu+dESYsJ98fjj33YL5I
         bPu70g0kKVA3tloYesrxIfVlzjwWpBf7FUNKebkqcJvg1FA7OdEN7G3gHHAb/VE3c5
         OjUgWiQ8DLYeja1+6BsQCT0OxAp74664jDepKGZipqJBCmFWD5Ld+oRa3e92EsH3kS
         BubUFFksLCnPF1+kbLKIsEgM1sBKom8KtKQ06EDbdvnJ8IMFpe3ijk6zihX2bgm4W7
         IihVlCDuavhsxZH36Ds7q3CtgMSUz8tM9hj43NAYjY7MV7UBy5MkQarYZMP36XxHsI
         LbGXtSje4BUjQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v4 0/2] SDM670 Interconnects (now with dts patches only)
Date:   Wed,  8 Feb 2023 20:23:19 -0800
Message-Id: <167591660369.1230100.10064457807508339752.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201010020.84586-1-mailingradian@gmail.com>
References: <20230201010020.84586-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 31 Jan 2023 20:00:18 -0500, Richard Acayan wrote:
> Changes since v4 (20230111005155.50452-1-mailingradian@gmail.com):
>  - drop applied bindings and driver patches (previously 1-2/4)
> 
> Changes since v3:
>  - fix a merge conflict on linux-next (1/4)
> 
> Changes since v2:
>  - change qcom,sdm670.h to qcom,sdm670-rpmh.h (2/4)
>  - use SPDX v3 license identifiers (1/4, 2/4)
>  - accumulate ack tag (1/4)
>  - format changelog (0/4)
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sdm670: add interconnects
      commit: 0daef104e4b1d945ac81cb10e35c29f82695b10a
[2/2] arm64: dts: qcom: sdm670: add opps for peripherals
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
