Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161855F810
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 14:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfGDM0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 08:26:35 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45584 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727676AbfGDM0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 08:26:35 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190704122633euoutp019428f6dee11efafca8da560c3847ad5e~uM_haF0YE2824228242euoutp01R
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2019 12:26:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190704122633euoutp019428f6dee11efafca8da560c3847ad5e~uM_haF0YE2824228242euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562243193;
        bh=3MtEWWvx6gqwDixQ5dHpVZg1D4dhpVO9nckP3J732x0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=iMSGc6pyR3y9zEdc6Mh5Bj1w+702dF1gurD3Ox8+0V09j+tK8EwV3l2gBFrzTRBCa
         sFgRhSB/7dAeihBWLSvZH5077BxWfuXSLqbOgDzgB66u0yTrHZcKJFl1hDprMer2pj
         Q04WiQ63oKhqCnXgKRSDSGFRF+AdwSvmoUJJtp2k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190704122632eucas1p2e95de9aba9a91739d1e0a83558669ded~uM_gkg6F91869518695eucas1p2a;
        Thu,  4 Jul 2019 12:26:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 2B.E2.04325.870FD1D5; Thu,  4
        Jul 2019 13:26:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190704122631eucas1p1ba141e3585757f1a5804ebf941f439a8~uM_fsCbJJ3031230312eucas1p1y;
        Thu,  4 Jul 2019 12:26:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190704122631eusmtrp1326547f44e3ec4d8a7d7a822a9b9ef48~uM_fd8RNs0872508725eusmtrp1_;
        Thu,  4 Jul 2019 12:26:31 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-8e-5d1df078fbb6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B8.FF.04140.770FD1D5; Thu,  4
        Jul 2019 13:26:31 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190704122631eusmtip2586506a3e54d779106da6aa7f906f1dd~uM_fDY3xu0709207092eusmtip2w;
        Thu,  4 Jul 2019 12:26:31 +0000 (GMT)
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: add link to datasheet
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2089b5bc-44bf-1dad-3e3d-08eff409335f@samsung.com>
Date:   Thu, 4 Jul 2019 14:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702154419.20812-2-robdclark@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7oVH2RjDR4+U7ToPXeSyeL/tonM
        Fle+vmez6Jy4hN1i4v6z7BaXd81hs7j28zGzxfOFP5gt7m44y+jA6TG74SKLx95vC1g8ds66
        y+4xu2Mmq8f2bw9YPe53H2fy+LxJLoA9issmJTUnsyy1SN8ugSvjxmq7gvdsFZOPH2ZsYLzE
        2sXIwSEhYCJx/XdZFyMXh5DACkaJhTdmsUE4Xxglvp6bxdLFyAnkfGaUWLu3FMQGadh49ChU
        fDmjRP/BQoiGt4wSJ2YvZQNJCAt4SPy4sx3MFhFwkThx6TcriM0s0MIksXFrLYjNJqAp8Xfz
        TbAaXgE7ieUbvoDVsAioSGxYcBLMFhWIkLi8ZRcjRI2gxMmZT8AWcwpYSnx5uRBqprxE89bZ
        zBC2uMStJ/OZQA6SEDjFLjF/0QpmiKtdJOZPe84OYQtLvDq+BcqWkTg9uYcFwq6XuL+ihRmi
        uYNRYuuGnVDN1hKHj18Ehxcz0NXrd+lDhB0lvq2dzQQJRj6JG28FIW7gk5i0bTozRJhXoqNN
        CKJaUeL+2a1QA8Ulll74yjaBUWkWks9mIflmFpJvZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgx
        t7g0L10vOT93EyMwSZ3+d/zrDsZ9f5IOMQpwMCrx8D7YIhMrxJpYVlyZe4hRgoNZSYT3+2+g
        EG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBkYT7d5P7WrW
        CutZzM60ezLt3BH401b8Qt5zR8mVCq8t6p5Erikx1pgh0WTJGDar8/6bzBX2XdY3uWOby45p
        RDo2pPEV3djzev3sWTZLz7j9F5uhLXMr7YG244Oarg7NCN2D1bqmm7iKz7+LS0/dYNYVeuKA
        1Mri6edv362Uynx3aI2gSmXgViWW4oxEQy3mouJEAMreMVROAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xe7rlH2RjDeY8UrfoPXeSyeL/tonM
        Fle+vmez6Jy4hN1i4v6z7BaXd81hs7j28zGzxfOFP5gt7m44y+jA6TG74SKLx95vC1g8ds66
        y+4xu2Mmq8f2bw9YPe53H2fy+LxJLoA9Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DY
        PNbKyFRJ384mJTUnsyy1SN8uQS/jxmq7gvdsFZOPH2ZsYLzE2sXIySEhYCKx8ehRFhBbSGAp
        o8TkS+YQcXGJ3fPfMkPYwhJ/rnWxdTFyAdW8ZpT48OkFWIOwgIfEjzvb2UBsEQEXiROXfrOC
        FDELtDFJXNzbxgrRsZtRYm7jVSaQKjYBTYm/m2+CdfAK2Eks3/AF7AwWARWJDQtOgtmiAhES
        fW2zoWoEJU7OfAK2jVPAUuLLy4VgNcwC6hJ/5l1ihrDlJZq3zoayxSVuPZnPNIFRaBaS9llI
        WmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwOjcduznlh2MXe+CDzEKcDAq
        8fA+2CITK8SaWFZcmXuIUYKDWUmE9/tvoBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNH
        Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRo8tnu3CVdpT1k/e
        9Wayde/sg+aXDATKLf/2qR+8o1L87d06q2leQSEM6/T2tjOJe7md89m+y6c8yFq9J9P7+Jn/
        755/Fbp5/k4ek8LBMzsqQrky/UwnpF527ylp0lvGEvlg96rt1Zeb+S8eMhBX5rC+4HKg2ULs
        EUfz4Z431/h7Eyb++r+lRYmlOCPRUIu5qDgRAHLmH1fkAgAA
X-CMS-MailID: 20190704122631eucas1p1ba141e3585757f1a5804ebf941f439a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190702154438epcas1p2493f1bde0f16a5bdd63f884826e2071c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154438epcas1p2493f1bde0f16a5bdd63f884826e2071c
References: <20190702154419.20812-1-robdclark@gmail.com>
        <CGME20190702154438epcas1p2493f1bde0f16a5bdd63f884826e2071c@epcas1p2.samsung.com>
        <20190702154419.20812-2-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02.07.2019 17:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> The bridge has pretty good docs, lets add a link to make them easier to
> find.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index bcca9173c72a..f1a2493b86d9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + * datasheet: http://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
>   */
>  
>  #include <linux/clk.h>


