Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4357D6659
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjJYJLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbjJYJLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:11:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D154195
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:11:30 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c54c8934abso76533261fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698225089; x=1698829889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58tDLmUrp1Y7zKHRzVWCThNpjHf0swWESRGPN2hl8k8=;
        b=ikYhvwT6E2UT7IvlVSPtnXgyyit9hMaQWAXvNiz3gshRB4iiGJX2nugNxzo+ZOP4Da
         5GQT/ZS+vCDRq+L8wc7ZzDoGYZm+GU84lKQLEszSFr5DyZbwHxfP4C94P6yL7H5UQI0Z
         PYWOHeAgiMCqubgxjxgoK5Hn93LEbrOPMQ8JsPoUDh66WKEFAgYLZDtrN49mYhmk0ELn
         JmC5wjRJdP2fC4+xDp4TAw3ZdxHNsvH4bWLYKUwV/i9F7h27qy/n1T7Il5VszdfJWd9/
         wLXHzqZsES4CwjyZinzYLboFiHqgCnrLmThEbzTp97368bHoJAXHTVwK9GqYwKlXP/zq
         7Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698225089; x=1698829889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58tDLmUrp1Y7zKHRzVWCThNpjHf0swWESRGPN2hl8k8=;
        b=N9BnW0IJXRCpHKltE/Fn8+HBCyDe0HdSZJ5wdh8MMAREixUx7s7dDKXk6JsjlS16CC
         YXt18ixCUWtORbf13XOiRoc+PWDDOWLGP6eT7NszlhmUsc74kk+PjI+8h+Z/M/JUfDs3
         f8RXAJBc7Fq+Zth0ekhGzdh7sU4T3HlW0jWSyuzSYOszunSWXlFmMUG0Mrxkg1IhyL63
         Dhl6fYf44/z0m96+Zrw8FdyGXMdVlek3ZK34APgY9M4Q1/JrG7dZbL/6jUxJ3lk+tOS8
         MKMXZ0fR+Qxs8lAt/rAI0DkDaiTypyWVSux8IForx2pPickHYYcxVrbsrt7qnYk+kx2t
         R8AA==
X-Gm-Message-State: AOJu0Yx3uM8KbBzms6m+AugnideKXxs1P4pIOu9wbTtwtwRfvtP/hudE
        2svDEvrNWs2MXQJ0eHQNkOqcTA==
X-Google-Smtp-Source: AGHT+IGwm/5mxEe7WZa0vxAR3paFKN2FpTQaJQxGkpm+6IK9mESTyICa0N5VUaXSkpjYALGda73ANw==
X-Received: by 2002:a2e:b88b:0:b0:2c5:380:2a10 with SMTP id r11-20020a2eb88b000000b002c503802a10mr11884563ljp.25.1698225089059;
        Wed, 25 Oct 2023 02:11:29 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d24-20020a2e3318000000b002bce87faca9sm2354356ljc.57.2023.10.25.02.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:11:28 -0700 (PDT)
Message-ID: <c98a3141-13a2-4cb3-bbd0-74ff63446183@linaro.org>
Date:   Wed, 25 Oct 2023 11:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 7/8] arm64: dts: qcom: sm8650-mtp: add interconnect
 dependent device nodes
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-dt-v1-0-a821712af62f@linaro.org>
 <20231025-topic-sm8650-upstream-dt-v1-7-a821712af62f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-dt-v1-7-a821712af62f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 09:47, Neil Armstrong wrote:
> Now interconnect dependent devices are added in sm8650 DTSI,
> now enable more devices for the Qualcomm SM8650 MTP board:
> - PCIe
> - Display
> - DSPs
> - SDCard
> - UFS
> - USB role switch with PMIC Glink
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]

> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1c_1p2>;
> +	vccq-max-microamp = <1200000>;
You should amend these regulators' nodes with loadsetting
and allowed mode properties

Konrad
