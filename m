Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22D77D8175
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 13:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjJZLDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbjJZLDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 07:03:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0CE195
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:03:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507a5f2193bso840811e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698318205; x=1698923005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzUkjj3ioVAuziUZcUjR5KTsG1ZchY1msQxN7OBN/9E=;
        b=R24ij74OdmOpyo/Oix4XzS1/Te2vaVJIGtwd8a1jfygV41mBJPhZCT5/zEiUtQcXiO
         pLtJQWgxPzLSOmwDQYIGnZr6nyaxBkCNEuhQHg3vtyBZ/9pXSGv0f/a67WZv9NDJRszd
         UizYxzEKe4KKwy+Bh1Kv5hPf/7xmLjvBkJckvrYF4uyxUwzolbIiujBeiOImIOjDPpwC
         2fQONF8XDyJFk6sKW0w0DMJ/wXvSh546mEKxvSKWKS8mFf2ELeiQc0F/LoAM/7PyHH5c
         NirqqrcwozN/PLO60bM6L/LIhWxsHGf2TO+1+VF/Wq4nCiZGYulN03jO9tXi5fvlGH8N
         gXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698318205; x=1698923005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzUkjj3ioVAuziUZcUjR5KTsG1ZchY1msQxN7OBN/9E=;
        b=G6K8ivSA8zxuIRWWWrFS8sMuBZEfxu1RSgIuPZOzGDTsWuVpNOr5eJA/nrvuUEFqy8
         UvcGz+gFLwA1asZb4dnrGtWCnpiRJg/1zLuAo9ahOLPheI6v4rwWBiQcbQvP2OSxO5VP
         QGdSGE3HDXFqZk6TX6LZ30TgkTKi3MIKbjNK/KSQrxS9dLoP+HQvwtHSodb+GGvLlqPE
         brUARqX8wPGKiAXDRrIQh8ZpJH7N1dclanYe9UcPpRdi/vV2VI9eNbcZF4XhqSMV0NfL
         /cdg7WZFbMw3IXqPYqeaGq1rvnKee2J4N8TR7wMVuhSdeSAVm2veqP6Du1oUv/LGmBKP
         v+SA==
X-Gm-Message-State: AOJu0YwnnKjMJDpN8ZOf2sNNYpV0mWrbhU0n4eogLvvL8Tc692mrCEdO
        c4CFP2p7bZQHrNb7Dxdeh5Vhkw==
X-Google-Smtp-Source: AGHT+IGXWeTTuhTugX6l5vKV6ed4QbMt4Upd/1mje4BckbkWso9Rz1mQfodP+vd3jINdRSXBP+zS5Q==
X-Received: by 2002:a05:6512:214d:b0:505:728d:b48c with SMTP id s13-20020a056512214d00b00505728db48cmr707543lfr.19.1698318205254;
        Thu, 26 Oct 2023 04:03:25 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m7-20020ac24247000000b005079d34f330sm2956190lfl.282.2023.10.26.04.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:03:24 -0700 (PDT)
Message-ID: <6017d366-b4fa-4ef1-ba39-f54d7963cc88@linaro.org>
Date:   Thu, 26 Oct 2023 13:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add SC8380XP power domains
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        ulf.hansson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
References: <20231025135943.13854-1-quic_sibis@quicinc.com>
 <20231025135943.13854-4-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025135943.13854-4-quic_sibis@quicinc.com>
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



On 10/25/23 15:59, Sibi Sankar wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Add the power domains exposed by RPMH in the Qualcomm SC8380XP platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
