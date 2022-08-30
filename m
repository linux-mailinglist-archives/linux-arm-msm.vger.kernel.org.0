Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885E55A633D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 14:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiH3MXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 08:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiH3MXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 08:23:35 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD9EFE802
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 05:23:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q7so15268303lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=y+/lGnJaLJVLR/XaO70T/uhmEN7c6IdO5d3GPBmHeds=;
        b=hATx49Joh9431NIAdfNrQzJR0lVJBUwK7hXK++ckvVE5EkWj+nWBXjt1yjto6nGQqI
         wCghFaNbOIj8ihHoNxPNX8LwqV0z4lx3xjJ2M2iYZDA1wB2/A5AZ9225bLdtrv/XhsoU
         oJN5mcT+ejwrn4dHCtuNkpDJVg7TmksCXyiZRNCxD2kENWW6LxjYFyrMkb4+LkSNVW9B
         Qn8cnhguOZUUrEm8I/GpSkTZExGxrpGLGBUX8m3qkw+NeSevx4MvQ4kGvsAvJbUQ76Bg
         JSq4fKDOoMU9ru9iRAEdYlWqZiLDKvzizz3Zr1FdFqov54UtNl+nAVQtb4vBFNUHlahM
         oFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=y+/lGnJaLJVLR/XaO70T/uhmEN7c6IdO5d3GPBmHeds=;
        b=59OurPhdLvgx7UOcwI0pJrUJBW1iCpCViN3GYeoRL5qvQbrsfnpdc8jUW+4XOoJjZ4
         4Ey7YI+lWmaIdTcg++cNJx+cxdmUIcYOdCzXDgukHRrxu2LtBI8cBGsLbyoFDuHZrBBn
         qf04GJZdUY4eJndsCsAQeVJpk7PGYeAv0rs8WI3KDf4+1Q2qwhV5o4TDV9apnn7UcC9e
         DReRfjN+QJ0C2St4H+uILkZG5v6gehzqAwJFQTdgEyfS4iZGgDFtfZlfov2yPVdX7/hV
         qrcj4msu4owUcELZQUpjK7s1x74/zy29njMB7MxmpX/+hUoazlgsfXDurvwYFqvb94Hi
         afgg==
X-Gm-Message-State: ACgBeo3JcpdFueoSLsVQEnja0dQreIyweWGeEzIQnT0p324YpRANGFsp
        g2hzgHg0PVMYVYjCHx8jWYhvnA==
X-Google-Smtp-Source: AA6agR7dXQW8gkolpt7JptyYL/LhrZI7w32wgREH0RNo8r5Fl+4KO+v7jfL4X2VaeQ//NVdH2AWfqw==
X-Received: by 2002:a05:6512:3086:b0:492:c1e7:f5be with SMTP id z6-20020a056512308600b00492c1e7f5bemr7874153lfd.454.1661862210080;
        Tue, 30 Aug 2022 05:23:30 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u22-20020ac258d6000000b0048afd0c496fsm1599913lfo.156.2022.08.30.05.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 05:23:29 -0700 (PDT)
Message-ID: <150c46c7-7de3-379d-4c8b-b94f81f2b860@linaro.org>
Date:   Tue, 30 Aug 2022 15:23:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document additional skus
 for sc7180 pazquel360
Content-Language: en-US
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220830112013.v2.1.Ic4d4e0777115011544dbc2ab07ed4d7b408c003a@changeid>
 <47910371-6356-1040-1073-c50fc87b9d04@linaro.org>
 <CAFvdKjsEwFcs7HuhOrx4RBqmAP3DrA5bm6f2Y7MYGZ4gr5=Ehg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFvdKjsEwFcs7HuhOrx4RBqmAP3DrA5bm6f2Y7MYGZ4gr5=Ehg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 15:20, Yunlong Jia wrote:
> Got it.
>>
>> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
>> ---
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> (no changes since v1)
>>
> Is the above format correct？


The above is not correct. The one in this patch was okay.

The comment was about resending four times the same version. Read the
docs before next posting.

Best regards,
Krzysztof
