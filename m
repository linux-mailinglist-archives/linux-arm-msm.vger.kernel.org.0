Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9568067C965
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 12:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236622AbjAZLFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 06:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236057AbjAZLFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 06:05:53 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA1A29167
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 03:05:51 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so3005999wml.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=heZJw59T2BEIPcQJQ4uYDF/GEiW8kKbaj33CVJ4j0QA=;
        b=OGHW+YWFhgFliomeTrCvXab/b3ztik8IkLjKZrHCJPgZPJEHLNFlEWIsIs9obDB+4h
         qooeXwfrAccrxy0oVyS43oDAfvwjg5eahrRVHlcm7WR0QZbpNObdzPwi5N7RpzC+Paiz
         ugeJJDCKAZJqHcK3WSht20960TThpI74MvA6Z3juB0fb486A3gR9ExR6iubOwTz78VEw
         jaz/by3NaHMxtuEeCqFtviLmWEJzRXqnbGA5JnOcgT23kYEuwVpHufJyBVgeYd8nT+aL
         m7SSJ9cD6ig3rrZ7yUyf56wiBn5j53eVA9AHiwoReUR2qhTJUacNEGIpqgtOW7MMzMuQ
         SI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heZJw59T2BEIPcQJQ4uYDF/GEiW8kKbaj33CVJ4j0QA=;
        b=YEkZEZLH8aFCeknvN3lyBliV1i9Shi113SuMTYqRhNojHLDqxdH2u+AgsBBUUykTgF
         bLq9XJwlwIx6boEMVFTNm1NC5cLSpBc3oNUtHw8jMJRjisbQQ9XIGvGIwge3t2T+RCa4
         MvVonYHrtaatpqNChIDO+jRpK6lAdqZsCOY/dUlTgZ+VawPTM/AOT5Qm0Bwb6ZBLqKs2
         MFlqE69i1bp/+1YUpT7eMIKWnpURTR108cxNhLkyc0ta5dcGCSvLkK5PYKp3w2D4Va8k
         x71h1VjntvPHijtQgFeykI93yqDqJMe+MeK+v21btCyrSIUvqrH0VjJjRKekhS1JSHNk
         1EKA==
X-Gm-Message-State: AFqh2krtVGTctey68NWuCIet6zEu+IO8fENNhcj6ki+NXIXoj5Ak5R3B
        B3f8vKrYk3Tbqh0/wq3sdcVX+g==
X-Google-Smtp-Source: AMrXdXvm+/munbFIM9dMJkjNlLF8RunOzyerbBIAKGs4KuqxNnxcHriBwiL0Tytcq9WgMoOagu8Dag==
X-Received: by 2002:a05:600c:304a:b0:3d9:8635:a916 with SMTP id n10-20020a05600c304a00b003d98635a916mr36734444wmh.9.1674731149736;
        Thu, 26 Jan 2023 03:05:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b003a3442f1229sm5016139wmq.29.2023.01.26.03.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 03:05:49 -0800 (PST)
Message-ID: <64c5cd0d-86ef-2b98-36f4-62106edd657a@linaro.org>
Date:   Thu, 26 Jan 2023 12:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 09/12] dt-bindings: PCI: qcom: Add SM8550 compatible
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
References: <20230124124714.3087948-1-abel.vesa@linaro.org>
 <20230124124714.3087948-10-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124124714.3087948-10-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/01/2023 13:47, Abel Vesa wrote:
> Add the SM8550 platform to the binding.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

