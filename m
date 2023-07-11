Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32EC74E613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 06:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjGKExx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 00:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjGKExw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 00:53:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A82116
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 21:53:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9008F61140
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 04:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15287C433C7;
        Tue, 11 Jul 2023 04:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689051229;
        bh=ieeYaaJXqI522ZOoNP7U0EdcAYtoYQpnhRw5BD0Lnp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6DbQbUI3PUFPXI5Lq+zRu/lddVBBN/T1n65CS0EDZgYsI/P+KnzzqpQvWIHPs6sA
         J4lTy6NNB9ostzftA1Fev2Pv8mluN6mLQmDsuHVKi9h8CV0PtEzuOobELtH3HbAm1i
         FOAEGNx8I+tauId5Skxl65ROtaeNpbqlZeufz36AD1KsjVlIskNwFgmekPHmlxzlgy
         jNgiLJMcw+W97h6T7XQTpMSQyqiMlC2Y39uJ9V+3/3LCzkbeEoeuwXI0IQjYzMKD2f
         9iS9Ot7ElDor2gMwnyYR9mRN8SUTmY50I+s1AcrDBVoCkHVzdlrrmVogKChy2CB4Jk
         2nKkpJSGxPfGQ==
Date:   Tue, 11 Jul 2023 10:23:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-snps: Fix kerneldoc warning
Message-ID: <ZKzgWWrtF3aCQNN/@matsya>
References: <20230523115556.3460131-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523115556.3460131-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-05-23, 14:55, Dmitry Baryshkov wrote:
> Ad ddocumentation to the update_seq_cfg to fix the kerneldoc warning:

s/ddocumentation/documentation
> 
> drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:136: warning: Function parameter or member 'update_seq_cfg' not described in 'qcom_snps_hsphy'

Already applied: 2a881183dc5a ("phy: qcom-snps: correct struct qcom_snps_hsphy kerneldoc")
-- 
~Vinod
