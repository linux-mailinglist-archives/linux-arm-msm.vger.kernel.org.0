Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4293E6C78B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCXHVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCXHVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:21:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFFFC0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:21:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 64E93B822F4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E913CC433D2;
        Fri, 24 Mar 2023 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679642462;
        bh=JAalBEdru/ocLqf8SWOl9qHluKU5LUoUETNuxkFPQDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BjHU7E7vNpWu9OIW643SEAoLpc4S+gtiozoxRhUmtf5LEBYKm0THPSXoVPZYWlOAx
         zFwQ+tkv+iRMshZ0y9QCuGzyfNypInNWP4K6GFl56Yv/nm0KcO6wcVwcEXlVCGkrtu
         Uq8da/s4Z7uRkXjA9/RY+F1h4Qf++rxAoeKjOpIyXY8j9Iairs8fuLVt2MvJDWXdyy
         bpTLW0Ti2Zvoa7cTRlQ5g1nzhGLPY2MET5BixDz6+alsWpVHB3GuhcRoEuQYUPuUG9
         LjDAHfqHeSFbNAdahy037WzOM8mfKtKqAkKr7k6/OGWvsKsLJgBLAf/PDIvxoeZS1S
         Jtq3KPA4h/SOQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pfbjR-0002zx-15; Fri, 24 Mar 2023 08:21:01 +0100
Date:   Fri, 24 Mar 2023 08:21:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 1/2] phy: qcom-qmp-pcie: drop sdm845_qhp_pcie_rx_tbl
Message-ID: <ZB1PXVam/9TlLgqu@hovoldconsulting.com>
References: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 03:17:51AM +0300, Dmitry Baryshkov wrote:
> The SDM845 QHP PHY doesn't have designated RX region. Corresponding RX
> table is empty, so we can drop it completely.
> 
> Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")

This is not really a bug (and this is just a cleanup) so you can drop
the fixes tag (which looks incorrect anyway).

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Johan
