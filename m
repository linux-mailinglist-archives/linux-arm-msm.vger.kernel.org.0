Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBCE31513C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgBDAlh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:41:37 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37303 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgBDAlh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:41:37 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so8517437pfn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=vSA6BvPjvS9ifz76R6As71Q8f4abiw4r0fjrLkrMqHY=;
        b=X0804Dmzj7ntDUKGWRZy5N8uQqcOcTBMO7/5JxLInlhjMa1DoG2NAjNDdmK+EhLXr6
         eziBSWTdVkCc3bp10pnLwq++HTZWxJ4VBiJsB9CrXQyCIyQjSbU2ZsDtW1+XIxO/zbUm
         AtJemD+iiaizG2z6mbq9VAd3R7QtVjGlwHTXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=vSA6BvPjvS9ifz76R6As71Q8f4abiw4r0fjrLkrMqHY=;
        b=UbQSNhbMKalHCXL+IKsCTY5egZd746BFdk3LydzVi2cvsTXF3UFv+P1RgB6CR39pHa
         oIbESBo2W08/BXCquYTHjCrxl6/ZNZ1l6QHViGUIMqAH0F9lRyceZLNLcDkAcR75tbd0
         tYF2i88FRKmB/fSmQVk9JFC+M35rTi3PZC6ywf+Xfgm0KPfA/IPNy64vv4CNaCro1gVx
         AqQTTnHlOOoJLP9/7YP/uB5gbWGarEueRcoVkaZpifYoQrcdesc5sR2I6B+Ur0k8c0zs
         1fjpVhb4QS47EAsGFez70ox+FbkVmX3QXaWnVyZgSN4I9PJLz7MtDQVf0xnjhCT5+74p
         mloQ==
X-Gm-Message-State: APjAAAV3lCwL1OToN53Bp85gEq9U4O2wWH/AgH4iXOSXPNKA/PSXmU/j
        1UsG2dRYpjrvZXzhrwnovLvvqQ==
X-Google-Smtp-Source: APXvYqwKmbVPtw5RWhpIEPUagYYd2v0Gs0GvqBxVCfWID/zZfSOnf3RDr8ySgEC0OkU8HPFO64b46w==
X-Received: by 2002:aa7:8717:: with SMTP id b23mr27854169pfo.53.1580776896777;
        Mon, 03 Feb 2020 16:41:36 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id o6sm20654596pgg.37.2020.02.03.16.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:41:36 -0800 (PST)
Message-ID: <5e38bdc0.1c69fb81.2e565.9cc7@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200129203819.GE71044@google.com>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-5-git-send-email-sanm@codeaurora.org> <20200129203819.GE71044@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 4/8] dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:41:35 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2020-01-29 12:38:19)
> On Wed, Jan 29, 2020 at 07:21:55PM +0530, Sandeep Maheswaram wrote:
> > Add support for overriding QUSB2 V2 phy tuning parameters
> > in device tree bindings.
> >=20
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 33 ++++++++++++++=
++++++++
> >  1 file changed, 33 insertions(+)

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml =
b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> > index 43082c8..dfef356 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> > @@ -80,6 +80,28 @@ properties:
> >          maximum: 63
> >          default: 0
> > =20
> > +  qcom,bias-ctrl-value:
> > +    description:
> > +        It is a 6 bit value that specifies bias-ctrl-value. It is a PHY
> > +        tuning parameter that may vary for different boards of same SO=
C.
> > +        This property is applicable to only QUSB2 v2 PHY.
>=20
> As commented on 'dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings
> to yaml' a possible improvement could be to restrict these properties to
> the QUSB2 v2 PHY through the schema.

Can this be done? It's nice to keep constraints type, otherwise the
yaml binding is not as useful.


