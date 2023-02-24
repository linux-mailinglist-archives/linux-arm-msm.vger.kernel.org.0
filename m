Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129866A1C78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 13:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjBXMyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 07:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjBXMyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 07:54:35 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C204E59E4A
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 04:54:34 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bo30so13252879wrb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 04:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKJQDv4Kif6EGyfqOTg66AyQtr3vwAgyU41TdnYU1ok=;
        b=n5Dy01q6kUixJ9kKRCOGyblC2Dy5qoduTfh5ms/rHvPjmTstlc+RWyu71B8e3+Kotg
         QmDj8qStmtWPrIydTH0Q69pcr7WxYIcDBFZJsIxPzf68qfurepjaOLAOGNu5J+BA7Gpx
         T1KEq1qxa/+NE85nrB151iM3kKRiU/TSTWsBg28N1J0Rl5gaLGqFe4Sa9tmrdk3ceq4q
         jqkx2KfdEyAWleRWkIC3OGm7i4JNcueEmHJ22uhX9+5YbT804eI+mw03dTuRJNTvYl5r
         LZrmao6nugHccwZT0ODuT+3A+1EPR4XRcENjPyC8rZCiMgJ6c14h8+ceCGiazj4j6vn+
         eRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKJQDv4Kif6EGyfqOTg66AyQtr3vwAgyU41TdnYU1ok=;
        b=RF2f3k8kiSAKlbeQ8A5xTTN6nB17FrseVSYOdlGWQ+KKNbqVDrIfQcRKswm56Xe/PS
         NLieh7o6f56f57QvWEfqko90uAgURfMOhuJgkPN2Wm2JFefhrDjrA7zXWHGANaZrPjEV
         f2nzJ6/SK/MQ9H9C9TjX93sWVVPMyF4xk/i9kzx96+GJ2oIT1PPjfHJvG01vucJZ0y3i
         p6J3bqnzV4hghdrEKSxSJD3sVbxCmCBmdYlT6OTTusOgWszLxqzcE/r8yZ2Lgzi10ECg
         ZNTh+E4P9LeFqJrS1NIrgYAyLjngOl66xmAEvqrDWHRVyKBZ2ihn0pFGPhIHO5UnipdN
         j3Dg==
X-Gm-Message-State: AO0yUKVn7GsqsBcJnWd+50KYeQCx3CHlxHxAyNlsZsMn45iQNT2HzcPU
        0i6DRALNt8VkPT1LM+j5SpUCbw==
X-Google-Smtp-Source: AK7set9YMD34P8T/oGssJCIPFl6P4x2re05kDEPyfm4ulVZnvWLTPtalofrM1ozZ42Xn60QYUEdqhQ==
X-Received: by 2002:adf:f802:0:b0:2c5:4c7d:53ab with SMTP id s2-20020adff802000000b002c54c7d53abmr11060307wrp.20.1677243273310;
        Fri, 24 Feb 2023 04:54:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe84a000000b002c71d206329sm1714946wrn.55.2023.02.24.04.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 04:54:32 -0800 (PST)
Message-ID: <3bfa1895-a282-14c2-9710-7e887a5d52ee@linaro.org>
Date:   Fri, 24 Feb 2023 13:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 01/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-1-5be55a336819@linaro.org>
 <c3376575-c24f-18a3-1d8b-c3d67f072287@linaro.org>
 <a28c4e67-78b4-21b5-7094-9953316576b2@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a28c4e67-78b4-21b5-7094-9953316576b2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2023 12:51, Konrad Dybcio wrote:
>>> +    else:
>>> +      if:
>>> +        properties:
>>> +          compatible:
>>> +            contains:
>>> +              pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
>>> +
>>> +      then: # Starting with A6xx, the clocks are usually defined in the GMU node
>>
>> The comment is not accurate anymore.
> I'll argue the semantics, they are still "usually" defined
> in the GMU node..

Ah, usually. It's fine then.

Best regards,
Krzysztof

