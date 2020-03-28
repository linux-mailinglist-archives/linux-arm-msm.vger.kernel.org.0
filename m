Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A8019694A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 21:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgC1Ukv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 16:40:51 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:52362 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgC1Ukv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 16:40:51 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9218E20030;
        Sat, 28 Mar 2020 21:40:48 +0100 (CET)
Date:   Sat, 28 Mar 2020 21:40:47 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200328204047.GG32230@ravnborg.org>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327073636.13823-1-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
        a=_-RXmzA4W026I1OARrkA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harigovindan

On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> 
> Harigovindan P (2):
>   dt-bindings: display: add visionox rm69299 panel variant
>   drm/panel: add support for rm69299 visionox panel driver

I have only the first patch, which is now applied.
Please resend second patch as it is lost somewhere.

	Sam

> 
>  .../display/panel/visionox,rm69299.yaml       |  58 ++++
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 295 ++++++++++++++++++
>  4 files changed, 362 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
