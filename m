Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B79570109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 13:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiGKLrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 07:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiGKLqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 07:46:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1485FA6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 04:44:09 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r9so206138lfp.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8kbHaWOgwGZ87aOELCDzqAsSUAa/8f6yn0taHmP3zxI=;
        b=AUEYlFC4TI5jDI3kIduulNZ04vzgkQbh+jz7GGLVxs8ReKM0ztlPdlyECtXIZUPZyk
         Si3LAMbEfGu5s70hqKcXZCGlI/MQK8B2iscjHc7AA6U6WAraqd5pgszysr0O6yOFYIwV
         Xeh3x/xRYDdI6+AfluUFVECTGLiOzyvFV55AFpsUCZ6mdklx++KXYeFbj5rRcPIRjoBy
         ySQxOE4+TRBP6lqcm5VAfA51hzZjKPysXuo75aky9LnOtZrkXaHe7kspfRQKul81P+FT
         0xoybe3CwssN0IR5UF04K7Dllkh35FQJL8wNHOyTCc4S88bOnmizZN970UALckPRqoEm
         8jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8kbHaWOgwGZ87aOELCDzqAsSUAa/8f6yn0taHmP3zxI=;
        b=bK99OvUQOzaIs6PmO2FWG2NT9wEy24sgvr2M2jo+w/3DDUZbxnNI8SYROQ+zyCui88
         JYtJwu44kDMgAzkWrAVkEIeZ2sJEVaZBKtw2ST2KdaMUFdHEUmRb3SvEVWq+hjQifunH
         AdYY+PkN3vjTBtMYd+X8OsMCiUWXH94EuntPnroqACTLdeW3Hq5Q3J+ME7Ss7tPKs2Rn
         yzNvWlEy9xRfepyCyTb1Ci99RIJ9uHOGAAqrQSEjuCq4W6r9D7xcYLcsaVlgn/rCCkLu
         AsYCOEFmu1rSTaYzNYXT4jxIObqClXHbukaYzISysgTA+4NIo3eO75rqe9AqJrPwzccE
         +Qvg==
X-Gm-Message-State: AJIora+RFUPYYf89EpErTfLZ5d7bES/vnnEX553aVC0hcR6k6/TZGma2
        vshKbO5OJVW03wtzV3mLQajiaQ==
X-Google-Smtp-Source: AGRyM1sAtNG9Q4gvJx/XKH67qmjMODpoRG0NKU4WTIlmAxdT2Xsk7myk6V3u4yOHOvFUtg1A0FOFbQ==
X-Received: by 2002:a05:6512:3083:b0:489:e0e1:6a3f with SMTP id z3-20020a056512308300b00489e0e16a3fmr2253906lfd.73.1657539847557;
        Mon, 11 Jul 2022 04:44:07 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512095000b004896b58f2fasm1492648lft.270.2022.07.11.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:44:06 -0700 (PDT)
Message-ID: <ceb5130e-a3e7-bfb2-a782-f6773a0af4f6@linaro.org>
Date:   Mon, 11 Jul 2022 13:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] dt-bindings: opp: opp-v2-kryo-cpu: Fix example
 binding checks
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, ilia.lin@kernel.org,
        agross@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        stephan@gerhold.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
 <20220708121156.2165250-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220708121156.2165250-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2022 14:11, Bryan O'Donoghue wrote:
> Adding missing compat entries to the cpufreq node
> Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml shows up
> a dt_binding_check in this file.
> 
> opp-v2-kryo-cpu.example.dtb: /: cpus:cpu@0: 'power-domains' is a required property
> opp-v2-kryo-cpu.example.dtb: /: cpus:cpu@0: 'power-domain-names' is a required property
> opp-v2-kryo-cpu.example.dtb: /: opp-table-0:opp-307200000: 'required-opps' is a required property
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
