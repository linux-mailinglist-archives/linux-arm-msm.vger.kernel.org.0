Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE15610F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 13:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiJ1LYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 07:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiJ1LYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 07:24:49 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98BF326EB
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 04:24:47 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id z30so3156341qkz.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVCSqRvpdzckFxd7y7PQdq7tMzzKz979ees9Dc/OcZM=;
        b=qzOhOWRaDR+py00khrOBG7vTWLAxH1NyrAaKwKYW6DUpmvXHbfrbln1Te4gAnTJweD
         nklKGEH+Bx0SYRkxs5t7wTDGSgXPMHNl6taESZQSXJHy9gcyTlc9EvfTRFZxKR441zBN
         TH/ZH3ysIWAKBPqM5noxDhtNi7532HZ+XMAP8froKMiX1yS0pynVqy3E7vZqKgpLI/Oo
         wb6aBCCYwG20sd4pMVEJVmFSgxeKboyp+YRrvOyPqRmK6rM1fWwsQWJlc4CsKnqWuSbv
         w+Vro6rwFpMBfMRUOk9onbmkRlbstjleWSFag2CjQIKa63tHHSpOi1uZaCAaVKh7ecCu
         UFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVCSqRvpdzckFxd7y7PQdq7tMzzKz979ees9Dc/OcZM=;
        b=AuJbdJxRgaqmGUWHH7DLxrkmep6aLeYoLyFzWbqfiIWWItwYENFkkHgvB2zF8f7ivx
         Zt5pyQQH2VMoLD8MtaZJ8hjR2ZrD9d+FRVj/WY6QkiXM9zPfC7hpxDkrEESKoYEl319K
         Hptj/AB5rSZ6ae5wGonQFkzoiRpK6zLB0HXrXa8NbWRs6lnFJlE3+6KaBtRtf6ugM1Df
         Ha/dnQOWUlkXGAfNtq3xPj39jceCyiPr3w3XWR+SwW6CKFgsmYrvujp9t35u052Knsm/
         kX3q2YMJugJhgtgfitAvvyUqy+stWaJv2quo1rm+7otcIcIzSgHX0HKhUoL2pnQG3Ef4
         1umQ==
X-Gm-Message-State: ACrzQf39uZIxkJQoxLhmVrMXTiljgLAr2ILvvoOtOy6vbm/HyK62J96+
        zULbKX9ulxhoDCDxgP0zC+UROg==
X-Google-Smtp-Source: AMsMyM4C82LHFcU+7Rfpy1Vy0cQUhk8GIhuKDgfZzsv9t5IPd5pB2z2Wg1PNJjJleHDV7zzzTTuPpw==
X-Received: by 2002:a05:620a:458d:b0:6ee:e940:4a6a with SMTP id bp13-20020a05620a458d00b006eee9404a6amr38226828qkb.235.1666956286902;
        Fri, 28 Oct 2022 04:24:46 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id dm21-20020a05620a1d5500b006b95b0a714esm2765532qkb.17.2022.10.28.04.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:24:46 -0700 (PDT)
Message-ID: <b75718d3-a177-c41b-da2f-659694c4d27e@linaro.org>
Date:   Fri, 28 Oct 2022 07:24:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] dt-bindings: interconnect: qcom,msm8998-bwmon: Correct
 SC7280 CPU compatible
To:     Georgi Djakov <djakov@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221011140744.29829-1-krzysztof.kozlowski@linaro.org>
 <d2600fef-0313-551e-b175-40edfbf1acd4@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d2600fef-0313-551e-b175-40edfbf1acd4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/10/2022 03:14, Georgi Djakov wrote:
> On 11.10.22 17:07, Krzysztof Kozlowski wrote:
>> Two different compatibles for SC7280 CPU BWMON instance were used
>> in DTS and bindings.  Correct the bindings to use the same one as in
>> DTS, because it is more specific.
>>
>> Fixes: b7c84ae757c2 ("dt-bindings: interconnect: qcom,msm8998-bwmon: Add support for sc7280 BWMONs")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I assume that this will be picked by Bjorn. Please let me know otherwise.
> 

Bjorn marked it as not applicable, so please pick it up for interconnect.

Best regards,
Krzysztof

