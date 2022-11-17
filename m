Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E229462DC13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 13:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbiKQM4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 07:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239321AbiKQMz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 07:55:58 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64679248C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 04:55:57 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id c1so2631088lfi.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 04:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weF6twQ71pWpDxGcUzWzUjRuKt4zlvZJapX9428bGkM=;
        b=oMJaEUk7SN6S+W68VImxs6MzLOp4LRttAMZpSdPfxVM2JMza7JDFDWdZZaL0lO9Bx1
         M8T9iWspwsMr6SYy4ZdUH8T1EQjqBGNOYs9jfZd1kqrL3uBAEHL+e6n9nPOls2DMEwsu
         wvg1nvOKUUC20InGEspvMCFGtH7OJrPVVthCEovVTkGTnK8vw9BRU7EeZuK0rZ5/1AyO
         EKXWShLXBF48iiY4KC3ZEn8j7aIErKsaOzHZVLlMaw8d2oia8izerOMPXbNkxf/46jhz
         5piUjAecz3Nh2BxW5RRbZrNjPM6u51pvU+DDTdhdccIOFz0aDFLLpVskGANGCamJ3OIL
         up2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weF6twQ71pWpDxGcUzWzUjRuKt4zlvZJapX9428bGkM=;
        b=MVCq9ITzIBUyr5uWLbBazjABRqxWHZM+cx6CZFzmFJihomQqwP4hTTZ3KZ1O1ezdR9
         XICu73vXzumXxtmESTtC58/PcNlLDTIrAX3O6rnLgNv+QDZcasgHwugVnpcRoGLZcN4I
         Fm8OploBddt8foD+UePu37O4J6Jd7PuQctLeSjnl+GYSWSG3zbShwvYOITfBq+QC7OaZ
         5mOncV49J2dJTZ7UJtRm/SYbuzjwJ5EyETy+lZKyMfU7+TV+hhPtH49WsI9pxtu83PcM
         WoYd91FFdYc68q+CRf2NC51QfvBQmPN2jWk2WQNH33F+t+ydtemZSJLfDZBLbne2Heas
         FXzg==
X-Gm-Message-State: ANoB5pkrBOFzhlJ6QAflkhqGpgAGGS6qh91GSjNVOUd40YwlcQgdYCpC
        KjXC8Mw/r2RwgXXH0mpkkc3P9w==
X-Google-Smtp-Source: AA0mqf6HTkt2Xy7pKPSB5hVlx+Bp1Kn+ts6vBant0J7vRFGKxCmfnqQF/qAUyQQ7iWJ9insch5v5nA==
X-Received: by 2002:a05:6512:3b12:b0:4b4:686b:4f7 with SMTP id f18-20020a0565123b1200b004b4686b04f7mr773502lfv.256.1668689755798;
        Thu, 17 Nov 2022 04:55:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s3-20020a05651c048300b002770a9ed61bsm181805ljc.66.2022.11.17.04.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 04:55:55 -0800 (PST)
Message-ID: <77805b04-2724-dc93-eae7-21d9c7caf0a4@linaro.org>
Date:   Thu, 17 Nov 2022 13:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add SM6350 GPU SMMUv2
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221117094422.11000-1-konrad.dybcio@linaro.org>
 <20221117094422.11000-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117094422.11000-2-konrad.dybcio@linaro.org>
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

On 17/11/2022 10:44, Konrad Dybcio wrote:
> SM6350 has a qcom,smmu-v2-style SMMU just for Adreno and friends.
> Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(although this might need rebase later on Dmitry's refactoring)


Best regards,
Krzysztof

