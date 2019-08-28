Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E9B9F760
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 02:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfH1Adq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 20:33:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36182 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfH1Adq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 20:33:46 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so398400pgm.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=Le67xD4dgnHnmjT2Q3611VE0H3J05KajZPLgblKSiFs=;
        b=Koe9DZY0IjEclkzhNeNnInI3BcoZy5V8wzgIBCHfeKqn3z/6j7hSV0G2lZfrmx4J78
         ns6j2gqfk8C7ZJp5eUqllEEw1As5DAcFIcerT9lN/TN5smHccP1uqLhefoE6wTDOnNtt
         0Mr5Nza3tZNdZmPPlnNdiq1XL1g9X+8IGbxF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=Le67xD4dgnHnmjT2Q3611VE0H3J05KajZPLgblKSiFs=;
        b=ZaxXvy0GUtmOUka4VzdWTAleLnlXmf/G1xXk0DPGn46pR/ChBre17Dp2KnmL3fZH7f
         GoOREbJS8nD/H8FAcZkmv9Odl8ZhN3EXSNTvGsYrDRwhU3sA1OBdfAaysvvgmD8PiODW
         T6ndk3EG3lIwubfMQnBD0I/o4VOMeQifJ7wbt0jVe7IdPQqHxWB57bqFrTLrA3UOerVi
         s9m0oe5e4jxi9thT+tO2lUDDnJMd0J9OlP++KMO5UY37+W6yhT8LvRvAw80me0PMfV5L
         7IdWZnNsP1PdGPLNj0K6gPDxKMy7KYcKI33NYURNtJE3bcU4/MBXNWUELvXdpk/1NqIG
         Ku4A==
X-Gm-Message-State: APjAAAWz07b1qp4oRCDxXjKgjwEzHXeEikt1y6JpZ4/n7w9qq1bI46A6
        31torMUkU+3voe2tz8XuVnhtfg==
X-Google-Smtp-Source: APXvYqzB3BKq2zBiCNP/tObOHr5KzgQIMNZwDENpW2WLNkldQ8Tmp6AQRyyp83CfnJR25DPGlbmLsQ==
X-Received: by 2002:a65:68d9:: with SMTP id k25mr1054914pgt.337.1566952425481;
        Tue, 27 Aug 2019 17:33:45 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b5sm485890pfo.149.2019.08.27.17.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 17:33:45 -0700 (PDT)
Message-ID: <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marc.w.gonzalez@free.fr, masneyb@onstation.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 27 Aug 2019 17:33:44 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-27 05:14:03)
> Define two new required properties to define interrupts and
> interrupt-names for tsens.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/D=
ocumentation/devicetree/bindings/thermal/qcom-tsens.txt
> index 673cc1831ee9d..686bede72f846 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> @@ -22,6 +22,8 @@ Required properties:
> =20
>  - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a descripti=
on.
>  - #qcom,sensors: Number of sensors in tsens block
> +- interrupts: Interrupts generated from Always-On subsystem (AOSS)

Is it always one? interrupt-names makes it sound like it.

> +- interrupt-names: Must be one of the following: "uplow", "critical"
>  - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how=
 to specify
>  nvmem cells
> =20
