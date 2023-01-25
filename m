Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F0067A8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 03:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAYC0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 21:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjAYC0G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 21:26:06 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2454ED12
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 18:26:01 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h12so11666037wrv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 18:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDkgofpVSTrduh9JZpePudAi0cWFw54YhiJOrE28ams=;
        b=J+T3BdDjwUzfRnorjggHKD04zWXY71zSH1qMw9r6mFhLV2CPK06ThyAZNk8JZe9xNY
         J437E+MRQlBLq621/bXenN+6Wc9Tz/JI8r2bWuy5G9C3qoJnSdi9bABD4Hx/BBRqSuhs
         IN9ZUGZhh+wIy164vRSfBxaDywDtm3S3fRhQ8mPIuiCBQRhCqD96R1WB46uwttAc5C4/
         ELvSbIBhPOqwIqy9cBJIQp7cImXWip9WplXBRR6Y9skCxDMZ9HhgtcpMZ7+mvO3WMsgu
         teS7wvnGCy3IEyOLDdeZaoZWdKOiHWll2i4UctluTEDkaPK0MtDemRfFzEC2yWfpbBMX
         Zb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDkgofpVSTrduh9JZpePudAi0cWFw54YhiJOrE28ams=;
        b=Pa4i2QHX4Z132zhr2uiG5zRIDUcOJ2qSTXlcrbSg1QnqeWJMbQD9pzhrn/jY7yCDjz
         rUrAU8Mg4eZ45NW76Z2GPtFtfarP673qXIz+maVh+TntePsaUwMEQB/mkm5RLcz3gufp
         pKHkcgj8HcZIl+O0D9F9eNNOamIzkPy6DqTYdfVsBxrPdI7AXZwHSjTLPsoRSZn8joWa
         y8z0KBmZ+f+eyOUW2+TK2e2he5ASzE/yI8nNfJE/BPu9mpSYh2DG9RnRSiNL3y0+PnZe
         gnMoTPyQXP0+fYJ4hzySjEut62dg4715sWYYTMdhx09bvNNMUjrIpAakf/I93qU23IlY
         4XTQ==
X-Gm-Message-State: AFqh2kqBs8m3+hQ9NFWW3CbrTxlkcpwL01LgIPdAElsCzEKTb2/Fz7M4
        Bct1sjAMDkXWSj5qqpFwymUoaQ==
X-Google-Smtp-Source: AMrXdXuCXLr9z9ZIgyHfVWfYvchwPjYSxoud0SEbv+jp/l8pX3kxCpHxkxKhePf9bapYR6kuKXxKOQ==
X-Received: by 2002:adf:d0c3:0:b0:2bd:e5cb:e7df with SMTP id z3-20020adfd0c3000000b002bde5cbe7dfmr21216144wrh.32.1674613559871;
        Tue, 24 Jan 2023 18:25:59 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q2-20020adfea02000000b002bfae6b17d2sm2977230wrm.55.2023.01.24.18.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 18:25:59 -0800 (PST)
Message-ID: <326ad224-479b-6081-612a-19179a3b0b2e@linaro.org>
Date:   Wed, 25 Jan 2023 02:25:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add Square apq8039-t2 board
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, djakov@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org,
        stephan@gerhold.net, Jun Nie <jun.nie@linaro.org>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Max Chen <mchen@squareup.com>, Zac Crosby <zac@squareup.com>
References: <20230123023127.1186619-1-bryan.odonoghue@linaro.org>
 <20230123023127.1186619-6-bryan.odonoghue@linaro.org>
 <e80b98bc-54e8-f7ab-b9a9-dd888108a0cd@linaro.org>
 <8dd1ce3c-82ea-cfc3-a84c-c022cbaec8a0@linaro.org>
 <0597e178-d563-0afc-a998-ca7c54ee56b5@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0597e178-d563-0afc-a998-ca7c54ee56b5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2023 01:29, Konrad Dybcio wrote:
> label: name@unitaddress

yeah I decided on "typec_pd: usb-pd@"

