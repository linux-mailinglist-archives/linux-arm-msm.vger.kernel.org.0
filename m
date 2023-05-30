Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A63716DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 21:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbjE3Thz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 15:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbjE3Thx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 15:37:53 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444E1E8
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 12:37:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f50470d77cso2810475e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 12:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685475468; x=1688067468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4TpePdBcmf3Xw/fPvZUtcZlrHBAqUXKquGcCNg+8W4=;
        b=dwqIw6MQH1tUrPDRdlGNfOTTTS4X4TGXQBY6HjdV5Kg/WHQzZi2rk7Z0ZKBU4R88To
         87Gq0HTgwpKhiHITsrTyshd5kxb7AYHjQsTvJCVi4So0J1/KZ+WEV72qAqLGwkIf9tcA
         j1BBmL89W2jhfWoI6aYtO4BDyJcFk8uOWSWT/CkDscbcr6PFBhwJHjTwvr1nQa25nrRM
         SVg+N5WOIlmJwPm481pMcfUyC5hjhedozkJhHP7W4lIza4JckFXy+ZYyVrKPedcOJvyO
         q1608se3L2Em3vQcjSv7Bw3clbM48BtRCN4MTtrYM8E8Xs5f3A5OF6Q6UIwX5Ud7Ey2A
         4UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685475468; x=1688067468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4TpePdBcmf3Xw/fPvZUtcZlrHBAqUXKquGcCNg+8W4=;
        b=YixdPYHCh806XOoHuxQTgoIcgt3B5MQd7+cZssf21N26oDcZg+Cxc/ras+v0BiPkxn
         1GhHvzquVCPwQFvqxoLjzTTiLmn+QiaWLxSo6bwO1nvSzDfx1QtE5YbHhmdwMK/WYis3
         RDTn4IH2ik5Ha7CdI7c3B3dbTPBlNGpWbc2qHa+IjQI2RwavpSQMFL+xoMBXsP2ymbBd
         hmCJU64vuNoIT9RKNUVZRR4fmk8hbq7ZRpM7mgJ87aTzrRgGMUK6HEJIAmgK6nq9hJ54
         1/SJASq5fpd+GWWHA4hOmLolqlqQiavU15GLoDVmtWafT/EMlF47Gr8tDjVxWx8S5zRt
         u3XQ==
X-Gm-Message-State: AC+VfDx7JHujSpta/bnOnp3A7OMJ0NEpAhVUO4xsQlvOC5hA8URPbpJ3
        AYQXjcpP0e6HBmpFcXcqzVGwqQ==
X-Google-Smtp-Source: ACHHUZ7pnAUM8bkHrV3d/NxVG64VyEJxxguXYTf7NQ+tfO8xq5mMB6Rk9GYLhNJX7tDJe9D0x1Tf0w==
X-Received: by 2002:a2e:a212:0:b0:2aa:40dd:7a55 with SMTP id h18-20020a2ea212000000b002aa40dd7a55mr1376227ljm.8.1685475468466;
        Tue, 30 May 2023 12:37:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id t10-20020a2e780a000000b002adb566dc10sm2962863ljc.129.2023.05.30.12.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 12:37:48 -0700 (PDT)
Message-ID: <c9c232a4-519a-108f-3651-5af6ba812dc8@linaro.org>
Date:   Tue, 30 May 2023 21:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: reserved-memory: rmtfs: Allow dynamic
 allocation
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230530193436.3833889-1-quic_bjorande@quicinc.com>
 <20230530193436.3833889-2-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230530193436.3833889-2-quic_bjorande@quicinc.com>
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



On 30.05.2023 21:34, Bjorn Andersson wrote:
> Allow instances of the qcom,rmtfs-mem either be defined as a
> reserved-memory regoin, or just standalone given just a size.
> 
> This relieve the DeviceTree source author the need to come up with a
> static memory region for the region.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../reserved-memory/qcom,rmtfs-mem.yaml       | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> index bab982f00485..8b5de033f9ac 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> @@ -14,13 +14,16 @@ description: |
>  maintainers:
>    - Bjorn Andersson <bjorn.andersson@linaro.org>
>  
> -allOf:
> -  - $ref: reserved-memory.yaml
> -
>  properties:
>    compatible:
>      const: qcom,rmtfs-mem
>  
> +  qcom,alloc-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Requested size of the rmtfs memory allocation, when not defined as a
> +      reserved-memory region.
> +
>    qcom,client-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: >
> @@ -36,6 +39,11 @@ properties:
>  required:
>    - qcom,client-id
>  
> +oneOf:
> +  - $ref: reserved-memory.yaml
> +  - required:
> +      - qcom,alloc-size
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -53,3 +61,12 @@ examples:
>              qcom,client-id = <1>;
>          };
>      };
> +  - |
> +    rmtfs {
> +        compatible = "qcom,rmtfs-mem";
> +
> +        qcom,alloc-size = <(2*1024*1024)>;
2 nitty nits:

- Most uses of DT arithmetic put spaces between the operands
- You could add a comment explaining what this example brings to
  the table

Konrad

> +        qcom,client-id = <1>;
> +        qcom,vmid = <15>;
> +    };
> +...
