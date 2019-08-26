Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F659D8E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 00:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfHZWPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 18:15:05 -0400
Received: from gloria.sntech.de ([185.11.138.130]:55382 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbfHZWPF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 18:15:05 -0400
Received: from [104.132.1.107] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1i2NGB-0006X1-3B; Tue, 27 Aug 2019 00:14:47 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND 06/14] drm: rockchip: Provide ddc symlink in inno_hdmi sysfs directory
Date:   Tue, 27 Aug 2019 00:14:41 +0200
Message-ID: <4123730.fx8cIkYQ17@phil>
In-Reply-To: <a1f778d328328f15300338600bb2400850717300.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com> <a1f778d328328f15300338600bb2400850717300.1566845537.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am Montag, 26. August 2019, 21:25:48 CEST schrieb Andrzej Pietrasiewicz:
> Use the ddc pointer provided by the generic connector.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



