Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97AE06E8EE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbjDTKFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbjDTKFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:05:32 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B42A3A8E
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:05:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4edb93139ddso435970e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985112; x=1684577112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RJXgo9mbZocth7W+W/DHGi5VI0a91D1/aaXffY9umQ=;
        b=lqclOq7xlrh4i4oA0IR5rQP1xWRPVMmSK35utJZQag/nwUvQGNv6FiEPXi+2jROtAt
         7lPtJwxfypHnbq18+ge0VMtkmmMjBfOJ710f6BF2zNhq9xMB5kZc04aShJyf/ZU92qgF
         bWaxly6/XjxNzqmxDrlb1vcFfBZZKLblurYJ2BglxXkP20VGGOVs9vcZ+SzfJOUSuDUr
         maRUNdq2FBC5lJxWzZyRNPBlNUa/qaK6vsnz7QG4TGTD2b+y58v8n0ZDILRjbVc/Ms0r
         /8p5nNrcEeSaXQya0jGVsIyfdizF1Sto3MEohQp5IgPON2PIypCcUNryED+QDBpZZB6F
         7v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985112; x=1684577112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RJXgo9mbZocth7W+W/DHGi5VI0a91D1/aaXffY9umQ=;
        b=UvTO+0Q7aGUBUVTnh9Ifnidb2Ije58EwLyTyAf0uTu2dIEDoevji7Dk4PmYQEcjq3F
         +AdDmE8+G0bFFG+zszhR/Lq7B0mmmZ4xdQHlm3vJFIPx72LN2SaVatL8k3qliu8LyNj2
         P4RfGM8Na8d1fjcbkwwjNNcRRshuxxvdRH2T2JzykPgBpLYStkhFqls2LaDL1vypwWe0
         x35rylnwODh/lf0+uzdzliYK+WqVMen5qHRQNnmkMizU/C0hO6anNsQehQdrnT2R+nOu
         DyrToR6CTA632FzI/bZ3C2nZwz9ITVv3zynuRm5YIol9F6wTRYNegQpjMfzJc0WO/aGB
         d1fA==
X-Gm-Message-State: AAQBX9eJNu6JZXRgqhux6aBya9gIP//Ei1ANgPdoZkkOjzuEtjDhS0KK
        gqka7D6fl+cOQMObb5aFMwCe/g==
X-Google-Smtp-Source: AKy350a39HBh7R9jgbfr/UIn1pZgwf56M1oanLrDl7HkbyiiLwbA6+p08jkzA66//nGGXiIVdLaZhg==
X-Received: by 2002:a19:c508:0:b0:4db:4530:2b2d with SMTP id w8-20020a19c508000000b004db45302b2dmr273139lfe.49.1681985112150;
        Thu, 20 Apr 2023 03:05:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r24-20020a2e9958000000b002a7af83ca1csm182840ljj.21.2023.04.20.03.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:05:11 -0700 (PDT)
Message-ID: <aa547a69-e1d8-1349-bd8c-9265275bb7f1@linaro.org>
Date:   Thu, 20 Apr 2023 13:05:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/4] clk: qcom: rpmh: Add RPMH clocks support for SDX75
Content-Language: en-GB
To:     Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     quic_skakitap@quicinc.com, Imran Shaik <quic_imrashai@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohiagar@quicinc.com, netdev@vger.kernel.org
References: <20230419133013.2563-1-quic_tdas@quicinc.com>
 <20230419133013.2563-4-quic_tdas@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419133013.2563-4-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2023 16:30, Taniya Das wrote:
> From: Imran Shaik <quic_imrashai@quicinc.com>
> 
> Add support for RPMH clocks for SDX75 platform.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

