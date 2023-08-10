Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89DE777C27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236113AbjHJP1o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 11:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbjHJP1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 11:27:43 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574F426B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 08:27:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so9249145e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691681262; x=1692286062;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ab5XjXMrLMf6LEqqqdrujtFLjlUS/mjFj+sFiq7n94I=;
        b=YmfJ79QBAcJsDXL9tH2gXu8kzw09ThG3Q3Lvwah0J8/H8rXEVv90r0vgEE89q9HCGy
         RGVagtCqIGjYZEbXAHjLxeflMDp6skizdITnuPvwAgIpmVXEI60uCJ8GUY8seiN2o+h7
         nmWsBO0UC09VQkBqbc7NqNgixxhlx8hBTe7++GuBlgFHfVjg06LrlMMeQzLXl5Me/xQn
         ZhSS1XbkepQxyuESSIsyY7EhkCOQq1Nt48My1irkEl/qbhRxd/p+ykieQT00fQIJbaEG
         N75CfHVKYH8sSs5PXf/uYnSmvM1OLWaIsHaR/AYa8I4Q1P9ZEgGbU631NQRhWGeTT+Gq
         JPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691681262; x=1692286062;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ab5XjXMrLMf6LEqqqdrujtFLjlUS/mjFj+sFiq7n94I=;
        b=Tju1j09kiqSzHqLg/Rn37xOg1MFHuRi5rRxXiXkmxQLzpq4++k/A34DGGXjb0L28mU
         gvHiIBYKTWsgGTc2ILZuqUyEkkhMJG60mKHy7mky45weecWB8IO4gnS+jzdCl8XiR7ru
         IP623QUWb8Xl1KCcKQZ8PDN6MeUu4fy0QcKi7cFWkvyxjtsawylr9HsX5+UsRiGrU4IC
         56w1LmsEhwc08pYyfJxoqJMV6qhBbDlo8zfsRwq/V6PceqQtICsDJ6NlMRF9a1yO+GQL
         cgAreDCWod1CAsLxtCHk2g+ZKi8lXmbZ8JEJANxeU4FNr2TV6RIfb4WbBQqqDterEbnn
         kNNw==
X-Gm-Message-State: AOJu0Yzd2zJR28lbYtK0nBbkFzjwYZH4IjeKvpo+ftOlfTouMuVWVhv9
        aj0juN4Y9AdvJsxXM8FlEmC9IQ==
X-Google-Smtp-Source: AGHT+IGJTs9iCT+ZKzq9qboSSVelpmldObteUz4SoY7k3uQ1SHUelg98UZCy7PnfjLqmvuu5Iw9i3w==
X-Received: by 2002:a7b:c7cc:0:b0:3fb:b3aa:1c8a with SMTP id z12-20020a7bc7cc000000b003fbb3aa1c8amr2264904wmk.16.1691681261773;
        Thu, 10 Aug 2023 08:27:41 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id fk3-20020a05600c0cc300b003fc05b89e5bsm2474249wmb.34.2023.08.10.08.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 08:27:41 -0700 (PDT)
Message-ID: <2fa7e5d8-1aa5-0a07-7533-c54cc55de66d@linaro.org>
Date:   Thu, 10 Aug 2023 16:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: apq8016-sbc-d3-camera-mezzanine:
 Move default ov5640 to a standalone dts
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
 <20230809202343.1098425-6-bryan.odonoghue@linaro.org>
 <ZNT9nLaSBZvm1HNe@gerhold.net>
 <d839ef44-3427-88b8-513e-a84b24cc6929@linaro.org>
In-Reply-To: <d839ef44-3427-88b8-513e-a84b24cc6929@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 16:26, Bryan O'Donoghue wrote:
> probably good in LK

lk2nd obvs !
