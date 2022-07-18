Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3180C57856D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 16:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbiGROaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 10:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbiGROaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 10:30:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94391CB1F
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 07:30:06 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id w2so13807208ljj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/5oIvxDhU1wNW+eL7Qgvi7dKgqP5roy0pnTZFlmRHxE=;
        b=iCPfT+Xn0NP2BrOqLN6FJa1BYWwl2rY4H9AvMI3zt0sk8J+Ov4JOmhI1YXJxVJGvdq
         iIYTvhQ2KfaoyTwDuo+3koLssU06OCgZBYRpzPlJ+HZSkn4WsHEzHvyeVyb9atfi9Xd2
         4uIjIZUKD86hg75VTvHxwMdnCuopt/1cfQy8yDRmJivAv6VMDpLIfpq5CDtcdD+LGHMu
         RKV+pxpvXbqKgI+xo5QjVXN7OO52FES+RoUkZJKONrdY9ydMCTB0n87X4ysU9rO+zTtw
         9yiDCzX56WCKn6uKndbSUuAboPBm5Ojw3TY57DuaMPGm4OD/gYJP/FZUXxM/q7uGPyNl
         YTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/5oIvxDhU1wNW+eL7Qgvi7dKgqP5roy0pnTZFlmRHxE=;
        b=yT7Q6FNNJNr83HmMb0WKHI9WnBCRJEGFdxgvDqPBHTRQjRKaiUDgawBILbBvCbmiUS
         IK1/1gRyjswi+e1Keom4xCQUyFpNaZJlNpiy4lspuLyK7JAt3ag4AnqikDGg706z/e8i
         KSZie4u/guzOFCIdiEwDFbd0AQ2nD5sOPx6h3+X2PrnkrGUMg89vvKPWuwoALtphroLI
         Tj/E4AV5rhG+CaX8GCpGpEp1sIGR+e2qWq1TGIDtt4Q60oU2wuEjVBVSunYsdo84fd15
         l5RmVH7TI1sC4eg4ZmpE90F5jFi7bvYiFgaihu69gKZzQvZL04hrcM5u2asmsRd499Yf
         ikTA==
X-Gm-Message-State: AJIora8UqPznrwzqtlFe/iXs11rh9A83dekhrpOsuELluQq7nO4YoO/G
        VJMFjXxo7re7/KJYYpuLR2s6xg==
X-Google-Smtp-Source: AGRyM1uyh1ig1wRtCAeayUglHsEzfADmdSe/JCLJNHNmtTJeS57mUYCm9kEivg0IyHc2hj9uj3EMVw==
X-Received: by 2002:a2e:9690:0:b0:25d:5357:37db with SMTP id q16-20020a2e9690000000b0025d535737dbmr12322895lji.62.1658154605338;
        Mon, 18 Jul 2022 07:30:05 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id c39-20020a05651223a700b0047f76a935a5sm2619108lfv.137.2022.07.18.07.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:30:04 -0700 (PDT)
Message-ID: <7ed2f112-54d4-2652-542e-079541aed394@linaro.org>
Date:   Mon, 18 Jul 2022 16:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add SM6375
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220716193257.456023-1-konrad.dybcio@somainline.org>
 <20220716193257.456023-3-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220716193257.456023-3-konrad.dybcio@somainline.org>
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

On 16/07/2022 21:32, Konrad Dybcio wrote:
> Add a compatible for the USB PHY on SM6375
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
