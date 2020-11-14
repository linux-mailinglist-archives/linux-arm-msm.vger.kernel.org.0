Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7252B306D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 20:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgKNT6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 14:58:48 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:58318 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgKNT6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 14:58:48 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 2DE2F8054C;
        Sat, 14 Nov 2020 20:58:45 +0100 (CET)
Date:   Sat, 14 Nov 2020 20:58:43 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/panel/samsung-sofef00: Add panel for OnePlus 6/T
 devices
Message-ID: <20201114195843.GA3900471@ravnborg.org>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-2-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-2-caleb@connolly.tech>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=OPaO7OcAVtVQApmh9Q0A:9 a=CjuIK1q_8ugA:10
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Caleb,
On Thu, Nov 12, 2020 at 04:21:13PM +0000, Caleb Connolly wrote:
> The OnePlus 6/T devices use different panels however they are
> functionally identical with the only differences being the resolution.
> The panels also don't seem to be used by any other devices, just combine
> them into one driver.
> 
> The panels are: samsung,sofef00
> and             samsung,s6e3fc2x01
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Thanks, applied to drm-misc-next.
Fixed a few checkpatch --strict warnings when applying.
Please check with --strict in the future.

	Sam
