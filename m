Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436DC59E8CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241881AbiHWRLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344214AbiHWRKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:10:37 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDA2B5179
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 07:01:16 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id u5so9319728wrt.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9CxBBUmjU/GRTNZigSTIxvYgBaeq6qAgAztqT+TrpaU=;
        b=TQ8eyTTsoPt3BzutSU3DojsdAukJqYijwbs8W7hCkRKB+uaAL/z5mh6OEl2We+8uk+
         aBQXbRVqq60yYnp56be2efIbgrY2EJ95l0Krf1wzsBL80liP2+vczoa/AURzvkkv6VCY
         f2NmC98V+/6OgziVTVdeojEze+2UEM/7yG5+LUj4m4j/WOEd02hhhzO22se/HuXElqbH
         gUC8+WjEZWDTbYmaesn2SC5/oo0sgNFZOZDNO3ubVtBX3q5BttKcKf7xs681YKWCJnHW
         wNlzWYVEARvaTMXJrDCCNDSZXGdnx55Q7Pb6PaJfAT0RV/+fwaHsvbxhSFcS1xTReDNY
         SkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9CxBBUmjU/GRTNZigSTIxvYgBaeq6qAgAztqT+TrpaU=;
        b=oEp8eiQL0ec96az7aiXf7M/SLIkX0nMizhJ1kJhylcSpVW0mBWJQqjBcfvdNICfweD
         LCByvXAv02WwwU2W9SJEOFGwYf3NYLzWR+R1avSEIZZ0LZEE5PZEyl5p4ScRI7Hxuc8G
         /RituueYzUfrZ+SX0N5q5rEV2Ixfth9X1DfHX+nJEbKv4hcVS7vlOk7ruMqC1dX9ZIP/
         wVPlE5IhRP7SqufMkprVI5e3elaPeGJ5gKjSjKsm6sUBlParcZGHS48zVJbZr+d/JPP7
         nkiqD+4dJ8wB8tmI0X/c/WZQiDM10K24jWSGTSKWipvoyopCW0mCMWGcEQSphzQ1diUn
         dq8Q==
X-Gm-Message-State: ACgBeo0xANhPVuDYadgaOBHY+9Bc7enMu3SC5ecGWHW5QXb6yJg3DI7/
        WUIfbfFihADoYbZ3Xb/QyY2xNg==
X-Google-Smtp-Source: AA6agR7qDCXx2JKppEtNTOxlRMxTxSVRp4uB0ynxHkP1dpifVhHrD5RNB9ZD4x1/5rFYZ9roCL4mHA==
X-Received: by 2002:a05:6000:2c4:b0:225:6782:5755 with SMTP id o4-20020a05600002c400b0022567825755mr1881200wry.299.1661263275088;
        Tue, 23 Aug 2022 07:01:15 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b003a61306d79dsm21933810wms.41.2022.08.23.07.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 07:01:14 -0700 (PDT)
Message-ID: <90c5fac6-78c2-43b8-b81f-6fa10912efff@linaro.org>
Date:   Tue, 23 Aug 2022 15:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: Fix pwm declaration
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
 <9022126c-2cd7-44c9-28dc-338e36a3346d@linaro.org>
 <11e20195-1383-d1e3-4715-8a1f110ed344@linaro.org>
 <4e567599-90ba-c8bd-9774-1e34ae8f8ea3@linaro.org>
 <c1357037-a280-0104-2f92-54a689d269b3@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c1357037-a280-0104-2f92-54a689d269b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 14:58, Krzysztof Kozlowski wrote:
> so maybe let's choose less work?
+1
