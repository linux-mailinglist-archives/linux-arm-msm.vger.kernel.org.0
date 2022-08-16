Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD8F59564C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Aug 2022 11:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233494AbiHPJaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Aug 2022 05:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiHPJ3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Aug 2022 05:29:46 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB4F108F33
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 00:49:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id by6so9831444ljb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9Cr9AYG8AdsKwmXI4Qiz3tAwEHTOmPCZfY7GjgrZfEs=;
        b=oQyawWMFN77LukqlOAKyMex0kW4mXtBVf4SIAf6rAB7V0xmXWtCZOfHXXlLgWFsAVR
         YDkC+KEIwnN9q9+bzpoq3V21fN2gdvKcuDy6aAjGPlmQ2i4QKzFoq05wDBx+5UqPzPrE
         VPuwCGTck8vD3ttKoVixcVbeB8BSzv4pkNP/ip95kqcCaH/jDWsFFPjCvKYwGZyI1xF0
         geLMrXjBaK4DVrx+1qc8aeR5uVtUGjT5BmV6OwdBgVLlrGiUysGSi69Sn1A7nnHvYGrG
         C3ptSZdyGeQ7QguT21ObbkLZKWzhhgTUOCI7/RZVK7mnINn6hPj4ufnZBZdgonpnaPjF
         WY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9Cr9AYG8AdsKwmXI4Qiz3tAwEHTOmPCZfY7GjgrZfEs=;
        b=XXjVPvNURAfXBFuZ2Bm2IZ2/Z1iS1Uogf/OQhPgnMZ6wjwTXj9uVD7q4ulh4O6/uye
         WzVgiiifUbD5xpkO32VsCimQmLArbjVe/jq031Dx07wZ+6scAC6KL4cEOeyIe3lLNqBd
         KzoekVIBf23KktcQmZ+M3xz95Tojgb4/K9fEs7ogK4g36xEXoCLJ7eInI6exwZgnd8Bh
         wblXdvO5RRGBn/xw7bxdjxBItpBaTzmglDaRbL3L+W9uNeK/tEbiz6GNPMIcBLUqlNap
         IViLf7KJ39/v1Q+7GPfvkFxJaV4Yy4yeDTTJ0RdagQMzkgq9v4JPnf7QplcUg7deF6Md
         oRXw==
X-Gm-Message-State: ACgBeo06SE8qoNC9A0tMClKZktqw/+vXiQ6tjN+0eK8ZXp6ICClp777b
        Tb/WKPD8DBTl3sXi8WN/Tn29wg==
X-Google-Smtp-Source: AA6agR4ZuIL6YhljvhwjG1WDPl7O3ub8LcT4CuceR2nnMLcn4XRci7/OmpyrLVADMM9r7D/ehodRsA==
X-Received: by 2002:a2e:b010:0:b0:25e:65b3:b24d with SMTP id y16-20020a2eb010000000b0025e65b3b24dmr6269239ljk.292.1660636176946;
        Tue, 16 Aug 2022 00:49:36 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id l6-20020a19c206000000b0048a9f1933f2sm1301493lfc.247.2022.08.16.00.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:49:36 -0700 (PDT)
Message-ID: <41fd15ba-b261-c3cb-2762-076aa5e984b2@linaro.org>
Date:   Tue, 16 Aug 2022 10:49:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/7] dt-bindings: mmc: sdhci-msm: Document the SM6115
 compatible
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Emma Anholt <emma@anholt.net>,
        Rob Clark <robdclark@chromium.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-mmc@vger.kernel.org, linux-pm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>
References: <20220815100952.23795-1-a39.skl@gmail.com>
 <20220815100952.23795-4-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815100952.23795-4-a39.skl@gmail.com>
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

On 15/08/2022 13:09, Adam Skladowski wrote:
> Document the compatible for SDHCI on SM6115.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
