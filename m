Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F575665D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiGEJHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiGEJHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:07:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDBE6459
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:07:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9CC66181B
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 09:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1242C341C7;
        Tue,  5 Jul 2022 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657012023;
        bh=3ZpJpRNDhK6kBwRF3RuYIOFq7v3/dbRfERHQO2XKC9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oglNQPqxphZHLSarXFIjRthMAFo/TsafAbm8rCG2BW4lSzJbXrFPGqILs8tdQYVnM
         GpJzRjgiVgviHw11UOsQ+XRjqjARbK9mbrQKyp9qA+ZoXus6l4+eXvzmbdHZNGS4en
         mFF3ETc27nnx0OuFnYTify3H+qKlJJahQZNRHh607EXDyNTbkCQ0T/srH2zWFtCvhU
         smcQ+18wH7JFxBWq9i7pNdjLf3RDI1RFKQt1GKE6C8dSrNMWenenQ1j1WCkg4iHCPJ
         /6aUKcr/DBCRKrO4RzOzbGdwlkvoJNOxEiCLRt+U1p4DnMwp5hM7rgenEiud91p3BA
         a863LznbMhSpQ==
Date:   Tue, 5 Jul 2022 14:36:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells
Message-ID: <YsP/MmX96aIYc1p7@matsya>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
 <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617103608.605898-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-06-22, 13:36, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
