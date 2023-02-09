Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEAC690864
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 13:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjBIMMm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 07:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjBIMMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 07:12:20 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA84AD04
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 04:11:33 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so1390575wms.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 04:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Df0R/1IsIEBizIIioRMRApD+5BCz/Cj0WUyoSJvsVgw=;
        b=rpn8yyR6+aUJwDrOJrJjq18RlJ6tXQItoSv2xO46b0Plpa2MWPZYEMNbJ0ZYaB1sjy
         Bjt1yfrymHDwmJnCR6lLArpuJV1o2xGURIlUqeOHfi+0sVqbxSeFbSu6zVt6Bm+oLhTi
         XUubJAnTcet3x6gXW5QCsoOLixrl9IcZgV+XVpzW5KMDQEQ5B3Lyz5ClpsA9lRvSGyHI
         nQWgyah3Hw023Y6HGVEDFSsEakUnIx1Cmg3pMZbl4ArhlN6lr5BQTT7ELfZqMvcB9FkI
         6JkhMwZqlOCIRnW8NR2eJej0v5U9mu9pznGRaqt8c54hdatbmca3vL+uTZVW3F1H2SNm
         73YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Df0R/1IsIEBizIIioRMRApD+5BCz/Cj0WUyoSJvsVgw=;
        b=O3ff7xh4jvkB/iQsOKxsqSyjCkiaRB4++v7wu1u41jWu/4dglisP4/oP6MVIPhOKNC
         XklJLN7d14aeKNMYhtbnqWbRzU4P+ZDXv4xbSsuzHoWCFSY68wUgI807MatX9ZOn1GjU
         cnr2umapLmsZVp/HEhtfUmyPgrtW0N+sKeSmWOXzsLnaZVbskQIp+Xb2OjL8Bg2EPiIK
         DPKQYY8bGff//ua/V6jUoZwmtt0UBABpCU//+J7tM79t+ljaVFXv2L0dBsdMQCQGt+hP
         eJ9yjlJPlUPL3TqE46SZNm2/kOYjdPxCGaBiLAgXIXZc9EaqM0wbMl0bh2xox1xwX8Ye
         rYcA==
X-Gm-Message-State: AO0yUKWR9t5bTW15YJPzuSgqJvnvW7MXUOE0ujyDrmNKCOcFJQVaHjlt
        rkgv+nfwuMdLqftyvttuGGUuNg==
X-Google-Smtp-Source: AK7set8UCw1fqq7pOokTqqBwG55lf07NMHtWhTdB3dAiI5zggOD6rqDMVTlIW50ALOYB/+Djcvmc3g==
X-Received: by 2002:a05:600c:1e8a:b0:3df:e57d:f4ba with SMTP id be10-20020a05600c1e8a00b003dfe57df4bamr12758098wmb.7.1675944692400;
        Thu, 09 Feb 2023 04:11:32 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003df30c94850sm4753348wmc.25.2023.02.09.04.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 04:11:32 -0800 (PST)
Message-ID: <fa2e0db7-5b27-5a41-920b-b786dc4e521c@linaro.org>
Date:   Thu, 9 Feb 2023 12:11:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory
 region as reserved
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20230124182857.1524912-1-amit.pundir@linaro.org>
 <39751511-3f06-7c39-9c21-208d4c272113@linaro.org>
 <CAA8EJppLBuA08hkqTrZx_wwbtCxK9sAjv48c9_DxgPENgo7a8Q@mail.gmail.com>
 <1a840d88-e5b1-711c-b980-f57620c54472@linaro.org>
 <8508e3d5-7468-0b2f-5a43-7c439ecf2d8b@linaro.org>
 <CAMi1Hd2UNxXHUVWO-=sWh=-bVnrqE3UdLguFOq+62SfvUiEs0A@mail.gmail.com>
 <b2307e91-3373-539a-ecfb-e2542b9f83db@linaro.org>
 <ed737e67-eabc-6f29-b734-f4698767ca8e@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ed737e67-eabc-6f29-b734-f4698767ca8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 12:08, Konrad Dybcio wrote:
> If the bootloader splash is enabled then this memory is used until the
> DPU driver instructs MDP5 pipes to suck data from a newly assigned address,
> so there's a short window where it is.

It seems a shame to reserve 30 something megabytes of memory for 
continuous splash unless we are actually using it is my point.

If I'm running headless its just wasted memory.

---
bod
