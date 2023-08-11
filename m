Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6E9778C23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 12:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjHKKj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 06:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjHKKj5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 06:39:57 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D67A10F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 03:39:56 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso1642345f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691750395; x=1692355195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pP5JD7Qd+owlI+EsZu3qt7Ys+Mje9L1poHGNTb5VlFg=;
        b=VNELPwnMUm3pFHDWHIv43quvejQ5BhC2mvC40k8fmx4R+7xMuB1ad50z+Rhlt0nLeg
         vsMkgAQShsvlEaW1n2Yf2Lk9TL9uoa5X6zvrQNHqf+0Y0QbYTSR4dI3bCoIwKXN5+Imw
         7drdAjdS+xHQWYgy6LXJVovtQwKh0OS8ICn1h73n4UbYvE0G+9H4gCr8u1MckqpumEn6
         xXoT2OYUrYn2RtJu5K6/Nu7if5skaAjs0xwlBv6x1gArr83PXhSgL4bLKK3qFQZVmjm5
         d7kHOXKTMK+qyy98TQIQHKjrHl0Jaqzjyk/mg37lsXu9U0HG/rOnzperjfM7y7QGIXDh
         7LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691750395; x=1692355195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pP5JD7Qd+owlI+EsZu3qt7Ys+Mje9L1poHGNTb5VlFg=;
        b=Mt0z8R2I8jvOQlpzv+bofqWVIs96xpaqG7lSD7ngpEMFjU+ZgFL+gARCB8GtRsqEZA
         TYTDXAhUSV+nnh3S8712EGWotktGPLxmiPs1ZgLTaF5L77tsLIzNLyurFSafYXB+Bmhx
         M3yjvXwonRip6qZDpwNBV6PRg1vOxBYg5Z9XahSvTfREMfmsaFM3TjFmUBTgnrZiLEjE
         H/DYjUpHjZzBJjD/k925Uye9F/fPm8e/yQFkmR3wf4Io4kOyR06sp3WnyN6bfV8sjMSq
         pbQ+tT92m/RAOKlblbaNIzacvQI8z9Xs/4bGGIN6tbqNKgyujUiCXGPZRBjfn+5e4uxK
         jyjw==
X-Gm-Message-State: AOJu0YzrJaAXqpY2XuWIdCy7Ci6CB0sG0DUXcNY5aYil0+JcJq90VGAY
        BR94xiVItqCfNWA8BBJoMo4mDA==
X-Google-Smtp-Source: AGHT+IGIiRy7UxDy7iJQLnNOZ1BodhhB0A6nBwAIk6mflNf46YzeHu8tlNyE0HhrO6XXGhy8USNqXg==
X-Received: by 2002:adf:f20a:0:b0:317:6470:3271 with SMTP id p10-20020adff20a000000b0031764703271mr1021233wro.45.1691750394757;
        Fri, 11 Aug 2023 03:39:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600012d100b00314329f7d8asm5043481wrx.29.2023.08.11.03.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 03:39:54 -0700 (PDT)
Message-ID: <2fe4e8f0-5aa5-a89b-2f42-e179b218e7cc@linaro.org>
Date:   Fri, 11 Aug 2023 11:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] venus: hfi: add checks to handle capabilities from
 firmware
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, tfiga@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <1691634304-2158-1-git-send-email-quic_vgarodia@quicinc.com>
 <1691634304-2158-4-git-send-email-quic_vgarodia@quicinc.com>
 <59b61d65-a827-d252-cdc2-a256f99cb4d9@linaro.org>
 <a1713beb-e1bc-4118-ab58-b5d8e7fb3cbf@quicinc.com>
 <e763934d-dd4b-9cee-9992-eb24dce0435f@linaro.org>
 <f1bbcd06-f888-b466-1b7e-7034ab4004e7@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f1bbcd06-f888-b466-1b7e-7034ab4004e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/08/2023 09:51, Vikash Garodia wrote:
> 
> On 8/11/2023 2:11 PM, Bryan O'Donoghue wrote:
>> On 11/08/2023 06:54, Vikash Garodia wrote:
>>> The case is all about rogue firmware. If there is a need to fill the same cap
>>> again, that itself indicates that the payload from firmware is not correct. In
>>> such cases, the old as well as new cap data are not reliable. Though the
>>> authenticity of the data cannot be ensured, the check would avoid any OOB during
>>> such rogue firmware case.
>>
>> Then why favour the old cap report over the new ?
> 
> When the driver hits the case for OOB, thats when it knows that something has
> gone wrong. Keeping old or new, both are invalid values in such case, nothing to
> favor any value.
> 
> Regards,
> Vikash

Is this hypothetical or a real bug you are actually working to mitigate ?

---
bod
