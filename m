Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3BD6566928
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 13:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiGEL2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 07:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiGEL2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 07:28:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BA113E3A
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 04:28:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z21so19952172lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xfr8LBR7Ga+h22q5IX0GbtYA45GVUah3dg/7beJ17vw=;
        b=qlU6EIgx4+Okfxy1F3Bvt+OsS+X7zoZtjwaLHAoGJKbmgP/27UX4gAIfAZW9k27GUp
         frGrKSyQ0iZsdduAM+FgIgBKeHBd+KsemEe/X9py0BaUbXp5qnwCiFHpjJY5dRnYB6Tr
         lzpuDwC7SfWPbXhoWCXALAGeSzqbi2R64AQHvq51OFaIksbFEDUhZNMPgqf+uFU42Gkl
         nnKL4jjvEHqKk+BGFAKP+77wVIwxEI+7A+yjR/YudGzeYYW5QPaAP+wrbn/4PpTsg9W4
         2QYYxldq2P5HHekkUHoI+Ns2X+a96vEC6Zs2C8yOItal8JMI03Pz8Zt7HKNWKQqXK86c
         NAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xfr8LBR7Ga+h22q5IX0GbtYA45GVUah3dg/7beJ17vw=;
        b=Tj/VkIF4hSy9OebkswK1erQqgSqf0yuvh+VBox1T8gdoIkjeuOW6Ijx0/NsVHawYOA
         QoEiu6GG44CVl55e6J1LpepZNRpVep+vwdA/BWQkmOIPcbVjmRIExkn93hoauVfzGXBH
         sYkkEIxtrqPhsAyr2fSIkBT70nrZaTVIBH3ZFm1BAGtF5iJRRaWQUUfZo0WQUf4z8Jk8
         50/ZW+PYvfNnXgI91hZTBJL1aHrYxlaq+S9uQx3cvf6dOsdqWwqmDwaZl1XGrrarfdKh
         Olk/2KFKrF6O0bXCBCwUtC2rz5bMjJFBIOn9s1JX5DqYSjJAtcMpFQqCvNgPJspfVcIb
         Ly8w==
X-Gm-Message-State: AJIora+PydYX25KXMCTVTbzCFAduJkNuX3zeHT5qcAHQg1SX8t1naTrL
        YX3u/1gAwUPF4MXadRs/5mTFhQ==
X-Google-Smtp-Source: AGRyM1tUFLt1X8xNcI/QxsP/gcrLz1V3MJ2grrBBCdJKv17R6Lir7cSu47cPQzRjT78Tq00JPwg/rw==
X-Received: by 2002:a05:6512:3084:b0:47f:6c9e:952e with SMTP id z4-20020a056512308400b0047f6c9e952emr22100858lfd.332.1657020517269;
        Tue, 05 Jul 2022 04:28:37 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id k22-20020a05651c10b600b00253ceefb668sm5347303ljn.60.2022.07.05.04.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 04:28:36 -0700 (PDT)
Message-ID: <a5dad8f9-ca96-c176-195b-964a78c2b475@linaro.org>
Date:   Tue, 5 Jul 2022 13:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,mmcc: fix
 clocks/clock-names definitions
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
 <20220705112734.1323355-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705112734.1323355-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 13:27, Dmitry Baryshkov wrote:
> Rather than defining (incorrect) global clocks and clock-names lists,
> define them per platform using conditionals. Also, while we are at it,
> mark these properties as required for all platforms for which DT files
> contained clocks/clock-names for the MMCC nodes from the beginning (in
> addition to existing MSM8998 this adds MSM8994, SDM630 and SDM660).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
