Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA92D2A254E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 08:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgKBHe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 02:34:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727689AbgKBHe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 02:34:58 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C94CC0617A6;
        Sun,  1 Nov 2020 23:34:58 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id y1so3664901uac.13;
        Sun, 01 Nov 2020 23:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jcub/V5PHC4+SEwinCH+yvg22FdW459DqPvHHN6CGCU=;
        b=OoKgxHDC/RE2Xk4x6hntCvv+jB06IZwpSl+luRMl+q182/CX6tYZEypISW19jThP1X
         0MVJKH4Xtz5GtvUVqbkngfjCrxw6yj7fKVOswDZ53y7bDAuIJynVXyX0WkTBd5ZCwsse
         TOjWZaP8WaigFe8ugiwp4ZyHt7rtrX/27YF+r40bv5DihKNaaizyXCX4XFF5oQfhs4Bs
         z5iG5OBofBBJTZBJWSQtQYQB8v0nK2tpSeWygfyof8BDetHXPPaSu8HybPYl9ZFPKndw
         hV0RMzEkDuM2hhjmBdbcX1nwVksBfpD+r115Pj36Ab3c5hARGcUhkKJySS6Kl1lY8o93
         iGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jcub/V5PHC4+SEwinCH+yvg22FdW459DqPvHHN6CGCU=;
        b=hH7WWl1Y0bACT88DOkrywxVuY/A5xa42gBZ1vlwYmeFz1Pz11s6kxH2sdlD5pD08AQ
         M3a31wltREiCxeHBMEN8A1ggLuzJRMXgMset8+GHeDTKqyna2CABBwcXUBkriRqZ6F6w
         lIXBmpFIU0PbM9Uz+D9srygNYNuljhzvT7m4PfCu+WZ8iVJ+ZMREnZOM4juzZUfUsoiS
         WhM7fdmjgqNVT+mMxf+CLHXP4Y63idMwWO75Qkq4jYLREPEMU2HPXDVyhuAoS5yXQ00R
         2zTcoGFo0b7FpKaIW1ZqdsHaw6aDrogc6DX9td5W/JhYmwycp/tsOaPK4OlCvgZ+7AmP
         IHDw==
X-Gm-Message-State: AOAM530wkAYULlUe/5hoiDETzqbSuUYf7hSgOSYwrYED93hkAE6cqdPo
        2ONMzp0dBfmwDee2huCYLl9YX4XVtH1K379HNhteY/h+SLKn8w==
X-Google-Smtp-Source: ABdhPJz5csAPhcYN0p+3YMmXnIZqHfYWOpyp92yHXR/WeaeyKqdn57Lhd1sizJD81Dd5tXoCetVfFoXKb9fGX7fEcCc=
X-Received: by 2002:ab0:23d5:: with SMTP id c21mr6953552uan.129.1604302497198;
 Sun, 01 Nov 2020 23:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru> <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Mon, 2 Nov 2020 15:34:46 +0800
Message-ID: <CAKgpwJWWg+fimuQOCcw=L0HZSwLYXNNCAV4ifzzG-HXfkFmazw@mail.gmail.com>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Serge Semin <Sergey.Semin@baikalelectronics.ru> =E4=BA=8E2020=E5=B9=B410=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=888:04=E5=86=99=E9=81=
=93=EF=BC=9A
>
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.

This need a counterpart driver change:
drivers/usb/dwc3/dwc3-qcom.c
dwc3_np =3D of_get_child_by_name(np, "dwc3");

Li Jun
