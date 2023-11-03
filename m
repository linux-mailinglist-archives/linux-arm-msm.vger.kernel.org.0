Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B6C7E0790
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 18:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjKCRhs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 13:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjKCRhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 13:37:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11F7D69
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 10:37:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50949b7d7ffso2918252e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 10:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699033058; x=1699637858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iErKMUq/w2g3T5+M5gnt0liiIvc0hs2MFqhSqX6INvE=;
        b=uxDB9BV5yLu9Km6NhZDe12RVR1HHqGuNsgqKENxK6LD+0NQ9JB+BTKOEAMgLQWogDa
         yv6WUesYSg4mNQWJ9BdSehGeRe5nx4OmP2ITDk1pZ8FEm8I2uCiZZ2yUMl49PvbrgEOm
         DZ+kfS+/8p/+TrCtzFr7F9/lMkHO8nuA6I8/NAGRXX+PTnsizWoHwo8ZGl4SophnsG1t
         F0x4rNBPP/A9VMb6PYUwovq8gFClwh7YH2PM1hdoaNoiKcCOMvHEbq4GhtZFr786EbxE
         33bE6xFdYiVyyYecJKVV9j+hmxKo5ZioZA56szCgA+uPUVUxPnud0h6N2t5QIgXfeXYG
         YPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699033058; x=1699637858;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iErKMUq/w2g3T5+M5gnt0liiIvc0hs2MFqhSqX6INvE=;
        b=Iw8h26oQF/UOXqcuAoqMJg/7b4943pp0tuU5Qg6POodEbIJDB9GtrBF1czpnlUfKd0
         lkxRlWhHpYBeBpmgoOAvc0LZbRLBndXaiDvd3t5uOqrTj4D2V4ukAu04mldlOqK51b5H
         mBv9A/te3pWQPwyrIkEMfmqGGgsYFnmKAr/eRBEto7CNlL1nLfj7cck3NgIBRmrCM7ge
         +B5hPLE2zbGAYaG+X+sWHTxKYR0LLw7H+h261KX2a3Igi46nezXt7b/f8xm80cUviOdl
         P5+SMR4T8GU/Y6SE0g744Yoas1+s9ZP5/4GsbSPEQrVfgYl7ILxWeD5Oe7u+6QuUIjnI
         9FdA==
X-Gm-Message-State: AOJu0Yw7GppxnGtaPPh6olvxhW4sLe8LkLobKpOqf0I2o0wRmzoR+iyn
        xrOsPTudCZiSGtht+pXWGIhe16i1dxVz2hFTS8/Kzg==
X-Google-Smtp-Source: AGHT+IGSJh29QOQBPZXqHgSWp8LEm7FpMzUj77QtzgwdQHOt3ySaOe0cVY0O+af0pkIR5uJYNBCeQA==
X-Received: by 2002:a05:6512:1388:b0:508:26b6:bc21 with SMTP id fc8-20020a056512138800b0050826b6bc21mr18739124lfb.40.1699033057753;
        Fri, 03 Nov 2023 10:37:37 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p29-20020a05600c1d9d00b0040772934b12sm3300391wms.7.2023.11.03.10.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 10:37:37 -0700 (PDT)
Message-ID: <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
Date:   Fri, 3 Nov 2023 17:37:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: External display on the x13s?
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZUUrMm1Q/PI5xv6a@brian-x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/11/2023 17:17, Brian Masney wrote:
> I have Fedora 39 running on my x13s (with some minor tweaks to the grub
> BLS boot entry) and it has working GPU, sound, battery status, etc. I
> see the external display port in the DTS, however it's not working for
> me. I have pd-mapper and qrtr installed. Does anyone have any
> suggestions for enabling that? dmesg doesn't give any useful
> information.
> 
> Brian
> 

Run gnome and run the display @ < 2k

---
bod
