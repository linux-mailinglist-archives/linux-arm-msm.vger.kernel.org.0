Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A97574B94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 13:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238309AbiGNLM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 07:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234487AbiGNLM2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 07:12:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808264BD00
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 04:12:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n18so2250051lfq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fvqr8DzCB5Ms/ndKd51yog97G935KCQIcJUMeAgMVno=;
        b=jH3QiWlHtlfoa285UHBE/VcWeZvy+mWv8ej2r09+geEqhtysnIcqJrPxFqiPyj7+DW
         vmc8luVf2oe5ikO9Gmt7Wt2fXfEHhb4ZaEpnDXvSxzIF0iHpFVdwK8NtKk1JQdVFwVT5
         ALl/1n6s/i+qewLXz99/tweY9Jyt3H4ls1fGcieaPiLer3hhqkInYN//KZE71wL+fRUy
         iSfKCQWhzC8zEitfq7SXfguxh8eh4fUHjIz4XC8uHs369oxkfLstSKAtqVMqoJE7pNbF
         MyTK+43wR1oFaz2kChl4uHiubD3ozhysHVhUZJTsiEnxBf3vs0nl0Pl/U9loIanBW7XY
         qTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fvqr8DzCB5Ms/ndKd51yog97G935KCQIcJUMeAgMVno=;
        b=kMjhPyg1zji4qE9br3CCHTd20JBQ1/GNLoXbuiYPoahc/V7GEFhXbU82dpIzvIqcY/
         zG6RfgxkcKFne/bCbgGAnYk+YVHB8rrRLlpqRztuZUm4Sq7UvdljJGMfy6R+27SsxJ7F
         kwm2ov7CjaEVF0wxSVRo1NKy/4DeS00bXYVSfhYG4WMeAiTJ8WJLa5iReMC3vW4LzeOf
         lO9+Hjz1JPeTSP0IqWqMDJo7GR8Wny9+GIeuLCXe8Aw8W1ZqVr+DNRcigMwMUtS9BqXi
         tJmMzC+MAjkZQsxdZAqVKYAp2pE0ZW/zCja4pJHc/8KShgnEKG4/9Myv7R9ChJFNs3p+
         694w==
X-Gm-Message-State: AJIora9L8Q/DvRpQMgTzbTj7jqm3tFxvYiuVBtcDy0t2zY7ZE3IUH7Qs
        AvN1BQdq63T5lNtEBsmE4PgSDg==
X-Google-Smtp-Source: AGRyM1uCyLRMhFXry/qiHNx5qI9aOJ2I8WKRtkBiIN8tzefGYlhoUNhVFIVYj/Kq0zEZDXj+B2Eawg==
X-Received: by 2002:a05:6512:3342:b0:489:e367:ac with SMTP id y2-20020a056512334200b00489e36700acmr5231044lfd.191.1657797143883;
        Thu, 14 Jul 2022 04:12:23 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f8-20020a05651232c800b004894b6df9e2sm302327lfg.114.2022.07.14.04.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:12:23 -0700 (PDT)
Message-ID: <63c2f4a0-e2f7-cf86-50de-dbbac074c26e@linaro.org>
Date:   Thu, 14 Jul 2022 13:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Document Sony Xperia 1 IV
 (PDX223)
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220713201047.1449786-1-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220713201047.1449786-1-konrad.dybcio@somainline.org>
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

On 13/07/2022 22:10, Konrad Dybcio wrote:
> Document the compatible for the PDX223 device.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
