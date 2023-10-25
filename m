Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55B607D65E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbjJYI4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234374AbjJYI4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:56:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DCD186
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:56:33 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a55302e0so7229297e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698224191; x=1698828991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcWDpz6RiebILDq0MkRy3/6J4V7vqmXqPyZ0jkm/G3U=;
        b=gzQpDUt+LhTYuB83RhcDhHITcJjaBGxZMj12pqjGU0M/q/1EsJDBG7YFvo4bHejD3H
         iSMfInT+AYNXcx7z/V4i1ZG6oFjacRWI/d17Fhek1uGOlOSjdVchbPCeoGY48nHRrtRj
         uSnNiPz91kxq1oqO3zr0RtaZH7rfuCCqcYfq3UE6yK2OK/jPxIcOjkLvo4XwNqbIb4g6
         MAN38g8Z4Eyp7W7Hh+g8yGgx4XIlHA8ymsbWq4Hly+gkZQ8XQ65cxi8vUsUYf8AqYtVQ
         onFZ6uyqzJANlpQxt4MYXrAxfczzCwI+fmZelDqOitSIzp83Ix+pskiOiyJMeMoLzgHI
         Teyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698224191; x=1698828991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcWDpz6RiebILDq0MkRy3/6J4V7vqmXqPyZ0jkm/G3U=;
        b=Kmo2smev45kbqXLZVe8XwIYbP/PSWn2XCRaW4/994cRyZsBIYgEC4Q1l3FE2LiWaDN
         CI/Swf4c1fG6TPOpNHSSaXxgvIxmBuTDk7Q3M4XkYPARzoY3TZdr36fOKXOWlHsgjXn0
         58hw60rJJ4wnRy8PIZg0ZmNzZUevVb8+oxiWjS1Nxi3TAxyQS+nNFxBA+2GIFDWTj8fQ
         pv/rD0R6cN3lckSFp0M53tQHaT4gxRxrhFnqBU0FpH5OjI7CFlMnF6iEx/CqR5RcEPid
         PHfGHrXQTckChu91gBbDNIphI/gtQQ5ydRbvesJnNXtY4595P2pR4oVngElDzhl06388
         0Fpg==
X-Gm-Message-State: AOJu0YycCVUUoLmpqXHjdmByOMgfx4BUT7V7tOJRNtwemoZL3g2y1v9k
        hyRzJsVh4Jkt5BRR5k/BU40Pgg==
X-Google-Smtp-Source: AGHT+IFcsjDaRKHtNQkrRrpzaJTXYCgCXDLm2TWDrR2cEO93ECaEjWZjYH7DVg020p+sK7+GfwmO6Q==
X-Received: by 2002:a05:6512:2825:b0:508:1690:d825 with SMTP id cf37-20020a056512282500b005081690d825mr1167879lfb.21.1698224191151;
        Wed, 25 Oct 2023 01:56:31 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651236c700b00507a3b0eb34sm2468030lfs.264.2023.10.25.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:56:30 -0700 (PDT)
Message-ID: <a42a913d-b0b1-4645-9f60-0163bc93fc85@linaro.org>
Date:   Wed, 25 Oct 2023 10:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add SM8650 SoC ID
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20231025-topic-sm8650-upstream-socinfo-v1-1-6776a5183fa0@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-socinfo-v1-1-6776a5183fa0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 09:31, Neil Armstrong wrote:
> Add SoC Info support for the SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
