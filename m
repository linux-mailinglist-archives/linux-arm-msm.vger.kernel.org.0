Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 320756C386F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 18:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCURjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 13:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbjCURjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 13:39:46 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74181FFE
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 10:39:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eg48so62713313edb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 10:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679420348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew/LKGJ8Jj95pEC4kKeRU77u/HVRhzleE7cRa8HgbiY=;
        b=AxG2hRe/xj9e9EnlF1tQBNw05WHrTAh/Xmmk3wXCRkBcJlo9z+JvILZtnW8lkFBOy9
         LEcjspvnzbYQsG/PNip/hBeF71TgPUh6K1RQm5R4HILMVDkFp7NJap07Fnklk2t+DfNQ
         pB8NF8EhYK6MsaOPF1BL1uQxieNzEz63cM1pAk69IOIF6WLRVLQihTyCiyD1/5ELC3Te
         8YWcCVUEFw6YScq2k+a56BBBl5Kuv8xiV7Ul7vmouFXUubMMUmkZ2EbTpcxpJW/T50JO
         SPihNYq1gt/sajGgrSGhF5yobNHhUp6fVk39qxrgTtcxZqcl3QPgKPqinUNIwW6lysXI
         wfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679420348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew/LKGJ8Jj95pEC4kKeRU77u/HVRhzleE7cRa8HgbiY=;
        b=1lWDw57RVjcrsgREOLaEHR22JJb+i+r7axMGiCuzdDkYhvhZawfE55/PutvoWLznIK
         YEe1uf0YxoYg3l8L8j8gSsu/BKJRZVCYsLnh9MzCGQWICgixkhzj5uecFXviVsciemju
         qjUdWkZSaZkUsR4TZKoMgtcyr3ujbKphYHFgCMbMrGhrFcCWZKezUz1EOD/9S6FbfEj1
         HrvV0Pk+9foUP3j7DzYNPnpnkWG8jfBg8H67Dd23cx2890kTKLiIxnJ5ZGuovEDpdOL6
         HEBpoVIzpH0YeVVvBmJ+A23UevL1/adJcZ+VbRrunpZfNgAHRaokZ60KHbqOSkklbwfd
         yFjA==
X-Gm-Message-State: AO0yUKVJ02qbaasJlJ2H54QPCUTnlm/VjyOK7SUInJ39AVvFF03ttAqI
        IV8buU+yZBrF296TK0ZhH2v00g==
X-Google-Smtp-Source: AK7set8OMcl+bTtJi2CaWtR9hzTsb+Pp1XZ5EebGjJ9xUgCqkS425DyHmqzd5ZKkj/WweIm7Qepb1Q==
X-Received: by 2002:a17:906:35d5:b0:930:310:abc2 with SMTP id p21-20020a17090635d500b009300310abc2mr3826828ejb.35.1679420348406;
        Tue, 21 Mar 2023 10:39:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id lc5-20020a170906dfe500b0092973e209f2sm6038493ejc.109.2023.03.21.10.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 10:39:08 -0700 (PDT)
Message-ID: <e845b412-9afa-3d9e-54fc-7f9f04d25c05@linaro.org>
Date:   Tue, 21 Mar 2023 18:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V1 2/4] dt-bindings: soc: qcom,mpm-sleep-counter: Add the
 dtschema
Content-Language: en-US
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
References: <cover.1679403696.git.quic_schowdhu@quicinc.com>
 <576e53a1d0ef218536da976102b4cc207436ec1d.1679403696.git.quic_schowdhu@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <576e53a1d0ef218536da976102b4cc207436ec1d.1679403696.git.quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/03/2023 14:51, Souradeep Chowdhury wrote:
> Add the device tree bindings for the module power manager sleep
> counter.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  .../bindings/soc/qcom/qcom,mpm-sleep-counter.yaml  | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,mpm-sleep-counter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,mpm-sleep-counter.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,mpm-sleep-counter.yaml
> new file mode 100644
> index 0000000..f9f46b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,mpm-sleep-counter.yaml

Your code a bit explains this... this is not a device but some memory
region. Does not look like suitable for bindings as separate device.

Best regards,
Krzysztof

