Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DB37BFE94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 15:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbjJJN5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 09:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjJJN5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 09:57:01 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15262C4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 06:57:00 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40566f8a093so52541815e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1696946218; x=1697551018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYWciwUfzF59aHppIFLCZXbAD7SKQWPGWbHHZOCCLvs=;
        b=wfN99QRgDjjm2iGMpo3oWU9i3lUsAAhm/YBsddPpXjMWfLu0kCIfJqToljQSsvj58z
         QK5eQ+FrojKspVLIv7zv5egDon7dfv5FGNCdECC+Nohtu6Tniwy2kDR3JSgldruhNbnN
         C2oUE8JK0UxkNetAyEax4/wlysI72nvcEqJlMZ02wZ1W3gyeNkfDoKgT7khWuQUsk4XO
         YSWIQkvC+Z1m95g+fNgqn2TdHzC+kKD5sgm8rAYRBmWvOejaSmfg3gx4g6fT9G1Hmn91
         zKFTsiYMsnbU9NyTaGbLbl/DjQiFtcHcxjHCc+N7cxJGGYff4IlUYq5v69LD0iOpJbn5
         nleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696946218; x=1697551018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYWciwUfzF59aHppIFLCZXbAD7SKQWPGWbHHZOCCLvs=;
        b=RdyK2aRsAhH7NqkdUSgnMlA85e92loojXkJnm6yekBvDIy98uzBqQ+p4AJ4FGgi64y
         12/E1b4HFtjLoY+wEyzC1pimSav3bKsAcIodECnr9984CzlFGGcDkBZXtEBUwO2O6lhm
         v++QfJuV3Q1S0yybWzQ9un0wJEes6oKFUBWS2zKqkd0BX3U9cVttRyolKhVFumOYl3b5
         2w+3uNV9MZLKS8qBsJfj3c7eQQP8EFbn0h60BtPdPVVHxXYXvRf+MmK0tL6hCjVMviRj
         uLDMmyLSjTGhUbj+ute21P5VHa2V3HwHAO5bSOhZRA4+kcIwpgpOIB4T//BQCfbw7P7r
         ct8Q==
X-Gm-Message-State: AOJu0YzwUNCaqlysY0QHara2nbgJUaH/DA4zltbsusDGA8DTVZdErK3B
        90fYKWKzit0TA5Qhh16BlpWIPA==
X-Google-Smtp-Source: AGHT+IE+vnxzSyo9AaWe7ZgaXykbBDq6JHcYIoNKc0hMWYtSIGkzVrq3qNRcxiIk6PFrwBLg+2Ku8g==
X-Received: by 2002:a05:600c:3781:b0:405:1bfb:ff14 with SMTP id o1-20020a05600c378100b004051bfbff14mr15183186wmr.9.1696946218169;
        Tue, 10 Oct 2023 06:56:58 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n26-20020a05600c3b9a00b004068def185asm14420554wms.28.2023.10.10.06.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 06:56:57 -0700 (PDT)
Message-ID: <04374506-023d-4680-9f0f-77d6893288c4@nexus-software.ie>
Date:   Tue, 10 Oct 2023 14:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     konrad.dybcio@linaro.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, jonathan@marek.ca, andersson@kernel.org,
        quic_tdas@quicinc.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        mturquette@baylibre.com
References: <20231010122539.1768825-1-bryan.odonoghue@linaro.org>
 <20231010122539.1768825-3-bryan.odonoghue@linaro.org>
 <169694433325.625737.10533845261157845416.robh@kernel.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <169694433325.625737.10533845261157845416.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/10/2023 14:25, Rob Herring wrote:
> 
> On Tue, 10 Oct 2023 13:25:38 +0100, Bryan O'Donoghue wrote:
>> Add bindings for qcom,sc8280xp-camss in order to support the camera
>> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/media/qcom,sc8280xp-camss.yaml   | 582 ++++++++++++++++++
>>   1 file changed, 582 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,sc8280xp-camcc.h: No such file or directory
>     26 |         #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I guess I should be embedding this


This patch depends-on:
https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T/

or


This patch depends-on:
https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T/#mc33be3fef01bffe892f72bd5e567dba6a047283b

below the "---" in this patch directly, instead of in the series 
description ?

---
bod
