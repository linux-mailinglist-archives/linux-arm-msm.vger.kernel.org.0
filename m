Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B31E60F9F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 16:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235955AbiJ0OBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 10:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbiJ0OBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 10:01:39 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F78EC1E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:01:33 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id c23so1143966qtw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BIM9AP/v/YdcTWJm3DuGMdy8t+tc52c5MKOBGgfU4M=;
        b=R3vQ58xpuvPRsK/v1rJtbV1VrnwALFfPqAvm4KnkYe5QVUjkIG55wUQC6WvBsmbvQV
         MukottTOxv3hByPXVcPVFcbAm8K27k37BU7P7L8wxo0LgyCBPpJ0XbdnQGd1jf3OM8qT
         ewTEzBB1cAVdL0YYaPT0B97Y67X7++zULD3iB+AgVuJp0AuXCbcV+1Bdly1ogBWbndUF
         58VqzLGojrPt5DJeCemEvU46KqjlbPcPncPWQSBcU3pfKu9j3uneSTpjgZgI1SB0zw6Z
         v/N7ZN9w6Le7+Ii+X0o9z/LQjimx3mW6DGOd/GteSyk5LIb4y1PXaqRNoz08/Kw+n42J
         rZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9BIM9AP/v/YdcTWJm3DuGMdy8t+tc52c5MKOBGgfU4M=;
        b=xmUkw39dFq6v0Jw7NzYgKuI+G20rl93oEfUuu6aQowFCUwYwOp91pvBr+PZBSbG/Kh
         caAuzwXuVWrwMMuEQaV7J4UEZ1r8XmnT4ITI0HTJLtKQ1mlQu9vhdh11BO5rUaW29Rgj
         IRAJ/cDMg4gDml49GxXOXBEnLuJv92VuYqfUrEOmoLzzWr6V2I9bsxGHzWxUhgsPBFi/
         H49GPexdjGSbRQ81AQVaHJGkB6CDn8BVydwiYrlR4aB8jKmd5pZFNI7toa6DuLfph/8j
         bXp2MGwaetav8B6Sf+4fTstOD1HDz5Z/JGklTuON1YlngRG+qMvOGgEWOdJzAw9eiOGJ
         HGng==
X-Gm-Message-State: ACrzQf1YfWPbIB6FAiLnulbMyBntvrSkGdzshLvXbSInyMl6H0NlG3X5
        GOA3zHdS/VdEejZqH3N9XYk0aQ==
X-Google-Smtp-Source: AMsMyM7xZFWRL6Ie5t5hA8Zm48nyfRGc08IHmbxDYgQBF5smoCBBh1JWYehyB1TePUCLr3nTXSS+1A==
X-Received: by 2002:a05:622a:250:b0:3a4:f664:16be with SMTP id c16-20020a05622a025000b003a4f66416bemr4144613qtx.86.1666879292179;
        Thu, 27 Oct 2022 07:01:32 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id q11-20020a05620a0d8b00b006ee9d734479sm1029140qkl.33.2022.10.27.07.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:01:31 -0700 (PDT)
Message-ID: <e5240681-6382-b354-ae7e-5fef016f2716@linaro.org>
Date:   Thu, 27 Oct 2022 10:01:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sc8280xp-pmics: Add support for
 TM5 block in PMK8280
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-7-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027063006.9056-7-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/10/2022 02:30, Manivannan Sadhasivam wrote:
> Thermal Monitoring block ADC5 (TM5) in PMK8280 can be used to monitor the
> temperature from slave PMICs like PM8280.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

