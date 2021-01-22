Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3192FFF4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 10:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbhAVJgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 04:36:52 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53497 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbhAVJfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 04:35:12 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210122093430euoutp0267fb29da65f57b399156ca023b51d4b8~chCc0hJYJ1903619036euoutp02f
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 09:34:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210122093430euoutp0267fb29da65f57b399156ca023b51d4b8~chCc0hJYJ1903619036euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611308070;
        bh=R+V80JL03vuZvezpG0U4GdoEqnl1aCpCcPxqEwhIz4s=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=loPYDTADQCAWvZcQkJQRy+/6+Nlbrz4L3NyvMS37MqyQBGXs/zLue51k7jMaOeNBX
         347b77dCZ9xx9TI2HOQP7yReSwbsQGh9xVDdHFr1LBV0HmfkloMwF9prSpoVWL37Hg
         qc6bd83+UF4mVIUTo1LlcMNekae+CK0fnrChQzj0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210122093430eucas1p265c7d564bb356f1e0f40e114a569391e~chCcioCvr1984819848eucas1p21;
        Fri, 22 Jan 2021 09:34:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.62.45488.62C9A006; Fri, 22
        Jan 2021 09:34:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210122093429eucas1p2b9f427b87fdab78fa877320863ca3c20~chCcI2kpW1727417274eucas1p2R;
        Fri, 22 Jan 2021 09:34:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210122093429eusmtrp2d31148dbdac898323ef33a2379bc9679~chCcIDorX0989909899eusmtrp2G;
        Fri, 22 Jan 2021 09:34:29 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-76-600a9c269beb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C2.FE.21957.52C9A006; Fri, 22
        Jan 2021 09:34:29 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210122093428eusmtip20c6f867244372cda344c0c3eca872f6c~chCa5KHi70365803658eusmtip2J;
        Fri, 22 Jan 2021 09:34:28 +0000 (GMT)
Subject: Re: [PATCH v4 3/3] drm/bridge/lontium-lt9611uxc: move HPD
 notification out of IRQ handler
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <c6737dce-e310-bf5d-fa22-cc8d3ec0136e@samsung.com>
Date:   Fri, 22 Jan 2021 10:34:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
        Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7djPc7pqc7gSDA7e4LLoPXeSyeL0/ncs
        FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
        PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
        orhsUlJzMstSi/TtErgyZkxdwVKwgq3i7dWiBsa5rF2MnBwSAiYST/7uYu9i5OIQEljBKPFm
        3xRWCOcLo8TJxb1sEM5nRokfWx6wwbTMfT2LGcQWEljOKLHnfgZE0XtGib1XJwC1c3AIC6RI
        7P6UBFIjIlAi0fe0FWwqs0ADs8SOznOMIAk2AU2Jv5tvgg3lFbCT2NW5C+wmFgFVib/7nrOD
        2KICCRJ7351jgagRlDg58wmYzSngLDF522OwXmYBeYnmrbOZIWxxiaYvK8GWSQgs5pQ4/vQJ
        M8TVLhL/506BelpY4tXxLewQtozE/53zmSDseon7K1qYIZo7GCW2btgJ1WwtcefcLzaQz5iB
        rl6/Sx8i7Chxs+s2E0hYQoBP4sZbQYgb+CQmbZvODBHmlehoE4KoVpS4f3Yr1EBxiaUXvrJN
        YFSaheSzWUi+mYXkm1kIexcwsqxiFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITHGn/x3/
        uoNxxauPeocYmTgYDzFKcDArifA+suRIEOJNSaysSi3Kjy8qzUktPsQozcGiJM67a+uaeCGB
        9MSS1OzU1ILUIpgsEwenVANT7ld+M3tzAQurvnOlvR+ne2zZH9L38/gVC6b1p/6JtO952y09
        feW1h95ezmczpFo0RW+uXDbryDKLq9Y7VY5ya/Tf5P7Yb8ckyNwSOveti9XiLU/XHmeOFM2q
        OXg9YN4tznu54m+lypY/3Ct25RfX7qrHVozPP6bpaS+9ErLKvWbJTdstOp/7OoJ+v3xSuKwx
        IHnB2e331Hc/WVWhz38tyejqeY/FF7ZNFvL0bBRKmRyf4z4jc5rn5+9Bt6Pn5CvYOIc6seoc
        CO1xv93sGFDCtehrg3PCHLHr4Qr6Fd78DNVuegd6jhcqV7bf+zXzvJhilLJsrbnqqvbS9S2z
        ity1tnM4HNkZsuTHlCX+gkeVWIozEg21mIuKEwEWYZKL4AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xe7qqc7gSDN7NMLDoPXeSyeL0/ncs
        FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
        PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
        ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyZkxd
        wVKwgq3i7dWiBsa5rF2MnBwSAiYSc1/PYu5i5OIQEljKKLF/yS12iIS4xO75b5khbGGJP9e6
        2CCK3jJKzHv2G8jh4BAWSJHY/SkJpEZEoERi0o9WdpAaZoEGZokfy6YzQjScZ5TYt2AN2Do2
        AU2Jv5tvsoHYvAJ2Ers6d4HFWQRUJf7uew62WVQgQWL7/pVMEDWCEidnPmEBsTkFnCUmb3sM
        1sssYCbRtbWLEcKWl2jeOpsZwhaXaPqyknUCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5
        xYZ6xYm5xaV56XrJ+bmbGIFxve3Yz807GOe9+qh3iJGJg/EQowQHs5II7yNLjgQh3pTEyqrU
        ovz4otKc1OJDjKZA/0xklhJNzgcmlrySeEMzA1NDEzNLA1NLM2Mlcd6tc9fECwmkJ5akZqem
        FqQWwfQxcXBKNTBF36h4IGJ2T2bfaS1+xYdaBraFl75cUn8ok7HFWqKQ/9ikFQovd4dbpzT+
        sW8yZWOwN5r7rJh5R3np5wuVflct8iZpfNFWsLF90l5zQjtFRSrlVFNPk+L7i07nlJb3pdfU
        Ve9ZJcJ86mZ1+/WMUMMT907lzfnSfzUl+G3OFUan/wL5vOwt15nUrR0EOiZIFkuYeRSIu6XW
        nl7X/Wc7196fChoSf3atCut88NwjW37GCU1XFeXjniv27b5Z57F555a/2+2575WmJ3lIJj9y
        Vf17o+te3/HNU37M8NvIMnVvd8LRNdZyOtN2rwzv/hWdkpLRcnGS+68qniNh01+qe1QEOSZw
        8Okr3WCcYPaqSImlOCPRUIu5qDgRAJ+3s4F0AwAA
X-CMS-MailID: 20210122093429eucas1p2b9f427b87fdab78fa877320863ca3c20
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
        <CGME20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a@eucas1p1.samsung.com>
        <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

W dniu 22.01.2021 o 00:33, Dmitry Baryshkov pisze:
> drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
> thus delaying further lt9611uxc IRQ events processing.  It was observed
> occasionally during bootups, when drm_client_modeset_probe() was waiting
> for EDID ready event, which was delayed because IRQ handler was stuck
> trying to deliver hotplug event.
> Move hotplug notifications from IRQ handler to separate work to be able
> to process IRQ events without delays.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>


Let's wait till Monday for other comments, then I can queue the patchset.


Regards
Andrzej
