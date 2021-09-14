Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689C040A26C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235703AbhINBY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhINBYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:24:55 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E64FC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:23:39 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso16046012otp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=QApNJaQ+4zf4NOG0NQxMwjGWEI23AT3h/AkJ/g+8Fgs=;
        b=B5Ou/+YkeYt3m8Q4F5zkxmBu02DaZz1pg/FLbUK/u9KR9D6/RBSadeL749BhJffFZS
         ddZSGbKbX7mjHwLeAJm9SOVnxFLF3RbBLh30gTW/tmeDg4J21yw/L3DWCT0XyVA8IKYj
         MObgqrM+4P5HiRWPev07GLPN4TATag+/AXGAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=QApNJaQ+4zf4NOG0NQxMwjGWEI23AT3h/AkJ/g+8Fgs=;
        b=RACKtpykz3W7ra6XOgU1mo6a1FzPQv57vd08U1PUeVJgYRcgh8TtNunBfSVsiqZeBH
         K2esY66yNXOInh8LregKuRQqPA1exZKMXM1JqG+kMb3UOjIubmP6MPyGRfuWbZPTmtVM
         QzS4kUVNhy3h1YWkT+o4gxu4/OspXUQ3jhHDWVi4FQyKShmlTvkGxj1LgxS6ZyBX/3bF
         ZWz2DtfgjJO0gLJTFZYfpUftGWek2e2levXcyGN8DXk+LtCBhYa6nt3m2+k3fva1gkTn
         kSbOJWIpoj+Yy3irdY1Gtu5wSwhLGgf2RQ5zKqFtK0QUs4jlwHzb/PPmJzkOZxZ0Ne68
         WjCw==
X-Gm-Message-State: AOAM533CP/c9pVU8A0PLm+0iN3Wet0b2d5oV2IOREzuk8l2iS6iZ0mb3
        loEuxab4KOeHQGQpBYTpE1M6k6a/qFGdVo06sntpWw==
X-Google-Smtp-Source: ABdhPJz81mU20V2tbBwEn6dAUEH0d4iWsffBcpOJ1p+/Gm0extfrRrbnhXl70N8M3Fw8rJM5F/QFgiqaOkCPoiRYZeo=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr12251836ots.77.1631582618692;
 Mon, 13 Sep 2021 18:23:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 18:23:38 -0700
MIME-Version: 1.0
In-Reply-To: <20210913175747.47456-13-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run> <20210913175747.47456-13-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 18:23:38 -0700
Message-ID: <CAE-0n507ehHX3FHDUjvsdNRXHvNUM4YRNYuE+PN=PrZb+94U+w@mail.gmail.com>
Subject: Re: [PATCH 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-13 10:57:43)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e5e47a..984301442653 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,6 +21,11 @@ properties:
>    reg:
>      maxItems: 1
>
> +  reg-names:
> +    const: dp_controller
> +    const: hdcp_key
> +    const: hdcp_tz

Perhaps we should drop reg-names and assume index 1 is hdcp_key and
index 2 is hdcp_tz? And then make them optional by having minItems: 1 on
the reg property.

> +
>    interrupts:
>      maxItems: 1
>
