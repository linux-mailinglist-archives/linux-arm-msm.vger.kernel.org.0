Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5486B1F01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 09:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjCII4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 03:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCIIyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 03:54:17 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B03464857
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 00:53:33 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id k10so3934982edk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 00:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678351987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/wZHW13/mQxhk8emF0uZdwKLstd4GE6HEzP/De9WH0=;
        b=BG/dRpZ/NUnb1+JWPtygo8p1kSQMRnFW2N3kkWid/xyc/HkSTvmUk9LYLANpCKlu80
         ijlTDK8PShVim5FqfPNEuvWWWlOQWrA5H8sQ8aIU48nfJcHbFNJf29KTMZuo+qQeW7bg
         wBs8egBzAiYlDjlOXI+qwiNk9uASGbvRxSSXVujkHK+hc46k7l1Dev7tCEmh8dErpPaL
         jr9rUJyU36yKdte7YsogC0NVMti0qtH9f5zTxw4vMzecpYwhRX5UA8j91xiswZBuZ23D
         9uG3OR0bxFLXKVCXeyqf67frBAGwLSGKyYGl4TrQHd4vNDHPELSYELIQFaVQzOWMxrg6
         lcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/wZHW13/mQxhk8emF0uZdwKLstd4GE6HEzP/De9WH0=;
        b=7NWQuMbfM77jOYH5wOdxe3cJuZBuCVOe6LwT/SS+Yk+GbJiboFDO7T1ZNknt2HSsh4
         ygm6H0PITuF06H0rxCmVq06IPtEUS+l2PwciUxW0UCxDIDj3ganFzDMtOqceDbiiewEo
         t1J1XErO9d1OqtKvqIY2o/NgFqvJyl5pEaE8hN2NjhAulrUcvjlJSOiuskSAP/WBa5tC
         oScQS1INZv7TWpsbt3AQvDVRM1Cq/ams+gL28zIVTKJnMRezPHMkLoe1fsfoemDYI85/
         97iQyva0iVy/DhthSiVMMxObDl0AYPwGo65yN3Q/esoq8lSGefiD9gZjdNRBunsnG9Zp
         oBCw==
X-Gm-Message-State: AO0yUKUYAa0lB4mnMWxhBbFigx85iqTWo9QWptslC0psikAcD3s/I45e
        4LCbw3PUQUZjHkgoQ1Eb+lEXyg==
X-Google-Smtp-Source: AK7set/N0j1iC6/UdLiys36rU0s0N5NOAh+G6YeJK2n83X4YAfEBPymjnqnnbCLmls9KsXDe+7w+Gg==
X-Received: by 2002:a17:906:eecb:b0:8f1:4bef:b0e7 with SMTP id wu11-20020a170906eecb00b008f14befb0e7mr32604866ejb.1.1678351987755;
        Thu, 09 Mar 2023 00:53:07 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id s26-20020a50ab1a000000b004bf999f8e57sm9194133edc.19.2023.03.09.00.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:53:07 -0800 (PST)
Message-ID: <192a29e3-86d7-5592-f9b7-932e07e5f7bb@linaro.org>
Date:   Thu, 9 Mar 2023 09:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,qmp: Add SDX65 QMP PHY
 binding
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1678283688-4020-1-git-send-email-quic_rohiagar@quicinc.com>
 <1678283688-4020-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678283688-4020-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 14:54, Rohit Agarwal wrote:
> Add devicetree YAML binding for Qualcomm QMP Super Speed (SS) PHY found

Subject: drop second/last, redundant "binding". The "dt-bindings" prefix
is already stating that these are bindings.

> in SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

With above:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

