Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A636730468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 18:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245284AbjFNQAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 12:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245118AbjFNQAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 12:00:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418661FF9
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 09:00:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB8D5643B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 16:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB813C433C8;
        Wed, 14 Jun 2023 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686758419;
        bh=xag9aVGSo+TaGZOt39Idf5UWBL2+gk+vfxhi8S39VZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cjguqa8mYO5wjn/rroNCH2Hdapo0wNBnRoCbpN5jQqXC0tAZKMGJjSwr8ESNyTxV8
         Z3EfJKMJqG8zrbR6uUuUGZDvKZVkUoD6fDnnLyalkV9OfMrRxfZMpi6V5Xi9gxCDax
         z9+g5zEwKIXpnDBjZqsmYbkJ3aisw+gBd+9GF4N53r8MzZ/yyOMzSlroemuUu/DAG4
         rMtodzkQHmqQcev4Lzhp+LwAkzfgW6yW4D1fvaP0+a0Yxy8R/kMSLf7tcNR93CyECn
         1PTsXc6kwQZdT/oNXTpk+Xeg1kSNI1MADN5SWCptw8gWRFx6Zn0AthaAPH+O9Gx00J
         cKZq8GAqvZiaQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     manivannan.sadhasivam@linaro.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
        quic_ramkri@quicinc.com, konrad.dybcio@linaro.org
Subject: Re: (subset) [PATCH v4 0/3] PCI: qcom: ep: Add basic interconnect support
Date:   Wed, 14 Jun 2023 09:03:36 -0700
Message-Id: <168675861183.1453524.2591315161412027744.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1686752666-13426-1-git-send-email-quic_krichai@quicinc.com>
References: <1686752666-13426-1-git-send-email-quic_krichai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 14 Jun 2023 19:54:23 +0530, Krishna chaitanya chundru wrote:
> Add basic support for managing "pcie-mem" interconnect path by setting
> a low constraint before enabling clocks and updating it after the link
> is up based on link speed and width the device got enumerated.
> 
> changes from v3:
> 	- ran make DT_CHECKER_FLAGS=-m dt_binding_check and fixed
> 	 errors.
> 	- Added macros in the qcom ep driver patch as suggested by Dmitry
> changes from v2:
>         - changed the logic for getting speed and width as suggested
>          by bjorn.
>         - fixed compilation errors.
> 
> [...]

Applied, thanks!

[2/3] arm: dts: qcom: sdx55: Add interconnect path
      commit: 831b802a7727ba6e67c5ed585c54f610d9db1316

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
