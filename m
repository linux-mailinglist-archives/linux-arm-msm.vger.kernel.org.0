Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E010A762DC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 09:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbjGZHeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 03:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbjGZHdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 03:33:53 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ED74487
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:31:06 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5221c6a2d3dso6008970a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690356665; x=1690961465;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFATkPw4WNwwQSjNQCAVqXgiuGGZcvwhGAlK6VGHVcg=;
        b=BcpDFiy3iJpXA4UlVBeMFnZEGjq//3VTj4/yGEPMX3Y7LmZkyXa+9gqg1HeE30Mwet
         8k5owC2FBZNe8MOVDRU1jiGlvEz0jQeqIdarjxLPjKgBTEmgu3zmweRLwVd7XzE5LLoB
         H4mzZV8tKprzg/66DP8hcBuKrRcqB/k8KvkuWTvWd407zfQbod8kCG0IbEA01g8D8OF3
         HuAbSbX6Bp2K6LWzue5dHJEp9EEi35Fa/3qWqfi/KThCpM4O0Xo2bTj1i5E0yPvVTTZb
         73Wq2oclq+X1FTLxn0Jm7ZOb4kdJAChCRMgt7nhCHUClUQgstiAXlMMR1TBMpIhxICEo
         GjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690356665; x=1690961465;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFATkPw4WNwwQSjNQCAVqXgiuGGZcvwhGAlK6VGHVcg=;
        b=Tj9+Xm+X2zs5Q9+3bjrkDYIzvMxSyEbruUSs3EXCfQ6zHPExL8ptroJFpJTd+pVW4R
         tx/UaPCL/BxhjBo3p0OuDs+xx+sjsuZ8x+hGjTxwMaDTcNGiSyJvKK7Vv4GNbdNp9PGr
         g6vOSxbj3QPHXCR3t4JNuf0m8UVeqHJ+F6TLX+0cj6twRX7EYV+Mtxf3DnFOonQWrXXm
         g05QI26UbSEKSGpe7I3Hf53FXW1XAY7I9lB/j+mrVPrYZSo6AOfz5RX3OoRXC+JZK8dN
         XR5B9EIpYAorL5nT0Cf1o/UjOlZW5W8EtgcrN8pMygyccgDGsTB0pIgV2pWL8IlcGcpE
         oCSA==
X-Gm-Message-State: ABy/qLaxjMkiFUDoIY6SRhsg23CTaAcuBPwPoMKNgB00Yb7S6+yBCaPd
        5qbDMO4VUyypZeiP+4ta1BOFZA==
X-Google-Smtp-Source: APBJJlGnbLBLUXMT391nVEmLfEYAhyvX0fuvkWBotA8krCIkuARYA7sWsS8AUvS5wFzMVVhMJDp79w==
X-Received: by 2002:a17:906:10cd:b0:99b:cc09:711e with SMTP id v13-20020a17090610cd00b0099bcc09711emr309696ejv.23.1690356665190;
        Wed, 26 Jul 2023 00:31:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906135200b009893650453fsm9363351ejb.173.2023.07.26.00.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 00:31:04 -0700 (PDT)
Message-ID: <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
Date:   Wed, 26 Jul 2023 09:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded
 status from examples
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
 <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
 <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
In-Reply-To: <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
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

On 26/07/2023 09:27, Krzysztof Kozlowski wrote:
> On 25/07/2023 13:46, Marijn Suijten wrote:
>> On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
>>> Example DTS should not have 'status' property.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
>>
>> This is not needed: it has already been corrected in v3 and v4 of the
>> respective series (among other changes) and the patches were only picked
>> to a preliminary (draft) pull to get an overview of the outstanding work
>> for this subsystem.  That branch happens to be included in regular -next
>> releases though.
>>
>> 6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
>> v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
>> v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/
> 
> What do you mean? The old code (one I am fixing) is in current next...
> 
> If this was fixed, why next gets some outdated branches of drm next?
> Each maintainers next tree is supposed to be fed into the next, without
> delays.
> 

Ah, I think I understood - some work in progress was applied to
work-in-progress branch of drm/msm and this somehow got pushed to
linux-next? How anyone is supposed to work on next branches if they are
outdated or have stuff known to be incomplete?

Best regards,
Krzysztof

