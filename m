Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D82781818
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Aug 2023 09:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344364AbjHSHpd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Aug 2023 03:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344403AbjHSHpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Aug 2023 03:45:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86391713
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Aug 2023 00:45:12 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99de884ad25so213585566b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Aug 2023 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692431111; x=1693035911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYxJHRkfz5+E7C/DgQtipVS7sPzq8usuIEMiG66wgWA=;
        b=Z76wT0UlYmYwypK8d0yXNx14meVAJawQSYz0sz3zjQB77X2ELCAotD1bGWZ/gu71xY
         FfEnulmEL9kNtN3lRB+JDAM3JLuc1ZQihAgFvLhe+MsafkjUQWkZD0+tGVRtFLV7/DG/
         TDOdfLOb930E6EWwuSyiwc8CIzatjkybKfh0HCBMKbPgWbuau2arlKFk3ACtShubUwwz
         4rugrL3N/BQM3H9aPIw0QEvbPWtBnWWLcaHS+q0w6osdIP2W1JSWOPnHT9fuomat536w
         AT+fDm4DiVUuG+A2/ynIAsDh0acQjBCUkLarC8KCT6AuUzXXyPpSWgQIgp54qVFx+T7X
         kAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692431111; x=1693035911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYxJHRkfz5+E7C/DgQtipVS7sPzq8usuIEMiG66wgWA=;
        b=fHVAztP3zJgoh9ecCSniI8s5J3OhSG+Ul2AG0z1agt0DHBsrLWWtBlS5AGNCafDS3/
         iHVUA7G1yWJwOtoCmGnRET7Gt7jc2bY3pO6w7fOOnX2ULgSr2DwoL7FJPvdBm8LfaAwd
         LTdKp2di5vEuBZIBU1VPt36HaEmFQqTn+NaXKC9ysZhEZMpTfq5lXYdQkqbsms/PtCP7
         mvULCi7M4uBgs3pH+w7CpRDdDu4q40bykqSYqJY6yuf6AdNZZkqgQiPUnq3suF1wnfNx
         j+uaqPMgsUdLkuHfhZ/1lRL88YgydfeKo0Xd0FHyV2I5xD6fqenP1oTJzYW3wEqsnHmU
         CBWQ==
X-Gm-Message-State: AOJu0YyHFiZpdr7I7GG1K/vdI+PmQzh8VCStlh3NJBnLQNHxL3CyuPLo
        oYsvPNXZbfvAxoHLksUAe6QVWQ==
X-Google-Smtp-Source: AGHT+IFA0oacvhzZRaqDxr5uNcec9rVnKY7L81x5sqkIXHlHXR5tkc9/fjtKUDaKebMkt+7tmCa1Ew==
X-Received: by 2002:a17:907:763b:b0:99b:66eb:2162 with SMTP id jy27-20020a170907763b00b0099b66eb2162mr1072866ejc.5.1692431111213;
        Sat, 19 Aug 2023 00:45:11 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id k17-20020a1709062a5100b0099bc2d1429csm2261089eje.72.2023.08.19.00.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 00:45:10 -0700 (PDT)
Message-ID: <2c208796-5ad6-c362-dabc-1228b978ca1d@linaro.org>
Date:   Sat, 19 Aug 2023 09:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] dt-bindings: crypto: qcom,prng: Add SM8450
Content-Language: en-US
To:     Om Prakash Singh <quic_omprsing@quicinc.com>,
        konrad.dybcio@linaro.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        davem@davemloft.net, devicetree@vger.kernel.org,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        robh+dt@kernel.org, vkoul@kernel.org
References: <20230811-topic-8450_prng-v1-1-01becceeb1ee@linaro.org>
 <20230818161720.3644424-1-quic_omprsing@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230818161720.3644424-1-quic_omprsing@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/08/2023 18:17, Om Prakash Singh wrote:
> Instead of having SoC name "qcom,sm8450-prng-ee" we could use "qcom,rng-ee" as
> new IP core is not longer pseudo random number generator. so "prng" can be
> changed to "rng". Clock configuration is not needed on sm8550 as well. So it is
> better to use generic compatible string.

I am not sure if I understand your point. You mean drop "p" in "prng" or
drop specific compatible? The first depends in the block - if it is
still pseudo. The second - why? That's contradictory to what is in the
guidelines and what we have been pushing for very long time. Going
against guidelines would require proper justification (and not some
usual justification "I don't need it", because we talked about this many
many times). One should not bring downstream poor practices to upstream,
but the other way. You should fix downstream code.

Best regards,
Krzysztof

