Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8874C7D88F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjJZTdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjJZTdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:33:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE3512A
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:33:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507bd644a96so1902231e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698348795; x=1698953595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53j4yPzIfSUO3GQdaiPP9wavaCtvO+DP02lB52Y0HLs=;
        b=YbIsDHBBfHiG/bXtbIDodZ8Si+Z4x/J4UMIdsvc+grnMb+dinY48jlvis73DUOgXDj
         fXlAUxloBgxadEHM4kvi66PMjebqBICL0dB4akfswOjLHyNupNdPpL9irklnGa8K1tqM
         AMhlONS1le8enrPH5S9ymBkzCTDhVzkesQ08npCd2cGN3bfK+sVbzjBajuupe3dywKEH
         LjOxC3r780ROphPoQrI4G+buvbt1eJ7OLKv8ZPJCey7h2pqrUv3Zfr+DZsrTAn9RBO4l
         19y9GHloESJbossHs06XDwYde1cdcbhTIRffwU8gJNDnWBQkBq3zKBJJ4Mn3m1aK8ixH
         zodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698348795; x=1698953595;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53j4yPzIfSUO3GQdaiPP9wavaCtvO+DP02lB52Y0HLs=;
        b=sr9j7lKMZhIemlzHVsKZrpQo9UxbHywgkFnO4JcKFI4lj1O75W+OHZffiv3Jynsfu4
         R3GKomDcWn1HCv913Uf48r40WjHVzUHPXzb+S/aVP+S6yyllYxviAChDoPMKadDTtYPP
         zt1ab+FKrBsYEuJv52tha3dFPMB9DINHZHT6U/pUD+jV2qWe4qaSCoMDCLwVckT65DuI
         09GQOaNj+Llj+5gvq2UKuMs2ZSdy2eze7bbE5GWl4bOizCUUkXxjlQHs3OKVtkZuTxLt
         swNucCu97uhFu1w5Vg/vk3eWknf0BDWIEBUMzMc1dMSfpcxpxlvo3xpxfh7JAhbVFiM+
         qgrw==
X-Gm-Message-State: AOJu0YyBxTIVOisHVEPFLxyBNk4fVwgTmSOlGqPAhBH9mtJV4N2qeCIH
        rwFor2cFdDN+ssUwXFXXaFQQmg==
X-Google-Smtp-Source: AGHT+IF6uzK4XBidM0y36zrNA9siSxrCRCUxIwpLiq44IJ2QmjApG0ZdhT99lHUSRpDV92BbutG/yA==
X-Received: by 2002:a05:6512:3b10:b0:507:96a3:596d with SMTP id f16-20020a0565123b1000b0050796a3596dmr270688lfv.49.1698348795394;
        Thu, 26 Oct 2023 12:33:15 -0700 (PDT)
Received: from [172.30.204.84] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j19-20020a056512345300b0050336e38735sm3107145lfr.92.2023.10.26.12.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:33:15 -0700 (PDT)
Message-ID: <a204b552-0162-45f3-a35c-04507c5150b3@linaro.org>
Date:   Thu, 26 Oct 2023 21:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: starqltechn: disable crypto
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231024154338.407191-1-dsankouski@gmail.com>
 <20231024154338.407191-6-dsankouski@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231024154338.407191-6-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/24/23 17:43, Dzmitry Sankouski wrote:
> Disable the crypto block due to it causing an SError in qce_start() on
> the starqltechn, which happens upon every boot when cryptomanager tests are
> enabled.
> 
> Same problem is on Lenovo C630, see
> commit 382e3e0eb6a8 ("arm64: dts: qcom: c630: disable crypto due to serror")
Would that still happen with this change:

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index b9243c0aa626..dd1a2b679098 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -1805,7 +1805,7 @@ static struct platform_driver qnoc_driver = {
         .driver = {
                 .name = "qnoc-sdm845",
                 .of_match_table = qnoc_of_match,
-               .sync_state = icc_sync_state,
+//             .sync_state = icc_sync_state,
         },
  };
  module_platform_driver(qnoc_driver);

?

Konrad
