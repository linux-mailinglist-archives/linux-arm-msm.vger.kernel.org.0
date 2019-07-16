Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B8A6A354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 09:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbfGPHzj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 03:55:39 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35890 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfGPHzi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 03:55:38 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190716075536euoutp020346f7418719e14d50b23101f0aab69d~x1BX_ihGS1730617306euoutp02G
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2019 07:55:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190716075536euoutp020346f7418719e14d50b23101f0aab69d~x1BX_ihGS1730617306euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563263736;
        bh=z6y7NH+vNk3T1ssuE0A9cgVBd5PD4K/HolMVUCfpspA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Xq9GjXYzU2yfj9rZyER6r6evZXM52qEju7JwG2JwcBkbWGLRmDckElNQS+reCV8Ar
         9FR7LBOhYn9gDAdL5aOehLQY/LkmvGM1Xs6/fpuyuPD40w6ad7+9Nx4QOjmrX3MtdI
         Bk1XxR5/zdLmn8PnFHtIQ8IfQNfMwV0Bq2kwyWBk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190716075535eucas1p16e3c9bd2c6a81a2d69a01536d3e47b97~x1BXTan9g0611406114eucas1p1t;
        Tue, 16 Jul 2019 07:55:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A5.66.04377.7F28D2D5; Tue, 16
        Jul 2019 08:55:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190716075535eucas1p2987295d2e6c1c58d74e63751e4e6186f~x1BWnAEXV0505305053eucas1p25;
        Tue, 16 Jul 2019 07:55:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190716075534eusmtrp24dd210399b998667f2080efffbf50582~x1BWY6m7w2904429044eusmtrp24;
        Tue, 16 Jul 2019 07:55:34 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-0f-5d2d82f7e7ec
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F2.37.04140.6F28D2D5; Tue, 16
        Jul 2019 08:55:34 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190716075534eusmtip2fe32f7e8fda2cf154e39f4210d86b94a~x1BV-Q9qa0506705067eusmtip2D;
        Tue, 16 Jul 2019 07:55:34 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ac6cfa51-8b66-a98d-1a69-710e0d4c552b@samsung.com>
Date:   Tue, 16 Jul 2019 09:55:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190706203105.7810-1-robdclark@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87rfm3RjDa70Klv0njvJZPF/20Rm
        iytf37NZdE5cwm4xcf9ZdovLu+awWVz7+ZjZ4vnCH8wOHB6zGy6yeOz9toDFY+esu+wesztm
        snps//aA1eN+93Emj8+b5ALYo7hsUlJzMstSi/TtErgyjn9ZzV7wjqli26rIBsblTF2MnBwS
        AiYSu/esY+li5OIQEljBKPFu7nR2COcLo8TNVfdZQaqEBD4zSnybaQ3TMfXcLSaIouWMEnNf
        Todqf8socWbCZCCHg0NYwF3izBY9kAYRAReJE5d+s4LUMAs8ZJRoPTKHHSTBJqAp8XfzTTYQ
        m1fATmJXy02wOIuAqsS/99OYQWxRgTCJnws6oWoEJU7OfMICYnMKWEjMm3gH7AdmAXmJ7W/n
        MEPY4hK3nswHu05C4BS7xPV1e9khznaRWNk9kRnCFpZ4dXwLVFxG4v/O+dDAqJe4v6KFGaK5
        g1Fi64adUA3WEoePX2QF+YwZ6Or1u/Qhwo4Sa+7OBwtLCPBJ3HgrCHEDn8SkbdOZIcK8Eh1t
        QhDVihL3z26FGigusfTCV7YJjEqzkHw2C8k3s5B8Mwth7wJGllWM4qmlxbnpqcVGeanlesWJ
        ucWleel6yfm5mxiB6en0v+NfdjDu+pN0iFGAg1GJh/fEHp1YIdbEsuLK3EOMEhzMSiK8tl+1
        Y4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwNn1gvvw6
        5CfDnxvHGlR+7UjY2mubsCuFV/rTDP11EaoG9Vy98UHTEyJXM375LWDEL3pb2Oxw4d+9a4Ru
        819ZmHQzK6j8aNYV35nPtz05+zY8yuXAX/NVq9pLpGepRNUvrNBwZdmacmbTtC9dCc5zKrfu
        vFMmyZmlF2yy+KKhoToHv0v9uX/LlFiKMxINtZiLihMBqOtFC0sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xe7rfmnRjDa7eMrLoPXeSyeL/tonM
        Fle+vmez6Jy4hN1i4v6z7BaXd81hs7j28zGzxfOFP5gdODxmN1xk8dj7bQGLx85Zd9k9ZnfM
        ZPXY/u0Bq8f97uNMHp83yQWwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq
        6dvZpKTmZJalFunbJehlHP+ymr3gHVPFtlWRDYzLmboYOTkkBEwkpp67BWRzcQgJLGWUuLHj
        ECNEQlxi9/y3zBC2sMSfa11sILaQwGtGiaUHVbsYOTiEBdwlzmzRAwmLCLhInLj0mxVkDrPA
        Q0aJSf2b2CGGdjNK/Hu0CKyZTUBT4u/mm2A2r4CdxK6Wm+wgNouAqsS/99OYQYaKCoRJHD2R
        B1EiKHFy5hMWEJtTwEJi3sQ7YEczC6hL/Jl3iRnClpfY/nYOlC0ucevJfKYJjEKzkLTPQtIy
        C0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG47ZjP7fsYOx6F3yIUYCDUYmH
        98QenVgh1sSy4srcQ4wSHMxKIry2X7VjhXhTEiurUovy44tKc1KLDzGaAv02kVlKNDkfmCry
        SuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwXtR6PHPBV9uciTzv
        ja0j3u02lfm1dx+j2ILvYQ7VOn62lUY2MfvnrOZSOtZ32PDoysCJFp+3bNj+9aeLUThz9UNT
        UfV/Syz5IoMKX3scfHe/LqJfcu2hLXapj2fu/rfggbLbxdCVxRn/J7Q0iNzJ2sYq9IY9qS14
        n5doaedf6azQ3+dn/c80UWIpzkg01GIuKk4EABog2tXdAgAA
X-CMS-MailID: 20190716075535eucas1p2987295d2e6c1c58d74e63751e4e6186f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190706203123epcas2p4094186d4d2d9954d6068c03b99df07a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706203123epcas2p4094186d4d2d9954d6068c03b99df07a2
References: <CGME20190706203123epcas2p4094186d4d2d9954d6068c03b99df07a2@epcas2p4.samsung.com>
        <20190706203105.7810-1-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06.07.2019 22:31, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> This should be more future-proof if we ever encounter a device with two
> of these bridges.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Queued to drm-misc-next.


Regards

Andrzej



