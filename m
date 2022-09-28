Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA095EDFA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbiI1PFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiI1PFs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:05:48 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0433ED6D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:05:47 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id ay36so8731649wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=LbkiTn2AAWuuc6hV3bxP0WyO4RfSlFoBB5RRyBhKRLQ=;
        b=Od4C1bLx1Yl3Hz1HqnUnvOL+CIUbylDRF341Sr1tz74+sJKO+9rAULiR7NPW7hyipZ
         VTab/cPzacGT1fmJD5KvIZ9ZtbAn+yWCjmiZSOBFXPr/s0GtDMmwo6M1QrDPgkk+b7L6
         t+vKGQGUBmtCYFVWkUoptgsRh+VcRFPoOI0JBXuuQjMVvPbAgEESwsbCqtx8zQty41YZ
         XaBMm5Wh3kom2H1VeMvQBChgapUMiovWpcSVGiRG8Udn4dYWQ8rDbI7RvAdrACcSfisS
         QN9MWjTUgASv7pnioG6a+7EOA/ULIGSJMOp+ex8QXjolUYFj/fr3TZT19ilvBPVwzIE2
         8z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LbkiTn2AAWuuc6hV3bxP0WyO4RfSlFoBB5RRyBhKRLQ=;
        b=M27ZJUyuWUbaqdXK56sg3aRzECprblxwqeZS3tg4Fb+88/DcUxWi8m+pCTNyW7ecqP
         Z6ZhgF1T1dTV+/H8I4XXWODKSUyUlGwBbLNhDiuWccKCNLm+Lsvnrk8h4GSNJN6FUyYc
         BRN1B09tbOF/RLt/UJLjEi0ARr4NfZunVHJehVxVYn7graXye7iD21CiWLaRM4y1lANj
         1cu8r7MzpJw8j4yoN7oVm+jTSK+tw+S1F/p+qVWv4KkeGoPUF1VkkQeJSdMknwCpZ7uw
         sV3qDXq6cAflgQ3qaCjqgrsMqZk3fl73chtR2KotLdavBB9PcRmxGStYLG8Cl3r6NzST
         B3lQ==
X-Gm-Message-State: ACrzQf1pG21mYDDmIPapD8E6coEuoOTplrx6atCVux8Hu6V9HMcki91f
        zan1jkDJcUYbawytVnqcvDS67g==
X-Google-Smtp-Source: AMsMyM4K0lTNM9cpGRumIQstlHDzumN0c1uVyJVGDQHeRJexGeR7LIBt+gRTfzXJUPQqpWvp8TNPHQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c618:180d with SMTP id g11-20020a05600c310b00b003b4c618180dmr7221013wmo.25.1664377545649;
        Wed, 28 Sep 2022 08:05:45 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d5441000000b0022cc0a2cbecsm4072327wrv.15.2022.09.28.08.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:05:45 -0700 (PDT)
Message-ID: <cd9a50f4-ff42-a87d-bcea-0af0509cb592@linaro.org>
Date:   Wed, 28 Sep 2022 16:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: move qcom,gcc-msm8939 to
 qcom,gcc-msm8916.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
 <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 15:56, Dmitry Baryshkov wrote:
> The MSM8939 GCC bindings are fully comptible with MSM8916, the clock
> controller requires the same parent clocks, move MSM8939 GCC compatible
> to qcom,msm8916.yaml

I'm not sure they are _all_ the same but definitely agree the two trees 
are so close they should live in the same file.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

