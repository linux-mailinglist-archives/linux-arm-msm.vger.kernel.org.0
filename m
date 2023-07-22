Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B786575D92F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jul 2023 04:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjGVCq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 22:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjGVCq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 22:46:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEAD12F;
        Fri, 21 Jul 2023 19:46:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96E9761DC8;
        Sat, 22 Jul 2023 02:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEE2C433C8;
        Sat, 22 Jul 2023 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689993987;
        bh=aNTT4YCh064DdPhuzYjOFZH8M/TlP7tVKcY5DRWkLbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PatEbBu0PJuSuPMOavd0Bgz5MoATe7dvFYC3BQMHS9KVSYOfVXsR+r7XnIr/ybT/4
         LunhUPVDXX5zwHgPYh5vRtd469Jk4mFySJi7BgfILEWaeg3LNywLp0vSY/iezLHfdz
         DAvUhJPdGGkY0g2teq0kIGGeHOwx7U4Mv65YNc5AceLjfn3tUPjZhNNvRLsAdqo+Eg
         Tk4GT7cg+/erYcSWl26HFvwl1fz7Dv0TDcr6su9l1iHZSogRfsG1Ksgapq1OQ1DyVT
         DiNsfJiFb3TTg2542sb34tk2S2FlEDrcWnqZh8E0NggYf7wbSP1MrHsN4HvBPYGZ0F
         lFyXIymmnzB8w==
Date:   Fri, 21 Jul 2023 19:49:45 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Message-ID: <vo7boshin545hx27ov3rrkhbglkf42f7yl5r5geltqyqw3lmol@icdicnqvrvrx>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
 <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 18, 2023 at 09:09:41AM +0300, Dmitry Baryshkov wrote:
> On 18/07/2023 07:37, Bjorn Andersson wrote:
> > On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
> > > Implement DisplayPort support for the Qualcomm RB5 platform.
> > > 
> > > Note: while testing this, I had link training issues with several
> > > dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> > > or VGA connectors) work perfectly.
> > > 
> > > Dependencies: [1]
> > > Soft-dependencies: [2], [3]
> > > 
> > > [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
> > 
> > I'm not able to find a version of this series ready to be merged, can
> > you please help me find it?
> 
> This = Bryan's? I have posted some (small) feedback regarding v8. You also
> had issues with orientation switching bindings, etc. So there should be v9.
> 

Right, Bryan's series. You linked to v8 which has requests for changes,
and I can't find v9. Am I just bad at searching?

Regards,
Bjorn
