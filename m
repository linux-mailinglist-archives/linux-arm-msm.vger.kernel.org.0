Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627B172B567
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 04:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjFLCZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 22:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbjFLCZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 22:25:53 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7C8E4A
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 19:25:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30fb7be435dso661247f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 19:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686536744; x=1689128744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZKG0ffrkcy1xii/drViWf4QWyfzui60KGk55lhMEuw=;
        b=AYXs+BNS/C3jqjKVjMdVPoFBYjntnN4UTZ+btsasdNT1GNiuLtA7tJKG3Qcj5UCSOd
         u6+vaNskESi7SG1rL0LF0yiLoSpTj4VSn0dxFw2VX4ZgJBe8Tx7iTEC0JquXZZesQ9j6
         nbVkduqTVANFu3t8PHaAN+RUsWnMWEMlzF2OcnY9gW+RXkqOhEFLKqKCwusxFq2UlO6O
         z5TAc2031fIgsLnPMBbT4V46ODxRXQKYAca1/WEdiTb98qzX3t/mvsuQUCyoIflOBcjS
         A2hN2RWCAF8xeMExRmeHINcOjVWzGZ4vhTeA9zT6lmB4dS6W8mQE5JUKc7Yny/ZF+n5Y
         YerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686536744; x=1689128744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZKG0ffrkcy1xii/drViWf4QWyfzui60KGk55lhMEuw=;
        b=b8UPA5t69W48RR5sYvDertLk5/SBlTAdkK34/5mI0DCuXbD3pMLrxMefHjuw/u8I7A
         EbvzkOsOeoL0JnKG2Z3eEMKGlwxmY3RXRBpI++ZDwZu1itZKsAf+TDfOzE6llfLasAd3
         R/FCpVmbimDGk445NXUINm3K97/JVqntORX9zqQaqdlMsej+6/A4ESb8YkglJqHFhgiR
         8GHtYRUKepzWTkDCYhpZ2a+MKeL3BELBUCwz2O7jQnFg9KyO8aCbMcDxCjVJR+N/d5s+
         r0MpjqXVrgwchbtdfSKBo7J/rbNfqH76hySZJBIu0yVVdxnCnvQ1MhhCvVE5y7tx4+0u
         dzjA==
X-Gm-Message-State: AC+VfDyV+nW3VNQgnPs5q8K0/TRQj5cdzr5jFjmI8xzg+/v04A6cs1Xb
        DI6GrVdSp/z3mKHdIiAM68Lnow==
X-Google-Smtp-Source: ACHHUZ7Mo0TD6O9mkw5mKyecmLn6CRnZGtRiAqjqHg5t5KHVLq7hJN0qZ1A4oqj02qkAEndI2fWRZQ==
X-Received: by 2002:a05:6000:191:b0:30a:ceb3:26bd with SMTP id p17-20020a056000019100b0030aceb326bdmr2854711wrx.56.1686536744219;
        Sun, 11 Jun 2023 19:25:44 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d4349000000b003079c402762sm10934057wrr.19.2023.06.11.19.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 19:25:43 -0700 (PDT)
Message-ID: <09ccfa54-5ada-8dff-03a2-b2ffb07a58c1@linaro.org>
Date:   Mon, 12 Jun 2023 03:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V4 0/4] Add camera clock controller support for SM8550
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230609115058.9059-1-quic_jkona@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230609115058.9059-1-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2023 12:50, Jagadeesh Kona wrote:
> Add bindings, driver and devicetree node for camera clock controller on
> SM8550.

This is very confusing.

Your cover letter doesn't detail any changes and your individual patches 
all say "no changes since v3", "no changes since v2"

If this is a RESEND then mark it as a RESEND.

Good practice is to for example add a note that says

"I looked at updating the yaml for the camcc but opted to do this in 
another series" or "opted not to do this at this time" or "it doesn't 
make sense because of X"

https://lore.kernel.org/linux-arm-msm/546876ba-970d-5cd5-648e-723698ca74fd@linaro.org/

Could you perhaps RESEND this V4 with a log that explains what has 
changed from one version to the next.

If nothing has changed then don't bump the version prefix with RESEND..

Second thought even replying to your cover email with the changelog 
would do.....

---
bod
