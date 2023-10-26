Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB43B7D7A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 03:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbjJZBud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 21:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjJZBud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 21:50:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457D2CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 18:50:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC20C433C8;
        Thu, 26 Oct 2023 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698285030;
        bh=ai96/RiTaKCJnWhue29McKV3xTzXFBhmH0+o2CsH4Io=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qVC63HLI7G9VZt/ONftTpoPf5QaFBoC0f8ud9OHi4c857yXk/aZ7c6nAIbbA6k+Nf
         WyYbj93LT14uWYrq/rnV8inw+lnPR02fzSN7j0DyNUjwgq5wmZkj3eSWQArG9v07sO
         kYXrvtVWfSslQjClVYtGR09R4v1hjMlqQz+RaX1v/srB78B+einke9R/X7F+tVyfsT
         sWJUN9vYWwIvfDDqFVXSOZAZa0gY8u8o4YEhPXNlaCOM+y3PZxqs95r04qa+Ry7pDD
         OKTaGM7uY/nlZAmhMgAUyazeutDQ9VoGg8WmucniDVh0DJi3BP+fXAAXitwiL8RE+9
         QeffXn+7Xrmvg==
Date:   Wed, 25 Oct 2023 18:54:47 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 5/6] soc: qcom: pmic-glink: switch to
 DRM_AUX_HPD_BRIDGE
Message-ID: <owpnaizakfjqyzcxcmdfoi3kdjopzsq2iwufzudi3lqi66psru@zhr3m5i4t3b6>
References: <20231025223027.943563-1-dmitry.baryshkov@linaro.org>
 <20231025223027.943563-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025223027.943563-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 26, 2023 at 01:28:06AM +0300, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
