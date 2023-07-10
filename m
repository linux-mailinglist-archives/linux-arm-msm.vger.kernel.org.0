Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A23EA74CA5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 05:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjGJDXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 23:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjGJDXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 23:23:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49FAAB;
        Sun,  9 Jul 2023 20:23:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D15460DC5;
        Mon, 10 Jul 2023 03:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96289C433C7;
        Mon, 10 Jul 2023 03:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688959425;
        bh=lqe8M7rk/LG743hh6/dDFwTSc8ca5NiN9IWm+xYMIkw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Az1XMuo7BJ5sIjavnqwP3S0wBqAcQC7d9El7dkF5aU71+wD9WgriwA6uoJ5tlGwLi
         RTazBGQdGtwza7hExsaTAVQxe+SxOO0kYuf+MSEI60bvI4bi+crok3JRZKMyrh+ojP
         Lz7g2Eatq+mFQ+07OK6MMB4kDHy+mIzpVMHUysYoVPQcWAi3DmecP3lbfJaWjxL6sk
         +PrixTwzzaZiT+aXZeZEfKznT7OHEzgqIGsPYmrioLp/Mrn5t0CiTCruTg4XGwVa7v
         iNWMnOjEqqxZl3+xFCNMTIPx3bM0R/HAbKngjN7li2QPrS9AB3Qnp5ALbrzXf1Doc7
         Ejb7ZBdEOhjmQ==
Date:   Sun, 9 Jul 2023 20:27:20 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] phy: qcom-qmp-combo: add support for the USB+DP
 PHY on SM8150 platform
Message-ID: <teisqo5zbl65gu5fy6sqhuuaai2ynnu4ce7ybof72nhyweb6n5@3n77j6xw3obj>
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
 <20230531023415.1209301-3-dmitry.baryshkov@linaro.org>
 <47e84a3c-b457-7aff-ad6a-809178c08b62@linaro.org>
 <CAA8EJprDPzTQU1j6n17gYAeiXw1t6M_d4CciTtD8mHNksYGHow@mail.gmail.com>
 <10388324-45c7-b8ae-fb48-64becff76e66@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10388324-45c7-b8ae-fb48-64becff76e66@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 31, 2023 at 02:16:42PM +0200, Konrad Dybcio wrote:
> 
> 
> On 31.05.2023 14:13, Dmitry Baryshkov wrote:
> > On Wed, 31 May 2023 at 14:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >> On 31.05.2023 04:34, Dmitry Baryshkov wrote:
> >>> SM8150 and SC8180X are close relatives. Reuse sc8180x data to support
> >>> USB+DP combo PHY on SM8150 platform.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> I'm not sure this is right. Downstream reuses SA8195 USB seq.
> > 
> > The upstream driver uses sm8150 data for sc8180x. So even if sc8180x
> > data is not correct for sc8180x, it is definitely the one that we
> > should use for sm8150:
> Right sorry, this patch adds support for 81*5*0. I wanted to point out
> that 8180 has a different set of init commands and one of them is probably
> incorrect.
> 

FWIW, DP works on my sc8180x devices. (But perhaps still not correct?)

Regards,
Bjorn
