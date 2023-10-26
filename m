Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9157D88B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjJZTB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjJZTB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:01:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25851A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:01:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso20739251fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698346883; x=1698951683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1BZ81nAT0A4MTpnEvNW5fCUKOEkpiMZtdJbcsroR4U=;
        b=Lsy7FgSqds2AXp7gVWDHO/geAUbkA3L85Efkjw3Bbh8XQ8k0SvIEahmrhCD2RJKMIE
         icjuG9eW/Y3ArvFf/m6vs3LM93ZPvM8lSx4IwsBfvhpOO5u729YueypgJ65exWdxoylC
         oQL9m/XXhXnI5nCuJgOJXofLTVCsbvLXIAI6MM7xOIeXeiWoyYC/+DnLjdOz/XrBSvlz
         Ml1iJuRVGYeSS2xg5Ccuc1UUEFUsYQRLevJ6C9quk4vemBAqTs2qxcwaYp0PuuwJ63o6
         J3J7vBcf0a7OONpnSkm8iTPeEOBCkih98SvesW7j2+OUu11ayeWb4JUIMTlB4G0AL7pX
         CExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698346883; x=1698951683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1BZ81nAT0A4MTpnEvNW5fCUKOEkpiMZtdJbcsroR4U=;
        b=HYprX8uZRPzGs0rERE760FyHG3FRq/H/U+kY7SWRDfRSwMXgFBS918KUs+IAynxlsD
         3DswaBp9QsIYpSQbCL2NvWJNbxv4y0aQNe0lANJiOjxh8yO8qfLbkjMTfuA4iqe4eetf
         vVexXv2Qw5fwlalYDxYe7VOVsIZSPKuVkdsFkWDO3ccqxuCBH0tjZuexeZdClCHSFHzs
         jNhJTX/rE7HXChhBLagf0+AR/CVEzRPw0I9APQpuQ4n+clx6KWdsfQ1nOCTWW4JoaAVc
         0KvjnKR0SLDDgGVtPUgv5206PX+SkolAIKeeKvk6DpoEfkoDSf+B97TNG2PjAs243Vpf
         XNQg==
X-Gm-Message-State: AOJu0YyAaPg6YoF5rvrj9BYhdpyFLSuKfAjFkNjzPXHQ9MathCaxl5n6
        licDgGjCfZkVstJX+/kW3z8rYg==
X-Google-Smtp-Source: AGHT+IGIAAotxRtH1wdOvF9QdEt6/2zKdECILEAJMIVzWwT9kNqftaBXOGXmlwcuVAXxxff5pSqaaQ==
X-Received: by 2002:a2e:bb86:0:b0:2b6:ea3b:f082 with SMTP id y6-20020a2ebb86000000b002b6ea3bf082mr321435lje.38.1698346882840;
        Thu, 26 Oct 2023 12:01:22 -0700 (PDT)
Received: from [172.30.205.8] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m8-20020a7bcb88000000b0040684abb623sm3240647wmi.24.2023.10.26.12.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:01:22 -0700 (PDT)
Message-ID: <0bff0569-8571-4994-96f2-ebfa1b82c9aa@linaro.org>
Date:   Thu, 26 Oct 2023 21:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Use common VFE
 pm_domain_on/pm_domain_off where applicable
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231024224255.754779-1-bryan.odonoghue@linaro.org>
 <20231024224255.754779-3-bryan.odonoghue@linaro.org>
 <d0d30b6b-3664-4531-a71f-6faec3330d2c@linaro.org>
 <fdd775e5-1e43-4f65-b444-da6b83e3df5b@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <fdd775e5-1e43-4f65-b444-da6b83e3df5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 12:40, Bryan O'Donoghue wrote:
> On 25/10/2023 10:18, Konrad Dybcio wrote:
>>> educe the pattern down to a common callback. VFE 4.1 is a special case
>>> which to me also indicates that it is worthwhile maintaining an indirection
>>> for the vfe_pm_domain_{on|off} for now.
>> Are there issues when powering it off like all the others?
> 
> 4.1 doesn't have a VFE power-domain just a top level controller PD, however I think a blank callback is neater than
> 
> if (vfe->pm_domain_on) {
>      vfe->pd_domain_on();
> }
> 
> its just vfe->pm_domain_on(); at the cost of 1 or 2 instructions for indirection.
Right

Konrad
