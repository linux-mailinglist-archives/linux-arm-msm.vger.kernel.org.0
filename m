Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DFC2FF5E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 21:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbhAUUci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 15:32:38 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35010 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbhAUUb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 15:31:26 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210121203041euoutp017b6aee603a3599066a093a54a0715a02~cWWFu5lxX1559315593euoutp01c
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 20:30:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210121203041euoutp017b6aee603a3599066a093a54a0715a02~cWWFu5lxX1559315593euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611261041;
        bh=h6zKDtX6u5QFojsyZseVpclsd7VNDEJ9rj+biyf1v3A=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Bq0AYuOE4clGGAJvxD9GVVa7k/wl2kZP1LNOb6t5wlxjQUq6OdW/BpXF6bV0W49Qa
         XPyEKNVFlLy1uwUqn5hM2QBarFjNGtcNYVI5WgYZZOL27l67UmEaQDhBkgt7d5rMD3
         mDEWSJUQdPiomt+lEz7vczLuy79sxMIZr6dLjXYE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210121203041eucas1p1e1f6d8770ee77de01bd792b77df733a5~cWWFJwYwr0484104841eucas1p1d;
        Thu, 21 Jan 2021 20:30:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 58.89.45488.074E9006; Thu, 21
        Jan 2021 20:30:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210121203040eucas1p2818713a21a74b580ad05383ce6ee9f8e~cWWElLBxO0875408754eucas1p2M;
        Thu, 21 Jan 2021 20:30:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210121203040eusmtrp209f45cf289b60741a9fd0b304277cb61~cWWEkkODc0577405774eusmtrp2P;
        Thu, 21 Jan 2021 20:30:40 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-b2-6009e470cdb2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C8.4D.16282.074E9006; Thu, 21
        Jan 2021 20:30:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210121203039eusmtip2ab1db0c7bf3a433d19781fa9c5cdd5f8~cWWDyf-Hx2324623246eusmtip2e;
        Thu, 21 Jan 2021 20:30:39 +0000 (GMT)
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race
 condition
To:     Mark Brown <broonie@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e7e4b633-21cb-54e6-f75c-fac28147396c@samsung.com>
Date:   Thu, 21 Jan 2021 21:30:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121154418.GE4588@sirena.org.uk>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djP87oFTzgTDBqnWFpsnLGe1WLqwyds
        Fl1tQhbnz29gt/h2pYPJYuL+s+wWl3fNYbOYcX4fkwOHx+W+XiaPnbPusntsWtXJ5tG3ZRWj
        x+dNcgGsUVw2Kak5mWWpRfp2CVwZex4kFRwSqbjdPIGlgfE+fxcjJ4eEgInE2QM3WLsYuTiE
        BFYwSsw/NoUFwvnCKPGoayqU85lR4tebx4wwLVt3/maHSCxnlPjesQLK+cgosWHKD1aQKmGB
        cIm1/36ygNgiAsoSV7/vBRvFLLCaSeLClS42kASbgKFE11sIm1fATmLu5rlgzSwCqhJzO+ex
        g9iiAkkSd+8cZoKoEZQ4OfMJ2FBOASOJKR+bwU5iFpCXaN46mxnCFpe49WQ+E8gyCYEnHBJn
        Zr9kgbjbRWLThV1QtrDEq+Nb2CFsGYn/O2EamhklHp5byw7h9DBKXG6aAfW1tcSdc7+ATuUA
        WqEpsX6XPkTYUWLqiqfMIGEJAT6JG28FIY7gk5i0bTpUmFeio00IolpNYtbxdXBrD164xDyB
        UWkWktdmIXlnFpJ3ZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwHZ3+d/zr
        DsYVrz7qHWJk4mA8xCjBwawkwvvIkiNBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+urWvihQTS
        E0tSs1NTC1KLYLJMHJxSDUylca+sWG1tZLYJqbFYq4r/edeledo+0eDdRoGbRiEvuQXmnr43
        94CX9zfdi065E2+sZxTZUReUVvtvntFv5jy5e4XtgTeb5aPf3tXPdfp8IW9FxvdACYXZU3wu
        WUTl8wvOFHkTuqcnI1Cp6PP301uqkt9MW/DhjnR9NtsS6ZDf0z/dzwxTeK8Tt03/Ppe/m1mH
        xt1Fp/tcspzn1jMb/LrKt3iPgKTUmY8ZO6PXGq78F6/zS2627aZMH9uwKdN+159+uzjanrHl
        75OIYlOu16GlF7Jjd58WvXrTbJuMCvehmOZzU58IaO+d84P18PbPWpm8s2faSG1q/b1/30fH
        9BMJXnyO/+7wTr7Qu7lGKkWJpTgj0VCLuag4EQD5ArBBtgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xe7oFTzgTDJYvYrPYOGM9q8XUh0/Y
        LLrahCzOn9/AbvHtSgeTxcT9Z9ktLu+aw2Yx4/w+JgcOj8t9vUweO2fdZffYtKqTzaNvyypG
        j8+b5AJYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/Tt
        EvQy9jxIKjgkUnG7eQJLA+N9/i5GTg4JAROJrTt/s3cxcnEICSxllNjyfDETREJG4uS0BlYI
        W1jiz7UuNoii94wShz9eYQNJCAuES6z995MFxBYRUJa4+n0vC0gRs8BqJomPryaxQnRcYZK4
        eXsjWBWbgKFE19susG5eATuJuZvngq1gEVCVmNs5jx3EFhVIkjgx6xMzRI2gxMmZT8B6OQWM
        JKZ8bGYEsZkFzCTmbX7IDGHLSzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKp
        pcW56bnFRnrFibnFpXnpesn5uZsYgfG37djPLTsYV776qHeIkYmD8RCjBAezkgjvI0uOBCHe
        lMTKqtSi/Pii0pzU4kOMpkD/TGSWEk3OByaAvJJ4QzMDU0MTM0sDU0szYyVxXpMja+KFBNIT
        S1KzU1MLUotg+pg4OKUamDKZ/8plhX1effPctgvpWaqV269aOp/hXqRubrHHZ7fE6+uqTU4f
        nXjmXq+KC2xjzlFM/r5hxURXPkGRWu8JK25ylmVtbLKfYNa9l61pubWj6of+qa/d4ySnz04V
        rbf/mXzX0FX390IX9ia5Of4Fzz7PCN29bv2KQq3HugwsXyQubJCQ1d0UYrrA+nTrgl+aumpf
        RJZUsaXMrnT/LmQjdurDjM4Fi0uuSZ5fMY/Nwjn3YXbiFObK71oHZ8v9f7w4UOzdBRlB118n
        +49HN3fWtNRlMan88ZA7OVOkbfd9tfesHeIVbmcdFlalLrnjG/7t24GzWqrb7Z+t2jLz0f1n
        Bw4tOu95zmzTlS2m9ivvFimxFGckGmoxFxUnAgBULiA6SAMAAA==
X-CMS-MailID: 20210121203040eucas1p2818713a21a74b580ad05383ce6ee9f8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
        <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
        <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
        <20210118204958.GS4455@sirena.org.uk>
        <5f37ae96-c5f9-6619-d88f-21c5e483ff8e@samsung.com>
        <20210121154418.GE4588@sirena.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On 21.01.2021 16:44, Mark Brown wrote:
> On Thu, Jan 21, 2021 at 10:41:59AM +0100, Marek Szyprowski wrote:
>> On 18.01.2021 21:49, Mark Brown wrote:
>>> Does this help (completely untested):
>> Sadly nope. I get same warning:
> Try this instead:
>
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 3ae5ccd9277d..31503776dbd7 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -1823,17 +1823,6 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   	if (rdev->supply)
>   		return 0;
>   
> -	/*
> -	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
> -	 * between rdev->supply null check and setting rdev->supply in
> -	 * set_supply() from concurrent tasks.
> -	 */
> -	regulator_lock(rdev);
> -
> -	/* Supply just resolved by a concurrent task? */
> -	if (rdev->supply)
> -		goto out;
> -
>   	r = regulator_dev_lookup(dev, rdev->supply_name);
>   	if (IS_ERR(r)) {
>   		ret = PTR_ERR(r);
> @@ -1885,12 +1874,29 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   		goto out;
>   	}
>   
> +	/*
> +	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
> +	 * between rdev->supply null check and setting rdev->supply in
> +	 * set_supply() from concurrent tasks.
> +	 */
> +	regulator_lock(rdev);
> +
> +	/* Supply just resolved by a concurrent task? */
> +	if (rdev->supply) {
> +		regulator_unlock(rdev);
> +		put_device(&r->dev);
> +		return ret;
> +	}
> +
>   	ret = set_supply(rdev, r);
>   	if (ret < 0) {
> +		regulator_unlock(rdev);
>   		put_device(&r->dev);
> -		goto out;
> +		return ret;
>   	}
>   
> +	regulator_unlock(rdev);
> +
>   	/*
>   	 * In set_machine_constraints() we may have turned this regulator on
>   	 * but we couldn't propagate to the supply if it hadn't been resolved
> @@ -1901,12 +1907,11 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   		if (ret < 0) {
>   			_regulator_put(rdev->supply);
>   			rdev->supply = NULL;
> -			goto out;
> +			goto out_rdev_lock;

drivers/regulator/core.c:1910:4: error: label ‘out_rdev_lock’ used but 
not defined

>   		}
>   	}
>   
>   out:
> -	regulator_unlock(rdev);
>   	return ret;
>   }
>   

It looks that it finally fixes the locking issue, with the above goto 
removed completely to fix build. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

