Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E07300231
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 12:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbhAVK5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 05:57:35 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50972 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727293AbhAVJ2l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 04:28:41 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210122092754euoutp023e9d7abcbe5fddbf55472e6c9eab3cfd~cg8rh_yHL1557115571euoutp02B
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 09:27:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210122092754euoutp023e9d7abcbe5fddbf55472e6c9eab3cfd~cg8rh_yHL1557115571euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611307674;
        bh=iKEfv6ho4mp1olAV7DZMK3OtY/Ckv85hjxHwFSxGVvo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=pWm0cOQeVBCUJDszVfQ2LbuiQQ33YlwKhn239wmIzAPhmbNEZxUNQ3lRcwL6R2aHG
         5ooBS9BdVsdngpcSH4Y1nJ5odCN2Ep58D7DC8rgL3UjnyEjM2WOKrpnWcRpZJr0zrb
         doTKejkvvmKvsqyBtbJRhNrd36QiinNjAXiVGY0w=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210122092753eucas1p2952155a6afd3a483f0ce3049b627b88b~cg8rNc5Za0890008900eucas1p2r;
        Fri, 22 Jan 2021 09:27:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B4.21.45488.99A9A006; Fri, 22
        Jan 2021 09:27:53 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210122092753eucas1p12994362773a6fe1eed315f1180929d0e~cg8qzcEKd1049710497eucas1p16;
        Fri, 22 Jan 2021 09:27:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210122092753eusmtrp2bcbf2cee5a5e8b960245ece1a4883caf~cg8qysEta0601606016eusmtrp2B;
        Fri, 22 Jan 2021 09:27:53 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-f4-600a9a99d68e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 7F.DB.16282.99A9A006; Fri, 22
        Jan 2021 09:27:53 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210122092752eusmtip2815ffee65933949f48ac2d2b3b162e6d~cg8qBDkBZ3175131751eusmtip2D;
        Fri, 22 Jan 2021 09:27:52 +0000 (GMT)
Subject: Re: [PATCH v4 1/3] drm/bridge/lontium-lt9611uxc: fix waiting for
 EDID to become available
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
Message-ID: <6047e54c-e540-fb27-6b08-de11473d9b8c@samsung.com>
Date:   Fri, 22 Jan 2021 10:27:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
        Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210121233303.1221784-2-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djPc7ozZ3ElGCxbrWbRe+4kk8Xp/e9Y
        LCae/8lmceXrezaLq99fMlucfHOVxaJz4hJ2i4n7z7Jb3G3pZLU41BdtseLnVkaLnXdOMDvw
        eLy/0cruMbtjJqvHplWdbB4nJlxi8rhzbQ+bx/ZvD1g97ncfZ/JYMu0qm8eB3sksHp83yQVw
        RXHZpKTmZJalFunbJXBltP1ax1qwkKViz4fVrA2Mx5i7GDk5JARMJH4fOMfUxcjFISSwglFi
        2ZXbrBDOF0aJjhvf2CGcz4wSuzsXscK0rNz+H6plOaPEm7swVe8ZJT4tf8sIUiUskCIx9VgD
        mC0iUCLR97QVbC6zQAOzxJfmpWDb2QQ0Jf5uvskGYvMK2Ek86JsMtoJFQFXiy6mj7CC2qECC
        xN5351ggagQlTs58AmZzCjhLzHuwDqyeWUBeonnrbGYIW1yi6ctKsGUSAss5Jc6fXcAGcbeL
        xI3+yVC2sMSr41vYIWwZif875zNB2PUS91e0MEM0dzBKbN2wExpO1hJ3zv0CauYA2qApsX6X
        PkTYUeLD/08sIGEJAT6JG28FIW7gk5i0bTozRJhXoqNNCKJaUeL+2a1QA8Ulll74yjaBUWkW
        ks9mIflmFpJvZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMw0Z3+d/zrDsYV
        rz7qHWJk4mA8xCjBwawkwvvIkiNBiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+urWvihQTSE0tS
        s1NTC1KLYLJMHJxSDUx11s8OvPymWPI/om1K+HsRj87ZZ9afmDLnn+Atq+uLS1aub07bP+n6
        JovE+NU1ezjlI++mruRMXXlzx535z5zF02TvrHuvMK2U0zTCMcvA81exfExp5If8b23pQazG
        JpVCO/q2qURIuekHa6ewtlmcLzdlPVaQ1LSnV/rij7X3+Cbwnjqplia6Lphp8Vm/M/fcP75S
        U+Ksi25Si76l2eIgM+n1rPecc6c4Bj+cLWMUvu7Z+oxbN5P3zV/LVqihpTA7Ju9TiPP8K06v
        toVsTJtyv/xL/L4u5n0WTSsPtXiI9pxXfME6aVrjtsUTTUO7RRf5at112jfLuvPavFo2U/Ou
        a7WiyuuOHf8gG/xtdaUSS3FGoqEWc1FxIgBNe8yk4wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7ozZ3ElGLzq5bLoPXeSyeL0/ncs
        FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
        PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
        ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy2n6t
        Yy1YyFKx58Nq1gbGY8xdjJwcEgImEiu3/2cCsYUEljJKzPkYCxEXl9g9/y1UjbDEn2tdbF2M
        XEA1bxkldi/sZARJCAukSLye/pAVxBYRKJGY9KOVHaSIWaCJWeLD0VtMEB3nGSUaN14Hq2IT
        0JT4u/kmG4jNK2An8aBvMlicRUBV4supo+wgtqhAgsT2/SuZIGoEJU7OfMICYnMKOEvMe7AO
        rJ5ZwEyia2sXI4QtL9G8dTYzhC0u0fRlJesERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nz
        i430ihNzi0vz0vWS83M3MQIje9uxn1t2MK589VHvECMTB+MhRgkOZiUR3keWHAlCvCmJlVWp
        RfnxRaU5qcWHGE2B/pnILCWanA9MLXkl8YZmBqaGJmaWBqaWZsZK4rwmR9bECwmkJ5akZqem
        FqQWwfQxcXBKNTDlzGaqEfeoi2o3zIm+zSX0Xlar2uduNVfGpfnrrTr3Pl/DtuBDwaKgsCkR
        N5zK62f3G8+/eWfF2j8xsgcs47XFzf6W/v57Xnl2uLGGksr79z+PdzVFBPRFBNXtCv/WLOa8
        VffGa7t0A8ez558+Y3A1dIkQ31vuUNy9++INNdkXOR01G6deYw6d8eNPyuy6QvMNJyo17r50
        u/266dN9OYHp+T+eBYl4iuzvd1/A2uC2elbyB44Gz/hvCgdvmV/OcttTFRfm07OV+0GlozZj
        +WTGWaUzbn/hftLpbyr2dPsRzhubJYpLXLqllpgd3tYw+ZJL9AWNB0ZzFv9TEV209+iZsAnf
        /85Lu1DqdKK/vVyJpTgj0VCLuag4EQCpfJdxdQMAAA==
X-CMS-MailID: 20210122092753eucas1p12994362773a6fe1eed315f1180929d0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210122084647eucas1p1054ab2676b281e24e3c8310a7ee0d1bc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122084647eucas1p1054ab2676b281e24e3c8310a7ee0d1bc
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
        <CGME20210122084647eucas1p1054ab2676b281e24e3c8310a7ee0d1bc@eucas1p1.samsung.com>
        <20210121233303.1221784-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 22.01.2021 o 00:33, Dmitry Baryshkov pisze:
> - Call wake_up() when EDID ready event is received to wake
>    wait_event_interruptible_timeout()
>
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>    let's be on a safe side.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Regards
Andrzej
