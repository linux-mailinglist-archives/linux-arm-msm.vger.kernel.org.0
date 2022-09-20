Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7C5BE0B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 10:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiITItL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 04:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbiITIs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 04:48:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A08D6B65F
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:48:55 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f9so2634925lfr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Yy1+JpH7mb9yRtgA97CnSueuyqH+DM3LnKPEy7X4nlk=;
        b=mn4lRXquBRleFQCpshmG+O6cXtSU+FiKstWkPxOrKfbolyI+L/ISz/GRjlbdJPWKR/
         rJfyySIefp7Fmc/PiPmw6vHAeN/0p08eJ5845XpVm4sO0oAsDhrYkh7TCS95ExEE6KH3
         LsLOpX9YjUXzF2xL76x6WdimBjgyF3YinZqCXQntjaf/6day/eY+9irQU/KO624hHTJU
         dd4916cX/M2V24vJbtb9QdgjfOmD87U2T/A/Afo4sCBNAofW+Gtf/qO4O2IkghT7Pl8i
         k3RfKy8KMGl8iGZkwFCyVKwIPpSnN4OdlliamceNPhRb683i9jxgIXGKVOBqJuvDVaM5
         8OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Yy1+JpH7mb9yRtgA97CnSueuyqH+DM3LnKPEy7X4nlk=;
        b=yv0xqiv5irOUDhaBOzaR4AAqQGvJ+maMXr689qbfEKr9D+rlemW9GO3UBShr2J3dsT
         cz0R7YuHaxdTzdwW1fGAlv2Xj9QIhTzkdL36m+UzNonUELXiduVIUHHCHVea7y54I1KG
         7Whu6IOCBbaegZOd197aCIq6tdBHqiS7dNS9GgmdVko0Ige2bbjM/wNotpMsAsSzHN3Q
         VJvgbtYSgKSOfPBqZFSdLXG2sXFn0fs7mC69Y6WXWdA7Fw1qJkcj0tzj5Q8tiyAebosI
         9o1TBDVw69AVSaI3LxqVv8zYoc5f7MFwQaquzDLzb4I4ETWqO8ohcE/vHQNJ+M4H+a9e
         pZ3Q==
X-Gm-Message-State: ACrzQf1YrDbtv+Q0Tnrenr1S3/S1Rl1EOFzRBv6Oif6V/pfJLRPiczfY
        IPnBXcL6tqKGyDwmKNKVgqAfXw==
X-Google-Smtp-Source: AMsMyM7ooit7RNs5fVCvrRuMdm1AzyqeD++USlCJfUWXymRCFh14TNOz5JQvn7Kn2twkwmzP7p5VOg==
X-Received: by 2002:a05:6512:3e23:b0:498:fbf1:c480 with SMTP id i35-20020a0565123e2300b00498fbf1c480mr8384702lfv.473.1663663733909;
        Tue, 20 Sep 2022 01:48:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 2-20020ac24842000000b004948378080csm197492lfy.290.2022.09.20.01.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:48:53 -0700 (PDT)
Message-ID: <656aa3ba-01a0-637e-bd5a-4b1556d2fc41@linaro.org>
Date:   Tue, 20 Sep 2022 10:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: add sdm670 power domains
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20220920021927.2489-1-mailingradian@gmail.com>
 <20220920021927.2489-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920021927.2489-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 04:19, Richard Acayan wrote:
> Add the RPMh power domain IDs and compatible string for Snapdragon 670 to
> make SDM670 power domains accessible to the device trees.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
