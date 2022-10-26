Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA3960E575
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 18:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbiJZQaj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 12:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiJZQaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 12:30:39 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545EB74E04
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:30:38 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id c23so10288403qtw.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEWQjBfFk/Zdt39bZHeZ/2md1LrkK3njfqHpxKjRhAc=;
        b=yqzLVshfBATMpUgpsZffV9q/DTVkozyc3MVPu0gQrxYNwaQoIlOBMP3undJwlntfQV
         iIUShn7/vowA/imGuvjeNBaZCF2nCVMXMmWTtWyz1HJvJQfhUJWhVluO63kXZA0fh0Z5
         zx9EWrtX07jf8kileGgS3lA/8HoUGRTUB6uSQilStct9QNe2YMn5rK0uX04qME2WX2wN
         0wAk9XMrfehHvMiT28xCEdrLelhIwsFc+e3VEKDsR5ygYdoZi0pA9YrSEaO+0S4goza/
         gWDz19FJ6OAvQTfc9CEP0M4YymLpPq3FOpPGjKOjluGq30VM7hx2UTUwmQ0YIQlOAbHm
         lgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEWQjBfFk/Zdt39bZHeZ/2md1LrkK3njfqHpxKjRhAc=;
        b=hhdfJ3Tjh8k+d1ND1qCSh3BMRh10aLHfH7YWhjbC9iVy0L5L+0SQnXNg5k1LeT9i2S
         4arorLimllCiTWcWQhzXeH0YI2fgcSUbYaQJSug3w+qJfV1ChG6/CSQffgwvewniE7OP
         liI/xxtjfcoExl1mlr+XJXpr7FYgTOkeTHE5ob2/Q0nmgn2F1QQAqSXOTMvCclMF/Rv9
         kJmJwThoVGJM2AfBd7fP58pQJcnIcaY0k05LaNf1WBTzcxRI2kTDmuzI6gp/862mKFhe
         ssWLN6716wrcfFNLzi+1JPMjW3RvvoMGiW6EZGdE0asA1Dsvw2NBCVhTYyygVFvFrwzc
         AbFw==
X-Gm-Message-State: ACrzQf3NOZR01TD+xh+URkXvU67YxR46SfN/UziNsoUb/H/hUIRZ5Dwp
        Cv6p5RCCwgjn2Su4HGWb2W9hYP5f81SiMA==
X-Google-Smtp-Source: AMsMyM4X5+5ss5R8dZPK0IxY6Megf9eWUoPQKvis6PymkL1smThD/yQ3JgibJaReN/eJFwt8FGLSwQ==
X-Received: by 2002:ac8:5a42:0:b0:39d:136e:8a43 with SMTP id o2-20020ac85a42000000b0039d136e8a43mr27254584qta.372.1666801837499;
        Wed, 26 Oct 2022 09:30:37 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id e10-20020a05622a110a00b0039cb9ef50b5sm3444073qty.26.2022.10.26.09.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 09:30:36 -0700 (PDT)
Message-ID: <3169d47b-35e4-7e49-875c-631a66350613@linaro.org>
Date:   Wed, 26 Oct 2022 12:30:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/5] slimbus: stream: add checks for invalid
 unprepare/disable usage
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/09/2022 11:57, Krzysztof Kozlowski wrote:
> slim_disable_stream() and slim_stream_unprepare() are exported, so add
> sanity checks preventing unmatched/invalid calls.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/slimbus/stream.c | 6 ++++++


Hi Srini,

Any comments on these patches? Can they be picked up?

Best regards,
Krzysztof

