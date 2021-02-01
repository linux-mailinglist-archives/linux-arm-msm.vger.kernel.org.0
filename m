Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB9030A1D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 07:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhBAGFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 01:05:34 -0500
Received: from vps5.brixit.nl ([192.81.221.234]:48438 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231759AbhBAF5O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 00:57:14 -0500
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id A5E7C60618;
        Mon,  1 Feb 2021 05:56:13 +0000 (UTC)
Subject: Re: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210127152442.533468-1-iskren.chernev@gmail.com>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <666723e2-0d5f-3f7e-3607-f9df0ffbd1c6@postmarketos.org>
Date:   Mon, 1 Feb 2021 08:57:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127152442.533468-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/27/21 6:24 PM, Iskren Chernev wrote:
> Before the offending commit in msm_atomic_commit_tail wait_flush was
> called once per frame, after the commit was submitted. After it
> wait_flush is also called at the beginning to ensure previous
> potentially async commits are done.
> 
> For cmd panels the source of wait_flush is a ping-pong irq notifying
> a completion. The completion needs to be notified with complete_all so
> multiple waiting parties (new async committers) can proceed.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Fixes: 2d99ced787e3d ("drm/msm: async commit support")
> 

Tested on msm8974pro samsung-klte, finally got 60 fps instead of 13
in kmscube.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
