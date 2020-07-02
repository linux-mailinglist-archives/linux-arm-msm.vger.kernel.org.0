Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F182212587
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 16:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgGBOEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 10:04:39 -0400
Received: from mout.web.de ([212.227.15.4]:49459 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729335AbgGBOEh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 10:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593698649;
        bh=DCK/WFqgBdaHR38QF2ta4hvKwO2tQSln1KlsJxiIhkM=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=EQIm1+Id5YKsEHlinZjakj9hsaYatJc/rsEQaAyEgnhwgCxWZR/f95F4CGkhGDR/k
         +hknJzmw/9n0Jq14TaO/+JWA/OT50eO3cra+u0YYBGgEsI4uUqdB7ycfxfuvJjz1UQ
         j4GBPNiXWmqiFLxHUv6ecVm3lp5tO7hCeOI8+APk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.138.52]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MB06e-1jh4Cj1p1Y-009vV6; Thu, 02
 Jul 2020 16:04:09 +0200
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Chen Tao <chentao107@huawei.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] drm/msm/dpu: fix wrong return value in dpu_encoder_init()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1c338c4c-c185-0b37-eabb-1072a6502ec0@web.de>
Date:   Thu, 2 Jul 2020 16:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zKBOW2W3vG0rFaq44rAhwc2i9qkzNX4TObOfBu6CAgIJ5qITTc0
 aKZkXK7c8EVplKQR0qcEMP43n0dEdkNyATjogxppBVgMVMkt7qSaeIuapze8jFWiEz/tyTn
 Y4APgs6Y7tdhZZSb62D+zKNWa6O+bJB7X3FFOcH6w7YGlUmMCyhkNQlDGaL8kk0N6nWHlTI
 Bh3bfkcFlmeK0sekM1Pyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J9+4GruiX8c=:QlwklHr6cTfjX5bYLE+JgK
 Iz6e+EfRYSec6k8MyhmGARc0COOn/sPrTJcBLILxmWUJ7gLADX5HMyYW+giWGrks4SpYpiZAZ
 2EMn5zixBug0UReTJYy7N8QBoJXQ8X8N8n0q4Z17lGEKFCMcMhb4btx16qC62HJYBgI96sQgF
 qzL2qyQ5/2W2xn8BboeKI4laFxVtknLjTSq86vKxYDCRs9OIo1R3NRtDYx2UouQ9wXIFt76Oq
 joe/oI4hwMFzvGQdAWjQEseIyWQ2YyRsiDoq/hdZ3bsS20OQ7P0YUdLe8/fF/NHIRoH2i0k0W
 ezrRkKaBQoTKBYgSxtvxrDnKeQxX3hgJEQD/ARXM5HcWa3I9Ed9j3jeD92i2XxkRwWvFn6R6m
 KC3z5+bYJyWGa6qlSh/kIOMma+ViCZQJG/fE3C7mvf9gYWmE5xkshX50qKEqs6vN3iNZh8JUm
 asnMx1PmgIRAOxShGpqt/bh27E19PiOpn7XP/6WGWarLUEo91iNZziCth7d1Wktof7anHm9gp
 hAkwJu0aGVaA2oKUbf/iQQF+gwKl0WiJIQClo08eZf2ziAxdiFDbLtvl6e6sWaRY/tITUg3Df
 TkXWwpfG2a+H1K7VK6WvmPIyFknj/mnK2hF6G1VYXA5E6JSgQz3D1ZuFfzQ8dAIee0UNlpxKd
 MmcuV7e9i55WGmEYn+4It7tqKklD6MdMCixAgMGU5Fr0ge4W62FxZN7rfmyF2C0JXcNheJfZQ
 ACO28wAVvW07JdUHBbGE/YMn6yag81aoyueIVvgNgoiXD6YeR0yXkx0GFgNYniTStYrkep6X/
 Ii6jVhm++4h5eeo+l2ENiqkPqh62QAfk7yHGrWkvcFdIJ0LQ7THoGLCnGpJSL2liTt12lpDNj
 Lgw9FdddpbLmQx/1xxhIKRYyhm7si22MGJdXnKLL80pr1PbOmRpaSnINPHlrCHqarQBs7KBk1
 NvJNaV+Dw/ffsnLVzsrGwBkD0ctog/Ndl6K1STzSpX312SsgbjOVRaIGX5AacWqvjn8nf2+Yj
 MPG1vKI1IoOwvWGWos5mY8IaPIBHpJWYHH8eakHMSG1hkBxjwvlZJiwGMTYnN5hOU2Vn6fMLn
 x1Vi4LEu97KPDp5yjJW0wWkLK6UC0bSvl+yU6Qa1Xz4GiUCjw1fpX6hPAkdrvRuGx87x0fbYH
 aXb03is05ARmOszbKEbmwrm6FcOZEh/TprOtS8dgiQWdXjdVcqhhXLAYLPF174lS8VjYAOwmP
 Ioxx8WgBgbx6TDhzq
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> A positive value ENOMEM is returned here. I thinr this is a typo error.
> It is necessary to return a negative error value.

I imagine that a small adjustment could be nice for this change descriptio=
n.

How do you think about to follow progress for the integration of
a previous patch like =E2=80=9C[RESEND] drm/msm/dpu: fix error return code=
 in dpu_encoder_init=E2=80=9D?
https://lore.kernel.org/dri-devel/20200618062803.152097-1-chentao107@huawe=
i.com/
https://lore.kernel.org/patchwork/patch/1257957/
https://lkml.org/lkml/2020/6/18/46

Regards,
Markus
