Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269E51FD126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 17:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgFQPie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 11:38:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726597AbgFQPid (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 11:38:33 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8E0921527;
        Wed, 17 Jun 2020 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592408313;
        bh=Mmp7l8nOqzeof+dCZUf8iwFZM9Tbqs2liNaByHyvJTY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=USXaaW6m3HgNXWONtUd4GS+12X3vlrQ2BIvKWKCz+S7WUOSD+FgPuGUBLy+80HhnC
         QQZlhSL97CRpS8wMlCVCmBYzPVGQeqxfK0ZOSHdVCQ5redR969T0BmYdNxZNYaehvO
         5UNFUMqKg9dyyc8FECvUdiSMwisPSJDXrY4Ec1CU=
Received: by mail-ot1-f45.google.com with SMTP id e5so1944121ote.11;
        Wed, 17 Jun 2020 08:38:32 -0700 (PDT)
X-Gm-Message-State: AOAM533megbuNEP/iL4ZKX++IfcJPJWYdF0TAPYmzaMbRoP0cuQ2/z2R
        bRIrGOhPIm0/N88h4Mn6U2iZhFVNJXWo50Vj3g==
X-Google-Smtp-Source: ABdhPJx+PoYXKyeUx8MAjbYQ1LRx9EEpUKsbhPm2Dbg1Vw8A/V17ptpVa4zGODoB4OocpKHaH/C7MvTr0HCPXdlZSBA=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr7446929ots.192.1592408312183;
 Wed, 17 Jun 2020 08:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200612015030.16072-1-tanmay@codeaurora.org> <20200612015030.16072-2-tanmay@codeaurora.org>
 <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
In-Reply-To: <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 17 Jun 2020 09:38:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLsp6gR_=nA36usk67n7+EJOoxt-87R5zc1_DXpap5cag@mail.gmail.com>
Message-ID: <CAL_JsqLsp6gR_=nA36usk67n7+EJOoxt-87R5zc1_DXpap5cag@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, aravindh@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 16, 2020 at 5:15 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Tanmay Shah (2020-06-11 18:50:26)
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > new file mode 100644
> > index 000000000000..5fdb9153df00
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > @@ -0,0 +1,142 @@
> > +        data-lanes = <0 1>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                dp_in: endpoint {
> > +                    remote-endpoint = <&dpu_intf0_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                dp_out: endpoint {
>
> Just curious what is eventually connected here? This is possibly a
> question for Rob Herring, but I can't figure out how we're supposed to
> connect this to the USB type-c connector that is receiving the DP
> signal. Does the type-c connector binding support connecting to this end
> of the graph? Or should this connect to the DP phy and then the phy
> connects to the USB type-c connector node? Right now it is empty which
> seems wrong.

It should connect to the Type-C connector perhaps thru some sort of
switching/muxing node, but that's not really flushed out though. See
'dt-bindings: chrome: Add cros-ec-typec mux props' discussion with
your CrOS colleagues.

Rob
