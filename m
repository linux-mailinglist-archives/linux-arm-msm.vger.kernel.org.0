Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28037975FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjIGQAx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244539AbjIGQAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 12:00:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1443E525F
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 08:50:27 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so1525625a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101775; x=1694706575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7Y6zFmhlb8oBiHulr6SNzDGIOTaQJEEOwxmUItsSBI=;
        b=fJlg7A9h2Lpgb5X7VpNcBNqOm5VochCKF3cV/r26FM3LWEr+t/EtgwzvOnVatg9Ine
         jpTDbaqet/Wrc1u45htzh85gapUx2ixeZHFvAtCTASdd4W9jds069nTmvVF6eQYMNDFn
         L1NA/j6wbbkR2/cOjbuCOUk155CO5ckTq5w8D2pq1INbw4yK1FkXRX2lOoJj9c+J3jNe
         N3jOy0ZOjDeQ/daBEgRQYj4R3DIjZ/MGadkkoWWrUIuj8EHinGP8YQcJhfG1d1QvOoYV
         dKFlBM3JNfTEcMn3++xnN6vyVqTA4KBHcd3uKNaGN9GGSXNYesAwp1VPeEN2FlKhCMDc
         Sgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101775; x=1694706575;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7Y6zFmhlb8oBiHulr6SNzDGIOTaQJEEOwxmUItsSBI=;
        b=T0rckh0FF92w+MKF+/SiM+aAh4oph0iktcrUxRiZeia75Z/DYMVtUNaJnXl1Z2IIxU
         E+6DJxYmIikhZ/gQslGNEpmEWn1Y0gjIPe7GvLrARN5QrQ6kJ2+lhcU4TwO88Od5Ksr7
         HCSziIT96GkO4jRrI2Zv2BWl40ftysFMQ5qBpTUAhlqob4Dhd3LkRkeeCRiVVfWiWy0D
         7FaB8zfHOXPzmzz6YuCqPiKxwISN5MnGNCkvykXju+ElckKlKLfr8VJk57BJOcVTTteA
         V0zLqXgbD64w6oPn9O+5GssvXmU6eTxFTsXKwBxwWjhksoSCGnmeTMY2AwaZnDUt6lEu
         KbAg==
X-Gm-Message-State: AOJu0YwQyLfm+GXEHwzRoSZyvpdvuoVGb6laD75ScoM2cdZ881/BS/kE
        zR1wms//F9S8JEWLAU+VgBhOkT4U/d3bHqSSpwlwyw==
X-Google-Smtp-Source: AGHT+IEKmnSNSlUtiCWpMx5epfLO+Rm4w2bJrzAa6Be3omHD0KXp967h3WlCKIuq9OnSAsdvXE+3AA==
X-Received: by 2002:a05:6402:3c2:b0:522:2dcc:afb6 with SMTP id t2-20020a05640203c200b005222dccafb6mr3798766edw.7.1694066597001;
        Wed, 06 Sep 2023 23:03:17 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id t3-20020aa7d4c3000000b0051bed21a635sm9237337edr.74.2023.09.06.23.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:03:16 -0700 (PDT)
Message-ID: <3f68d3bf-3273-2339-ea41-3362ced3c91b@linaro.org>
Date:   Thu, 7 Sep 2023 08:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 05/10] dt-bindings: cpufreq: qcom-cpufreq-nvmem:
 document IPQ5332
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <8fe23b5401362e214078648926a00f7ceefaa542.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8fe23b5401362e214078648926a00f7ceefaa542.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> Document IPQ5332 compatible for Qcom NVMEM CPUFreq driver.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

