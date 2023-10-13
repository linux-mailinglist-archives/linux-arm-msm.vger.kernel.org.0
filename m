Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF6E7C836C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 12:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjJMKnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 06:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjJMKnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 06:43:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A09C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 03:43:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAFBC433C8;
        Fri, 13 Oct 2023 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697193820;
        bh=TyNV48zrKAaS0i38ucLSEY6vFMJzYVMrLSVh1MF0r4Q=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=rjfpMoiiH+7TOYnrYGGdgwIpio7z+qxqdZT3CIHsJAXhGeQf5iuNnbvRZ4riJ7929
         on51y9vvNusWADLMBotE0coQ27DbzJdiUXLudUy9yTgKMqSjpVU1z5yrayjYRxAp89
         nQDEtcPCbirSxiB81MTJLaMbfBdtPMeXZ1sU4lO9GG2zCpqEtPZr4g0JQ/iJri51Nn
         oDOK5ZAAdkyLpNVRZeKjxGh2agd/l0dr/RXOTMb1X4QHYpy1EwpnFN4I1NnRJZgqeB
         /Frk7VgRczqW/a7wCLIB+7q5qme503ZHzZlNahVZGcDh7sgTM9UtfKrYYNVRN962Lx
         MfBM+3T5KBXsg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
References: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/3] phy: qcom-qmp-combo: correct USB v6 registers
Message-Id: <169719381727.165658.9377101716537787206.b4-ty@kernel.org>
Date:   Fri, 13 Oct 2023 16:13:37 +0530
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


On Thu, 28 Sep 2023 13:54:42 +0300, Dmitry Baryshkov wrote:
> Move and rework USB QMP PHY v6 register names to follow the usual practice.
> 
> Changes since v2:
> - Renamed the series from 'phy: qcom-qmp-combo: correct sm8550 PHY
>   programming', since the fix for sm8550 was landed separately (via [1])
> - Removed the comment regarding v5-v6 difference, which looks invalid
>   now (Konrad)
> 
> [...]

Applied, thanks!

[1/3] phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
      commit: 579483ecd81987fc30a8b13650323a17cb1c14e3
[2/3] phy: qcom-qmp-usb: move PCS v6 register to the proper header
      commit: 5077b136fd594d0c9e7df0a749bda75ba6114e3c
[3/3] phy: qcom-qmp-combo: use v6 registers in v6 regs layout
      commit: b5ec2824d74e71f16a0243446933542584acd440

Best regards,
-- 
~Vinod


