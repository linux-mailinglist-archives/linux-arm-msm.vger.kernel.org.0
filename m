Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72BC97E0F0B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 12:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjKDLWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Nov 2023 07:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbjKDLWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Nov 2023 07:22:47 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0591BD
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Nov 2023 04:22:44 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso4831849a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Nov 2023 04:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699096963; x=1699701763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJWALZUYEHz2qJrIzaykiHfq3vsVJp3Wwr9DqTqCaGs=;
        b=fFDJZCABKpG85ruQ4Z2KumGb6mcvanTndfsOR9QjSFmtKdn6q6n68bqd25n1OWcwsF
         VdYwy7ucLH/GfJ3g549XbYgq/3sPkljRVc0mnY74FFM+QnS5Hp0m46oGQtrvOieS7r0j
         g/9lYXTIL+Ea04Rucb7D+u69pQdZthdP6t7YMXFeXX+JENB45fmcnWZc3NqZlqZTwQWm
         kUFilqN58040FH+qVBOUCLqULOhePiuLp7oL1QXdGQcfIn+1rqFJczCX/+oJ0Avx1E9k
         NabrRsZzcuKY2AYXPEuMXqbFVKv//PIef+z13YgiIFgGLrBTzg+nB46mb7V1kyxoxpbA
         BuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699096963; x=1699701763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJWALZUYEHz2qJrIzaykiHfq3vsVJp3Wwr9DqTqCaGs=;
        b=ZBhV3y1KaCKxSBPXD+5u8S0W3kLVz4wGMdAS1npkPrr3Qwe7MBIwzjeme2Fz7fGyPO
         xWMq4xeN0T+FDPKnxyhEVTarLzuxmiW1QL43bIrTa7mj68LY9+nUl/ZH2oYfYpdSVqXt
         O6IEHBMZxFpo7boZc0Tcp2owuLxz7wDXulOWalrufDW9u8CsicV77rFf/XNIT69PGX4v
         PfXjYxHcEsap6Zhda6AMi45d9tkkmpr4Ta3IVKKiTci6hq6chIBENKK/ZAqceGCNKNvA
         1/qEfSdvtnpi+rd5YEtL+UmR0eSMIqIHjbRAGRTPUCqihPtQHdEVjiVgP4Df+ZO8N4EJ
         pQVQ==
X-Gm-Message-State: AOJu0YyO9WJfgZ6Rf/U1PPWVlgDovfvyr+KO+ISo2p4aqrhf50wBwcS1
        mOoVBM+UDqvyMR3RtJKUixFi1A==
X-Google-Smtp-Source: AGHT+IFYwit9a4cCM20TiSal/gji4jZsIkBNwk7fYnmu8fkSz+lTSGolK6MFnP+SUhfQWJ7rZjhAzg==
X-Received: by 2002:aa7:cd54:0:b0:531:1455:7528 with SMTP id v20-20020aa7cd54000000b0053114557528mr16625987edw.40.1699096963205;
        Sat, 04 Nov 2023 04:22:43 -0700 (PDT)
Received: from [192.168.0.153] (178235177017.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.17])
        by smtp.gmail.com with ESMTPSA id i14-20020aa7c9ce000000b0053fa13e27dcsm1978317edt.48.2023.11.04.04.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Nov 2023 04:22:42 -0700 (PDT)
Message-ID: <3e50565a-a098-4a33-b7c9-3b9a55077a8a@linaro.org>
Date:   Sat, 4 Nov 2023 12:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: list all Qualcomm IOMMU drivers in the
 QUALCOMM IOMMU entry
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231103225413.1479857-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231103225413.1479857-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/3/23 23:54, Dmitry Baryshkov wrote:
> For historical reasons the 'QUALCOMM IOMMU' entry lists only one
> Qualcomm IOMMU driver. However there are also the historical MSM IOMMU
> driver, which is used for old 32-bit platforms, and the
> Qualcomm-specific customisations for the generic ARM SMMU driver. List
> all these files under the QUALCOMM IOMMU entry.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
