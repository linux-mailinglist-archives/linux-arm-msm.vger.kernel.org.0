Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E521B4FDFB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 14:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352563AbiDLMU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 08:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352613AbiDLMRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 08:17:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ED02497B;
        Tue, 12 Apr 2022 04:17:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43570619E9;
        Tue, 12 Apr 2022 11:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FD5C385A6;
        Tue, 12 Apr 2022 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649762267;
        bh=I4iVPmcAWjsg42Hwd5bOIJBD6HNPJ3z8vTuvOj+JgeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jF8uWrw0URfTq3+dOJIEQV1lekgIHU/0h6FAm7n1HP7Pw/eXzMn1Sh/7YE64fy4yI
         S5Tgb2k6qt4lV4ASrZhkQbLL+/B6i7aXmHZxn21QIQfgZNCHY3aCeDIgK2d3DtFkfE
         hUzX6K8a90MTIE40K8qCIscBhnlk7XGa5LeMcvq37NmeDhOyuSK9L9IYsAH7Mt8/Se
         7EojRlf7iWoS9jZjqyj8w0dQd05zBkf5W0A26/cqGKQAQ/FkXiqosIXAd87tL08wHD
         zZdt/A9Xip3vlncK/CVzNYzV45B/kgKiUS4htVwedCLjm6WKGQXWMWTe8eN/mxKPUS
         xAveHvqUcmq+A==
Date:   Tue, 12 Apr 2022 16:47:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
Message-ID: <YlVf13E+AI4JAgkp@matsya>
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
 <dbe6d9c5-f717-785f-e65d-baa1328cea2b@linaro.org>
 <Ykx6NWrcf4IA2Mam@ripper>
 <CAA8EJpqrJr5RB8E6CQ+cAgp6bad4m_LSG6CPeMsf+Ws0jqFf1Q@mail.gmail.com>
 <YlTlZa35A4lu02oI@builder.lan>
 <2af9a8a7-0904-df31-7c1a-21705bcda8d6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2af9a8a7-0904-df31-7c1a-21705bcda8d6@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-04-22, 09:34, Vladimir Zapolskiy wrote:
> Hi Bjorn,
> 
> On 4/12/22 05:35, Bjorn Andersson wrote:
> > On Tue 05 Apr 12:38 CDT 2022, Dmitry Baryshkov wrote:
> > 
> > > On Tue, 5 Apr 2022 at 20:17, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> > > > 
> > > > On Tue 05 Apr 08:38 PDT 2022, Dmitry Baryshkov wrote:
> > > > 
> > > > > On 11/03/2022 01:19, Vladimir Zapolskiy wrote:
> > > > > > All interconnect device tree nodes on sm8450 are 2-cells, however in
> > > > > > UFS node they are handled as 1-cells, fix it.
> > > > > > 
> > > > > > Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> > > > > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > > > 
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > 
> > > > > Bjorn, could you please this pick for the -rc kernel?
> > > > > 
> > > > 
> > > > The change is obviously correct, but what difference does this change
> > > > make with the current implementation?
> > > 
> > > it makes interconnect paths probe correctly. All NoC have
> > > #interconnec-cells = <2> now.
> > > 
> > 
> > But there's no code in the UFS driver that calls of_icc_get(), so what
> > does this actually do? (Other than correcting the dtb for the day when
> > we add that support to the driver).
> 
> FWIW the change also has a runtime effect, it fixes a parsing of the board dtb,
> otherwise a warning in the kernel log appears:
> 
>   OF: /soc@0/ufshc@1d84000: could not get #interconnect-cells for /clocks/sleep-clk
> 
> Why /clocks/sleep-clk is mentioned here at all??
> Its phandle value is 0x26, which is equal to SLAVE_UFS_MEM_CFG from the array.

We should either apply this fix or a patch to drop this line from dts.
Either would be apt and latter would make more sense..

-- 
~Vinod
