Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F423765FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 14:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfGZMga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 08:36:30 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:33924 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfGZMg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 08:36:29 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A8FC880482;
        Fri, 26 Jul 2019 14:36:26 +0200 (CEST)
Date:   Fri, 26 Jul 2019 14:36:25 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add Sharp panel option for Lenovo Miix 630
Message-ID: <20190726123625.GA17037@ravnborg.org>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=HQdGnUN6SEKGFpM_q2QA:9 a=CjuIK1q_8ugA:10
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey.

On Mon, Jul 08, 2019 at 09:56:47AM -0700, Jeffrey Hugo wrote:
> The Lenovo Miix 630 laptop can be found with one of two panels - a BOE
> or Sharp option.  This likely provides options during manufacturing.
> 
> These panels connect via eDP, however they sit behind a DSI to eDP
> bridge on the laptop, so they can easily be handled by the existing
> simple panel code.
> 
> This series adds support for the Sharp option.
> 
> v2:
> -removed no-hpd from dt example
> -added .bus_format and .bus_flags fields based on reviews
> -added .flags after Bjorn pointed me to something I missed
> -added Sam's reviewed-by tags
> 
> Jeffrey Hugo (2):
>   dt-bindings: panel: Add Sharp LD-D5116Z01B
>   drm/panel: simple: Add support for Sharp LD-D5116Z01B panel

Thanks.
Both patches applied and pushed to drm-misc-next.

Are you up to a little janitorial work?
Today the preferred format for bindings files are the new yaml format.
Could you update 'your' file, and maybe the other sharp files too?
It would be good to have some progress in this.

	Sam
