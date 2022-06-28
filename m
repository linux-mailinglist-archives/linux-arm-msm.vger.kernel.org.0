Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA04155E474
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239820AbiF1N2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 09:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346101AbiF1N1K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 09:27:10 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C615326C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 06:25:25 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e28so12528104wra.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CKn2dypMjl//s7j5EiwsdZOXhfwq674TABBiuFBlpDM=;
        b=x2OpHdF1FzcOsB230wGtKvY7rbtz97uba8M8ySomN+j+XXYdCjPOpLBne46nBCIMCy
         PrTwfjUhnEbntHCwS1JgkCZOIfnjiF8P4ssoB1e+/3nGBQk6p9KqpU18fIh3XMJfW8PA
         NN6RBkBt9SLwzO4KgUwG8UxIZe7MPCtk82dUzYDHcXP8C12UNKiEH1rKdOGNz4JN7t+T
         mKA8ggkhHxG3O1/WPF8KzwCOKsEob6SRKUfkyMvqzqKa60vn8RLFKBbNGwf5VF/5WtAv
         ux79dHBwZ4NSDooIrW3eQ1GGKAfiRF4cgef5MDk/ovO8E6ZZwnajI9KfImbT9II9biR7
         Qc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CKn2dypMjl//s7j5EiwsdZOXhfwq674TABBiuFBlpDM=;
        b=HG+H1mKv5wut1kR0KJCapB5Tnz5WOZ/7hqRSoKYUVLX1s7iiW/AuHgYwc8D3zm7Jjm
         EFniV2KgU9vgNrCFmN/KwW6qu0gCH8i/495qGJnXuk25kp+92B4jkt9PyydQ8dbpC/G0
         on8lbUjgIEw6E/bTeL/kir+2RRR0PQgmlOhRlO2KiPenYmTUTpsntEmX3XtotUi3TxHt
         CnKA+qb8nvLNYjQ6onsl1+K1h/+fQ2iC3nVxJplvrL8c+2Dw2jnUb/4LCa7tWyaoELq/
         GfRHWFXo9rbTJbiO9J1LO1TXhLZdmfDkZJUofNUf1QqM+73DA+mIX6WnF+57LN3HwsZW
         EuyQ==
X-Gm-Message-State: AJIora+VeCOZF/Xi55JGO/nvJvjfs0FK78GS2Bx3eXpYpOzAgftH3kwP
        5p9++xLB9WVRXEjxGfXbXT1ogFfI+tuASA==
X-Google-Smtp-Source: AGRyM1tU4KPGbD+msQMaaYfAKuHpqNJm7R8fnemJkU0QpA+/c1aS9eYuoEnlIO3YouI51OGosYwJlA==
X-Received: by 2002:adf:fe83:0:b0:21b:9cc6:4c91 with SMTP id l3-20020adffe83000000b0021b9cc64c91mr18439262wrr.414.1656422723925;
        Tue, 28 Jun 2022 06:25:23 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a2-20020adfbc42000000b0021ba1b6186csm15049119wrh.40.2022.06.28.06.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 06:25:23 -0700 (PDT)
Message-ID: <c8699827-bdec-cef2-9174-9aa769a2ceeb@nexus-software.ie>
Date:   Tue, 28 Jun 2022 14:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     lgirdwood@gmail.com, bjorn.andersson@linaro.org, perex@perex.cz,
        tiwai@suse.com, srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
 <Yrrf5X8wstW+DXHF@sirena.org.uk>
 <14f6b7eb-cacb-91a5-ce06-9702618513b9@linaro.org>
 <Yrru6n6HnEAAz/2Y@sirena.org.uk>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <Yrru6n6HnEAAz/2Y@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 13:07, Mark Brown wrote:
> On Tue, Jun 28, 2022 at 12:48:20PM +0100, Bryan O'Donoghue wrote:
>> On 28/06/2022 12:03, Mark Brown wrote:
> 
>>> This doesn't apply against current code, please check and resend.
> 
>> What's the tree you are applying to here ?
> 
> The ASoC tree.

V4 applies to your branches for-next, for-linus and the tag 
asoc-fix-v5.19-rc3

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=8916-asoc-fix-v5.19-rc3

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=8916-for-next

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=8916-for-linus

I don't see an obvious master branch there.

I based V5 with the change you requested on  650516f1c1e0a - 
(asoc/for-next) Merge remote-tracking branch 'asoc/for-5.20'

https://yhbt.net/lore/all/20220628120435.3044939-1-bryan.odonoghue@linaro.org/

Please let me know if I have the wrong branch.

---
bod
