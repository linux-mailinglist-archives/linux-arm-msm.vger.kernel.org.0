Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0835256D105
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 21:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiGJTMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 15:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiGJTMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 15:12:36 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107F414D0C
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 12:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=mhy9fguw7oNBUNA4++MQTJEkbokGyq0g3XiuEESLdIU=;
        b=OE/o8T4ZCwPIeBTZ+7m0wqq2yrjnsgLQ6XsiyKPe8osdC1dOE32nKZ1aBZcSLxCmPZeaglZ7oERO5
         8AleqM+Vyd6lITxE/74YOi/jJNbhrt3Tbfqc2fqxrxdVcnSE7dmh0HcbVx9jIIzjRzZgajQaIJBEPM
         lt1SEPAmSthSC13ss1Z6iCV8GQMrQyhNQaHSPUVxnwoF2ZwdNbNkAzoBq+zNvjL9TLRyZniffw6f9C
         L837DfmFJlDEBjZMUHrzPSxNHXyeOytbg3pWNrhvfiKH+HlV1oWBuNqxK74DMPg4X2nFhq0wdAJOY5
         rrFuasOqDHP0fIEx+3gZngJyaIb9siw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=mhy9fguw7oNBUNA4++MQTJEkbokGyq0g3XiuEESLdIU=;
        b=RnA47xY/feXtfjBaI/zXv59+eR6HvtjUGxqoWU/9C2bZ133QpDO+vgby3a0dfvnP8nYReJODysnIp
         MWK/7moAw==
X-HalOne-Cookie: bbd82aec0b2170f761b40db99c68fcbf359bab34
X-HalOne-ID: 3fbbe948-0084-11ed-823d-d0431ea8bb10
Received: from mailproxy3.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 3fbbe948-0084-11ed-823d-d0431ea8bb10;
        Sun, 10 Jul 2022 19:12:32 +0000 (UTC)
Date:   Sun, 10 Jul 2022 21:12:31 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [RFC PATCH 3/3] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <Ysskn7pd+HxujsGN@ravnborg.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710184536.172705-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Sun, Jul 10, 2022 at 09:45:36PM +0300, Dmitry Baryshkov wrote:
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
