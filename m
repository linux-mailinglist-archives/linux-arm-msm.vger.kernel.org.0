Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE35F903
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 15:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfGDNS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 09:18:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57652 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDNS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 09:18:58 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190704131857euoutp02fbd87d3f61ceeb21c43bd280e9fcd427~uNsQ-gS8u1019010190euoutp02C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2019 13:18:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190704131857euoutp02fbd87d3f61ceeb21c43bd280e9fcd427~uNsQ-gS8u1019010190euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562246337;
        bh=pWS5uTzed4I4itabuM22N0z+ZBA0Fku7rHWXF8l5i4Y=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=vBVX8xcr6OyvUNeC3h7Pn62pAy8z4ZVdorJQJbE7cW56sKQzgKopgNmD5AZkU6mCi
         WfscY/puNu12IDNmquhODpHmV2LFuJr27FdpCBm0aJxfHiMWlhtIsu3k49NLazVzS8
         gZYFx7vJlXtDfamYnzvuL3Ny5htGzlq78mJ8nva8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190704131856eucas1p261fa99892b032f702603259215f946b1~uNsQdWXwF0897508975eucas1p2L;
        Thu,  4 Jul 2019 13:18:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B0.6B.04325.0CCFD1D5; Thu,  4
        Jul 2019 14:18:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190704131855eucas1p214a64282c2c4a34f914856de5375e384~uNsPu0OBt2966129661eucas1p2r;
        Thu,  4 Jul 2019 13:18:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190704131855eusmtrp106ab7f9cc474ab2190ee53c92a772628~uNsPg1VFr1038010380eusmtrp1J;
        Thu,  4 Jul 2019 13:18:55 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-61-5d1dfcc047a9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id EA.B7.04140.FBCFD1D5; Thu,  4
        Jul 2019 14:18:55 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190704131855eusmtip210c90421921eeba5b581e1ca23781466~uNsPONUK90902209022eusmtip2E;
        Thu,  4 Jul 2019 13:18:55 +0000 (GMT)
Subject: Re: [PATCH 0/3] drm/bridge: ti-sn65dsi86: debugfs and mode_flags
 fix
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        Sean Paul <seanpaul@chromium.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <081baf6c-6b29-f7d5-37ea-d1ecb217846a@samsung.com>
Date:   Thu, 4 Jul 2019 15:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702154419.20812-1-robdclark@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87oH/sjGGpx9LWxx5et7NouJ+8+y
        W1z7+ZjZ4vnCH8wWdzecZXRg9ZjdcJHFY+esu+we97uPM3l83iQXwBLFZZOSmpNZllqkb5fA
        lfG48yh7QS9bxbG57xgbGD+xdDFyckgImEjs/TmBvYuRi0NIYAWjxI13OxghnC+MEg8mbGGD
        cD4zSjQ8WMQE0/L1xEtmiMRyRomds96zgSSEBN4ySmw+6Q9iCwv4S/yeO5MZxBYRcJE4cek3
        K4jNLJAl8Wj6T7DdbAKaEn833wTr5RWwk7j89iFYnEVARWL/qRtgvaICERKXt+xihKgRlDg5
        8wlQDQcHp4ClxJ55XBAj5SW2v53DDGGLS9x6Mp8J5DYJgensEhfO/WCGONpFYuXhuVA/C0u8
        Or6FHcKWkTg9uQcqXi9xf0ULM0RzB6PE1g07oZqtJQ4fv8gKspgZ6Oj1u/Qhwo4SV+ftZgcJ
        SwjwSdx4KwhxA5/EpG3TmSHCvBIdbUIQ1YoS989uhRooLrH0wle2CYxKs5A8NgvJN7OQfDML
        Ye8CRpZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgSnm9L/jX3cw7vuTdIhRgINRiYf3
        wRaZWCHWxLLiytxDjBIczEoivN9/A4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8s
        Sc1OTS1ILYLJMnFwSjUwrtuiunD/FmvlTJUnp93Nq6SKLybOncxuFH1h/3POAuWOdd9P6lxY
        nN+p/VGfe2uDl8yifXEXK7Z8eLxg9cWosyvyw1M+fFm7J/tal3vYjzvd3BJRk+RrflxvMv4o
        4huV0ZR8+8G0WA4xhvsyrxIk5zr/XfGSq5pZd7WKScDFh/x/ShquTXzGrsRSnJFoqMVcVJwI
        AJz3+X0tAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7r7/8jGGrzcq2px5et7NouJ+8+y
        W1z7+ZjZ4vnCH8wWdzecZXRg9ZjdcJHFY+esu+we97uPM3l83iQXwBKlZ1OUX1qSqpCRX1xi
        qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/G48yh7QS9bxbG57xgbGD+x
        dDFyckgImEh8PfGSuYuRi0NIYCmjxOEz09ggEuISu+e/ZYawhSX+XOtigyh6zSjxfedSsCJh
        AV+JNec3sYLYIgIuEicu/QazmQWyJI4ueMAK0dDDKLH77y6wBjYBTYm/m2+C2bwCdhKX3z4E
        O4NFQEVi/6kbYNtEBSIk+tpmQ9UISpyc+QSohoODU8BSYs88Loj56hJ/5l1ihrDlJba/nQNl
        i0vcejKfaQKj0Cwk3bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgXG1
        7djPLTsYu94FH2IU4GBU4uF9sEUmVog1say4MvcQowQHs5II7/ffQCHelMTKqtSi/Pii0pzU
        4kOMpkC/TWSWEk3OB8Z8Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYO
        TqkGxpn7lsp9Svx/12Oy5CTVabN07kpelFk0+Up96MNnbbnb0vtetG0Sv/Zv4/ZCN7NoJ5+W
        1b8P6Bx5Zt90+NsqkZIrb/5k7mifVzjh7hVD4bdPFF46lOTvOuXzp1h+X3b5o8q9VdKP3hqv
        WqLIr3c8U7JGIefkLiWPpq0K13yvGF/00HvGOde45aESS3FGoqEWc1FxIgA/3f6mwQIAAA==
X-CMS-MailID: 20190704131855eucas1p214a64282c2c4a34f914856de5375e384
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190702154436epcas2p3fdaaa095c15a116a0be7e5313469151f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154436epcas2p3fdaaa095c15a116a0be7e5313469151f
References: <CGME20190702154436epcas2p3fdaaa095c15a116a0be7e5313469151f@epcas2p3.samsung.com>
        <20190702154419.20812-1-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02.07.2019 17:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> In process of debugging panel on my lenovo yoga c630, I noticed some
> errors in the dsi->mode_flags, which I guess were just cargo-cult'd?
>
> Since dumping the status regs was useful to notice this problem, I
> cleaned it up and turned it into debugfs.  The last patch corrects the
> mode_flags.
>
> Tested on cheza and c630.
>
> Rob Clark (3):
>   drm/bridge: ti-sn65dsi86: add link to datasheet
>   drm/bridge: ti-sn65dsi86: add debugfs
>   drm/bridge: ti-sn65dsi86: correct dsi mode_flags
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>
Queued to drm-misc-next.

--
Regards
Andrzej

