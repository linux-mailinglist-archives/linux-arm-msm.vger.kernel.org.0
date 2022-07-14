Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46F2574914
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237813AbiGNJb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238358AbiGNJbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:31:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0C02B181
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:31:27 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bn33so1442211ljb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zUUauj6xWQlBKhAmggWRJiHEqd+Uc2FLH1vOt4Xe2hc=;
        b=xOohA+X0/I6OlznNLZVRA2ZiFsMx+FSzNZpiqTOZlDUlQldcKqbYKMGrBYmQlZISA6
         OmYD3wdYcIQhEJmaVMMF5F4wl448dPyxDp/nscvjJdYjYyFQxduw8m4RBI0L4wdTYx4x
         oVnVkFi2IYVqFw89GRDrja22fhTDfDz5yvT1jAiMogAAKdo3OOvWJx+T9T/n7WcO9SCl
         3WIp5dx9o9YHn8Kv54r3/61aRZG6p+F+MmrI4pzcBHEBYAJqw7Jw3MylRn83m1LfFtyS
         6lxNweJ2Pg8BwdZ5GpzfNkz7yl0CJTB+S0QdmJhNHjacRkftXAzytlpPrmKSV/Fh1fRt
         EJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zUUauj6xWQlBKhAmggWRJiHEqd+Uc2FLH1vOt4Xe2hc=;
        b=24xICd68L6INqbzyR3lSbKIExf6WSTuu1A5Wavh3sYCk+N/XAJVzuepGfhqYtCyydq
         gM1625awo/J2HIe3+86ShUARTrop9logCp9uMNQyCAhhVaHLIv95GFqdVTtPM7hvMjxm
         bostMMv0sPDfPd1i0uoJ2Sv5/MmhCSl1wfP1kkqvX3e56u0DJGEPjMRlkmtqIDrNAJ7e
         zz5kbG5jQI7/fLvoq+WPudJx0H+hccRIE9EqLe2suZwfLZ2Ej6gWAsbVoGe6k1DkGfuO
         0LuHFwYDHJ5oYv7u4r73XwLgTuRkrYdCR6bTad3kQS6iZlIHZP1ePdcrUdH6wVJi8y7n
         anJg==
X-Gm-Message-State: AJIora9xkpDbkkN+Ujuuemc/6OkDk19ERdspdgetq5cI12AEeHO7up1K
        8PwB1Q7priiWZUD/XTKnfHWVvw==
X-Google-Smtp-Source: AGRyM1uoaKWpRhIDIlpLpcxTXkubmgIVBqbNjuwoyADerFM3djjjrtYD5bxDk4+gHIcEyN3xNoHMAQ==
X-Received: by 2002:a2e:8046:0:b0:25d:82b2:b328 with SMTP id p6-20020a2e8046000000b0025d82b2b328mr3907457ljg.185.1657791085189;
        Thu, 14 Jul 2022 02:31:25 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id u20-20020a05651220d400b0047255d21132sm260453lfr.97.2022.07.14.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:31:24 -0700 (PDT)
Message-ID: <5187985c-7f86-320b-aee9-a1107c8ce0a7@linaro.org>
Date:   Thu, 14 Jul 2022 11:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/30] phy: qcom,qmp: fix dt-bindings and deprecate
 lane suffix
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707134725.3512-1-johan+linaro@kernel.org>
 <Ys/QBPJmkWO6O3Fw@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys/QBPJmkWO6O3Fw@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 10:12, Johan Hovold wrote:
> On Thu, Jul 07, 2022 at 03:46:55PM +0200, Johan Hovold wrote:
>> When adding support for SC8280XP to the QMP PHY driver I noticed that
>> the PHY provider child node was not described by the current DT schema.
>>
>> The SC8280XP PHYs also need a second fixed-divider PIPE clock
>> ("pipediv2") and I didn't want to have to add a bogus "lane" suffix to
>> the clock name just to match the current "pipe0" name so I decided to
>> deprecate the unnecessary suffix in the current binding instead.
>>
>> To be able to add the missing child-node schema and handle device
>> specifics like additional PIPE clocks, it quickly became obvious that
>> the binding needs to be split up.
>>
>> This series clean up and fixes some issue with the current schema before
>> splitting it up in separate schemas for PCIe, UFS and USB and adding
>> missing parts like the child PHY provider nodes.
>>
>> The MSM8996 PCIe PHY gets its own schema as this is the only non-combo
>> PHY that actually provides more than one PHY per IP block. Note that the
>> "lane" suffix is still unnecessary and misleading.
>>
>> The final patches add support for the updated binding to the (recently
>> split up) PHY drivers. Included is also a related combo PHY cleanup.
>>
>> Johan
>>
>>
>> Changes in v2
>>  - squash split + cleanup + example patches (Krzysztof)
>>  - deprecate clock-names instead of dropping suffix (Krzysztof)
>>  - deprecate reset-names instead of dropping suffix (Krzysztof)
>>  - flatten child reg if/then schemas (Krzysztof)
>>  - add back optional vddp-ref-clk to all bindings even though it likely
>>    only applies to MSM8996/98 UFS (Krzysztof)
>>  - add missing sc7180 schema to USB binding
>>  - misc clean ups
>>    - shorten or drop descriptions
>>    - drop quotes around $id and $schema (Krzysztof)
>>    - use maxItems with clock-output-names
>>    - combine two USB clock+reset schemas
>>  - add Reviewed-by/Acked-by tags
> 
> Any further comments to this series?
> 
> Vinod, I noticed there was a conflict when rebasing on linux-next due to
> commit 85d43a69db2d ("dt-bindings: phy: qcom,qmp: add IPQ8074 PCIe Gen3
> PHY binding").
> 

I got few comments. Apologies for a slow review, I am a bit overloaded.

Best regards,
Krzysztof
