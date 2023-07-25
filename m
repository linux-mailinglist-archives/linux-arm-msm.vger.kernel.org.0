Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEABD761FB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 19:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbjGYRB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 13:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbjGYRBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 13:01:55 -0400
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A071985
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=HEYKn4NMMmasVQNcFwCa+HiHodnKGFk+SvBVj8VNFfw=;
        b=A6DQf5Av/0e8e9EBLoEAHflwSlep3BKEYaCQ8x3w8yy18fUjuqioILQ4kcrmtzIGnZSMImZqt0fQd
         Axs2ah8kn6ezQiWIRvbFdIT4NJiIMiFpYK4hiOs72oEDrkZ+EWAZaVpHfddUSZoOjFtqJDlC7A0bDE
         hXWfitYQq6BPSRl9hzdhNhsOOqBtA9SOUbj2ZQ0UN5VSPqC1sxtQp5DgU7bpjcTag54vCmPa9O+UJp
         45jGC8PgzZSLIMmYZI3VQnQCs5kLKVIN3suAtIDGfVbKp6/zS2W11KoKrvSpGuTNE5BkJ+qnhT7wGV
         +IzVsrL2O1loZCqU2Z7Vp5lGtRuhtyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=HEYKn4NMMmasVQNcFwCa+HiHodnKGFk+SvBVj8VNFfw=;
        b=uh0ldvFXcrw7PKCrKzTWVanDCUzmOkVysrpJQxgzGrITYOjs6QsEC3OQYjLhhQ5wH1lioJT7lDnzL
         L8AZXoNCA==
X-HalOne-ID: f087e3ad-2b0c-11ee-9e67-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay1 (Halon) with ESMTPSA
        id f087e3ad-2b0c-11ee-9e67-99461c6a3fe8;
        Tue, 25 Jul 2023 17:01:49 +0000 (UTC)
Date:   Tue, 25 Jul 2023 19:01:47 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     liviu.dudau@arm.com, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, neil.armstrong@linaro.org,
        quic_eberman@quicinc.com, a39.skl@gmail.com,
        quic_gurus@quicinc.com, angelogioacchino.delregno@somainline.org,
        james.qian.wang@arm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 1/3] drm/panel: Fix IS_ERR() vs NULL check in
 nt35950_probe()
Message-ID: <20230725170147.GB838289@ravnborg.org>
References: <20230725013957.1237590-1-cuigaosheng1@huawei.com>
 <20230725013957.1237590-2-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725013957.1237590-2-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 25, 2023 at 09:39:55AM +0800, Gaosheng Cui wrote:
> The mipi_dsi_device_register_full() returns an ERR_PTR() on failure,
> we should use IS_ERR() to check the return value.
> 
> By the way, use dev_err_probe instead of dev_err to print the error code.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Looks good, thanks for the update.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
