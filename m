Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C047BB81B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 14:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjJFMxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 08:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbjJFMxB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 08:53:01 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54BFDB
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 05:52:57 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b29186e20aso366581566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1696596776; x=1697201576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cwqsii98peqhVJoK4VIxWSTkPTgnYf80VbctBQv6Fvc=;
        b=jaUK7riIqOMdRoc+PAPVEDMON96UZ3HLUoJNze+qNwyAvLubc0n7Hgjbg2/ESsb2mQ
         KerW+rI5tdfxN06MYBjjYn/5YQ62/gtAZXsews/genGsUFhPU7ZwsH2JKaFcMe6V4nW3
         tXRoGlBaOSa0/ubXCGXZEX8S6lz62q3g0Eh9Q815Y08pEYe4Mjz83M448XkTiQsK2GMJ
         UpaJsEK1ARRoDzTf/CtRc3CwG/mUn//qm+FSLXDAwIg25psVmDAlbHoko3N5ijHcDI7B
         jpoiQM7W3Sdh6FYDRRgUleu6vqWVsvVDflMWlw8SYMfxiwtg8q3zG66rZfPfem9oXhi3
         d02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596776; x=1697201576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cwqsii98peqhVJoK4VIxWSTkPTgnYf80VbctBQv6Fvc=;
        b=RR6ffhNxHPurp6OhLYC8uIalUrNtPzUU/VSDrxuN2RijQOhZkDy4T209ryMxf1ERED
         5K5WvikYQy42O98iQFD1ZqZ7qsgpcXc9ZmJys8HQvfHbnj03yryz1Ff7eJuuCSeALErn
         Uxc5rctwlK1VoLBPytYhkJ4JVXV+7LXuNZ/lCbNADVUnlSv4tnJbZ4FXopg8RWuQBaYN
         /vv8FENQZTHIRRg7J9FmbptDM6SAOuRy8p8YT6b67UTtaaQH7euNoGDqm7B8jFWB4kxq
         /tb3puIbzJR3B9jjt4MMHquOjUmakXAOwog3pary+ASqeAprvzGyItryEdqrh8YvzTWJ
         eQRw==
X-Gm-Message-State: AOJu0YwWO+Qci8l6RMIH9ZFQYEore8m/+YuMNfRPqayNIOJqBUPRkfT6
        Ch8zsMYG+BbHuS66QJ27jXvzbA==
X-Google-Smtp-Source: AGHT+IFB2jTPlqF+QJCHbtvihw8H2Qw/ZlMn8tXyBNhZ+xQvO86DXco10Nkex1qT7Hqi67YGHbT0cw==
X-Received: by 2002:a17:907:77c7:b0:9ae:1872:d01a with SMTP id kz7-20020a17090777c700b009ae1872d01amr6510332ejc.76.1696596775820;
        Fri, 06 Oct 2023 05:52:55 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l1-20020a5d4bc1000000b00323287186b2sm1607954wrt.29.2023.10.06.05.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 05:52:55 -0700 (PDT)
Message-ID: <661e3701-9a26-451a-8851-f1d1b2355f80@nexus-software.ie>
Date:   Fri, 6 Oct 2023 13:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-5-bryan.odonoghue@linaro.org>
 <ace84d7f-d332-4598-a95d-634c1d17f852@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <ace84d7f-d332-4598-a95d-634c1d17f852@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/10/2023 13:33, Krzysztof Kozlowski wrote:
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data.
> No output ports to some ISP?

Not for the moment anyway. Its a raw dump of bayer data to userspace.

---
bod
