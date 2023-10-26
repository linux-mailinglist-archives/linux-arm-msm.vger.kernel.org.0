Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D767D88B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZTEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZTE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:04:29 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755BE1A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:04:27 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so915098f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698347066; x=1698951866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbynzDzZ6aYhsm3/VuZ68JZwk/UfAZZJI098UgEYcNw=;
        b=Zbir3E2GvMhpBcs7RuxRG/2ZG+6/vXeUxOl9l9O+2ycZvoId/uV4pN8Kdm7JFF01xw
         Or+mOQ/Brb17giol64kvZIlhs6ix93t7+DBDZ992OVUZun77kYxOr8ss6xtcHF7GE/Fk
         IcTXLGxu0YbBGuxJRaY29TG+b4nb9gRPGP1hNWG65ridBqgE7chcAcJCyzcTLursoONW
         wy/eNpQbGin2MS0zQf2ZiD/RZ7QEsbZ/B8TEhfyUg0rUnTMj7JUxr8t0YLX7TEoQXmRY
         pFWC5VkyRzsHKKtlG4pf7iaZPYE3Xc+DZwfCH9IIlrTvnlsi2hTXAQKpgrtZTKt26eOQ
         Sc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347066; x=1698951866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbynzDzZ6aYhsm3/VuZ68JZwk/UfAZZJI098UgEYcNw=;
        b=vjm/mlgOOuvjKCwMnQOnj6w4wbCrDFZ8zA30w+KBbPUaYSak6yPG5VIiB4N47A5n++
         4MdhZtaVuWloyKfCiaZezkcJiI2L6cUaD8HfgBS0It8zb9BNwazvkWNXmEtEU4wQ+Onc
         0OHofeUXR7sAckiiRcoB7u3SoixzFYN0zNGv9MPHgFywATMlddv7d0NAKmHxQumxW00Q
         qud6u8Axeui2nAZQ/r0hSPP9ottbu50ZddKS9ZP9+OmDVWHWBWhjy2gg27TFac6ISDLt
         6hbQ1Fe/u+YxvzwRXJkngM5pWwmAJmbH/4JdQfpSu98ooFfN+vBHdcuMVIgPJ2QxpYLh
         APeA==
X-Gm-Message-State: AOJu0YzJHrVXxGZeLVI0WXGsfgr/EQEuWE19TNvj/vsfjz9qV4ZDbTK5
        GzDChuJigq8UNfl1ujohCeTbog==
X-Google-Smtp-Source: AGHT+IF/GfMYUUnzoqsweXvAEgXUSfpxL0SwGmbvjJUViXSClKOBEivZWDDnAPsqzr04DT6TcQ3umg==
X-Received: by 2002:a5d:6508:0:b0:32d:9d80:4039 with SMTP id x8-20020a5d6508000000b0032d9d804039mr482066wru.34.1698347065762;
        Thu, 26 Oct 2023 12:04:25 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id x11-20020adfffcb000000b003258934a4bcsm72195wrs.42.2023.10.26.12.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:04:25 -0700 (PDT)
Message-ID: <d7fcb16d-1fe8-4be4-8f20-18ddcd2c2913@linaro.org>
Date:   Thu, 26 Oct 2023 20:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: use USB host mode
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231025-b4-rb1-usb-host-v1-1-522616c575ef@linaro.org>
 <9439252a-4dbc-417f-99a8-fa7c5f11a3d8@linaro.org>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <9439252a-4dbc-417f-99a8-fa7c5f11a3d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26/10/2023 19:56, Konrad Dybcio wrote:
> 
> 
> On 10/25/23 13:58, Caleb Connolly wrote:
>> The default for the QCM2290 platform that this board is based on is OTG
>> mode, however the role detection logic is not hooked up for this board
>> and the dwc3 driver is configured to not allow role switching from
>> userspace.
>>
>> Force this board to host mode as this is the preferred usecase until we
>> get role switching hooked up.
> Does that not kill usb internet and similar?

like rndis gadget? yes, it does kill that. But in return you get real
ethernet ;P

This is the preferred default configuration for these boards (I sent a
similar patch for rb2 before). The usb_role framework does have support
for letting userspace change the role via sysfs, but it's disabled for
dwc3. The plan is to enable role switching properly by reading the DIP
switch state in the future.
> 
> Konrad

-- 
// Caleb (they/them)
