Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 532496BC1B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 00:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjCOXtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 19:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbjCOXtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 19:49:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30E67AA6;
        Wed, 15 Mar 2023 16:49:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8E5AB81F9D;
        Wed, 15 Mar 2023 23:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB4BC4339E;
        Wed, 15 Mar 2023 23:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678923162;
        bh=Qjh1ONXyohth+sp+oqNyoqWPq462ZAGO6H1dj2RuDBA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pqCGLBZpOxVt/hdnt7RcYaerUC9QGKgzoOSd8ImHdQs1zqnFme0RDtXx83gtVY4NY
         s2RMNmK3FbDTBAZKZrYDURf7qG2Nkwxo3b6HBQUhsegrlnUJdy0MRNomxPe8YkMtgJ
         iwPb9PgM43CHMUSanA/7vtSsW39NAG/M+jQlvSVL6Hf7a+a0pqGX6HtLN/0afgUaxm
         Psk0MVKA9X+8FMpFVggcdXVimIjQQYGIpH7zEwauVkttHcQzXfmMWgxWsiVMHTcSxM
         4T13n9gPZGVdtUyLpwIRdb6BebVZfPs+Ckm3OXCPUMjOk7MJ3JFpgP/9kfA1PFbaDI
         vxYWg0q8vdrWA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>
Cc:     Odelu Kukatla <quic_okukatla@quicinc.com>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: Re: (subset) [PATCH v4 0/2] SDM670 Interconnects (now with dts patches only)
Date:   Wed, 15 Mar 2023 16:35:14 -0700
Message-Id: <167892332563.4030021.10604867727741594177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230201010020.84586-1-mailingradian@gmail.com>
References: <20230201010020.84586-1-mailingradian@gmail.com>
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

[2/2] arm64: dts: qcom: sdm670: add opps for peripherals
      commit: 17289c0165bdb61a585e8e937b80defc376dbfde

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
