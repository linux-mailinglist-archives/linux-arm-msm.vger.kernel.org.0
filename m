Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B076205C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 02:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiKHB1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 20:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbiKHB1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 20:27:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A030E2AC76;
        Mon,  7 Nov 2022 17:27:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56E9EB81714;
        Tue,  8 Nov 2022 01:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCEEC433C1;
        Tue,  8 Nov 2022 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667870867;
        bh=4WltsRf5IjO7g4zMPi90qgCp9u2ZiS2cPNrDlbUkOuY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hiOIf8MM/HdouNh3GXUn/XjOCESbGi4LpXE0UcODKrPkYZO0k2sEuT1VvvA9QTh0g
         1GG02Y/olzRvQANtPWFfE88/jq8eVUzXKuL0MX6NCowvD7rU5JP12llHnZ6ry5Rjal
         pm/wBev8LIP14clUQ7dfy3ctodKbpgVtDFcXp0Hoku/rcyC5VoSEvwQ1yEkwMBvWMu
         t/vXlkjgrkRNryuFkx6p9RgkhNWU3jQqOVfSVvGhMGiKB1KxDv0aTtQvJYKyZt8XoX
         YgqbCzE8e8wxjfb+Fm5a1yVv45WkGkEvcEOODI48fD5V+uvl1yHjrpM24K/R68K3L2
         4mS1y6R6D7lrw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Date:   Mon,  7 Nov 2022 19:27:19 -0600
Message-Id: <166787084675.599230.12174671721035803055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
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

On Sat, 1 Oct 2022 00:20:51 +0300, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with SoC
> bindings (soc/qcom/).
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: mdm9615: drop unit ids from PMIC nodes
      commit: 0d6e44e257ec53b41c2969130e0eb97b0a41b1d6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
