Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698DB6C8211
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 17:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjCXQDU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 12:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCXQDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 12:03:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C10B46AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 09:03:18 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r29so2306925wra.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679673796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JejaCk6CyWSfdiQWhxpThu9OY9rNIrf2KzDX35z5Uyc=;
        b=CnpTk8DJ0VZi6Qona+U0/XQDLXLLxcDigVDczGvL4PJf7hV1VMJoVaBs+wEdJLLWbv
         rdS+AbWELW/LnNtzxHpq7PVSAU1YGmdGkkK3CvT+WdZ4xHmvGa8i7HWKGTAnMiS04uxO
         kZb06EhuXvvKWDQeOFM2jrfdhA7IIWJmzyE4xhy21X3KklzgKxDbI9faeGyKfHWniXyd
         oUAAlwZtFuQvDZV2WjHhkNFm28QfJLJlT4HmB7CEJGBcz1oEzUF6f/gcthitguW5NF+3
         ZkviJKqi3YfsGCcwff3RoLKpYJneojzLxE7YfJCwmvK7nRThDl8NIWNvNR+fD33fPSuY
         msmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679673796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JejaCk6CyWSfdiQWhxpThu9OY9rNIrf2KzDX35z5Uyc=;
        b=cniFDaQnVgYz8R6OH47WMQLj8hsyiX4qEDEOI40iRwDi11Vh2+wgjP2ODThQdk7zlh
         1bkIXZR+w1EM7FGyWcIUTxFyVjDf5MKJZ6VXkIq18tiGtDQuAdUPYaywliadWBnm+s4u
         uQERJoO+kubIS3Qo9wvlfF+wAn+62G++KXTPMKpjMTiP7+t/x1JL+PW+VkLV4ZyJb/Os
         FPJ0Yd31LQqufh4VlAtIv6qI1qGdXF6aNjZ15oqRXItrBlKhm7NFBFrDAQL/4Hr9GVtt
         ZoWDLPvfrUWN4ujDdBSH9UUD//f/sBR6lRKuPiuCIGp4+UJLORVz+wLd53Q7KAslx3gl
         DLSg==
X-Gm-Message-State: AAQBX9c+J/v+P3A/Ip5KV+cQY09RVYq3TdbAOn4+QvlUs6+tQ6wWSLlq
        gmHa/jvhnQAHKY6LzaxMMnN3FQ==
X-Google-Smtp-Source: AKy350YKmDxrUkZCYDWW3/RcuEzrMmBDH1zTRoX2kHjwHiAHKi9ulZM5d4yb8N1LUp7EwADLpgbt2w==
X-Received: by 2002:adf:dbc5:0:b0:2d7:998c:5ad9 with SMTP id e5-20020adfdbc5000000b002d7998c5ad9mr2530229wrj.8.1679673796641;
        Fri, 24 Mar 2023 09:03:16 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9-20020adffa09000000b002c70d97af78sm18781475wrr.85.2023.03.24.09.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 09:03:16 -0700 (PDT)
Message-ID: <51c38884-fbbf-ae5e-781d-e32605f7ef5b@linaro.org>
Date:   Fri, 24 Mar 2023 16:03:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo> <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
 <ZBzyK0ILtUDr986r@Gentoo> <37d14447-0f10-be88-9cd9-8ebd30f1d006@linaro.org>
 <ZBz5OvauxQ2PWcHu@Gentoo> <40503ba8-7a38-0d1d-1d59-82101a0ce92e@linaro.org>
 <ZB14jJNUhHGBl7Az@Gentoo> <6bd08120-115e-5429-63da-32f8df52bc7f@linaro.org>
 <ZB29J/7LI4PREmn6@Gentoo>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZB29J/7LI4PREmn6@Gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 15:09, Jianhua Lu wrote:
> I get schematics of same vendor's similar device, it shows usb vbus is
> connected to charger pump. It can be the main reason that can't detect vbus, but
> I don't know why type-c can work normally.

oki doki that all makes sense - the "charger pump" is supplying vbus 
most likely - you can confirm or invalidate this theory by connecting a 
1.0/2.0 device to your external hub - making sure it is unpowered.

vbus *should* flow through the Type-C port into your external hub and 
into the 1.0/2.0 device, irrespective of vcon

Either way that's a 2x input on the VSafe5 - I'll downgrade this to a 
dev_warn() or perhaps even a dev_dbg()

thx

---
bod
