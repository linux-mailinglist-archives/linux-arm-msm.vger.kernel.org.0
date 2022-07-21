Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066DF57D177
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 18:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiGUQ1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 12:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233244AbiGUQ1N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 12:27:13 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41A588F2A
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:27:11 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u14so2472276lju.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FLbfIeGPl3ebIvxR+FhS5IYK8eJ7yeE22mxLZOIlFUU=;
        b=U6l6aOANx5uddaMQey1eQns8gozs/zKGcQWTos2MIO4pITPQ1baZHsi6NUB3LNg6ee
         CcQVWsRIigCmsDLxbY36TN8T8wZpgW/mf5OPjWI6ImfUHbkfDtIWZMCHCyjtEeA+lNCn
         ngGQ/OGK6rhHfhrSi+7Wkdg8ZZXKmFQtzq+m1C0rM/v3UjGfdGKWGnzFXhGL2oLTaYqx
         9jmAnc/3pAnOi8B43V04m8RMFvePKLh8hP848f2h2PfZOqwGRQvVfyMyzxOpYJR3XZZI
         4npKo+DmibiH6KyD19juFqkIb8G3+4ly6O7/gX0/4WvFT5tGWiimYw9mFyJN0liaFEI7
         fxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FLbfIeGPl3ebIvxR+FhS5IYK8eJ7yeE22mxLZOIlFUU=;
        b=Z3T9452WuWo2aJk5ozE/onR/R/QzZaoywrS2ZZmEIYE2w2foV8CyiIjGNAAyNaB+SD
         TrZwJF9aUJ+u3RblcyWUuzhJqYnzpiTPnDFTeDC5PfUXx8DdrlE2kgnLzS80OKh8gElh
         Ofu25n5b1KmYOhAv1EySRfiZqlRR/VNU8ZkQdpC3UWZdU1sqlr10cAHk9/Qr62PEiyeX
         l4PhlZGZUVDz14UYsAQ3E7sX6jHtNJakNFpSdZiDN8L7SuZLlVt0XDn/2yTe9Cq7dxGm
         ieCKY3Sus8olFqNMehbJxPacMMbeLf2vCS9V0lfpcolFUlJkd0BWCCGqwIr0IFWXX1/v
         Vjpw==
X-Gm-Message-State: AJIora92EhcgpVbiOEsRhrMFbeFD+RgxZIdzhAPjJg2Ai0kv4CdVXSSO
        oSowDTuMsLLRjF212MeuVuc5Gg==
X-Google-Smtp-Source: AGRyM1vh5UhRH2Jeh1nka+6MLdlCVT81CpwzvziFjK0WNqKXr+aUHvh6UKvkd7bDG4LBmQffiNbWsA==
X-Received: by 2002:a05:651c:385:b0:25d:d821:e0e with SMTP id e5-20020a05651c038500b0025dd8210e0emr3256866ljp.56.1658420829932;
        Thu, 21 Jul 2022 09:27:09 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id e26-20020a19691a000000b00489da512f5asm532641lfc.86.2022.07.21.09.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:27:09 -0700 (PDT)
Message-ID: <e75f1cec-f1ab-7f3f-720c-afa6aa2af611@linaro.org>
Date:   Thu, 21 Jul 2022 18:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom: Document additional sa8540p
 device
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220721154413.15578-1-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721154413.15578-1-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/2022 17:44, Parikshit Pareek wrote:
> Add the ADP ride device to the valid device compatibles found on the
> sa8540p platform.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
