Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE5C314B02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 10:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhBIJA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 04:00:26 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44242 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhBII6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 03:58:47 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210209085745euoutp025fcb8ccad851338cf0dd35646fcd7adf~iCJgRBEYu1143211432euoutp02Y
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 08:57:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210209085745euoutp025fcb8ccad851338cf0dd35646fcd7adf~iCJgRBEYu1143211432euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1612861065;
        bh=gsa0796qs2tF26mzxamPCLDFS263O5nP2xeA+S968SY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=e7nllApZTnWnSy/SRSsfGJXxfoBILYxUstDhq1iKQ7N7sOXbpej/RJlJflljJgaLp
         x6moZer3HLeB/eY6tHV3/qeuVUFgqU+5ufZ3MiCicF54vHbKENW8NuYZx6wS/j3aF5
         4tkK1jVakvOtdGxBgy3jDEZ1RgFo7iJIWKZCEeu8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210209085745eucas1p2bff2e224d77f2913c8422214e9d13dc4~iCJgCa-IV3112931129eucas1p2r;
        Tue,  9 Feb 2021 08:57:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5B.FA.45488.98E42206; Tue,  9
        Feb 2021 08:57:45 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210209085745eucas1p2a4db55275e1ec3a629310483290e70a7~iCJfpk9B-3112931129eucas1p2q;
        Tue,  9 Feb 2021 08:57:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210209085745eusmtrp1e74a08cefc9d3fa0192bd31c97c16f2c~iCJfo-opo1341213412eusmtrp1U;
        Tue,  9 Feb 2021 08:57:45 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-61-60224e898942
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4A.11.21957.88E42206; Tue,  9
        Feb 2021 08:57:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210209085744eusmtip2d8171f159a888904ee80e4dbce67f26b~iCJfTXi6J3267832678eusmtip2C;
        Tue,  9 Feb 2021 08:57:44 +0000 (GMT)
Subject: Re: [PATCH] misc: fastrpc: fix incorrect usage of dma_map_sgtable
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <90d01919-859d-d46d-e357-3f94a0187cbe@samsung.com>
Date:   Tue, 9 Feb 2021 09:57:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210208200401.31100-1-jonathan@marek.ca>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOd1OP6UEg2nTZCz+TjrGbtG8eD2b
        xdQ9GxktJu4/y25xedccNgdWj9+/JjF67J+7ht3j8bEXrB6fN8kFsERx2aSk5mSWpRbp2yVw
        Zczo/cRSsJ2zoveCXwPjMfYuRk4OCQETic7WH8xdjFwcQgIrGCUeXb/PCuF8YZQ4fGovI4Tz
        mVFiypXHLDAtC+bsYYJILGeUWDv1BwuE85FR4uvDl4wgVcICXhLN3z+DdYgIuEocOjcTbCGz
        QJ3E9YlTwGw2AUOJrrddbCA2r4CdxNPpLawgNouAisTe7gtgNaICSRLLb/5hgqgRlDg58wnY
        TE4Bc4nTXVOZIGbKS2x/O4cZwhaXuPVkPth1EgIHOCTOT1/JBnG2i8SMl11QXwtLvDq+BcqW
        kTg9uYcFoqGZUeLhubXsEE4Po8TlphmMEFXWEnfO/QKaxAG0QlNi/S59iLCjxJnL25lAwhIC
        fBI33gpCHMEnMWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwiXkCo9IsJK/NQvLOLCTvzELYu4CR
        ZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZgmjn97/jXHYwrXn3UO8TIxMF4iFGCg1lJ
        hDewUy5BiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+urWvihQTSE0tSs1NTC1KLYLJMHJxSDUzZ
        zgwVBtM61BdtTwgsK7Qqc+5Ys2X5rLQ9XQsXqdVKbmoRExLPN0pfYyEwiXXLHpvwz3calB9E
        56kbHLCco5Sz13ZjYwnHZ/GNCnt25L28nH1QfUlA5nphfk7vlaLHBbm7fIWuPNggHRO9ZFG7
        slXilYh3/z2CXzE2iRu/22mfy/VJXj91hfPshcqbwo5lqazbnbhAN5Bz2iGlivzuouSt2nan
        pskKt86Z6MkosuFIi3KepuG+kpW8aRNXRHbNu+pUwOLfz2f+lln1WVwNj8gH6RP7QvPNX/eH
        6RdxBeU89Fgg2+064aXwxeQfL/5/2Hmv6o7J1K/Tcw8bZ777NfN95I2zn42UXORf99ipKrEU
        ZyQaajEXFScCANbYzimiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7qdfkoJBm2fGS3+TjrGbtG8eD2b
        xdQ9GxktJu4/y25xedccNgdWj9+/JjF67J+7ht3j8bEXrB6fN8kFsETp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZczo/cRSsJ2zoveCXwPjMfYu
        Rk4OCQETiQVz9jB1MXJxCAksZZQ4OP8ZC0RCRuLktAZWCFtY4s+1LjaIoveMEtu75rGBJIQF
        vCSav38GaxARcJU4dG4m2FRmgQZGiZ4pghANXYwSS661gyXYBAwlut52gTXzCthJPJ3eAraB
        RUBFYm/3BbAaUYEkice37jNB1AhKnJz5BGwBp4C5xOmuqUwQC8wk5m1+yAxhy0tsfzsHyhaX
        uPVkPtMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjatux
        n5t3MM579VHvECMTB+MhRgkOZiUR3sBOuQQh3pTEyqrUovz4otKc1OJDjKZA/0xklhJNzgdG
        dl5JvKGZgamhiZmlgamlmbGSOO/WuWvihQTSE0tSs1NTC1KLYPqYODilGph0lvzKMK+5MdvM
        3DamItI4529AUom88XeBewd4E/wuOMq/Va7QWC/FFP1Fdkv0q4urJk71d7tsdYrXYP7R84y2
        M5+/eloeL8lXUi8ZabKo9HKeYOPUSJtiG+WbyzI+Rfc0W0+7vCXq9dENZcy/Jtv9mbKr5PFP
        vs7WvqmOldd3CFZmrj0hPPVwrYJId/+VCVdZj/FX8csophvt/ug2g9f24rHS+Mi6w9smCD9r
        C9A67Hoi4VD0v52e0ps0JuRJ1s3OLr5f6py28/Cq72v55IS3rueQ5PlsL3pd9fe393alB8My
        Y3Rfn5J7+Cjz1F67RXwL/vA+eJPdmRZ++7h/426PL09Nv/6fGys0c8PcrRlKLMUZiYZazEXF
        iQDe/k+pNAMAAA==
X-CMS-MailID: 20210209085745eucas1p2a4db55275e1ec3a629310483290e70a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210208200719eucas1p2e865a1368c6bc64bcc95a7ebe4af35ff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210208200719eucas1p2e865a1368c6bc64bcc95a7ebe4af35ff
References: <CGME20210208200719eucas1p2e865a1368c6bc64bcc95a7ebe4af35ff@eucas1p2.samsung.com>
        <20210208200401.31100-1-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On 08.02.2021 21:04, Jonathan Marek wrote:
> dma_map_sgtable() returns 0 on success, which is the opposite of what this
> code was doing.
>
> Fixes: 7cd7edb89437 ("misc: fastrpc: fix common struct sg_table related issues")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Right, I'm really sorry for this regression.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/misc/fastrpc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 70eb5ed942d0..f12e909034ac 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -520,12 +520,13 @@ fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
>   {
>   	struct fastrpc_dma_buf_attachment *a = attachment->priv;
>   	struct sg_table *table;
> +	int ret;
>   
>   	table = &a->sgt;
>   
> -	if (!dma_map_sgtable(attachment->dev, table, dir, 0))
> -		return ERR_PTR(-ENOMEM);
> -
> +	ret = dma_map_sgtable(attachment->dev, table, dir, 0);
> +	if (ret)
> +		table = ERR_PTR(ret);
>   	return table;
>   }
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

