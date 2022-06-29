Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CDC560332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 16:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbiF2Ohl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 10:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiF2Ohh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 10:37:37 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E0C39144
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 07:37:35 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t24so28445405lfr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=FhyPoEQz0RKtLndhys6lAY6EI+O9m3ogiGmUxKJbM9U=;
        b=incvQV4gzroWunRWH8JH/05yomzIH8GiXh6/TrYmrMvtPWDllUAuIvwcnlDuxUIbdq
         LfW69aXFkJpIp9QHztQ97hJeWtVX5/rsH4LW28XXqsuRY91gbcwXenJeddfsE1HkSxb+
         JoxIIEmVm6m7b9SyvgfKTZvp+tcShFl3H9yuZIpZGgrHyeSycZUcw+3NoT+phs724gL4
         DiBFyusivyJoZUogPfGR1WsnmiM5HKd5HVfsdr9NX6bR4iJqgFGKhHgsn07r2yIGaItQ
         peOGw2taLt9lipJ/V0OA/2FpbYcJOOfDHfgFoRWMGfpzhgZBzSe3uxzOFqWI+LkzFCnA
         9ZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=FhyPoEQz0RKtLndhys6lAY6EI+O9m3ogiGmUxKJbM9U=;
        b=lvMpBnLDUZ1AyqJ6WeJ4cI4yjYMp5woMmInFvke4ozYlAA327R251T0lZT4x1pKflT
         NrGbunwvXj+QOtqyd7/dKmEHtwU29m8rHu+iy0NjzwPgAwJ7o4CL+pGEq35D79AsdfLQ
         o7kChQ1T5VnPODkNd81XxfRb2Lraem42l4At2MztUyYl8nIp3VLQxAaeKpjbTSTOpjGb
         LmKHk7PVISp/376dmOBxzjKaaMbur26lqNQbWr9lOeoA+fvyIsh1LXHCcEGB3cK2mDiW
         oBg34jLt59p8BXkrMzDSP4ChVu9qRNF2xdfUlvYKfr0QjCOAhx6uRi8Y7rOWx/tDqOU8
         oGQA==
X-Gm-Message-State: AJIora/kQOyglK0L+EuLdEVOBmg3EqOG+EFKkg5mxAps2uHtX7jTknA4
        xs9BWAxhCuUNCc3KY9BoOZHhmA==
X-Google-Smtp-Source: AGRyM1tRX9vLYv7X5Wt5cAG/cVVk1Xh7kH6Us7qiN8IfkK/y+f+CJd2oU+zmfCrZv6S0nyXj5/0cLg==
X-Received: by 2002:a05:6512:2520:b0:47f:8512:19c1 with SMTP id be32-20020a056512252000b0047f851219c1mr2338958lfb.540.1656513454142;
        Wed, 29 Jun 2022 07:37:34 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id a19-20020ac25e73000000b0047255d21205sm2619414lfr.308.2022.06.29.07.37.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jun 2022 07:37:33 -0700 (PDT)
Date:   Wed, 29 Jun 2022 17:37:30 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: PCI: qcom: Fix reset conditional
User-Agent: K-9 Mail for Android
In-Reply-To: <20220629141000.18111-2-johan+linaro@kernel.org>
References: <20220629141000.18111-1-johan+linaro@kernel.org> <20220629141000.18111-2-johan+linaro@kernel.org>
Message-ID: <31EAC29D-77F4-4BED-B4DB-2B5718BD0009@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29 June 2022 17:09:51 GMT+03:00, Johan Hovold <johan+linaro@kernel=2Eor=
g> wrote:
>Fix the reset conditional which always evaluated to true due to a
>misspelled property name ("compatibles" in plural)=2E
>
>Fixes: 6700a9b00f0a ("dt-bindings: PCI: qcom: Do not require resets on ms=
m8996 platforms")
>Signed-off-by: Johan Hovold <johan+linaro@kernel=2Eorg>
>---
> Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml b/Doc=
umentation/devicetree/bindings/pci/qcom,pcie=2Eyaml
>index 7e84063afe25=2E=2Eed9f9462a758 100644
>--- a/Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml
>+++ b/Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml
>@@ -615,7 +615,7 @@ allOf:
>   - if:
>       not:
>         properties:
>-          compatibles:
>+          compatible:


Argh=2E Thanks for noticing and fixing the typo=2E
If necessary I can respin MSI series in a few days=2E

Anyway, for this patch:
Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>             contains:
>               enum:
>                 - qcom,pcie-msm8996

--=20
With best wishes
Dmitry
