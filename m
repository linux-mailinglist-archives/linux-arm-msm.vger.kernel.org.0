Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389D66878D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 10:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjBBJ3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 04:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjBBJ3g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 04:29:36 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9D56F738
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 01:29:19 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id v17so2067149lfd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 01:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hF1FP9uSu/iok1i0gg8stAHISdJKJxpXWFpnnPM01bY=;
        b=TCYiT2ou6sYOivmaPUJ1gwQvaOAlwLO6UihiPY8n6SiszSxUadNii1IqN5eHEVSIMn
         CACMWWQwcavwuA7eMAclq3FouMwHIjqba6ZlbATn0C8XUEIz1O18hnoRxUHyMYIXGtmw
         MXZy2H3VhdMTjzWNx/VMMGhqx0dTT4i3d2/GR0knAd2LD67dTTdncA0RoaMuG3FFBgJ4
         tQKjVHu6xeOwjwET0BDoygvMuGPAGxExN4A+s7j2lR89zV+lhQ/r5NQJOqVO5s3yOCSW
         U2or+M1xhhY6WL95dvIrzdwj27KTaurc3Lts7Xsrrh5eNAHUB1Q1eMPrCvEkXNaauBmb
         oOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hF1FP9uSu/iok1i0gg8stAHISdJKJxpXWFpnnPM01bY=;
        b=1c82gzYZb/+hsBO9yEQb14plpghU2XzuJTGl3zP5NOCx2iqrMM7Ve2mKc+VgZqsvHM
         yk5dz6btC2JIHPNQ4ulRiWIBORN9O0bP/Buz+4y8yAu9Fwk3sL1sgY1tuO2wqFLCaJAn
         kffoNQHEm1JPp1KF+a0yHQWiBlYrr+dHcDMJlDeKthnycd0nPZKXxJ9CIlYzlNxBNO3g
         epeKxWzro5b8kth6nWHAMBl0bjHR4aPvfMAeqBgp5m6lmPiVHfrsuCPCt/WrNda/Tqb+
         m+4Ug7EIsczhe9XEVMC11maEM7BgK0QIlZ9HxsARJJeGI4N0cZmq0TCDmNKbZP7XAq7p
         eY5A==
X-Gm-Message-State: AO0yUKVvICcHoxpA3kp+WRMG/yead6PmsDe+YjWxnKSEVDpeh5ypDdmQ
        wawb98aZYCR5ZNYGmT0daWHBeBeSKkJpqx8fVQNSYw==
X-Google-Smtp-Source: AK7set/U6c2t7aCZeIxVjttv08cAYzl5rIui1u4wZg2P32IfHGX10jGlEQUkCyHyHL5hE/viRgutm4dUbeSvVaUzK+Q=
X-Received: by 2002:a05:6512:12c9:b0:4d4:fcdb:6376 with SMTP id
 p9-20020a05651212c900b004d4fcdb6376mr1412014lfg.218.1675330157397; Thu, 02
 Feb 2023 01:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20230201080227.473547-1-jun.nie@linaro.org> <9ab7383b-f3ed-3e48-d275-3c8933be5f2f@kernel.org>
In-Reply-To: <9ab7383b-f3ed-3e48-d275-3c8933be5f2f@kernel.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Thu, 2 Feb 2023 17:29:13 +0800
Message-ID: <CABymUCNKvm9+_ascdcWAgA1xGYKPhyO5C97-+rTTK739v+UEew@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Add Qualcomm CCI dt-bindings
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, bryan.odonoghue@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,msm8939-cci
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  operating-points-v2: true
> > +  opp-table:
> > +    type: object
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - operating-points-v2
> > +  - nvmem-cells
>
> ?? You cannot require properties which are not present.
>
> > +  - power-domains
>
> Same here.
>

So the properties should be added later, after cpr and fuse nodes are
available in mainline, right?

- Jun
