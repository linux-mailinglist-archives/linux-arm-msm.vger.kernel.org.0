Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6817B372F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 17:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbjI2PpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 11:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbjI2PpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 11:45:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0D4B4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 08:45:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF5EC433C8;
        Fri, 29 Sep 2023 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696002313;
        bh=0hDyT9MUh8730O65k81LE+Nwv/GSPLBC8hZOSfjcJio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L89p6HObshK63IiZfGBnFLEiyJRV5qx5Ylk0YL8Em55VwmFMHeCK2rH3SCRf+qpHc
         r+1rMwkT+ur98q+lKztETgV8XwMUJBrwY9LDe++xxAjkVQp3i2KOzh2+7VepJnf/jx
         jBQ65yqRLTapKyLmIucukAd5W70gfCcaz060PYGVONOjzpLkz+AclAREjr8nC3sZE7
         bkSxXw6SOnJ88nPHQkfTl/nhjvPRicb369IojHETjWINtL9Awbi031+LrxTVoE5Dr4
         uv+UfTKKyEw489m3VNPwVWM3ttRZtrMVISqRNSEOcNgHQKgxs50+wQHICadF9X5G/D
         fH2LHeuhwIsww==
Date:   Fri, 29 Sep 2023 16:45:07 +0100
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Message-ID: <20230929154507.GA30764@willie-the-truck>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
 <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 25, 2023 at 06:54:42PM +0100, Robin Murphy wrote:
> On 2023-04-10 19:52, Dmitry Baryshkov wrote:
> > If the Adreno SMMU is dma-coherent, allocation will fail unless we
> > disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> > coherent SMMUs (like we have on sm8350 platform).
> 
> Hmm, but is it right that it should fail in the first place? The fact is
> that if the SMMU is coherent then walks *will* be outer-WBWA, so I honestly
> can't see why the io-pgtable code is going out of its way to explicitly
> reject a request to give them the same attribute it's already giving then
> anyway :/
> 
> Even if the original intent was for the quirk to have an over-specific
> implication of representing inner-NC as well, that hardly seems useful if
> what we've ended up with in practice is a nonsensical-looking check in one
> place and then a weird hacky bodge in another purely to work around it.
> 
> Does anyone know a good reason why this is the way it is?

I think it was mainly because the quick doesn't make sense for a coherent
page-table walker and we could in theory use that bit for something else
in that case.

Will
