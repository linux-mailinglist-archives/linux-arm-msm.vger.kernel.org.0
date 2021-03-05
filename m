Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7826232E28E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 07:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhCEGxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 01:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhCEGxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 01:53:09 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E85EC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 22:53:09 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id l18so1357331pji.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 22:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=kV9qrUApJ+Cu/9Ed2VGP4yT1O8hls5Q3S83d8h+ACtI=;
        b=jx23HuP+QHpQ4hJSLWGUxBRl+yzoaBd8GomfgbQS1TheLIXS7zWZ8x5ohIFwb+Bfkl
         uo287c7wH05VFPOlnD+6cb+tMBpwSwCnK3G9DSvuCSk/uFdiqy0nNE9laylqODudMS91
         vx3+8cGp5nk1DgYg8anCzi6RpAHlTkqYmnrTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=kV9qrUApJ+Cu/9Ed2VGP4yT1O8hls5Q3S83d8h+ACtI=;
        b=XWIx1NZ42X/UM6Wbk7qbV9TdYZk7nNadOP1WuyBmQbHixbuQ9nRA9IOcioLqjF830L
         VxrqPXqlZN6KQP/aFZF9d8SMYPg0mcxy9fmpAomXf2cb91pcnZpH47c4XPAdNmlWjDL1
         YGloa5v+11n3y2dQe+VV+tWZR7Ybj8Ji/z/XaREvq6wEJj3qBR+0mhHwfd4SSjdOZZbx
         8jkvAdlXlM1YzbPjBeHsdv7SuCDfn3HW5RY4rDcLP/+ZViZZE4RkySdmZxh5T7erDoj4
         Xt9RXXrPEssBtuHVom0R44XmDT/SgE/qppu4FL3yqjOtOa/EDBYJf6dcqp2IipsqAjRB
         XOQg==
X-Gm-Message-State: AOAM530DPtYohuWy6C4ihw+5ZwnFObfmTBW9+itzypmy+cPLmpBePQEW
        dhvIB+uivdNuZ6bh0ZJ2IAl8wNYfaMxbcQ==
X-Google-Smtp-Source: ABdhPJwcW5444RxixDO7dbie3rx5R4kqZpsWl51fjEP9pN7vpZyANwlbZUjKHy66Q8ddV3MspmXhyA==
X-Received: by 2002:a17:90b:a04:: with SMTP id gg4mr8879001pjb.51.1614927188465;
        Thu, 04 Mar 2021 22:53:08 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b498:4a2d:bc34:b77e])
        by smtp.gmail.com with ESMTPSA id v5sm1386461pfc.100.2021.03.04.22.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 22:53:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5a94b8c4ccb73afdf99bf901ce86acde@codeaurora.org>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org> <161436872955.1254594.2765257503019122275@swboyd.mtv.corp.google.com> <5a94b8c4ccb73afdf99bf901ce86acde@codeaurora.org>
Subject: Re: [PATCH v12 1/4] dt-bindings: msm: disp: add yaml schemas for DPU bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
To:     mkrishn@codeaurora.org
Date:   Thu, 04 Mar 2021 22:53:06 -0800
Message-ID: <161492718630.1478170.1460276218009944071@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting mkrishn@codeaurora.org (2021-03-04 04:36:05)
> On 2021-02-27 01:15, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2021-02-12 02:49:57)
> >> +
> >> +    soc {
> >> +      #address-cells =3D <2>;
> >> +      #size-cells =3D <2>;
> >=20
> > I think we can drop the soc node from the examples.
> Hi Stephen,
>=20
> In latest dt schema, there is a rule that we have to specify the address =

> and size cells or else it will take default value of 1 for both. If we=20
> use these default values, dt binding check will throw error as display=20
> uses 2 address cells and 2 size cells. That's why soc node was added to=20
> specify the values for mdss node.
>=20

Do you need to use both cells in the example? Presumably the second cell
is all zero, so it's useless. The example doesn't have to have both
cells in the reg property, that can be fixed up when writing the DT for
a particular SoC.
