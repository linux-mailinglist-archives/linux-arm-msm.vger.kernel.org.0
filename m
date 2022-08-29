Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4EEB5A57F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 01:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiH2Xqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 19:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiH2Xqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 19:46:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA3398A5A;
        Mon, 29 Aug 2022 16:46:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2C0F613F1;
        Mon, 29 Aug 2022 23:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F02C43150;
        Mon, 29 Aug 2022 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661816784;
        bh=B408F2mmdE4slykVzufdu452gU7fVs+YdpkNlXfr8lU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EpmtV0J1f+4uBwCMOk8CCg4lP9AC3bVK8qPk+Ml0STraJVZivXtOL9xnlfxpWX4su
         pFfpOxm7Z09itRyEmYbxSrod/fGgK45Yx9hyfUBJZbiSvUFYYLBIrtPiyZWyBiLVQJ
         AYb8gKjdiHhL3i0IVstTOj/W0Q2fjKDzIqhQkmU9AmCyRWr2qzi8hdY+2HxUhBmT/C
         rqSblK2bA4A3AXMIlwy4lFCl+tWiMZtaY1z4EnqpvVk3Jg1ytuAPBwIqYY7OEBgPOR
         Vsxy17E5NTgSQelX8nFDXiIsCsh3haSdip/9m9UqXmWwKDWeacytQCNt30tHBfA3+S
         c//agPx8f/hpA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org,
        Bjorn Andersson <andersson@kernel.org>, robh+dt@kernel.org,
        mturquette@baylibre.com, konrad.dybcio@somainline.org,
        quic_tdas@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dt-bindings: clock: update qcom,mmcc bindings for MSM8996
Date:   Mon, 29 Aug 2022 18:45:46 -0500
Message-Id: <166181675957.322065.14979758926013198529.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
References: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 5 Jul 2022 14:27:32 +0300, Dmitry Baryshkov wrote:
> This is a split of binding patches from [1]. When sending the original
> series I missed adding DT maintainers to the CC list, so while all the
> DTS changes were accepted by Bjorn, the dt-bindings were not reviewed
> (and were not taken in).
> 
> Changes since v1:
>  - Moved the first condition block (clocks/clock-names requirement)
>    under the allOf (requested by Krzysztof).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
      commit: 73e66ddfd9984594c1f28fb756e68010924798ed
[2/2] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8996
      commit: 51b0a5e044a4c49bcaf96c00123d26119da105d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
