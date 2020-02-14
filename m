Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5284715CFE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 03:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgBNCYo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 21:24:44 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42015 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbgBNCYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 21:24:44 -0500
Received: by mail-pl1-f194.google.com with SMTP id e8so3115874plt.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 18:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=zyr5zP62gxcn2MAM+lzUD5xLGxMnttBVg2RA3RQEg8s=;
        b=QMhZXkRH4oIy65/M0l0BfR39ISgMZgR3qAmeoxWLhNzfYAUHeaGBO3BZUfNJruc1wf
         jkfc3m8Y47UwUuWq9OOJsyPSEzF934STkcLaakWYPovEWNA6/2VHTAvYHd5EqpRIjYPz
         +mktNyNpU67YqZt3TvUHClkKp04eKzPmfdChc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=zyr5zP62gxcn2MAM+lzUD5xLGxMnttBVg2RA3RQEg8s=;
        b=ZkqqZq9IZFsR2fl2DLKuvhWlbUDDWcoSosn7iYBG1j9ah4tUAY6ydmaeQxgQDwFOx2
         Pvw02KsW8wyEEFVyE3QbnszpBp4H3F/CbVLA+rNg2aqAsMu7OEBFaIo3wyAl/+6+Y2oY
         +xVXeX1RAfSqVLH3hYqFdpDr5y+HRCEcfxU2bSXnhunibAc8QW6l1rgmwFU/aEzQwBTV
         lrFReWgBd6ml3q72LsStGycscZOMxkn4v1bTYpbQC+OmyBTY7Pe2aHoDJQf+OPcebGel
         AAGbDQm7Os1TJYO70gRWZo+wrNw7D3CoU87eIiuXim7NVdWf8T0mHqI6fYFihtzJEjLn
         T0Og==
X-Gm-Message-State: APjAAAV3yy396x08TslYGxfZlmJkc8Txadr2yEEuFNXwpDFwOqkAG/Sg
        rLFNW50saglkiCzucEO+K84Ojw==
X-Google-Smtp-Source: APXvYqxC2SJX1aAT6Gi5b3eS3JrHpxTtQH2y3axskLceSfHZHxtwyCHLbO1LRBrAThMLQXULz2yjYA==
X-Received: by 2002:a17:90a:b010:: with SMTP id x16mr708199pjq.130.1581647083461;
        Thu, 13 Feb 2020 18:24:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q8sm3883284pje.2.2020.02.13.18.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:24:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-2-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info binding
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 13 Feb 2020 18:24:42 -0800
Message-ID: <158164708228.184098.14137448846934888082@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-02-10 16:50:52)
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.y=
aml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> new file mode 100644
> index 000000000000..8386a4da6030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm peripheral image loader relocation info binding
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for describing the Qualcomm peripher=
al

Maybe drop "This document defines the binding for describing".

> +  image loader relocation memory region, in IMEM, which is used for post=
 mortem
> +  debugging of remoteprocs.
> +
> +properties:
> +  compatible:
> +    const: qcom,pil-reloc-info
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    imem@146bf000 {
> +      compatible =3D "syscon", "simple-mfd";
> +      reg =3D <0 0x146bf000 0 0x1000>;
> +
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +
> +      pil-reloc {

Should that be pil-reloc@94c?

> +        compatible =3D"qcom,pil-reloc-info";
> +        reg =3D <0x94c 200>;
> +      };
> +    };
