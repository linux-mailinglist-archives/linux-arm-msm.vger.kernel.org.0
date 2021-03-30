Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2E234F182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 21:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhC3TRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbhC3TRx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 15:17:53 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C79C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 12:17:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ha17so8268507pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=3XyvmIdPKkahClLiosjlR6PMEtvu7FXBIX4RfgFdO+A=;
        b=XbBZvXfE1rDKUgLY6DL9YwTFjGnHX4NS+EXoH+qy+LZTC8E06zrWzGEx4ei9Wuqdqf
         XRIv5j8wFwyixAwTmjXiW7B36hD/HjU+iFvtJ5I8OZJzlAgSBe2/37yrFnjSkkJKNw+/
         U4qkX0VjMX8rUJBvLwwBD4N6ns4sli8p8S1u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=3XyvmIdPKkahClLiosjlR6PMEtvu7FXBIX4RfgFdO+A=;
        b=FSgBW2wefnHLjFfKmFiDXObn9PEkjIbior17Zj0OuCgIxbQSEiuIUKHeb0PQ38zYhV
         /2Y/oF7oL+2dOXhA+328o0tMq2YtYe3Mn4CYQdSf0rQFCyGQZdgZ2+ngOaOig7HQ+8gT
         HikHv1BvObS8QfytQ0k29hTAexK3N9BnWss2SEAZnSJbrR2drruW7EFxB4HyhfLAKgcH
         hKHyRP34c8SUOzdXoE8N3/XWziRvYo47GDvCAzBlU8Mli9KJi0j4++jOMDn2ap33LEOc
         bpxwRYIVBFOsP856hAl6Lbd918lSDZ86VO6c5ltH91/HdRQ189AahYkmY/eW2vdWe3rN
         eZrA==
X-Gm-Message-State: AOAM531z7Vn6whWE/CniVHs9vz/jh0QPqjzYVSyN+UCDmNh1KRnEy0C/
        kcSbm1CaxltmiD/XRT9ZYw1kIhe163OG0w==
X-Google-Smtp-Source: ABdhPJzFRvvuGWIQm+GFxHiJKCJhlD+K7u/asi03QngCH+Xm6melsBRtBTPFw6vcJ2niX1RQJOVIOA==
X-Received: by 2002:a17:90a:901:: with SMTP id n1mr5803503pjn.147.1617131871729;
        Tue, 30 Mar 2021 12:17:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:c8c2:b814:df0f:253f])
        by smtp.gmail.com with ESMTPSA id e13sm387515pfi.199.2021.03.30.12.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 12:17:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b41d57010d51356bdc4af1cd9d9c01ec@codeaurora.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org> <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org> <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com> <81ea21602c74d2b18e4b013dda3a3213@codeaurora.org> <161698798504.3012082.2821776620747041419@swboyd.mtv.corp.google.com> <b41d57010d51356bdc4af1cd9d9c01ec@codeaurora.org>
Subject: Re: [PATCH v14 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
To:     mkrishn@codeaurora.org
Date:   Tue, 30 Mar 2021 12:17:48 -0700
Message-ID: <161713186863.2260335.7768119837169527451@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting mkrishn@codeaurora.org (2021-03-30 02:22:29)
> On 2021-03-29 08:49, Stephen Boyd wrote:
> >=20
> > Does that matter? I was wondering about that and so I peeked at the
> > qcom pinctrl binding and it seems to follow a similar design but=20
> > doesn't
> > have unevaluatedProperties: false. Instead it has additionalProperies:
> > false. See qcom,sc8180x-pinctrl.yaml for an example. So did you try it
> > or does something say you can't do this?
>=20
> Hi Stephen,
> I had tried the same thing in one of my initial patches and I got a=20
> comment from Rob that we have to use unevaluatedProperties when we are=20
> referring another=20
> file(https://patchwork.kernel.org/project/linux-arm-msm/patch/1589868421-=
30062-1-git-send-email-mkrishn@codeaurora.org/)
> In latest dt-schema tool, we will get error if we try to change it to=20
> additionalProperties: false.
> For example, in this patch "#clock-cells' and '#phy-cells' are mentioned =

> in dsi-phy-common.yaml and I am referring this file in=20
> dsi-phy-10nm.yaml. If I add
> additionalProperties: false instead of unevaluatedProperties: false, I=20
> will get the error mentioned below.
>=20
> I checked qcom,sc8180x-pinctrl.yaml that you had mentioned in the=20
> comment and this file is compiling without any issues even though it is=20
> using additionalProperties: false. But I see that the properties=20
> mentioned in the reference file (in this case, qcom,tlmm-common.yaml)=20
> are again declared in the main file qcom,sc8180x-pinctrl.yaml even=20
> though these are mentioned as required properties in the common yaml=20
> file. If I remove these properties from qcom,sc8180x-pinctrl.yaml, I can =

> see the same error that I am getting for my file also if=20
> additionalProperties are used. If I follow the same approach , ie define =

> the properties again in dsi-phy-10nm.yaml and add additionalProperties:=20
> false, I dont see any errors during check (working change mentioned=20
> below). Should I make this change for all the files?

Honestly I don't know. Can you resend this series and Cc
<robh+dt@kernel.org> and <devicetree@vger.kernel.org>? You don't have to
change this part, but it would be good to call out that you decided to
stick with unevaluatedProperties vs. additionalProperties somewhere in
the changelog or commit text.
