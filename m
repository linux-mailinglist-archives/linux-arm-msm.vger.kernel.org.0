Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00117609A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 07:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjGYFpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 01:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjGYFpl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 01:45:41 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D1C1BE6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 22:45:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5221b90f763so4281255a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690263898; x=1690868698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v33ozQ7B6ao7S8GXOqhbCmLv9i1PznqZJpCCfKR6El8=;
        b=W8ow4T6QCbknM6LYJrvRs61dhmH+OsgCnRAL4+3He+s4j1KKLP77X+XHsBbjbNNe08
         EQTTf8SYxMeAxenUWmbyv6eQqZi8WGRaRgbpUgsUSeHJw8wZBgFDbhk/S1iQfyh6Dn79
         1urwf5z/sh/C6EPaP3kuhAJZ0JmqzTkgdf0qFNROs5NasYe8j0+8d75WAiImudRKxCly
         Pmcs5XB5urgVpgUP8MraLUudXNlZv0JlUd+KwZ13jLsI+I9pmYGxyWpxMCyzeBDDBLFP
         48WtAwuUrz3L0yJCgDYD19wdmkM5rKDwDD3Fqs84vzlTvs/PQ5XIhK8USqLxvSc1bA0p
         MOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690263898; x=1690868698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v33ozQ7B6ao7S8GXOqhbCmLv9i1PznqZJpCCfKR6El8=;
        b=eAk0hx85RPxt8EEXHFEBcn4QW0fgUdI81S84Ge24113YbyTBRSW2hIULNgKGIN20e+
         nZAJHHEMBo7eduPnRoMDtGgUpW6TuIwW+NFsFlUkQMOSgIqTzyq+k/E+D7UHpHkivcC3
         V+fDgkjz5Bb5uoRHNNREBz0KAU0lAIAkEfdcSHuyHTJaqO6fAebcGxYEFhZgH0XtCZrD
         hbP90QFU8EVvWisB5UGBinyDf7AzidumeKaSE259xPLfdAy4bIDwE0SOuA5XSQ8CPgqR
         W6Y2s1jSy8wUJIeQHdDxqmYDJ1AlmMB3op6/tKcZNdRrdYNnAoJ2AdEbgZ5/Xauanhjn
         89iA==
X-Gm-Message-State: ABy/qLaoyrkLPOl3Mngdm+oD72VANHxIL2KNtyhdyjRx0C1FmeOJV6Zz
        YX3rSC003GQar4QyC+pmWhNyEg==
X-Google-Smtp-Source: APBJJlFYMcUVdRl92ALTBddlIcRlR2SkNHcjfoIcS0YhJsvhd5KWQ7u6T8eH+KE6AZnGJPlMAZ6MIQ==
X-Received: by 2002:a05:6402:b11:b0:51d:e2c4:f94a with SMTP id bm17-20020a0564020b1100b0051de2c4f94amr10375703edb.20.1690263898239;
        Mon, 24 Jul 2023 22:44:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b11-20020aa7c90b000000b0052228721f84sm3253052edt.77.2023.07.24.22.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 22:44:50 -0700 (PDT)
Message-ID: <0f39d36c-4c28-b7eb-14f7-47105f03f459@linaro.org>
Date:   Tue, 25 Jul 2023 07:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2
 reboot-mode driver
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>
References: <20230724223057.1208122-1-quic_eberman@quicinc.com>
 <20230724223057.1208122-5-quic_eberman@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724223057.1208122-5-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 00:30, Elliot Berman wrote:
> PSCI implements a restart notifier for architectural defined resets.
> The SYSTEM_RESET2 allows vendor firmware to define additional reset
> types which could be mapped to the reboot reason.
> 


> +
> +static const struct of_device_id psci_vendor_reset_id_table[] = {
> +	{ .compatible = "arm,psci-vendor-reset" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, psci_vendor_reset_id_table);
> +
> +static struct platform_driver psci_vendor_reset_driver = {
> +	.probe = psci_vendor_reset_probe,
> +	.driver = {
> +		.name = "psci-vendor-reset",
> +		.of_match_table = of_match_ptr(psci_vendor_reset_id_table),

Drop of_match_ptr() - it is useless and if used, then it must be
balanced with conditional table.

> +	},
> +};
> +module_platform_driver(psci_vendor_reset_driver);
> +

Best regards,
Krzysztof

