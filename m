Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9147B1004
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 02:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjI1AaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 20:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjI1AaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 20:30:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241FCF9;
        Wed, 27 Sep 2023 17:30:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D46C433C7;
        Thu, 28 Sep 2023 00:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695861005;
        bh=xl1vZm+n8QWp+Hct7HDZg7+jm6bYEZnVR0LPCaRbftQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gjHHnnkfoB+fNYJ0qmysjCCHXc2pYgMN95mB1n7afmFOan/dpj/3RMidhREUzZ3R5
         kkSR8vRwIq52Kaz+DzOznhTaTWuSp3wP2mnw9mSZkybd2qeTIU8yEBrEVVdGNwWXvx
         TVo0+aMcj36MluxgH6dsdoHc59OZyN/FiZ61UmosB72cAMiUrXYWvGDquntVZfZCeA
         81ahe4U3F5ylD5QygLyhrtERuFupXCmbh7UDiz2b5VIzVc/n3E8ZgB5+GFC4tFJOBI
         seFd71nl1NPgauaxjLrqnJT6+/np2BtOb+SGhy54zEXQft2mDY1xSlPUe1CHYZ2peP
         SUTAPPZNflVhA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] soc: qcom: rmtfs: Support dynamic allocation
Date:   Wed, 27 Sep 2023 17:34:09 -0700
Message-ID: <169586125030.1226038.2013225064759221820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920-rmtfs-mem-guard-pages-v3-0-305b37219b78@quicinc.com>
References: <20230920-rmtfs-mem-guard-pages-v3-0-305b37219b78@quicinc.com>
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


On Wed, 20 Sep 2023 19:37:29 -0700, Bjorn Andersson wrote:
> Some platforms have laxed requirements on the placement of the rmtfs
> memory region, introduce support for guard pages to allow the DeviceTree
> author to rely on the OS/Linux for placement of the region.
> 
> Changes since v2:
> - Rewrote DeviceTree binding description, to avoid dictating the OS
>   behavior.
> - Adjusted addr and size before memremap(), to avoid mapping the guard
>   pages, and unnecessarily have to adjust the base pointer.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: reserved-memory: rmtfs: Allow guard pages
      commit: 3ad96787949a96256931ca59aff73ea604bc0e6c
[2/3] soc: qcom: rmtfs: Support discarding guard pages
      commit: 9265bc6bce6919c771970e5a425a66551a1c78a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
