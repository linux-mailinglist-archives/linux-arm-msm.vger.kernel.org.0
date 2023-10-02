Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972447B4ED0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 11:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236033AbjJBJP6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 05:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236014AbjJBJP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:15:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906A39D
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:15:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-503056c8195so25859739e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238153; x=1696842953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTFxgVOu6FqWzooz8ERS8xM8WPaMS6pYudSyg6T5KGE=;
        b=Q8a5ie5NnUnsqKHu4PrFASCRpmQujPv25B0MS5CiBzia/6gCkeTHlE68bmPGtZ14e1
         GjUPKR6oLRG4Hli+YfOUP5dEBATV2FI9Roox20QuCue8YyQ2P/igeSJbpJbtDI6djKk9
         YRnkPzuk2+cCc3AMbQ72rVl1ulPtcn37saxXZ/uC6M+TulKG5Pcq2JtXFC5yh20p+8ag
         HuFKTtxgE/j95JWanANMV7wxMTF0qkYyDdswP8L8qcZ1T2BtdMLaJqq2CLSteEdf0Yjg
         69VlOqkNxyEENdVDwdUVf+C9JYBAR9vkOyFhU4R0UjkhBOMN/wu87ATKlEzeNakRWKZQ
         Vpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238153; x=1696842953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTFxgVOu6FqWzooz8ERS8xM8WPaMS6pYudSyg6T5KGE=;
        b=jAxvNwglueKiWL6qy8Oki0gvLMQKXs63eJprACVvsiMUXSVFngRwrv6ChepCeAX1K3
         0pEdUsBUT2BhDFXyDYKXVcV9O7ztO9ROl01suDjZ27R3gEmlx58IylvDUMnU/AdnqCZT
         Sfi/YUvNXEgvU0B0/OURHcZE6lDfUq7vHzMDBz0vNOzMJKM1lTy1BCQmQ7bo8dAr0Bvn
         QDop6isG97UW7sfL6Zl+lqJuW/YRdSHLKML9zRAcnfVTAwrwUva0KLaZsg8+QOpN804D
         +aOl3ZFtSL6UfgLK943Le0bXVpJUJyYfWdC6CmJ2gz2ID+diR31CGTFW1D9BZGMN2alW
         LVVg==
X-Gm-Message-State: AOJu0YwDpREIWJYBqW0U50t8GeuoYM9b8dMPlL6VOr9Bj0AYywKZHheg
        2TeO/6vS02SMYLuGtIod9XROhQ==
X-Google-Smtp-Source: AGHT+IG7MFpGpFBBFGxenUypPs1uqY9lxRFgjFyW+IeEhpy3S168urO5h+mvMFwpIIgF4Xj6SANX/A==
X-Received: by 2002:a19:9141:0:b0:503:3cc:cd39 with SMTP id y1-20020a199141000000b0050303cccd39mr8161061lfj.8.1696238152842;
        Mon, 02 Oct 2023 02:15:52 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t5-20020ac243a5000000b004fe26e36350sm4660646lfl.253.2023.10.02.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:15:52 -0700 (PDT)
Message-ID: <41e07183-e4bc-2bd6-8bc4-f5b6ab7f472c@linaro.org>
Date:   Mon, 2 Oct 2023 11:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 flash led
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
 <20231001-b4-sdm845-flash-dts-v1-2-275a3abb0b10@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-2-275a3abb0b10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/1/23 19:19, Caleb Connolly wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Configure and enable the dual-tone on the PocoPhone F1
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
