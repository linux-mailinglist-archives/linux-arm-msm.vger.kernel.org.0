Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8427C344F85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 20:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhCVTBf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 15:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbhCVTBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 15:01:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BA9C061574;
        Mon, 22 Mar 2021 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=NaJYCCGTYkREd4ErnfOF5a3JMkC3tPK3uYGREJCezYA=; b=oTja58ElOEg0ruPR0V+4H8vDnN
        jgja2eFUekR7oKgsRalciS4c3w2b2/sRDjPRbp/HVbvINDaRdqBVLYnaRG10oD1J+9g/kVLFuINJc
        j4oUKTL7ZGr2zmh5ZBVqJglwtx507nNaYIV9X2GDnf1PRMlQWCjspYZBbvjZkxC3j6bUENrdqjifR
        QbugoWK7Ux16IghqkyjeP48x5XJxnwe1zQ9hGIL+t3wHEcYRf5NlRAT02k1XE1FZpEA2E/wrwmmMF
        Q7QbvmKoyJfOfHqX65w8FlOH6B+5FwhHPTBH3IiXQXUYHBj///UN4kwbu4l6sIc2yNq1lkm6ouAph
        NMXuVObw==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOPmt-008wro-C8; Mon, 22 Mar 2021 19:00:43 +0000
Subject: Re: [PATCH] drm/msm/dpu: Fix a typo
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jonathan@marek.ca, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210322062723.3215931-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5afd0d4b-4e78-416d-f487-885d24f2eaf3@infradead.org>
Date:   Mon, 22 Mar 2021 12:00:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322062723.3215931-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/21/21 11:27 PM, Bhaskar Chowdhury wrote:
> 
> s/struture/structure/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 09a3fb3e89f5..bb9ceadeb0bb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -343,7 +343,7 @@ enum dpu_3d_blend_mode {
> 
>  /** struct dpu_format - defines the format configuration which
>   * allows DPU HW to correctly fetch and decode the format
> - * @base: base msm_format struture containing fourcc code
> + * @base: base msm_format structure containing fourcc code
>   * @fetch_planes: how the color components are packed in pixel format
>   * @element: element color ordering
>   * @bits: element bit widths
> --


-- 
~Randy

