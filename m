Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29D7300101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 12:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbhAVK5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 05:57:41 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34647 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbhAVJ3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 04:29:03 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210122092813euoutp0123fa400afa234f4e62d10ead8844d09c~cg89yfL8h1835718357euoutp01f
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 09:28:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210122092813euoutp0123fa400afa234f4e62d10ead8844d09c~cg89yfL8h1835718357euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611307693;
        bh=DQB5T9reCjyReOgl1+OmuHjaD14INRWiTUl0be6kNtQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=GRE7kcHNe7UJnrwXsgbCo5lqmghQIVz3fJMER/W5rcViUYidssqvq8hAU0yCS+om9
         WHYaN9Kt4s4oVgSGDSjnHhi/we3FwDT+lSQLuCu40vTzG9Tf5nmS3hpWMOnj5wCCcz
         84JMlilViwBQADOUcyt9tfJfqgnbVIY7gwwmBkuQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210122092813eucas1p20cc1daa85757127367a3039ed0e24b74~cg89h9utY1307813078eucas1p2B;
        Fri, 22 Jan 2021 09:28:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 70.A8.27958.DAA9A006; Fri, 22
        Jan 2021 09:28:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210122092812eucas1p2fbf70cf4f6cae9ae68501e2090491de6~cg89Csswp1084310843eucas1p26;
        Fri, 22 Jan 2021 09:28:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210122092812eusmtrp1f3731347ff829c4f8c1ff69f3ab7b88b~cg89B-tLh1325213252eusmtrp1s;
        Fri, 22 Jan 2021 09:28:12 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-69-600a9aad6663
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 51.ED.21957.CAA9A006; Fri, 22
        Jan 2021 09:28:12 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210122092812eusmtip1314ee666c49d890f064159bb831e94cd~cg88UgEtg1653316533eusmtip1V;
        Fri, 22 Jan 2021 09:28:12 +0000 (GMT)
Subject: Re: [PATCH v4 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid
 return code
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <9930cad1-3a94-2153-e8ea-3de24f4f9297@samsung.com>
Date:   Fri, 22 Jan 2021 10:28:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
        Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210121233303.1221784-3-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87prZ3ElGNxaJ2rRe+4kk8Xp/e9Y
        LCae/8lmceXrezaLq99fMlucfHOVxaJz4hJ2i4n7z7Jb3G3pZLU41BdtseLnVkaLnXdOMDvw
        eLy/0cruMbtjJqvHplWdbB4nJlxi8rhzbQ+bx/ZvD1g97ncfZ/JYMu0qm8eB3sksHp83yQVw
        RXHZpKTmZJalFunbJXBlHLm3lblgKkvFot3/mBoYDzF3MXJySAiYSBz/94qli5GLQ0hgBaPE
        pDt3oJwvjBKv1m2Gcj4zSrxsaWGFaWm41MsKkVjOKHFt0zpmCOc9o8SjfbfABgsLhEis7/wM
        1iEiUCLR97QVrINZoIFZ4kvzUrAiNgFNib+bb7KB2LwCdhLPe58ygdgsAqoSu6YcArNFBRIk
        9r47xwJRIyhxcuYTMJtTwFni/f6/YHOYBeQlmrfOhrLFJZq+rARbJiGwnFPi0Ls+qLtdJB7O
        62OEsIUlXh3fwg5hy0icntzDAmHXS9xf0cIM0dzBKLF1w05oOFlL3Dn3C+hSDqANmhLrd+lD
        hB0lNqzfxwoSlhDgk7jxVhDiBj6JSdumM0OEeSU62oQgqhUl7p/dCjVQXGLpha9sExiVZiH5
        bBaSb2Yh+WYWwt4FjCyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAhPd6X/HP+1gnPvq
        o94hRiYOxkOMEhzMSiK8jyw5EoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzrpq9Jl5IID2xJDU7
        NbUgtQgmy8TBKdXANMd1wZZfM0UXnRc9cmHSY4bp+QklOxme8j9tX8zgp8bCx2aiWDu5+P/8
        7Wudvr9wa2208FBNPlv7Z8Ip+8gfs25c+PFb98iqY6xlCUsNBKeb1T3IUv2wSn7pJa+X80Rs
        bJ+osvMrW/EIX6x34ohQq/kqniRcEMfNox1v4ykbXMItsf6PqNGE1XF7H51e4HRF8bpRTSff
        zzNsyzaubW2Iej3db26pyQKVgK6mu6/rZhRrfpVv9FvBf+/KLOHbpTlZWo8X7XX3P7rsYvCv
        fuOziutkzy+YyxPENYFBqLRbWlnthZ3U0zdBovcbeOvmJFTdX/qgo1GY92KGMMfphPBvS24Z
        HjwU3Cl96JBmySoeJZbijERDLeai4kQAyPugjuMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7prZnElGHy7Z2DRe+4kk8Xp/e9Y
        LCae/8lmceXrezaLq99fMlucfHOVxaJz4hJ2i4n7z7Jb3G3pZLU41BdtseLnVkaLnXdOMDvw
        eLy/0cruMbtjJqvHplWdbB4nJlxi8rhzbQ+bx/ZvD1g97ncfZ/JYMu0qm8eB3sksHp83yQVw
        RenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlHLm3
        lblgKkvFot3/mBoYDzF3MXJySAiYSDRc6mXtYuTiEBJYyihxetkedoiEuMTu+W+hioQl/lzr
        YoMoessosf3GHRaQhLBAiMTP9sVgDSICJRKTfrSygxQxCzQxS3w4eosJouM8o8Sd1smsIFVs
        ApoSfzffZAOxeQXsJJ73PmUCsVkEVCV2TTkEZosKJEhs37+SCaJGUOLkzCdg2zgFnCXe7/8L
        dhKzgJlE19YuRghbXqJ562youLhE05eVrBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8t
        NtQrTswtLs1L10vOz93ECIztbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4H1lyJAjxpiRWVqUW
        5ccXleakFh9iNAX6ZyKzlGhyPjC55JXEG5oZmBqamFkamFqaGSuJ826duyZeSCA9sSQ1OzW1
        ILUIpo+Jg1OqgWnD7+eRyVsfBDYuZZ31kpN/1qkDX15Jp7Mo5gYy6sVPfaf6zOiNaWv+rVvz
        O7luN/oUzWD4eXHrrQdG9xQf3bqj9/fXj8eHdf40ccec39CUtybW4OD6bV6hXl+sWxq1vxiZ
        Bid2+RsK2W2RjHzVqL6I3//3udUuodwZ5n499jNeMLa9mHp2lWhTzZfguVtesSiYZfjc3pEy
        W++9/ubWV0e/797y9t8xCa63H8+I/8tP98rqm2HyXEZhXXxOxv7l3w/oZxh6bZvPvHLmhPw5
        DV/TmXrnRPNH5vsu+en34Rinu/IxnorjdS4LagMiztcu8Vqclq7a2mW4WzZc2XAz91fbQK/D
        nVeuCQrfk9Xbv1GJpTgj0VCLuag4EQBAygaodgMAAA==
X-CMS-MailID: 20210122092812eucas1p2fbf70cf4f6cae9ae68501e2090491de6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210122084650eucas1p23ece322ba0996308c9cea6b1b6ba7db1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122084650eucas1p23ece322ba0996308c9cea6b1b6ba7db1
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
        <CGME20210122084650eucas1p23ece322ba0996308c9cea6b1b6ba7db1@eucas1p2.samsung.com>
        <20210121233303.1221784-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 22.01.2021 o 00:33, Dmitry Baryshkov pisze:
> Return NULL pointer from get_edid() callback rather than ERR_PTR()
> pointer, as DRM code does NULL checks rather than IS_ERR(). Also while
> we are at it, return NULL if getting EDID timed out.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
