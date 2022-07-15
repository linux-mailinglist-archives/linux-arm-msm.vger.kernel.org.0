Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A42575D0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 10:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbiGOIJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 04:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbiGOIJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 04:09:10 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1363C1B78E
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 01:09:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so6636254lfn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sh3qQBxtVm59D6pY3ArLd+5CvRyF7NNiw6/39bUzBx8=;
        b=gyU9gzj7ZHkjH/AnPb/OntuoNCVNCIacmF6qdlH26K/ifCqtKbMvZrdW7mLSTr/dtk
         dbGQVhQ0w2+lGU5Yhn8gG8qK2MecFyPsn03MlWvephuzhL817A+46HSj6ceRIenZ2Fbn
         930LsjV/2DUW3djOZFGFHWWHqq51abLDaMRyFJWvHhi1+xPbtHytH7sCdKy94opWVQaK
         AaWQ4mIfiLgLejIIr1ylLvtbi7O6gO8BsfDz5fi7xqKiDKAbNcNkuoQ+BRAAnKVDJBh3
         YtZnTCbE5LgbVDSUU7jTnn6L86L0Jpnmbt9blnyG5+mICLfBQnZzKrlvh17OFAQAfRYi
         GoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sh3qQBxtVm59D6pY3ArLd+5CvRyF7NNiw6/39bUzBx8=;
        b=l0neIkF1lGPfIwEyodJcqOKa2VI6vQKFEaY9uiiN3X/ggbIpr44jSAFfWnGoyigAbu
         lTvmHNz8L7DIe1fk5pqEtX11yb6aVE7/gOumF1UEmGJGVFReR0iY0nQNdn6T2Vz7E2J3
         H66R5XjTEcznt/9ICkOVbnVcN+FMprsc53aZ62qSgrmnS72nKh1nN/2ASZiXucaMiagI
         +vudo50xXLjC15gWeTCYuPBF7/hbeLIxeGUUHOZMgd6P2SjSiaGEn62kvXx4piz4J5J4
         1WNHOwU8Hs6KgfERZw3m631u4DZkXnhixgqYfkdRUc9+f1abTWzyLsIf5zJ3aOosUfkN
         R/IQ==
X-Gm-Message-State: AJIora93vN09EKQpXK6pAUHIY54eNlS4fnsh37CBTeG8zitGK74dPhND
        t3lSmFuoPyyTO94G1/wvnTHUrQ==
X-Google-Smtp-Source: AGRyM1v2eu52JxiG7w2sijEsdgrXupqb3zrV62/uR306AkJIKmlXe3z8Jfg9np4Mel3+xiPzTI+2eQ==
X-Received: by 2002:a05:6512:15a0:b0:489:d008:c0a2 with SMTP id bp32-20020a05651215a000b00489d008c0a2mr7847182lfb.231.1657872547466;
        Fri, 15 Jul 2022 01:09:07 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id x37-20020a0565123fa500b0047255d2117bsm777118lfa.170.2022.07.15.01.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 01:09:07 -0700 (PDT)
Message-ID: <c66a3d29-695a-1d50-b3ce-8b9741dce073@linaro.org>
Date:   Fri, 15 Jul 2022 10:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to
 schema
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
 <434cbf73-c62d-7d5c-fe60-7d98a84bc7fe@linaro.org>
 <YtBlGJ+lQFQg+l+I@gerhold.net>
 <cd8a2b66-ba7c-768c-f5b0-2728f0a8be99@linaro.org>
 <YtEeay9JCaG2NMdT@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YtEeay9JCaG2NMdT@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/07/2022 10:00, Stephan Gerhold wrote:
>>
> 
> Sorry, I'm not sure I understand you correctly: What do you mean with
> "the previous bindings were not mentioning it alone"? "qcom,q6v5-pil"
> was listed as standalone compatible just like all the other compatibles:
> 
> - compatible:
> 	Usage: required
> 	Value type: <string>
> 	Definition: must be one of:
> 		    "qcom,q6v5-pil",         <----

You're right, sorry for confusion.


Best regards,
Krzysztof
