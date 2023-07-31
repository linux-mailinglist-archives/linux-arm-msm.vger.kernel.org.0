Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 516E1768F7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 10:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjGaIEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 04:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjGaIDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 04:03:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4F71FF0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 01:02:41 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so40365961fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690790559; x=1691395359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MprwVZmNUV7a47mCTURUBSfMwGAKqbdXK1e5nVbgoxA=;
        b=VwNtgQDgYrVPUchMtfZ690ZpBvW/vnFfxiXWNzOXcd8hVJM9kZOa1NnYACjMR9ct7d
         KG8NvlOU70LrsblNBE/+X56kZsCUgkukAP97QYe6oAppHDHMFwL1L9TSgzp4CHTtXkJt
         hDjhWkoodM+dt2FAyHYlJHqAxwUfazFKD6spNoUA5C4v5+pdbWEftNUdD1YzkKzuzOzR
         6PgIieS07LJks8jfr0YMWpGHigMNoiRA6vmgJAg1YOICh2uSpIg1HShPDxY55rlCoZvR
         BaxDu8kO7ufs5ZhIcIufRxsMkHN4LiWvUDiEVfelP1RLzjRLsU+u2Jw01keIVRRLPXSg
         Mlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690790559; x=1691395359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MprwVZmNUV7a47mCTURUBSfMwGAKqbdXK1e5nVbgoxA=;
        b=NYAl95kQ4d1eBgPSKDY4U3IJDhGpbJjtxjvvCGfiLI+WZccSa4YZBbB/mha7qDH5cQ
         kOsyGdHgM6mgPqLL/yoP1nQF2BpAiLk2XQAAOxka17UrK67VFJUuXIDEvye5dB6H6/Qg
         rRG7sUod904KQpZP+qxKRfTOwd2wMhhwFUoA69+0FIzrqXMLdB7qlgFizqMQyIGOxWgJ
         mZ+pTuDt1deWg9YVmQcek1LKz1LKLjn5K39IWkyz6M72H/XhElULa1E2u0tLoSpOoSsg
         UhC56Bhww4RaSDGEMUwj3AepBsVEmXa7gnDSLFLcukMygBVRVx8d2ueOCFQ40sgrnope
         LUMA==
X-Gm-Message-State: ABy/qLZv978Zd22JVMPK+2/PXm4vCxtXvY9Qhx39fsNFZE+rZc81O/jI
        3gA/1WP26KkH/Q3cVRbtgGMw2A==
X-Google-Smtp-Source: APBJJlGllSTwLHwrGgtsMnNsjbPWLnX9k2/UY2kzBkmdnksg2maL9QuCt0nuQECpBFBej1dpvYOMOg==
X-Received: by 2002:a2e:904e:0:b0:2b9:ec57:c330 with SMTP id n14-20020a2e904e000000b002b9ec57c330mr1167125ljg.7.1690790559168;
        Mon, 31 Jul 2023 01:02:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709063c0f00b009929ab17be0sm5799358ejg.162.2023.07.31.01.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:02:38 -0700 (PDT)
Message-ID: <dc327138-0fc2-0766-0d86-08977b07fb76@linaro.org>
Date:   Mon, 31 Jul 2023 10:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 5/8] dt-bindings: arm: qcom,ids: Adjust the position of
 QCOM_ID_QDU1010
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230731061325.26431-1-quic_tengfan@quicinc.com>
 <20230731061325.26431-6-quic_tengfan@quicinc.com>
 <981a79ee-5258-eb76-020a-765f5f39866f@linaro.org>
 <53132580-53b6-06bc-8b48-51a3f56ab71d@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <53132580-53b6-06bc-8b48-51a3f56ab71d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/07/2023 09:21, Tengfei Fan wrote:
> 
> 
> 在 7/31/2023 3:00 PM, Krzysztof Kozlowski 写道:
>> On 31/07/2023 08:13, Tengfei Fan wrote:
>>> Adjust the position of QCOM_ID_QDU1010, so that there is a coherent
>>> sequence of numbers.
>>>
>>> Change-Id: Id083e1ecc92c063c1a07a81c66dcb034020964b0
>>
>> Please run scripts/checkpatch.pl and fix reported warnings. Some
>> warnings can be ignored, but the code here looks like it needs a fix.
>> Feel free to get in touch if the warning is not clear.
>>
> sure, will do this check if this patch still need.

I understand that resending this might not be needed, but just to
clarify: you must run checkpatch on all your patches before sending
them. This is the most basic step required before sending anything.

Best regards,
Krzysztof

