Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA646EA499
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 09:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjDUHWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 03:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjDUHWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 03:22:49 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7706448B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 00:22:43 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5052caa1e32so2217044a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682061762; x=1684653762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G94r1kDoCSrrnnh54D3AYOlzXClm73g5y+LROkaOI1o=;
        b=Vhz2Vgqf74V7QRPjCEVknXhpyMq/VVhwbH4NmgDhbdAIAN/LxlGEWkEWxflKOLCxcx
         gzy78QL3hpQLN+uGutghd45oqwQtDVqF1HSzX0JQo1DgUoJaW0Qd3o9Tnds8+BH53k9w
         JdyZTpvJqQdzizyZsyE/KnkBgNJBYlHRk9nzW5YVgwOQYROvyu17ubHvWzHsv41jrdYX
         j91y7PliaCWouQeaO5t06qcBmQdz9q1C+U1F48LLYftVj/C+eoh7eQQv96P324vTF4lu
         3yjCNyBHsWozheAebLprpoWzHqpxpyErurRXbmUa7paScii9oDNuX8hS3trrFWYSltD7
         tHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682061762; x=1684653762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G94r1kDoCSrrnnh54D3AYOlzXClm73g5y+LROkaOI1o=;
        b=VmpYuDZeU9qdZRbPx55ONVGwMwX1qoYyrcgyf0ZGLrFcE1vWRlVengfNtkC+EQZZfG
         mGsrFIGTCq1ir9y3Ont3IvQ/IMcq+u5B2qKEGHDLutgRtlMwygNhw+9gnGacVDveSxwO
         P/I8UeyUv934MhJJn1vnpV7JoQVDbeEufQ/rj8A5NfgEKQx4ttW5QovXb1Hc83pPYvgx
         c1EQccVAhsniHc1WFvu5b5hvM/uvMDz+ZC/3LXNZ+WSY7Mayu89lkS6Vaqdykzkau4SN
         UfFoo3j3kiXIYWTqYqv0nDl0k10+EXdw1FonV+Q5EXzeyT7P0a6b9Jl9LqcMnvkRaF8u
         V99Q==
X-Gm-Message-State: AAQBX9fLLCTMrintN0bSfxdTjn6hz81xFiKjjB5R1QYYNOWsOy0GiOuM
        aY8f5Jhr0racf3b1sYo6a7LIHw==
X-Google-Smtp-Source: AKy350bP3yXrNVbDGJwdj6jyg5xHgrUduFWRxyie0GM7RBpam0YfmCTrtvKfLvQpad9yZYFGsiSYnQ==
X-Received: by 2002:aa7:de92:0:b0:506:c096:18a9 with SMTP id j18-20020aa7de92000000b00506c09618a9mr4135575edv.32.1682061762149;
        Fri, 21 Apr 2023 00:22:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:668b:1e57:3caa:4d06? ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id j19-20020aa7c0d3000000b005065141d1f4sm1549251edp.20.2023.04.21.00.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 00:22:41 -0700 (PDT)
Message-ID: <e960b01e-96f4-56bf-366d-12cbad33f815@linaro.org>
Date:   Fri, 21 Apr 2023 09:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V5 1/3] dt-bindings: sram: qcom,imem: Add Boot Stat region
 within IMEM
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
References: <cover.1681799201.git.quic_schowdhu@quicinc.com>
 <bd3350e3b0b02669cffa4bdaf9a0a1d8ae9072d1.1681799201.git.quic_schowdhu@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd3350e3b0b02669cffa4bdaf9a0a1d8ae9072d1.1681799201.git.quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 08:46, Souradeep Chowdhury wrote:
> All Qualcomm bootloaders log useful timestamp information related
> to bootloader stats in the IMEM region. Add the child node within
> IMEM for the boot stat region containing register address and
> compatible string.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

