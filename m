Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2AB587ADD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 12:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbiHBKlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 06:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbiHBKly (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 06:41:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB47122539
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 03:41:52 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z20so8039487ljq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wmTM3L/iymZMU/fnd3mvXNlrqlcsNutt59LWDA/9pO0=;
        b=prTa7/zZhEgTnrNrq+qfzAi60M2N7oGlzarc7fGn3QTieiDcfQgawwYItQ1vzqHFnT
         YDV2RlNG7vAJiPulv8Fe+OkriVHzlu/qEI6rxUrdZ6zvZEs4s2jZ5cVy/GpI4jMY7XPA
         EkbTOQ+vIbSIrJifag1U+U/jM+VP0tQhDQEdDWi2ERxpK6wr2Sd6aX52ShucbPyUuoVf
         XR4xMKOi01xQTF7LS4Bavh4Qd+2/ClkjlrtQdgevcABFSA9IVU0V4MhmL39IxdpyZt5y
         eJclTJg5g+7nddKfySzB2VZkA0AfGDzoBO3mqyW0ZN4uvYE2SJOZgti+E2HDc+abJbdo
         k4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wmTM3L/iymZMU/fnd3mvXNlrqlcsNutt59LWDA/9pO0=;
        b=AKrSQtWSQrZ+22VsBoxManuMZ0B7DUVSmUF1noZ9Ci29/KuI+8Ar8qh6kA2ohbVNbh
         NTS/bkNOcr4h3ATo1j8naDDLn8lRw9EDte1m5qRf2TqHh3V2qeg7O1b3yRcIdxvE9KQJ
         gW2Eo2nGaINxkM4nrgSHQplsAbfVzv/o6ilVohpJhh2SSjGyDCxzijT21/vznCHutGqW
         ufqa3Dqk0EO7ebpBq2/awSE16T0LkiyweViFrPpUoipaTUFJJHFL6RpMbhZwVyD7FIJQ
         OyBJlJMJaQc8FjcwGJ3IlM+6iRWpyheDeXHwbIjmmZ633IXWlN+xNIh5hgqbkTsw2EnD
         Bi6w==
X-Gm-Message-State: AJIora+0zYprQafmYNLN1YB3uhc4lCkQSyeMP6UqAUNpH0LCPN3WnSQm
        oaSXzjycdLNBW2fvUc8FeadcEw==
X-Google-Smtp-Source: AGRyM1uAwk5Z6Nt5hhCOS+uMyGAWFxAUfImDvreK4WeYQqd+ilSgJuebsCKPFwbZvBV161vdVqZd2w==
X-Received: by 2002:a2e:8081:0:b0:253:ce61:3c66 with SMTP id i1-20020a2e8081000000b00253ce613c66mr6034789ljg.98.1659436911078;
        Tue, 02 Aug 2022 03:41:51 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id s3-20020a056512202300b0048af79884fesm829165lfs.101.2022.08.02.03.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 03:41:50 -0700 (PDT)
Message-ID: <a4868d91-f4a1-23bd-91a3-802fac7d7e9e@linaro.org>
Date:   Tue, 2 Aug 2022 12:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 02/13] dt-bindings: regulator: qcom_spmi: Document
 PM6125 PMIC
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Adam Skladowski <a39.skl@gmail.com>
References: <20220731223736.1036286-1-iskren.chernev@gmail.com>
 <20220731223736.1036286-3-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220731223736.1036286-3-iskren.chernev@gmail.com>
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

On 01/08/2022 00:37, Iskren Chernev wrote:
> Add support for pm6125 compatible string and add relevant supplies in QCom
> SPMI regulator documentation.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
