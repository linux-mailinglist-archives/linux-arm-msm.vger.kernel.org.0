Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2E06598DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 14:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235071AbiL3Nma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 08:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbiL3NmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 08:42:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDD810FE2;
        Fri, 30 Dec 2022 05:42:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5929BB81AD4;
        Fri, 30 Dec 2022 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1C1C433EF;
        Fri, 30 Dec 2022 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672407736;
        bh=H9MsQc8kKq+tvIKgCCK5VE0NAcb/NS5KQJ2VaJL4vQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UrhjkJhFfxn/PZ1t4juOOp4u2uxdJLGbh7Y3C9UpMA/Up+C4KZ873vMe6qb0xXVHL
         bB16xWNpL7ZQYgAHPt2mgPpYHMQqMWFi2qPsNayvg/iygtI8aG5c0yHtVeVVE345Qa
         9xvek0HZM3SNRZuNxhElEbiI94uE+W3PoNLbFWHn1fUPLNihJn60CJRcT1P9URKI23
         5ViI+KfBXDqmDodWOUffjeQJoQ0jA+9zVV6tbRO1Y8vg6GADwo14lpNOPUNZylXD1P
         bwgwjXysxsk3+xktkqdoee1/gm6k4b9i0HcxFR2pxuoZHCmCcO1b4SuEBU3jZarVkv
         /U8Dlp66c8wOQ==
From:   Lorenzo Pieralisi <lpieralisi@kernel.org>
To:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: PCI: qcom,pcie-ep: correct qcom,perst-regs
Date:   Fri, 30 Dec 2022 14:42:08 +0100
Message-Id: <167240770788.754221.16859969124148517946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109113202.74406-1-krzysztof.kozlowski@linaro.org>
References: <20221109113202.74406-1-krzysztof.kozlowski@linaro.org>
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

On Wed, 9 Nov 2022 12:32:02 +0100, Krzysztof Kozlowski wrote:
> qcom,perst-regs is an phandle array of one item with a phandle and its
> arguments.
> 
> 

Applied to pci/dt, thanks!

[1/1] dt-bindings: PCI: qcom,pcie-ep: correct qcom,perst-regs
      https://git.kernel.org/lpieralisi/pci/c/68909a813609

Thanks,
Lorenzo
