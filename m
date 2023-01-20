Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF35674835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 01:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjATAqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 19:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjATApx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 19:45:53 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6335A8F6F7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 16:45:51 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d2so3480911wrp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 16:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ca48TWzh+z08kA9PkkfRhaPbJkNBvnzcz9gn4kRdiYk=;
        b=S9dv2JFyIf0VVRUEk3CgiCUKPZCPl5V9KLtKwpiM93nKXjFtOTMIjqVwsidoJKzJB/
         7mMhFoXj+5Wg4r++EA1v2cOpUN55UGWPUU6EJ9kZaZa/nDBeXqWSsV5KhWX1OVCD1rBz
         dM7Bfg1oen3aZxofTFDgmdMfH8oZHavYCL2GGln9eHtzn+ToGtdGOjTZob9UJBfbmSSP
         fT/cBlTWSIUE6XuYXH0eDpgDnJ2U7h749Z7Hz8TL2iIIE8UQ6p4y58o7T9r38SADQm3j
         RlFZg7VV8kT1bEhdWJbeF0n8fNmwnFOWfwp0nzbrO5aXN1yAy6OU7S8zQhs8+r0dPawC
         SuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ca48TWzh+z08kA9PkkfRhaPbJkNBvnzcz9gn4kRdiYk=;
        b=UleIxANIQtRWzKyreA8JSBmBzE/UgcesbuQrjDTe70/Vbj+Fju9CGP8Xn+AYF0ruzs
         GZQq2fbVK1JFEG08QaX9MRL7jTqU7pZ6DQaBP9G7a4EBiw3SfMUBcwau/7PSmuA0n1oE
         GZxTds/yuw+y6fKEVTu5IfaKj4rcr66T5ZERdD7Eg1l+gnF8gZAPZhIl59nUCchf0dZg
         L18zNkeIuaLigW/Eq6s9BlOTwjahLQlB9PECmFsP1hEmQ1KneJsS+M/5RFD3bGpb41WD
         9aoD0JYnbHhYZk6qB+ucvOlRBeYetnTKbdf8xiRRMkzHKPWlQMAuL4LATZPg9UTm0eUP
         7ZLw==
X-Gm-Message-State: AFqh2kpcHDbk8V7GENa7BwRFoGLVttAauQ4tKV+V1GJGbIcxI9Kl+5+c
        e2P4eRgI3pu6p/eIu/78P8lrujQ06YDJ3RGm
X-Google-Smtp-Source: AMrXdXusDyoZE74jSRmrA+n9UpUUX4m++ajZQ8/KUFiSvAIaEYpcTnrG2R3i5TS96mQJJWRDM5jRGQ==
X-Received: by 2002:adf:dd01:0:b0:289:773c:59ee with SMTP id a1-20020adfdd01000000b00289773c59eemr10910231wrm.6.1674175549915;
        Thu, 19 Jan 2023 16:45:49 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w5-20020adfcd05000000b002bdc914a139sm25983260wrm.108.2023.01.19.16.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 16:45:49 -0800 (PST)
Message-ID: <0a7427ea-e127-8608-7a37-b89574b48f20@linaro.org>
Date:   Fri, 20 Jan 2023 00:45:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: Add msm8939 SoC
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, djakov@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org,
        Jun Nie <jun.nie@linaro.org>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Max Chen <mchen@squareup.com>, Zac Crosby <zac@squareup.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230117024846.1367794-1-bryan.odonoghue@linaro.org>
 <20230117024846.1367794-6-bryan.odonoghue@linaro.org>
 <20230117205800.cqexxwxmtupapy7e@builder.lan>
 <58ec79b0-1b58-48c8-6eea-d6675f34192d@linaro.org>
 <ab1c316e-b018-9fa6-0ebf-5c0b47c397a4@linaro.org>
In-Reply-To: <ab1c316e-b018-9fa6-0ebf-5c0b47c397a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 00:42, Bryan O'Donoghue wrote:
> On 20/01/2023 00:40, Bryan O'Donoghue wrote:
>>
>> pronto: wcnss@a204000 {
>>          compatible = "qcom,pronto-v2-pd-pil", "qcom,pronto";
>>          reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 
>> 0x3000>;
>>
>>          power-domains = <&rpmpd MSM8939_VDDCX>,
>>                          <&rpmpd MSM8939_VDDMX_AO>;
>>          power-domain-names = "vddcx", "vddmx";
>> };
>>
>> ---
>> bod
> 
> Doh.
> 
> I opened the 4.19 kernel ... not 3.18
> 
> *facepalm*

But *this* is the downstream

qcom,wcnss-wlan@0a000000 {
         compatible = "qcom,wcnss_wlan";

         qcom,pronto-vddmx-supply = <&pm8916_l3_corner_ao>;
         qcom,pronto-vddcx-supply = <&pm8916_s2_corner>;
};

it is an _ao

---
bod
