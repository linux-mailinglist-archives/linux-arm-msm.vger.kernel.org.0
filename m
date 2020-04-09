Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8815A1A3002
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 09:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgDIH1L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 03:27:11 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38655 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDIH1K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 03:27:10 -0400
Received: by mail-pf1-f195.google.com with SMTP id c21so3733716pfo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=PW5R2urL1RcCKJMKVW/iEwooUVVj2eA41VTurDA74ms=;
        b=I6pvTt6GHsW0D0ZVS6BI4QmKrZiYbk0HpP+vCrvTVfUgOQ5gW1gnUI71119PTVOQMZ
         kAL6OFJGcxedpoS8niOrYl00HxS/nv0wjs94Gkyl8YhWbO00Xgvb6PwJic/tex0YXFVD
         QV+0ZxTf7W3j24HFtTV5UV6oc6LEWemZYDViY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=PW5R2urL1RcCKJMKVW/iEwooUVVj2eA41VTurDA74ms=;
        b=iAXJQ61z82rpxUXO07JBtO56v2yd0n/g7HQzYz3z2dbe/kkhALKh2eA072xfnL3K4h
         JwhPcAl2UDTxl/ldEWqtktP3kKadYs1Wyyv8V/heiCIewBAftR6u/JhFs/9jxT9ScZcS
         vMw4MqrQ5FiVZqu0Qobtm/C1daYt5er7GUdHnfIVr28zKIRSj7VTmKj0sq2axXaOrYz+
         0wmG4TMr9NkGK1HsiFixMBJCcuxe4ZCxZ6uqsC0ZgjwJeufsA3vJVNhWejbqcbkIkUit
         P75hFILgUFQplM8jGffCigubjuDS+KWjaw/OjgjElfk1/voko2WJ7C4cHlrXV8gJ1Q+g
         xYiQ==
X-Gm-Message-State: AGi0Pua2Runl9OSyP+3Ct9ozTSLXmVX6pfkJew0MqwUH1eCPfadxUxSw
        oDTSiQMoEKNC+3mOnpvzF/fqUg==
X-Google-Smtp-Source: APiQypJqdncetrhZ92esLZOchlzSIwcyr3ixrVR2rf2bIw+D2kX4czue1SWYP7xdPCxoE+i4hCE8qg==
X-Received: by 2002:aa7:9a47:: with SMTP id x7mr11708235pfj.29.1586417230218;
        Thu, 09 Apr 2020 00:27:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id iq14sm1364163pjb.43.2020.04.09.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 00:27:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <24b30222392569e7aa5d61d46642a4c38a964512.1586359676.git.mchehab+huawei@kernel.org>
References: <cover.1586359676.git.mchehab+huawei@kernel.org> <24b30222392569e7aa5d61d46642a4c38a964512.1586359676.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 28/35] docs: dt: qcom,dwc3.txt: fix cross-reference for a converted file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Thu, 09 Apr 2020 00:27:08 -0700
Message-ID: <158641722866.126188.5100903994140124194@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-04-08 08:46:20)
> The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> Update cross-reference accordingly.
>=20
> Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bin=
dings to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Docume=
ntation/devicetree/bindings/usb/qcom,dwc3.txt
> index cb695aa3fba4..fbdd01756752 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -52,8 +52,8 @@ A child node must exist to represent the core DWC3 IP b=
lock. The name of
>  the node is not important. The content of the node is defined in dwc3.tx=
t.
> =20
>  Phy documentation is provided in the following places:
> -Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> -Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> +Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt    - USB3 QMP PHY
> +Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml - USB2 QUSB2 P=
HY

It should probably be bindings/phy/<blah> so that when the bindings are
taken out of the kernel context they'll still make sense, but that can
be done later.
