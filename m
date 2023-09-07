Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C192797694
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238019AbjIGQN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240091AbjIGQM7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 12:12:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AAF2C165
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 08:50:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5007abb15e9so1882202e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101746; x=1694706546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpHIUYmzApKmGGiHZZpnMSxi31KSn/xZKBPfgME94EA=;
        b=f8ax5ryLAEOmmUsQucpL26DqEvKuyZWtLcXtDwGK8nE8v1N8vG58aSjlhxHub0sUb0
         Z1tCwMAO6lsPEO+sgcTsGosYA841i0Fr1agX93p9aV9LwiUEQ+5Zk4zo1lpqSI0VpCQo
         DWDZa3QCsEBqHfCiitd2OBhy9PirKbvb3pFu9f7ocKi9ajLF8b5nfsQFRj3xzqnrRs+h
         C1TSzqxdfO4TZ1UEyR/MLpe8EoN5rtQUwatOPRWHqOaxWe8Y7xYF6QMWg5c8tCNViLQw
         oDyHrYl82rYAAgn3EBBwZjEdFHFMDEkLv+aepAXWD6+vpmDE2PY0ZlnADwrrNzr5xLpU
         lNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101746; x=1694706546;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpHIUYmzApKmGGiHZZpnMSxi31KSn/xZKBPfgME94EA=;
        b=HS66doTtUn3CiPcCseniYHvQkqouc4l0PqKTqZNcPpueeHIqtJ7mirYaAl6sjgXs0b
         k1lO1yg9ovCpohZyv/omy3ogR7/o8Zm43zechr3UKuVQ1QVu5UpISvWvV9NQ/pmRsMI4
         mkDdsxEWsHmQHYwC1cQgUXZPoK+U6C3PrOgFwFZF4DLwjiDkERuZCw71ctL/JErgqThM
         X2UtuxobKa7I64KUfW7Lq7B0RVhseI3oTn4TTj2LdTHPnIndMaMGawDvLbilKe9YRtb2
         4wHIr1eC85wBrpwoG5AD2xHtEQrAxi9vAfqVKgfwOZ/ylGk9MA91OLHdVicvdat7K+vm
         S47g==
X-Gm-Message-State: AOJu0YySMZy3u0jVuv1zoH4lSDOXg2/R/mcSM7ZBHp2+KDqdPYKnECnt
        LeIrUHNeLPnAhuOMpbXK7TPxMPa+QtN2o0/9JkU8Aw==
X-Google-Smtp-Source: AGHT+IE6rP7AS4FnGxp/huXUuWImGW5DpdIfQDtTj/sIRkZFOXfhElTxhQiu10RgpaNZRjIoSI51Qg==
X-Received: by 2002:a17:906:5c:b0:9a5:db06:4264 with SMTP id 28-20020a170906005c00b009a5db064264mr3607933ejg.72.1694066638936;
        Wed, 06 Sep 2023 23:03:58 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709064e4200b009a5f7fb51d5sm9928020ejw.21.2023.09.06.23.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:03:58 -0700 (PDT)
Message-ID: <4f882fa1-8174-2816-71c4-a2941372aa19@linaro.org>
Date:   Thu, 7 Sep 2023 08:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 10/10] arm64: dts: qcom: ipq9574: populate the opp
 table based on the eFuse
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <1512a94f8fe1f8fe22cef2bf8498a6ac27989633.1693996662.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1512a94f8fe1f8fe22cef2bf8498a6ac27989633.1693996662.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> IPQ95xx SoCs have different OPPs available for the CPU based on
> SoC variant. This can be determined from an eFuse register
> present in the silicon.
> 
> Add support to read the eFuse and populate the OPPs based on it.
> 

...

>  	};
> @@ -223,6 +254,11 @@
>  			reg = <0x000a4000 0x5a1>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			cpu_speed_bin: cpu_speed_bin@15 {

No underscores in node names

Best regards,
Krzysztof

