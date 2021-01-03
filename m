Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFD82E89D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 02:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbhACBbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jan 2021 20:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbhACBbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jan 2021 20:31:19 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600F9C061573
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jan 2021 17:30:24 -0800 (PST)
Received: from [192.168.1.101] (abac131.neoplus.adsl.tpnet.pl [83.6.166.131])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 934011F4AC;
        Sun,  3 Jan 2021 02:30:19 +0100 (CET)
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <63647a5d-e621-b2ce-fb2c-587b5a49f697@somainline.org>
Date:   Sun, 3 Jan 2021 02:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kind reminder that MSM8974, 8994, 8992 and friends are held back by the lack of IOMMU support upstream. There has been an attempt back in 2014(!) [1], but it was either overlooked or forgotten about ever since. I'd be more than happy to see someone look into this, as I have some other bits (almost) ready for both 8974 and 94, but MMUs aren't something I understand well enough yet.

Konrad


[1] https://lists.linuxfoundation.org/pipermail/iommu/2014-June/008993.html


