Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B52F17C01C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 18:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbjJJQhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 12:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbjJJQhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 12:37:17 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EECF99
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:37:15 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-405524e6768so56829505e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696955834; x=1697560634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2+nmzantxOYY6snfxh3U/lP8Nv4ffuUeaORW4FhlFk=;
        b=OtTVdiMNhurxGoo4voKaItx2tNCLzc0YY/xCpJA3I7CSLDQLb8SA1h8ruuD1/dxAHZ
         0fApCT1YlIF1vWRcSoyQsJxnsIQkVbm9gJkdmb+7Pi8wdCpevBx4lq6Pa5lO4nhY8vN4
         tQZxuPwOnesHQdAfngpS7gcAk1DUQv4Xexd56GCSCsekR4w4LRbt9tj5/TXdAfPxOodx
         kTFJBxV14QW5G4ZOUe6ypAfDOQ9TmxWw4flxvQJISgYLAmbcYg0zheycFZP4h12gk8u0
         ZCndYcFNNW+jPle334LcqjaUMfbLZRkkfrLZXc8NwHue2hgcJNYiUXqBZBRsflpWe8Gp
         Ompw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696955834; x=1697560634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2+nmzantxOYY6snfxh3U/lP8Nv4ffuUeaORW4FhlFk=;
        b=WGSHeQ62HDVPgjTVyrGU1/u6vnQB8EMgvBVXAS25ByCZt6PbH3nmP8tnOlL8Vame1C
         5kFT5WkJTegG4GLPhQ1u864q4+YjEzxGHJBallR62RK9apgLLfTzGJzPacNgAfAVNEwr
         4EBWKOJvUBsmHqR1abFOdcVj7lvfwxgpxN9IHxNdwyyHlIFuBHrJNnGTUwUqgQhokY0R
         nuSWQljCPgrEQdYLRStIacpiGc7bHhbzJgbgK2xnfU3pnhCDW5e3DxKkKQYSQCjDjO1L
         RLxxX7hP879CiOROOAZpVgB7TPjTP1nJreI9hB/Y9xwm1J0G8JXffmVJDJnHruH0mwPG
         n33w==
X-Gm-Message-State: AOJu0YyGDTJ31VNiVwKQbEwYuDKtlRkIWqc1/ZCFwswzPtEkzPNoxnF6
        1DfvITSuoVx2Hy0/KkNVJq8jNBm3GYnqi6DCkVY=
X-Google-Smtp-Source: AGHT+IHuDBPm08d2IT/HViICAu+xRv2PqSFZdUqU3VVrNFhRl/7xmwE37yYJexiLv4EDQkrEGogpIg==
X-Received: by 2002:a1c:7712:0:b0:401:c52c:5ed9 with SMTP id t18-20020a1c7712000000b00401c52c5ed9mr15859201wmi.32.1696955833906;
        Tue, 10 Oct 2023 09:37:13 -0700 (PDT)
Received: from [172.30.204.182] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b004063c9f68f2sm11675343wmb.26.2023.10.10.09.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 09:37:13 -0700 (PDT)
Message-ID: <5458734c-b9ff-4351-9bcd-c3dd7538f135@linaro.org>
Date:   Tue, 10 Oct 2023 18:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/4] dt-bindings: ufs: qcom: Add qos property
Content-Language: en-US
To:     Maramaina Naresh <quic_mnaresh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com
References: <1696952947-18062-1-git-send-email-quic_mnaresh@quicinc.com>
 <1696952947-18062-2-git-send-email-quic_mnaresh@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1696952947-18062-2-git-send-email-quic_mnaresh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/10/23 17:49, Maramaina Naresh wrote:
> Add bindings for per-cpu QoS for QCOM UFS. This improves random io
> performance by 20% for QCOM UFS.
The bindings addition improves performance? Cool :P

Please explain your changes and provide the "why".

[...]

> @@ -318,5 +326,13 @@ examples:
>                               <0 0>,
>                               <0 0>;
>               qcom,ice = <&ice>;
> +            qos0 {
Looks like the indentation is off, also missing newline before subnodes.

> +                cpumask = <0x0f>;This should be a CPU phandle array instead. Besides, can we not 
determine this dynamically?

> +                vote = <44>;
> +            };
> +            qos1 {
Missing newline between subnodes.

Konrad
