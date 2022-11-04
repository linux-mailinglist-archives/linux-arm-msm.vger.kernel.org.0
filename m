Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B66E619892
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiKDN5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiKDN5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:57:06 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330392F392
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:57:02 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id k26so3079892qkg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1Av/fO0FqP3dPRXzvVuPS03eNN5YFoNuGA5FMbWkLY=;
        b=hR1pyysR/T7gF4a4YDq3Qszoocobb4LSw4WGjbScXhCzYHhUImNhK/17bHXwH8IS5E
         e8WGT+bAubb7rKRHiBS6ouTYmijZfW+1LuWPAoxnsDkVfLFnAA/hyhM7VLALkeB2R8Id
         WquSbylhLTk+YovCxb2s7b5pgmKRXHMwRq2FzzOPePDdT7UVofOYSgmGfXO6QUVD9Xcw
         tAebQS5zu32mEwpnQvbVTeXjAQhJRk1XoIW15Fw2T6cn92yqOUqXgYL0KTv6NrDhVZhQ
         u/yJ+/CFL/VSYuA302XBZ0asINIGGxownCSO0twic6PkcX1hab5bKeR1GdQaPaCiHfaY
         wnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1Av/fO0FqP3dPRXzvVuPS03eNN5YFoNuGA5FMbWkLY=;
        b=0w5GTcGc8BJjPAse2PmvgHHRbWUy6VnRePhv6uJQUS6z0sTsV4JH+jzAzkSEfb1R9G
         PgVR7z0MCbQ0UGrWHkcIKExk+Aqxc7jGVuE+1kp1Pxq4vx2kIFaeKXKDDQXZbr303inA
         VxiAA9+0Jc/fi9Ac/5VcioS/K0s9PiuFtsjQS1b93XmkRb0O2WChRPXtdH9dxKdIGjYv
         PIKFcFSCaeXWmaCQJhmVVANHyl9fGwR52JHoaVb4f9RbiSYhTLfuqae3z/WcbwHUkS8S
         PPcIwBgfvvHLB/+/yETeRpRB5+QR085BjovaQbTzt1dcOjtsXVAuIH9VnBDE+P6tNLD8
         yiFw==
X-Gm-Message-State: ACrzQf12MTP+DLwwAbXkz3+tTlYF0K3IbgjkSshhkQN7s8LFp78knH85
        UI0hadO4Zc3diESKtEMM/7kozw==
X-Google-Smtp-Source: AMsMyM5H+ScN1mRwortQ6Eu9H7bwQhtzGBVRcEiPGAk8U5VZb7iozlvoh6QPQOdfJ2ezUSp2S0u4EQ==
X-Received: by 2002:a05:620a:25c8:b0:6ae:bf82:8f36 with SMTP id y8-20020a05620a25c800b006aebf828f36mr26380052qko.354.1667570221341;
        Fri, 04 Nov 2022 06:57:01 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a16a800b006ed30a8fb21sm2871949qkj.76.2022.11.04.06.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:57:00 -0700 (PDT)
Message-ID: <f4d796ed-ba95-7034-6316-4a1b05983a1c@linaro.org>
Date:   Fri, 4 Nov 2022 09:56:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916-alcatel-idol347: Add
 GPIOs -state suffix
Content-Language: en-US
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221104132400.1763218-1-vincent.knecht@mailoo.org>
 <20221104132400.1763218-2-vincent.knecht@mailoo.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104132400.1763218-2-vincent.knecht@mailoo.org>
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

On 04/11/2022 09:23, Vincent Knecht wrote:
> Add -state suffix to GPIOs states node names as required by dt-bindings.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts      | 14 +++++++-------

This was fixed:

https://lore.kernel.org/all/20221024002356.28261-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

