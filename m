Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01E73074B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 12:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhA1L0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 06:26:01 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48636 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbhA1LZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 06:25:29 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210128112446euoutp01df62b52cfa59dcb6aaddc6439ade7607~eYacV-0iL2705827058euoutp01C
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210128112446euoutp01df62b52cfa59dcb6aaddc6439ade7607~eYacV-0iL2705827058euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611833086;
        bh=kmZizkUGW79bCIXZ7XxalpWjHA7TeBfSuGwjTG9mlA0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=MNHHM6F7iZ9FI7yVRAs1tU0q2T5JtMSCZp5KFss8s5GLvv98gbG2ekK88kyx+3b/k
         N3dHtnracfH8c1nLDnDilLuFZmsI4x+rGESJJPKmwTkycGzuOsEX9y1/mr2iWfK5+B
         rOeCbrwlnaGFPZ0GW82hNxsUba7URHsfSan+tfRU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210128112446eucas1p179c85c4477dde388c43885f5f6ab92f3~eYacBvLWJ2455324553eucas1p1Q;
        Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1A.F7.45488.EFE92106; Thu, 28
        Jan 2021 11:24:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210128112446eucas1p2b220826a592b8a4f6132c2f0e01aaf6c~eYabnLjBa2496924969eucas1p2F;
        Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210128112446eusmtrp2a05f2c577ebf7d32d7736d19b2916db8~eYabmbP9c0072600726eusmtrp2j;
        Thu, 28 Jan 2021 11:24:46 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-01-60129efe6d1f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 82.6E.16282.DFE92106; Thu, 28
        Jan 2021 11:24:45 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210128112445eusmtip2090f0196a7a15514b7c06e7449e5d1ca~eYaa4qiCZ3013230132eusmtip2j;
        Thu, 28 Jan 2021 11:24:45 +0000 (GMT)
Subject: Re: [PATCH v4 3/3] drm/bridge/lontium-lt9611uxc: move HPD
 notification out of IRQ handler
From:   Andrzej Hajda <a.hajda@samsung.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Message-ID: <1da37287-9f88-a28b-092b-cab6310c5665@samsung.com>
Date:   Thu, 28 Jan 2021 12:24:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0)
        Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <c6737dce-e310-bf5d-fa22-cc8d3ec0136e@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djP87r/5gklGLSflbboPXeSyeL0/ncs
        FhPP/2SzuPL1PZvF1e8vmS1OvrnKYtE5cQm7xcT9Z9kt7rZ0sloc6ou2WPFzK6PFzjsnmB14
        PN7faGX3mN0xk9Vj06pONo8TEy4xedy5tofNY/u3B6we97uPM3ksmXaVzeNA72QWj8+b5AK4
        orhsUlJzMstSi/TtErgynh8tLTjAXbH5GV8D433OLkZODgkBE4mWiw1sXYxcHEICKxglGla+
        ZYRwvjBKbGp/ywxSJSTwmVFi/QMNmI5zj7vYIYqWM0rc7N0O5bxnlHj/ZTpQBweHsECKxO5P
        SSANbAKaEn8332QDsUUESiT6nraygtjMAg3MEv2bqkFsXgE7iTeTD4LFWQRUJS4+XcEEYosK
        JEjsfXeOBaJGUOLkzCdgNqeAvcSN1atZIObISzRvnc0MYYtLNH1ZyQpyj4TAYk6JV09fMUJc
        7SIx6e4BFghbWOLV8S3sELaMxP+d85kg7HqJ+ytamCGaOxgltm7YyQyRsJa4c+4XG8hjzEDf
        rN+lDxF2lLjZdZsJJCwhwCdx460gxA18EpO2QYJBQoBXoqNNCKJaUeL+2a1QA8Ulll74yjaB
        UWkWks9mIflmFpJvZiHsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwvZ3+d/zr
        DsYVrz7qHWJk4mA8xCjBwawkwvt2jlCCEG9KYmVValF+fFFpTmrxIUZpDhYlcd5dW9fECwmk
        J5akZqemFqQWwWSZODilGpgKp9Ss2i2nvfzc3F8hZ9tkWPgtZ3yoeKThZMqhW/Gc0elfTXPn
        RxG2S4Wf9rrdKkgrE/hbuEljX+m7yabnUmz1Dx+etXShlJFjdtgPVq0jK+KuWe1vXXEgrnP5
        HI6na6+nTV4ucm1l9+/bh7ri1rUV3vue63TlaLrMgRbj/9lcPx4bpaVYCphOqJrJxfT347uO
        0GWKoUGCxxoM6+dl73WdINosYt9+tDfbf1Z4/9ogVcEFMwvWreBh29V0RvjOsl/mQiHP7x9I
        8+9trlizomKC9qOy1Ff+MaJVKxuSdzCJnpC5MutAWFPvrUf14WqT1p2o/XFyZ8EJpaNHlN+F
        /X56mb3tutgx1qBvk1nv7PyqxFKckWioxVxUnAgApEL4i94DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7r/5gklGJyytOg9d5LJ4vT+dywW
        E8//ZLO48vU9m8XV7y+ZLU6+ucpi0TlxCbvFxP1n2S3utnSyWhzqi7ZY8XMro8XOOyeYHXg8
        3t9oZfeY3TGT1WPTqk42jxMTLjF53Lm2h81j+7cHrB73u48zeSyZdpXN40DvZBaPz5vkArii
        9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKeHy0t
        OMBdsfkZXwPjfc4uRk4OCQETiXOPu9i7GLk4hASWMkrsP7OfBSIhLrF7/ltmCFtY4s+1LjaI
        oreMErf+bATq4OAQFkiR2P0pCaSGTUBT4u/mm2wgtohAicSkH61gQ5kFmpgl1u2ezQrR3MIk
        sfxQNyNIFa+AncSbyQdZQWwWAVWJi09XMIHYogIJEtv3r2SCqBGUODnzCdhFnAL2EjdWrwaz
        mQXMJLq2djFC2PISzVtnM0PY4hJNX1ayTmAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfY
        SK84Mbe4NC9dLzk/dxMjMKa3Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuF9O0coQYg3JbGyKrUo
        P76oNCe1+BCjKdA/E5mlRJPzgUklryTe0MzA1NDEzNLA1NLMWEmc1+TImnghgfTEktTs1NSC
        1CKYPiYOTqkGpuXrlkiaa85x8hFZ1pm7c6JP29rbXpxr/ple3bVDqOcYv9XGCUszBV875cqJ
        WbBNPCsaUNInff1Ra07F+uKN95OPlZf077TV/ndMeWr/ERM34SPVBYu6pYR8/7tH/Gao3PFE
        xEDtDvffA7mibPG8L4PNfvzsDXrlIqIRJWU/2zvgeQCX4P2WhcUnjT6uMxLyn/mBVVDi8b71
        Bpz7l3e4HMwR7Q2J3uya0uiWuD1WOSnk0mIbgQ3Jfxp4Z4XfW3L0G+9RzxWL5D7NbDWtbffr
        tIm9uPrGj02rOVt44/vkqo2tnlsw5U4wOM9jYflFvva0wle17YKqxmt+f/xc+aK0dsqUC4YJ
        b/nEo75ujXilxFKckWioxVxUnAgAL6iSHXIDAAA=
X-CMS-MailID: 20210128112446eucas1p2b220826a592b8a4f6132c2f0e01aaf6c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
        <CGME20210122084635eucas1p1dc81023f70ef2a5eb2e59d6068b3289a@eucas1p1.samsung.com>
        <20210121233303.1221784-4-dmitry.baryshkov@linaro.org>
        <c6737dce-e310-bf5d-fa22-cc8d3ec0136e@samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


W dniu 22.01.2021 o 10:34, Andrzej Hajda pisze:
> W dniu 22.01.2021 o 00:33, Dmitry Baryshkov pisze:
>> drm hotplug handling code (drm_client_dev_hotplug()) can wait on mutex,
>> thus delaying further lt9611uxc IRQ events processing.  It was observed
>> occasionally during bootups, when drm_client_modeset_probe() was waiting
>> for EDID ready event, which was delayed because IRQ handler was stuck
>> trying to deliver hotplug event.
>> Move hotplug notifications from IRQ handler to separate work to be able
>> to process IRQ events without delays.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>
>
> Let's wait till Monday for other comments, then I can queue the patchset.


Queued to drm-misc-fixes.

I have fixed missing parentheses in the last patch in 
lt9611uxc_hpd_work, but apparently sth went wrong and I have merged 
version without these parentheses :(, can be fixed in another future 
patchset.

Regards

Andrzej


>
>
> Regards
> Andrzej
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/v1/url?k=20f4a2d0-7f6f9b96-20f5299f-0cc47a3003e8-b85b502ae8b34801&q=1&e=194b3466-3374-4717-82f7-d4cec3951dd6&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
