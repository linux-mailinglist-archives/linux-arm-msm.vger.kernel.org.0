Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857417572D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 06:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjGREeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 00:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjGREeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 00:34:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A8DE6C;
        Mon, 17 Jul 2023 21:34:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 665766143F;
        Tue, 18 Jul 2023 04:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0065C433C8;
        Tue, 18 Jul 2023 04:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689654840;
        bh=pixKIFpANj6Pob0ssMruoTOTrgPNBkZB51oMfPdOR3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCjHCLsmQGC2ppqJZN+sGubkWUB2hIFxepN31uEUnsthLLxOO6wvrsdiZ7THEA9xv
         HIH8Z7Q4qs2+c2H/osqdRQXhiCKVZ4flMAYgdN0jHGo51X7DkfZIQ7nDY4hfd+L59j
         8IYhexuMElrfRc8OjQ/XlxrH3gY3WLv4GZdCNvtWHuT/5LBdK/O8dONzytmgjnVYuj
         E7GOy3OxMSOyHjcryM6aS0WnD48jQPO6kFameFgrIC/DO6yF9WGpl5pY6bvSXGHgzU
         aFYBrU+AUZMw3CK5w5IgkpYvgZje1ur8NutXXqdrBmo5seNDu4BK9NAzxyjf3F1+1S
         VPetXFXbqz9RA==
Date:   Mon, 17 Jul 2023 21:37:24 -0700
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
Message-ID: <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
> Implement DisplayPort support for the Qualcomm RB5 platform.
> 
> Note: while testing this, I had link training issues with several
> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> or VGA connectors) work perfectly.
> 
> Dependencies: [1]
> Soft-dependencies: [2], [3]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/

I'm not able to find a version of this series ready to be merged, can
you please help me find it?

Regards,
Bjorn
