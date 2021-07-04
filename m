Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38453BB46E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 01:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhGDXmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 19:42:44 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:38050 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhGDXmo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 19:42:44 -0400
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 566736086F;
        Sun,  4 Jul 2021 23:40:05 +0000 (UTC)
Subject: Re: [Freedreno] [RFC 3/6] drm/msm/mdp5: move
 mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
 <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <95f0c71f-2d22-98c0-a587-1125070b11de@postmarketos.org>
Date:   Mon, 5 Jul 2021 02:41:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/10/21 12:17 AM, Dmitry Baryshkov wrote:
 > Move a call to mdp5_encoder_set_intf_mode() after
 > msm_dsi_modeset_init(), removing set_encoder_mode callback.
 >
 > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 > ---
 >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 >   1 file changed, 3 insertions(+), 8 deletions(-)
 >

My Samsung Galaxy S5 with mdp5 and cmd mode panel seems to work same as 
before with these patches applied.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

