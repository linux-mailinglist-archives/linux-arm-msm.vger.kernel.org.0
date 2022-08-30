Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433455A5AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 07:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiH3FGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 01:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiH3FGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 01:06:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8634D9E2E5;
        Mon, 29 Aug 2022 22:06:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3DB81B811B2;
        Tue, 30 Aug 2022 05:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6312AC433C1;
        Tue, 30 Aug 2022 05:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661836006;
        bh=ASOn7IQszNk+VN/K8F4lja21kCAiyz6HLrdzvHYkXRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSpMOTAF50Jycfw9ef+jyokGRBpmTKhDyuHeLrDoh3zBwoALkUoMMBJxIq0mqlc0U
         zjmFO96lUoFAP1sC2wN3pFKnmP3JJ47QbNaLuwrnTzd/N5cZ8GmPl9VfDyLmsZ/mnp
         LUX/3xoCdvltbTsT7oM2Lpg8aAEiagvkCW7EU3Lhysj+gM0L0Y3XGIPQlLDCZRwcAm
         g6jfuf51gR48rOu0dU31K65mYNo4kzi82NwjnlerErNO+KT5PKiVAfaY4YnC6MeXtP
         B6YJYWzVZ0xqPklWnO+8cGrVHDJISzg6zcMVebBt4x2bfODyem6SjlD4uL1aWAXtEH
         pHtKdL+YzS6ug==
Date:   Tue, 30 Aug 2022 10:36:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/30] phy: qcom,qmp: fix dt-bindings and deprecate
 lane suffix
Message-ID: <Yw2a44l9a6zz5qTJ@matsya>
References: <20220714124333.27643-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714124333.27643-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-07-22, 14:43, Johan Hovold wrote:
> When adding support for SC8280XP to the QMP PHY driver I noticed that
> the PHY provider child node was not described by the current DT schema.
> 
> The SC8280XP PHYs also need a second fixed-divider PIPE clock
> ("pipediv2") and I didn't want to have to add a bogus "lane" suffix to
> the clock name just to match the current "pipe0" name so I decided to
> deprecate the unnecessary suffix in the current binding instead.
> 
> To be able to add the missing child-node schema and handle device
> specifics like additional PIPE clocks, it quickly became obvious that
> the binding needs to be split up.
> 
> This series clean up and fixes some issue with the current schema before
> splitting it up in separate schemas for PCIe, UFS and USB and adding
> missing parts like the child PHY provider nodes.
> 
> The MSM8996 PCIe PHY gets its own schema as this is the only non-combo
> PHY that actually provides more than one PHY per IP block. Note that the
> "lane" suffix is still unnecessary and misleading.
> 
> The final patches add support for the updated binding to the (recently
> split up) PHY drivers. Included is also a related combo PHY cleanup.

This fails at patch 2 for me on v6.0-rc1, please rebase and resend

Thanks
-- 
~Vinod
