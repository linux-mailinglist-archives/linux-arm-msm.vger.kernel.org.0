Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474D12DDD2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 04:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgLRC7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 21:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgLRC7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 21:59:17 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF6CC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:58:31 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so431454pgl.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bC2VW5XkenWCusLOGpVQQXWwTeVsVyhtHMkwknNkbXw=;
        b=V6CS0BH0oPFd0xTWJSqLiIG0UWvAkCLAt2cQYq4tNx9wr3hzqPuKND6R7ELv4LSbNL
         H16fnhNv4MQy+Dfn7PhOOvS7EDUpX3roDAXn3NI14YdzDuipK9diyGsLO8b9gHqHfpaw
         RIOqV/NYejFbFp6gFe0nrvsNy0CTLOHJrPS4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bC2VW5XkenWCusLOGpVQQXWwTeVsVyhtHMkwknNkbXw=;
        b=AbJWwkUL+C3FkpUJ3isxQCZ8BtWsqMtmp0yVtFrqnh4G81EuO/Ky1pjKoQlGvICxLN
         HnSN4B+F2zok/wiDTK6sjoGgFpFefC2U8q7NJurX76zndjpXCyPFl4FShMWp/gnEPDAq
         UOvONUPQ3/bjto4/IREbLxxfsKFwYU9BhZv4lnvNW8kCedMFhucEz3iJ8vybl4SXwt0G
         dQPqAIFCjf6rSfCl65IZEWduUIfJkDW9V6g+PS3QOixeBps+wa33kZxt4PHmg5m1gyTa
         VnUeeRR3OwZASJCqVapPC5HbJYrYfZrZ2/6GT/3HrpvYENVhbKz9Qra5VLThf7eGlksN
         HpwQ==
X-Gm-Message-State: AOAM530x/ZkbGbBNNXXy9EoOe3Q30bVP+ELxd0ZblSO4dipCvR/v+vYs
        Dhq6hNxHb1iUviBm5iBcQuo1dAlxbkhmEg==
X-Google-Smtp-Source: ABdhPJy+Lf4rt3mzo+VnrFMtjObNYgUw6ZqquOi3xGql9AKigxKAHBKiumSYe0Cipj01d4IwAW/Tng==
X-Received: by 2002:a63:5845:: with SMTP id i5mr2119130pgm.355.1608260310682;
        Thu, 17 Dec 2020 18:58:30 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id d10sm6830466pfn.218.2020.12.17.18.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 18:58:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <13b88450f124129fd1fec586b6e8f33e@codeaurora.org>
References: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org> <1607670585-26438-2-git-send-email-mkrishn@codeaurora.org> <160772619842.1580929.2107809673048637455@swboyd.mtv.corp.google.com> <13b88450f124129fd1fec586b6e8f33e@codeaurora.org>
Subject: Re: [PATCH v9 2/2] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>
Date:   Thu, 17 Dec 2020 18:58:28 -0800
Message-ID: <160826030845.1580929.8191985658645644879@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-12-17 14:52:54)
> On 2020-12-11 14:36, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2020-12-10 23:09:45)
> >> Changes in v10:
> >> - Change title of this patch as it does not contain PLL bindings=20
> >> anymore
> >> - Remove redundant properties
> >> - Remove use of IRQ flag
> >> - Fix ports property
> >>=20
> >> Previous Change log:
> >> https://lkml.kernel.org/lkml/1597066683-6044-2-git-send-email-mkrishn@=
codeaurora.org/
> >=20
> > Why can't that be put in here instead of making me click the link?
> >=20
>=20
> Thanks Stephen for reviews.
>=20
> I just wanted to use space efficiently. But if it helps in reviews,
> I will bring all the previous change logs back.

Or it can be left under the cut (---). This is probably going to merge
through the binding tree so it doesn't follow drm practice of putting
version history in the commit text.

>=20
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> new file mode 100644
> >> index 0000000..bc80632
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
[...]
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> >> +
> >> +    mdss: mdss {
> >=20
> > Can drop the label. Also this node name is bad! Should be
> > 'subsystem@<reg>' I guess? And then the reg can just be the first
> > address in a reg property that is remapped for the children nodes.
> >=20
>=20
> I didn't get this part:
> "And then the reg can just be the first address in a reg property that=20
> is remapped for children nodes."
>=20
> Does this mean, I should add reg property for mdss node as well? Node=20
> mdss address is 0x0ae00000. So something like:
>=20
> reg =3D <0 0x0ae00000 0 0x1000>;
>=20

Yes and then a ranges property so that child nodes can figure out their
reg property appropriately.

>=20
>=20
> >> +      #address-cells =3D <2>;
> >> +      #size-cells =3D <2>;
> >> +      interrupt-controller;
[...]
> >> +                    remote-endpoint =3D <&dpu_intf0_out>;
> >> +                };
> >> +            };
> >> +
> >> +            port@1 {
> >> +                reg =3D <1>;
> >> +                dp_out: endpoint {
> >=20
> > Can drop the label and show some remote-endpoint connection?
> >=20
>=20
> I am not sure what should I include here as connection. IIRC, Robh=20
> suggested It should connect to the Type-C connector through some sort of =

> mixing node. However, I see only typec connector node at:=20
> Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml.=20
> Should we use that directly or should we use ec node?
>=20
> Can we do something like:
>=20
> remote-endpoint =3D <&typec> or <&ec>

Sure. I suppose <&typec> would work.
