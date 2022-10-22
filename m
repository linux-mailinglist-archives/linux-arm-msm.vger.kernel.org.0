Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80903608E23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Oct 2022 17:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJVPoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Oct 2022 11:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJVPoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Oct 2022 11:44:00 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A746422D586
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Oct 2022 08:43:59 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1321a1e94b3so7186172fac.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Oct 2022 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ju7kxtOhKHTRsfBsXg2/eTdT1+u5aVNes5dScova9r8=;
        b=t+NU1/rm2OYIOGutKekuo5Cb7LFVI4jyvbzHGZxnhEgdUfK4OIiG27Yb3cKYAvy2pV
         VTJvYTAhBPsv5eq4iySUTnVFI2KbzQLGm3jmHDFtEg0+OHQA3phW8OCiT0W085wZEH+j
         6eGJgWlG3Nkc6GnsKY0AhMoF7SwyDYTbwcFay9Josxm8RqUD267fuz58WuMaAq0iHKSo
         4hAXCYtHDAPJ3HDanYSaMEoVS6cO++4FHw4tqbjgb8jYCcjLwMW30QzCEX1rqiroJbrt
         fXh9PgXEJmW58cAdlNyUTl6vzxNQOPX2ZfUaI6Hib+57Hf0395nUIT4COzVcD+urDfWE
         5EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju7kxtOhKHTRsfBsXg2/eTdT1+u5aVNes5dScova9r8=;
        b=gMVFzk+US0vXFkoBNNV2VfDe6aixHX5B9wIksIswjpFuGWJJqOMqBWcD5LCRq4PDC7
         +Sk7R0ciVNrYLK/EvRIdlHLTa9iJHyT+sGDgNLYBKvoyOPc14gBpvNX5AK1UODEAaHJq
         uwIK7aTJZbKV9RkI9VIJB6aZDs3p+1uqX0XvfN3dEhQP2xdnbGxXwoGqboG8ZdWlvHqO
         So6gCQ034ujbwX/Lg+Wb9901zKeuMa60d1G8+iCeV84qopRwhX2TELUVfMLf2tgHTo8I
         FXRMubg8PKJvwtqXDP28yIUrbHzu9ZNPgMDWyQRCOhmlza/lGerHQL3iT3Oercxg8r1H
         97BA==
X-Gm-Message-State: ACrzQf0or5uddpPEO2uoNEsXauw/Po4Q9bdUjnagbiPqErOLwHtFVGxv
        C+HIv4RtGLVHIQjNUApPbvCfsg==
X-Google-Smtp-Source: AMsMyM6YOhCieDZR89GiEFE08pgj2Qt6dMSwM5GAwGyMbRO7gGqkcoZSc6SrRMkBjYf0g84SmS/maQ==
X-Received: by 2002:a05:6870:b393:b0:136:8cc2:ea8 with SMTP id w19-20020a056870b39300b001368cc20ea8mr32922605oap.20.1666453439075;
        Sat, 22 Oct 2022 08:43:59 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id q185-20020acaf2c2000000b00354b619a375sm2267659oih.0.2022.10.22.08.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 08:43:58 -0700 (PDT)
Message-ID: <403db1f4-d927-bb73-8aa9-84b9b0330e73@linaro.org>
Date:   Sat, 22 Oct 2022 11:43:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH 1/9] dt-bindings: arm-smmu: Add missing Qualcomm SMMU
 compatibles
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021165534.2334329-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/10/2022 12:55, Dmitry Baryshkov wrote:
> Add missing compatibles used for Adreno SMMU on sc7280 and sm8450
> platforms and for the Qualcomm v2 SMMU used on SDM630 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

