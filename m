Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E7E82DD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 10:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732045AbfHFIge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 04:36:34 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58108 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728845AbfHFIge (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 04:36:34 -0400
Received: from wf0413.dip.tu-dresden.de ([141.76.181.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1huux4-0003Qy-MP; Tue, 06 Aug 2019 10:36:14 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 05/13] drm: rockchip: Provide ddc symlink in inno_hdmi sysfs directory
Date:   Tue, 06 Aug 2019 10:36:13 +0200
Message-ID: <5678760.RHkh9mv3Rf@phil>
In-Reply-To: <52272b8ebf403361ff96e04bf14f5a7389116f73.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com> <cover.1564591626.git.andrzej.p@collabora.com> <52272b8ebf403361ff96e04bf14f5a7389116f73.1564591626.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am Mittwoch, 31. Juli 2019, 18:58:14 CEST schrieb Andrzej Pietrasiewicz:
> Use the ddc pointer provided by the generic connector.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>




