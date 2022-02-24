Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB6254C2675
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 09:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiBXIoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 03:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbiBXIoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 03:44:01 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40BE5583AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 00:43:31 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1AA053F1BE
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 08:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645692210;
        bh=Dcj0D0zPsXPEVS1eNhpQqfPztDcGavIHA1/tOM5ybJI=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=PmeF1MjGoM4FAzZig19wP3N+L3TGBSVTIwlbjlu0lqqjH2vGsGKn1376wvCwS51US
         VeE6QmVvE+K90fma/E1nPhIqS+FA9+vUV08n1xYx6vraJSU4dyfOSoT7U/KtwIaavb
         WAa1+AILGxhgDIIUpT4BBsjYQslqpcfr+sy4rrAQBeEmubFaW4m3ByvlgFf3TzbzY7
         Dt/zWCYQGDymmBDe4od8eBEq7AtXrkL+yjXVPtbR/6tKa+Jai/Gess0gXMRZnIN496
         0UCuN5dDF/UjQczQAoN1pgx1z6bJtciit8P0z/fCzQNCKbgWEoizt05yjNmv6jN1XS
         qEIAjFWKoT0ig==
Received: by mail-lj1-f197.google.com with SMTP id r27-20020a2e575b000000b002463f43ca0aso735196ljd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 00:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Dcj0D0zPsXPEVS1eNhpQqfPztDcGavIHA1/tOM5ybJI=;
        b=Rwu0qglOPeNtjq2c4BrjyZHu5CSeMkeF1SqyMyKARpjPoJkaDSJ5PQXdGLhsMIkAgi
         QDgoLzNkzyKCNQMd2f6c6BYJpuPLtssTkjGjxpvjxmOpd3jjVl2efPugjr5T7lnRlxnO
         2qFiwC3DLDyRYSdjdnfkxm+LnVixxBKPcLZ6p5swJNu9FbULrm9csy+BYE+eQqmghl/L
         v59D/4wD9SPRpgUIm3umSrxgiwHLMYsCq5p1KHL3xxHFMds74tJY9xhEfeOEJlg0Mf4S
         IqW4GTYCQJl7483T7oaUxck+q2rIPn9YAfMxeGrZk3T/pxvuNB92O20x1KIIY5qIAusI
         egRA==
X-Gm-Message-State: AOAM531LOTPQ6HRAVfgKvy4VnxL96lKMIFYWzsbuIHrU+EJyoOa2aEX0
        25e400etBsAWwRQxHqks9dYZ+5qo5/MNloGHTOf851GSyMZwSoFgp8dQDgkGEEzD/c/W2LA9yAx
        lGWnVnFShRHs0ZXEmPdKMp5E6aPeC1hZAhjxOxIq2zUk=
X-Received: by 2002:a05:6402:2744:b0:404:ba60:fec6 with SMTP id z4-20020a056402274400b00404ba60fec6mr1261649edd.235.1645692198571;
        Thu, 24 Feb 2022 00:43:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR9ltyboSTjtHA8dcoqW8jhNMCdSS02AQooqb5CLRWmWM576orT/UQwLqy77zZSpmBsHCJBQ==
X-Received: by 2002:a05:6402:2744:b0:404:ba60:fec6 with SMTP id z4-20020a056402274400b00404ba60fec6mr1261610edd.235.1645692198343;
        Thu, 24 Feb 2022 00:43:18 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id 16sm1006988eji.94.2022.02.24.00.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 00:43:17 -0800 (PST)
Message-ID: <cd89539b-92b8-0376-03c2-1a9268721b92@canonical.com>
Date:   Thu, 24 Feb 2022 09:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/11] driver: platform: add and use helper for safer
 setting of driver_override
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20220223215342.GA155282@bhelgaas>
 <bc4f3314-46f2-72a8-f25c-c9774d987ca1@canonical.com>
In-Reply-To: <bc4f3314-46f2-72a8-f25c-c9774d987ca1@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2022 08:47, Krzysztof Kozlowski wrote:
> On 23/02/2022 22:53, Bjorn Helgaas wrote:
>> On Wed, Feb 23, 2022 at 08:13:00PM +0100, Krzysztof Kozlowski wrote:
>>> Several core drivers and buses expect that driver_override is a
>>> dynamically allocated memory thus later they can kfree() it.
>>> ...
>>
>>> + * set_driver_override() - Helper to set or clear driver override.
>>
>> Doesn't match actual function name.
> 
> Good point. I wonder why build W=1 did not complain... I need to check.
> 

I see why - I missed kerneldoc /** opener.


Best regards,
Krzysztof
