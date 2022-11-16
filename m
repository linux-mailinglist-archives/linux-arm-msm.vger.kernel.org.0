Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3422362BE99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239058AbiKPMtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239057AbiKPMsu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:48:50 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AB3BE0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:48:46 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g12so29369657lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jKTXv3W+aVVrG7M+pevbCvwAQjTJkck5FLwc5nQCkkQ=;
        b=KuBg0PdH3A4pnA7c9PaC5TTDHb3iw7rEugZB2T11VX4xjA8rPiUzhctQR2NVll5+7I
         QRIznVLfZ5EacZ/UbgjnAmazKCNgKwl1eFIEvVcoP/NopMhDbl7xqlzOHelCx41eKK3r
         ScKmaAOyuRKRgbS0JsOE2knYK8zVjFB5RNN/gfaW6JKJMybxcLoGGIm5DWReXub8JtEB
         RFjFDDci7gs2tH5QTc8ePF61aG7/G9LyvlTGLyk0VhTHLyc3U+79wkZQ7YSbqQDU0hIj
         vBc8Rb4kw9sQc4Af6Z1yF5TkTG8cNhIUPxE+3YGgFpqruwnfH1gg8zi4JhBOrc5hrVXu
         6htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKTXv3W+aVVrG7M+pevbCvwAQjTJkck5FLwc5nQCkkQ=;
        b=HwuqVPpQKVQOfcF+xKkMkOtJElJ8ddUi2Ze1OGZBae7e/onfKcY0PN5Cr3EC/Vz8T2
         F8i/DjGyUqLNT2TRIfvuQm3+Y2jAhtoHfm746cOHZwMo3yOTTPdHQIHLRKuxIooKr8dj
         JU4njN201VaNBgysrt0bKcC6N91gm8/wboZ+UnmwR9oCqJeT5km5Ty95+K0Dtdx3Crsh
         26AZ/HlxlSZJdk/TSe2r2/x6b0dFldMWMDf2FMS/bBrPjUN+jY2r2E4pbKKKsoDcPR9G
         bsYSHv1iirBBoi2fgrLQ0Uh6Iq2Rj7ww87mQEW7K7eKsKn92LFq1iH7uI9c94sokIpHr
         dAOw==
X-Gm-Message-State: ANoB5pm971L3xjtxNYuRFzqB0ktXjK+4pPRrAj0kQ3gmzDkwzkFzTKQn
        HG+AGxqk9zy7TjirQ0/wAguW2Q==
X-Google-Smtp-Source: AA0mqf7/5F66e1Pt6JlCU8Ah87lxd0DJlaAsqswlnj6wFWJZb1wN+pQUnFCD0yMYLrIc4RaYiZ07iA==
X-Received: by 2002:a19:4f4e:0:b0:499:fd39:b1e3 with SMTP id a14-20020a194f4e000000b00499fd39b1e3mr6909937lfk.348.1668602924742;
        Wed, 16 Nov 2022 04:48:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020ac25e8d000000b004b1892aa5c8sm2594135lfq.56.2022.11.16.04.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:48:44 -0800 (PST)
Message-ID: <d9ee3801-d5a8-ecdd-96c0-ec2fbd6d43e2@linaro.org>
Date:   Wed, 16 Nov 2022 13:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] dt-bindings: ufs: qcom: Add SM8550 compatible string
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20221116121732.2731448-1-abel.vesa@linaro.org>
 <20221116121732.2731448-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116121732.2731448-3-abel.vesa@linaro.org>
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

On 16/11/2022 13:17, Abel Vesa wrote:
> Document the compatible for the UFS found on SM8550.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

