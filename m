Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F02445F3EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiJDIx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 04:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiJDIxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 04:53:23 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6473151436
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 01:53:20 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a10so14603841ljq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BjQ7wZdEwhDFP1bph9bud3xlXOp8F4ljX/e3KwokmSo=;
        b=gP+UJFWCXkYW9wdPw6MtNYo4Sw6tx6cERC0U8wNKHom2nSxk/xWWUFO5KsRIR5ifUs
         QwjXJtQRoO2q7kU9qU3ucCkSzrDUjJlIxar3Za/em+VwEyS2kc1AfKIsSXrdKXoQhA9+
         3HpLhYErzfYjxF662JKegHzVTkUoxT/fUdKCu27NARZyJhFwl2UKC6PZUSOyyVpo2ncC
         67C1ITWrO5eR4px7BN7RomV2P5bkE2apWb8AqYgz5bHu8SHt7FdC0xdWVLfGNIpSedQ/
         B6cPt9zlIcwV28VcjJjNIcHWXiFGoXLMrSHhRLhaOaK2o1Rfy499g5Q7XW+4o2KGvjQD
         6P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BjQ7wZdEwhDFP1bph9bud3xlXOp8F4ljX/e3KwokmSo=;
        b=I8DKZ08vxtIopcy6B7ntORmgJfvrcwEGC2n5vL6pN9WMTUOan8Or9lJp9u1xQpij9K
         m7XPKLQkkKicrzmmnfWokRBVDFC7C7cZAuJ2qmI84gtzPEm8Y1f/3WfXwmCO9IGjayy7
         kWz7iM0aNH4Sb1XKSYXn8tne5KRAhJw0h1+StwRHSoQ8XplT1FE4iwqGSU3d/3qIrbL5
         ek6nAdMN7wEcaSBjpfn9W5hqYJvK/FfGGGZq5wfIKgqVaOzjOgPoVFKD9xxvTlhVKCe2
         fnjfrrUTTXc28HLX94vpvaKvXJSa7e2P3LRjo8zeRtmdK9PiOP7tin6rs62GzHILF9hp
         lUew==
X-Gm-Message-State: ACrzQf04+DixtjiL7DiFvMtb71KiVvCeZLFXxvq9BMmsKh3pQBlyALmw
        SFF1+OMXKHv3zyKzOeZZDLQx/g==
X-Google-Smtp-Source: AMsMyM6q44QpIxX9H7cijyngshgh38vlpoTRMflVLcSiiPIotWlSYuJ2zA66JfNPBP/Y1bqz6X884w==
X-Received: by 2002:a2e:9d81:0:b0:266:a1d7:74b4 with SMTP id c1-20020a2e9d81000000b00266a1d774b4mr7301151ljj.423.1664873598209;
        Tue, 04 Oct 2022 01:53:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8cebsm955095lfr.210.2022.10.04.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:53:17 -0700 (PDT)
Message-ID: <6459412c-74cd-f761-b9a1-fe7d5954c636@linaro.org>
Date:   Tue, 4 Oct 2022 10:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 03/11] arm: dts: qcom: mdm9615: add missing reg in
 cpu@0 node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v2-3-87fbeb4ae053@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-3-87fbeb4ae053@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2022 10:08, Neil Armstrong wrote:
> Fixes cpu@0: 'reg' is a required property from dtbs check.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

