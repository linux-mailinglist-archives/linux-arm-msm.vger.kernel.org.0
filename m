Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C76874428
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 05:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390181AbfGYD4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 23:56:13 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:51085 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390180AbfGYD4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 23:56:13 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20190725035611epoutp03c833b3935024a795d1c91bf96ff54114~0ij5ljt2L1659516595epoutp03k
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:56:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20190725035611epoutp03c833b3935024a795d1c91bf96ff54114~0ij5ljt2L1659516595epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564026971;
        bh=C716pIFwHZ+WjhDZMOaClxutDoCMBDIKk7zqcZGKoyU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=IP17u1Od1O1MNo7Vg/MXwBG7R2nHiXWw7+aCi7jIvEEKDT0s7h5BOzphtHDb7+avb
         CkzFaVSDia1glZKDlVe58HDuXYHQwmvPYw+3yaK98Rutf+XgtU6uNijJ4Fjzv30hHr
         qW87nGzQ97nvOxVlrC9IJ0qKjxb0n40nP15YnztE=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190725035610epcas1p4ff863f31e033356100127d9f617b61fa~0ij5I9bAC0134701347epcas1p4Q;
        Thu, 25 Jul 2019 03:56:10 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
        epsnrtp5.localdomain (Postfix) with ESMTP id 45vJKg4DmjzMqYkg; Thu, 25 Jul
        2019 03:56:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        71.8B.04160.058293D5; Thu, 25 Jul 2019 12:56:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20190725035600epcas1p4764e5582e760704ee036ca7648c8fca0~0ijvkdiZP2737927379epcas1p41;
        Thu, 25 Jul 2019 03:56:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190725035600epsmtrp1494170a58a4c52ea398f8d4979bca408~0ijvjnu_O1439114391epsmtrp1Q;
        Thu, 25 Jul 2019 03:56:00 +0000 (GMT)
X-AuditID: b6c32a38-b33ff70000001040-8f-5d3928500a94
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E0.31.03638.058293D5; Thu, 25 Jul 2019 12:56:00 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190725035600epsmtip1552edd7a99b30703bf8b3ccc8b9a374f~0ijvZUQ8S1446314463epsmtip1L;
        Thu, 25 Jul 2019 03:56:00 +0000 (GMT)
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
To:     Yue Hu <zbestahu@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
        robdclark@gmail.com, sean@poorly.run, robh@kernel.org,
        tomeu.vizoso@collabora.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, myungjoo.ham@samsung.com,
        huyue2@yulong.com, zhangwen@yulong.com
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <ecd5c975-615d-2cd0-5507-9ee89e0a228b@samsung.com>
Date:   Thu, 25 Jul 2019 12:59:20 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNJsWRmVeSWpSXmKPExsWy7bCmrm6AhmWswYp2XYvecyeZLP5vm8hs
        ceXrezaLOc/PMlrsmX2X2WLi/rPsFrcbV7BZPF/4g9ni/54d7BZ3Jx9htOhbe4nNYu4pLosD
        S16zOPB67Li7hNFj77cFLB47Z91l99i0qpPNY/u3B6we97uPM3kc33WL3aNvyypGj8+b5Dy2
        rlnMHMAVlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZ
        A3S8kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAskCvODG3uDQvXS85P9fK0MDA
        yBSoMCE7o2nCA+aCxfwV8/tvszUwvuTpYuTkkBAwkVj6YRN7FyMXh5DADkaJtbM72SCcT4wS
        HW2TWSGcb4wSy9ubWGBa5p78ywyR2MsoceDjJ0aQhJDAe0aJr9uLQWxhgVCJ9/c/gBWJCMxk
        lHh7+zuYwyywklFiatNkdpAqNgEtif0vbrCB2PwCihJXfzwGm8QrYCdxc+9/sBoWAVWJTdOn
        MIHYogIREp8eHGaFqBGUODnzCdhJnALmEs86z4DNYRYQl7j1ZD4ThC0v0bx1NjPE2fvYJa7u
        4e1i5ACyXSS2bzWDCAtLvDq+hR3ClpJ42d8GZVdLrDx5BBwWEgIdjBJb9l9ghUgYS+xfOpkJ
        ZA6zgKbE+l36EGFFiZ2/5zJCrOWTePe1hxViFS8wGIUgSpQlLj+4ywRhS0osbu9km8CoNAvJ
        M7OQPDALyQOzEJYtYGRZxSiWWlCcm55abFhgghzbmxjBCVvLYgfjnnM+hxgFOBiVeHg5kixi
        hVgTy4orcw8xSnAwK4nwBjaYxQrxpiRWVqUW5ccXleakFh9iNAWG9URmKdHkfGA2ySuJNzQ1
        MjY2tjAxNDM1NFQS5134A2iOQHpiSWp2ampBahFMHxMHp1QD44orHLxfv4czucWVvuZOqMw5
        027hG8iyyF9z9mzNaQmfXqT1vDt31icpQr4l5ePl+fE3i041zIjpFFy9cX2ImNA613fda//H
        vsoXVedx4PwQ/7GoI5zZMPje1XUP1D89S1v66YmroW7wz+Yv6fdUP84L5337Rzn2uwDz+6KK
        tiCWznP+Va6TlViKMxINtZiLihMB98bZJ+4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsWy7bCSnG6AhmWswakP4ha9504yWfzfNpHZ
        4srX92wWc56fZbTYM/sus8XE/WfZLW43rmCzeL7wB7PF/z072C3uTj7CaNG39hKbxdxTXBYH
        lrxmceD12HF3CaPH3m8LWDx2zrrL7rFpVSebx/ZvD1g97ncfZ/I4vusWu0ffllWMHp83yXls
        XbOYOYArissmJTUnsyy1SN8ugSujacID5oLF/BXz+2+zNTC+5Oli5OSQEDCRmHvyL3MXIxeH
        kMBuRolb/8+wQSQkJaZdPAqU4ACyhSUOHy6GqHnLKPH22V52kBphgVCJ9/c/gDWLCMxklPhy
        5xgbiMMssJJR4uuLnewQLV2MEj1nLjGBtLAJaEnsf3EDbAW/gKLE1R+PGUFsXgE7iZt7/4ON
        ZRFQldg0fQpYvahAhMThHbOgagQlTs58wgJicwqYSzzrhDiVWUBd4s+8S8wQtrjErSfzmSBs
        eYnmrbOZJzAKz0LSPgtJyywkLbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7
        iREcv1paOxhPnIg/xCjAwajEw8uRZBErxJpYVlyZe4hRgoNZSYQ3sMEsVog3JbGyKrUoP76o
        NCe1+BCjNAeLkjivfP6xSCGB9MSS1OzU1ILUIpgsEwenVAOjpUVrw+Zbpi7yS3hDb619Jikk
        GH7MTGa7uEiu3aMPMy+ZyGRdF0xUZFtdE+ofsGDZ8eVF1+NOPO5R2hf8fbOpaoposfbNLBmO
        b/Pv2IcdO2QqY1fqcNJOOsvR+1pVsnSZ20kuVcUdn9u8xJQcvsi0FKrabejtYPxsrBB0P02A
        na3qpyJvjBJLcUaioRZzUXEiANJ3c1/bAgAA
X-CMS-MailID: 20190725035600epcas1p4764e5582e760704ee036ca7648c8fca0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190725035308epcas3p3dbb085335947fc1675773baecbad012e
References: <CGME20190725035308epcas3p3dbb085335947fc1675773baecbad012e@epcas3p3.samsung.com>
        <20190725035239.1192-1-zbestahu@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19. 7. 25. 오후 12:52, Yue Hu wrote:
> From: Yue Hu <huyue2@yulong.com>
> 
> Since governor name is defined by DEVFREQ framework internally, use the
> macro definition instead of using the name directly.
> 
> Signed-off-by: Yue Hu <huyue2@yulong.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c               | 3 ++-
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4edb874..f7308d6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -95,7 +95,8 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>  	 */
>  
>  	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
> -			&msm_devfreq_profile, "simple_ondemand", NULL);
> +			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
>  
>  	if (IS_ERR(gpu->devfreq.devfreq)) {
>  		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index db79853..a7c18bc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -157,7 +157,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	dev_pm_opp_put(opp);
>  
>  	pfdev->devfreq.devfreq = devm_devfreq_add_device(&pfdev->pdev->dev,
> -			&panfrost_devfreq_profile, "simple_ondemand", NULL);
> +			&panfrost_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
>  	if (IS_ERR(pfdev->devfreq.devfreq)) {
>  		DRM_DEV_ERROR(&pfdev->pdev->dev, "Couldn't initialize GPU devfreq\n");
>  		ret = PTR_ERR(pfdev->devfreq.devfreq);
> 

The include/linux/devfreq.h defines the governor name.
It looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
