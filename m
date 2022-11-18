Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB71F62F60E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241772AbiKRNa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241173AbiKRNaU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:30:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE2E72129;
        Fri, 18 Nov 2022 05:30:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BFE062527;
        Fri, 18 Nov 2022 13:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1507AC433C1;
        Fri, 18 Nov 2022 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668778217;
        bh=DVByPI99cziskeMpw3/H3Sw35EfmuI4W+QBBcElCutc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q9ycSFlGC0m5cG9RlAnwnYROpSROstzfMcobdK7fyIuqni/nBCox5zZU8Zxm5JPQU
         0NKbCmOwLN6yHLstgSag0cb2GLcS31zJxM9bJyFPJoQbzVy0V+liMcYT8YrNRwTQeL
         qSmMkZ5+8tMznQrISNGyBBCqpy/mixDrZFEFn29bfIz6oaPXPdMENCV02yPhFm3bUK
         OvRzNp9qluquzn86ncaH7paGu3Fl+Wb1WI3H/owbh/Ebept7Fs7ZUMT0DXwOR40Mrr
         GFtFiDEUOAwpp8v8bklsGXmYphMFUeCoL9ls0we38VSPdLs4lerFm/lfDqQXfsdhW6
         /XmJuSgBbZbLQ==
Date:   Fri, 18 Nov 2022 13:30:10 +0000
From:   Will Deacon <will@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework Qualcomm SMMU
 bindings and implementation
Message-ID: <20221118133009.GA4046@willie-the-truck>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
 <e3c8121a-5234-1051-40c7-3989189badfa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3c8121a-5234-1051-40c7-3989189badfa@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 18, 2022 at 01:41:24PM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2022 18:06, Dmitry Baryshkov wrote:
> > The main goal of this patchset is to define a generic qcom,smmu-500
> > binding to be used by newer Qualcomm platforms instead of defining each
> > and every SoC line with no actual differences between the compats.
> > 
> > While preparing this change it was required to cleanup the existing
> > bindings and to rework the way the arm-smmu-qcom implementation handles
> > binding to IOMMU devices.
> > 
> > Changes since RFC v2:
> >  - Dropped the dts patch, picked up by Bjorn
> >  - Fixed minor nits in commit messages and in-file comments (noted by
> >    Krzysztof and Richard Acayan)
> > 
> > Changes since RFC v1:
> >  - Added the dts patch fixing order of clocks in msm8996.dtsi
> >  - Fixed the DT bot errors
> >  - Added separate clause for Google Cheza devices
> 
> Please continue the version numbering. RFC is also a patch and also a
> version. This is v3. Your next will be v4.

I queued this already, so hopefully there won't be a next version!

Will
