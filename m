Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34996784266
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 15:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235888AbjHVNvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 09:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbjHVNvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 09:51:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392531B9;
        Tue, 22 Aug 2023 06:51:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6C23630B5;
        Tue, 22 Aug 2023 13:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D52DC433C8;
        Tue, 22 Aug 2023 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692712272;
        bh=eNJ1ArCqNfDsBkko0rVolZfY4UgGf4CCVx88itGrCnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oy3NM4aapbcthQupb6Wm6LrjFaAYu6eNbEScDHGjGQcGoquI3t1j3wrpzY/39j1f0
         k824I6VSQB5FRQIiXT9vjs0gOMHMpPxrKORx3ogRQB22SkPONdxLFMRwyttaxC+8Py
         /gY5g/+6jaSoxJ0Ht0yxsD2wcrDyMe9dE5v7iN0epWTNFCq1hRmqPIbzM7I1YXzacT
         kj71yI21OzXtBju9xYk65XVAsgQ00sSJCsDAk7ihqMsRjigyxMJLSWd/aWh5Ul3tS4
         xKS+RDG9XL++zpnUssbvyWD4pzkFMDwsn+SWxexVPOD+HVpgw/ia0BEViqqhRcEEa3
         g0tpZDF9aCORg==
Date:   Tue, 22 Aug 2023 19:21:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
Message-ID: <ZOS9SxQTWcKM+CBa@matsya>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230817145516.5924-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817145516.5924-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-08-23, 17:55, Dmitry Baryshkov wrote:
> Switch to using the new DRM_AUX_BRIDGE helper to create the
> transparent DRM bridge device instead of handcoding corresponding
> functionality.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
