Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FDA6D558C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 02:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjDDAaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 20:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjDDA3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 20:29:52 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0183C14
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 17:29:50 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a44so13484181ljr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680568189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8l7Gpf1kgcSkfhhcQOq0OfQlssCiSnegEYzShnT6EBg=;
        b=kqthJisN2OKwyvqbEfBce7GgQ8XsLKGUfGK2OjczkAOijlM5glAmrB2ICuYKi/c3Aj
         2uqd5MLRrYRzmIP/5EJsb8xJ3nwtFJ6K6KWxphGilG0FinIJE5UViewmMQcuDUG9I+tZ
         hlEas8dXikMIpBSFCEEZoHTJ6KgJS6PE2+xlbZN0kmn47y7UJzN8cU3CrrD5Mks3iewA
         c0Ga4ZrGhA0mGieqC+pf5+IVEf6gtok8HZuGLDuEPfrWbx6aqozJCO3SCzVRF8XulaUf
         QkEl2BiLz2Vs1niHTRitHpLd+2dcgf8EGUnaaoVjcPE+zz+WDzsffHNX9sdgtipmEx6Z
         m98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680568189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8l7Gpf1kgcSkfhhcQOq0OfQlssCiSnegEYzShnT6EBg=;
        b=c7heGf0k1VBTaPlUgYBrQyZd88mDypdM6V784gZtGzM3cwCghHFzXH/crGkqUNP8ye
         0FnSfO0ghz8/Js7cKbAYEEJ7Xd4s+souXt0hGbpyTKBApDvtWdytpI7cdwEvMJgzB696
         TiAdRngPYopUniVHrDfVZNTEttqY9BTdw0dxL/cdjvgZEoHtPf/Kfgj/kYRwXyzwnJCb
         WK4tGih2Rbv0Dgln5SO84snYErMDjHEGNHp1yu3UAVak8glsI3FgltjSGLDCgxYGxQ7/
         3P6T5JzdUvUQyeCxHLjIBFgnFJNbsX67hULrW55hMTktfWwvDvp6N2fiNySK0bKpaGZu
         x/Gg==
X-Gm-Message-State: AAQBX9cxQ367jeYdGrN0QsAiH268sTjeYwsxe8lbA/UJZhG5njm9vbKx
        13a8aWsvXPCUi+nwecKdogZ/AA==
X-Google-Smtp-Source: AKy350ZqpBnO5Q5YG2OTNyDexq4JYCBSFdDejsEH2v8+s7eFJpon/I0IIVTXYVfXFjqwgODSwA8AGg==
X-Received: by 2002:a2e:88d0:0:b0:298:b335:de49 with SMTP id a16-20020a2e88d0000000b00298b335de49mr313259ljk.25.1680568188799;
        Mon, 03 Apr 2023 17:29:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u19-20020a2e9f13000000b0029a1ccdc560sm1998162ljk.118.2023.04.03.17.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 17:29:48 -0700 (PDT)
Message-ID: <e346ebf6-6760-ed0c-392d-6956a14ce592@linaro.org>
Date:   Tue, 4 Apr 2023 03:29:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/1] dt-bindings: firmware: qcom: scm: Updating VMID
 list
Content-Language: en-GB
To:     Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>
References: <20230403204455.6758-1-quic_gokukris@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403204455.6758-1-quic_gokukris@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2023 23:44, Gokul krishna Krishnakumar wrote:
> Adding the full list of VMID's, which are used by different clients to
> pass to the secure world.
> 
> Signed-off-by: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
> ---
> V3 Fixed comments from V2
> 
> V2 Fixed allignment issues in [1]
> 
> [1] https://lore.kernel.org/lkml/20230328214703.12093-1-quic_gokukris@quicinc.com/
> 
> ---
>   include/dt-bindings/firmware/qcom,scm.h | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

