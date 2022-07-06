Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB375681D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiGFIiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbiGFIiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:38:03 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B67924969
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:37:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d12so1343433lfq.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QXTMhBYT3w75TvCkzzesF7l5WGW26s/hOIbi6cFrZsE=;
        b=M0QwwRWJ9eR2dndWmYSYHbZgoje5eb99kgZr9dycrA6Zxt7jWc3ibsuy1tYmgy16Hr
         qU6oK9/YIvVGjJjpd9IAd3QilMOOK6k7mNL5VxPcq1iYaGNWilVZADGQ/sktxAQTExy/
         biyeeTdpmKf5IL1nyA1cFg8bsPOWWNeJ2Wzl4wqBvJ2vOXl5TxxNsFBfaM6Vz61vXjvE
         BWO0f2LPCIXMZ5+Oq7YNMbJv42A1mIM4xjTCF0wpfXT6yZ3DsEZWpYYKF0FWG0pPkL3I
         pBppxvVQD+4FN6PFxP0Iu1xclZTKM7vq5q5t8aQ8dJ6ZCJYV53cnBN41PlcuF5AxAR9G
         makQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QXTMhBYT3w75TvCkzzesF7l5WGW26s/hOIbi6cFrZsE=;
        b=IZ7xnmZietPi8zg3Wa+KVf5nwFc6LsembSHuqm4tCC+GnaaI1B1G5ZOmv5mwD/nyRU
         /Gbpz2Fr1pZ+QboHKVjmHkDkUJCLqI1doKRcX5avb7onFEN+Q1uPijs2cYRHIt4xRtJb
         7nPpJ/g4kusJNcQOFgas7C07mGmFBrd/sxbNmhANqopo4jqzsNIq5RYngefzXQ0dXfM5
         rtjpkruLMWKIZzFQaKb0hjki3Kx3KpAokrVWYVycQvTFc2xNwc9/T5hKndbPxgtgVIg6
         lASL/qyw+JYpKAqv/OHxxQnd/02zZkY81KGn8hNjOVYytnv5nHE/uAcybXUtjbFEneQz
         ryKA==
X-Gm-Message-State: AJIora8aI+1QgwWwpRcfA0Hc5drRdlIr9HUqODMIexSiXl7WnFCPs7be
        MKIUng656OtDP5zNaGiRp+Gmhw==
X-Google-Smtp-Source: AGRyM1uoVHEA1HqOG77YoQYuQ9EeTV1O78NlNvafZDIKrTdHFQoeOA8K2DCtaWXYP6FX/MUoPmCHIg==
X-Received: by 2002:a19:ad4d:0:b0:485:689:18c8 with SMTP id s13-20020a19ad4d000000b00485068918c8mr2869141lfd.287.1657096668753;
        Wed, 06 Jul 2022 01:37:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id c13-20020ac25f6d000000b0047f6c95f2cesm6164157lfc.145.2022.07.06.01.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:37:48 -0700 (PDT)
Message-ID: <7c3ef50a-2a4d-4b75-3aab-3bfbf12e06c4@linaro.org>
Date:   Wed, 6 Jul 2022 10:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/13] ARM: dts: qcom: fix dtc warning for missing
 #address-cells for ipq8064
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-9-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 05/07/2022 15:39, Christian Marangi wrote:
> Fix dtc warning for missing #address-cells for ipq8064.

Paste the applicable part of warning in the commit log.

> 


Best regards,
Krzysztof
