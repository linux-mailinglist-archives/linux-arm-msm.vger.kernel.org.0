Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9D9616E4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiKBUIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiKBUIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:08:20 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5004D3AB
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:08:19 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id h21so31657qtu.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAtCoQUt8+1qIrKW2Ix4AR3pRz2pFf4RxKKcIZEXPeY=;
        b=RmcRmqP6sDGA8eTrDk7p8T4o2i6X8f8GvSe5c6ARTXa1OmSsnfmoyCgArDTivKinpS
         0Mk0oEcQhV0dgAkweU2A2kvS/ZfWgscjVRVmB8WUgEMovRhQW0FTeoSVH/zCT5IHnzLQ
         BD9g09xS5Xob6Ra+fIZ0GwxlDD68VFkUdaa6vhWNOOR8cg3wzhVZwrQ2/+rFAdSN/DZY
         ELBgoGFpk9UD0FcdUtCbQ3V0lC7jNCbub6ypNvSsPd2kWty4eeV8siJUTuLAUA9+tU9c
         OzA4PG84WAxJSFFtOfs7gcTX9YmrmpCLMFH5OKznI6PLdtI8GG18b7nRgSNNZ6t9awCp
         9fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAtCoQUt8+1qIrKW2Ix4AR3pRz2pFf4RxKKcIZEXPeY=;
        b=eNDLDhcKN+wMh9crbUOw45wl358BUSFuJ4Vp2YHYMonv2QvsWOC8QPTchwQRBN4M2M
         +A3EskVWjI2lBcssdTcRMupHx7w4WwCBYf553QcikjQAyOak5Xn7UPBTlb4BgFjOQdNU
         jxQ+PrYKeXNOq7TX1zjCcoY/vKi8Qs5IV6eFE3Hm3eGMEbvVSDY04NRGbMa0otuGJQXg
         hNTdmF3Q/r6NRmInKY9zh6uYGauoITpWU+W2/7d6YwprY2u9DADihRMDwCDrz4bgOMw2
         t7H7C63Qc065ZhYe/7qN8P33ZZLg76V1CAAT7WKcu4XdtFn8txQ/InnWOkl3yuSn5Qia
         MLqQ==
X-Gm-Message-State: ACrzQf3vRKuZ1+iNdS0DJcT1wOqWzv6lbAxZVGAIDC82+V0I1lFy4KFn
        1KHhCfO7H092YeOzPXawDwzybA==
X-Google-Smtp-Source: AMsMyM46JjiP7AbO8nIElXpF0JnhkWVL5+aq5p1ekI768sfvBgE1GZvCI2SLqn2FMw+NvsI4SKw85g==
X-Received: by 2002:ac8:5bd6:0:b0:398:e8e6:3768 with SMTP id b22-20020ac85bd6000000b00398e8e63768mr21569213qtb.547.1667419698520;
        Wed, 02 Nov 2022 13:08:18 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a450100b006cbcdc6efedsm9265812qkp.41.2022.11.02.13.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:08:18 -0700 (PDT)
Message-ID: <fa57e497-7eb7-72e1-9236-c798f727f4cb@linaro.org>
Date:   Wed, 2 Nov 2022 16:08:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: sc8280xp-x13s: Add
 PM8280_{1/2} VADC channels
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
 <20221029051449.30678-10-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221029051449.30678-10-manivannan.sadhasivam@linaro.org>
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

On 29/10/2022 01:14, Manivannan Sadhasivam wrote:
> Add VADC channels of PM8280_{1/2} PMICs for measuring the on-chip die
> temperature and external thermistors connected to the AMUX pins.
> 
> The measurements are collected by the primary PMIC PMK8280 from the
> secondary PMICs PM8280_{1/2} and exposed over the PMK8280's VADC channels.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

