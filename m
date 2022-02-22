Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C9C4BFBD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbiBVPDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbiBVPC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:02:59 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7330B10E076
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:01:49 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4F5DC3FCA8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542108;
        bh=HtdrJ3I4lOo9P+o7lWSeEHgMO5/UUG8VsgHgTsClLgE=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=G+PMQ6V4Q5in6kK6rSduCkvGNHTtH+X25bfzi4EQKTEGYL2UaIAxtYU7TZnqBh49l
         v7Yt4WGFM5fBf038GUvq20EPjmfg4kG59j2HkCrisb9aV+f36+HXOrFrUdXkeQBD6D
         OuVyVGbdGwGATWXtS9bkM6DCW4oAvTptqzUxZz5ZWBTO2+CFASoT60Ng7EkwBVqwf2
         iaNnYpLLwionXg74HKRub/LqIfvP2BYMalwNZ593fuTbzA1TRbjy8mCkF+FWhrmHJa
         x/nBB7uWI2mBzw4KBqK8UK46vTIMBisnesHdKrMVC7VZ9r0+PttR8L6krPtv8pjlTs
         B/fy0EWWyZiqQ==
Received: by mail-ej1-f71.google.com with SMTP id go11-20020a1709070d8b00b006cf0d933739so5905076ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 07:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HtdrJ3I4lOo9P+o7lWSeEHgMO5/UUG8VsgHgTsClLgE=;
        b=BaHqJ5IbOQu+PAIsK4wwyqzakl+KFFUDz1iOEdJWF/RkOzipXzxrSbQN3WZrQkHbea
         gvLz1SliGcg9g5LhCnYExUNHYkykLsYwEhGlzMzlyOwL3v9/0kuUpESbp5WRL3YmUlN3
         +A6P7G/gQWNbJlLl6L6tOI0qKLagt16IQ91ecJASXj6lIxvxh6VQkF+A6JEQen3M+yox
         P15lA2kxMzu88VlMOv+G6mf3AhNfS/3IxoKD37A0Q/dgabjP6B0zo3/IsewqjuhjwgJo
         iV0T56jIm65PPKWn9pmwaOspi+3I99oEVMa2cRaUJyfc3jpVk62G1xTtk0W2SueWJ81J
         ADHQ==
X-Gm-Message-State: AOAM532pmYW9T2pK9A+9SSBc4h9pYimHlyu35YZfOFEekGBwJglH8NmY
        0VfwM4jexTLAVALcjtWwIdNtNtgOglYp2sPAVzdURnaLODMY3U1DBe0H9s2UnfL5lsmsPzaOqbt
        3jq8aBfbiPhpgeKIbZAZxieSxxNcSje2S9TC5lbP80Gk=
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id v5-20020a170906b00500b006b48861597bmr19372052ejy.238.1645542107959;
        Tue, 22 Feb 2022 07:01:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl5ajALOLJhstZXNm4FFrBok2iV4kiyLbSmxL7nyMkd0sVGKDRLluG1qlnkwVf1Pl3ETi9Pw==
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id v5-20020a170906b00500b006b48861597bmr19372009ejy.238.1645542107580;
        Tue, 22 Feb 2022 07:01:47 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id ci16sm6345629ejb.128.2022.02.22.07.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 07:01:47 -0800 (PST)
Message-ID: <4e459bbb-ca6c-4ca2-efe9-8ab4d4f3b648@canonical.com>
Date:   Tue, 22 Feb 2022 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/15] dt-bindings: ufs: qcom,ufs: convert to dtschema
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2022 15:58, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Flash Storage (UFS) Controller to DT
> schema format.
> 
> Except the conversion, add also properties already present in DTS:
> iommus, interconnects and power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
>  2 files changed, 241 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> new file mode 100644
> index 000000000000..356217124222
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -0,0 +1,241 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Universal Flash Storage (UFS) Controller
> +
> +maintainers:
> +  - Yaniv Gardi <ygardi@codeaurora.org>

This email bounces ("User doesn't exist: ygardi@codeaurora.org"), so
maintainer is needed for Qualcomm UFS bindings.

Best regards,
Krzysztof
