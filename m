Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D3B695EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 10:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbjBNJZB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 04:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjBNJZA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:25:00 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FFF23305
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:24:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bu23so14900552wrb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u8KakO0m99ack6WtkcRo8QC9fAx9EZec2nxXq+nRpV8=;
        b=XnkRv8qcJgXS8YBUYXFr3msPkyWSuAK7Xwx3teh9Q0AMx2x3w1TmzQ4QaN2BFQUsm2
         dAkbt2lgSE8azsW+GIYDqBUszigYr4JXpwL9t55zGb6hko0SNNNZ0CU591nyIEh3hrkX
         3sIMsRJkpU3r2i3rHqHbG4Ba9RLNQwldJxMnJ4zTPU5zV2FKlhLmnBdlOFyfBU0pZkRU
         jY+tqaUlCNUw5VjcJTmsD0Q23FEDvYpHCnCEyD6Dt3vKHMFJi5gyj1vxWFtHYC2wfCTA
         aaE3jNFLfHlnXZNOUbMo7pb+raS6UQBsEaAd91iI0L+vQCAayILyCKYkXNnfejlshzTz
         iN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8KakO0m99ack6WtkcRo8QC9fAx9EZec2nxXq+nRpV8=;
        b=3rrBpr6xjwnEWPuGGLwt8sE3nSbKC3k7BCboltsNrWKrbM3mddtKJSkFAAD46aowCH
         Ke6UVV90F2DXPk8O2xdQ0ban/nAmn4J1YXwfP4gLWH4/z1+J2vVkKtJ5DjcKGH3QnCxB
         X6tma01vx9Dc+1popXq9oj3hbnPUntpIEskhhysiNALznupHVaQlsCKzBCccdkBS8+r5
         LUDpLW4QhR8ZeDZvoaXD2q7lY00fp9pEmiOPa9VjsBf5ANw17Dvd97ZkVA/XPgLiRLTi
         1u6go/z6i7zXX7mc5yrXm8M5QYbacbidvU1PmlI81tYeqbeGdzEL/x9wWuH+zAXVa0D/
         h+KQ==
X-Gm-Message-State: AO0yUKUesfGOIcNAnZtUPfendXLv/kzyJ9KEx82nxZUB/emUmKF9EErn
        qBcEkpM5xZNe59kydP4xx+6Yww==
X-Google-Smtp-Source: AK7set/D6I/qxlSfxlRbpbzUy5a6qP8a6fLo8xCBJzYuz2JnEbfY9w2P98SqeCbjjCL59H93Va0T8w==
X-Received: by 2002:a5d:6352:0:b0:2c5:5308:859c with SMTP id b18-20020a5d6352000000b002c55308859cmr1628694wrw.18.1676366697533;
        Tue, 14 Feb 2023 01:24:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y16-20020adff6d0000000b002c55521903bsm5679255wrp.51.2023.02.14.01.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:24:57 -0800 (PST)
Message-ID: <0a815e82-0c4b-cc94-7143-6fbbc2d62347@linaro.org>
Date:   Tue, 14 Feb 2023 10:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] dt-bindings: PCI: qcom: Fix msm8998-specific
 compatible
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230214091202.2187321-1-konrad.dybcio@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214091202.2187321-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 10:12, Konrad Dybcio wrote:
> In the commit mentioned in the fixes tag, everything went well except
> the fallback and the specific compatible got swapped and the 8998 DTSI
> began failing the dtbs check. Fix it.
> 
> Fixes: f86fe08ef00f ("dt-bindings: PCI: qcom: Add MSM8998 specific compatible")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

[bhelgaas: sort msm8996 before msm8998]
yes... I love amends by maintainers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

