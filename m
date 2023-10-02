Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5437B4ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 11:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjJBJPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 05:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236002AbjJBJPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:15:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C41BA4
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:15:43 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5041335fb9cso24958414e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238142; x=1696842942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKFgAZi/L0N2kp9XV6Gn5/hvFVeYhucp7Px8g6ewoQo=;
        b=fNGkKexhuzgLEeVpkFKN8w0ybe47T9Jsz8vWB1GNOkG0zW3Cb/a+oTk9uGbY9C09rx
         2qzZxWIg2JDpJy0+S9h6DKUcpIb3whVQBl70/qVodKP5NE/X6TLSLYeQVgwW+TCIzwBm
         NKXw+A9yUtONRBG3pa9SvqF4DzWxxMBVjSddaAHS/5jeXzge1XdHIopORf2g8AN5PiUo
         9oTZyP8oqjSY1kvOlMgHBPGdLZ+iyJeE60wkYik+PVfZ+PJYqWaWgmnZbFqLgy+bK/Zb
         iQabvdG1MUx2Bj7LGS/bKfRKX3uDj988zHonbqn4z3g1hZc26D10FXAQPD9JAuoRhCSw
         bEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238142; x=1696842942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKFgAZi/L0N2kp9XV6Gn5/hvFVeYhucp7Px8g6ewoQo=;
        b=fIxI65AWtsAn/gJ7Z0Z5HqDeqKS54CCclurDqL0dw9zoK91pjRT+vszvyFZMSuycHV
         Q2WwrAm2PntX+F0lDADrDboBX3Xzn99yXYlwir/NbBMaujiUZn2v73BvHSnJzQS06CHw
         t97TpI0ky1kdwylh+bAE83eGO5XEktLRd9ZONwmXtqjmrTheDJiW7ddoun8q1Y69AKhx
         S0ewzkZYxsphjxnUoHcOZZLUBPUlbP+Lq4booR/DiGSZHXm3gl2A6JZmp0dJ/sj4edi/
         l/fWf/BvfklXz1b1WftJKXAAJDk0jBJzcY/BpYdzjyuYdjJmhlc8nFNU0TzdO9KPAGqF
         CFVA==
X-Gm-Message-State: AOJu0Yx0dJCto5eUMVMMZZ+qzWgWfqVLZJ3l9KDGdjqCA6fLi6SZbRza
        VM2we0ahlN+dtHozr4jawV8v5g==
X-Google-Smtp-Source: AGHT+IGa14XP+UqD8pYmtIu92W58oS/MZa2G9p8QeeBfIWcQQPykrUqAviYI11e1nL5dRWwmQFPPGQ==
X-Received: by 2002:ac2:5453:0:b0:4fe:8c4:44fb with SMTP id d19-20020ac25453000000b004fe08c444fbmr9238541lfn.38.1696238141849;
        Mon, 02 Oct 2023 02:15:41 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w21-20020ac24435000000b0050307304a80sm4674723lfl.205.2023.10.02.02.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:15:41 -0700 (PDT)
Message-ID: <5864a318-f45f-49c7-0680-de50fa2b9f31@linaro.org>
Date:   Mon, 2 Oct 2023 11:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: enable flash LED
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
 <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/1/23 19:19, Caleb Connolly wrote:
> Both the 6 and 6T feature a dual tone flash, enable it.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
