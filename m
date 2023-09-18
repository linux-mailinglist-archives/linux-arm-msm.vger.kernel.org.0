Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319227A542B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Sep 2023 22:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjIRUcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Sep 2023 16:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjIRUcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Sep 2023 16:32:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283CA10A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Sep 2023 13:32:10 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-403004a96a4so54909645e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Sep 2023 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695069128; x=1695673928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJ9kKidA4UTcvgY6X4IKVZPoKP5X1ijt7CTX1NJIC/U=;
        b=UwvEb9xQjrQFDVxVqbNb0gYGmQqQAQuiN+gf61R3tkwojad54psXUFgrQMj/SHfiwh
         dxY4XOpudMrTGPdxkg4JIwmyvk1blLbLIADPHG6PRu9EK4oyabAmCo2/+2RIqBZhhCfC
         W7ChA0xyqARru9num4xukpko/DPRQXa2pWp5rB9AwTqq0ao1c1rcmCIFNmtEHqO0PV6U
         5QmFv29Wa2a/xXmtvww3ic659SM6VO7cZXL4YmVCVO6tYe3tQ5Ct/kl/ZKe4+LSCW4F6
         VbkC+ZdZTVAvEBDjk+peu/qk6eIQxyyMchHR5DSobZHWQGRhdxd9m795qUZyYIECMUU8
         nlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695069128; x=1695673928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJ9kKidA4UTcvgY6X4IKVZPoKP5X1ijt7CTX1NJIC/U=;
        b=UKT50EFQz4zvZtoWF5SzB5WTfntOuQsxzjSz17zBYA8nAXg4HIpHJdTAmAVB4/CnFo
         NUYLfpR2Yqtr+mwrYtsTGGKVBPGip65R7sV/wbnQc1536Axehp1u2eNBdLwFAZwWgDdp
         ROXRiJzK1+akC9ejbyL8JdqinGR28SZxpcoop698ItQQiD/UlWGES205shNBbgIrGooH
         q+aHRNi3JzsWEGsZAPZwCwPIOZXkig79lLWKF48c78JeTu6gsYmmhhCsw4gOrzy7VCFK
         B3awGCk1EXULhq9E0vR5KNqGtS6aCRBUqHqQUn8mpFncIvygh6CeHHI6fw2K0GAA0WwY
         KBkA==
X-Gm-Message-State: AOJu0YyYeo2pwSK4iCAyx7bpaVLpCkrksvq7RAn6BNc+cXJYCsGiYsKO
        u0zlLVhsgRDFRmC+BkkN99eAlA==
X-Google-Smtp-Source: AGHT+IFaX7hYEZhb1ZMpS1NvihzD053zuOpZrqy7LICre/K/BWFkwhUY5kHeQZ1hPNl6XDq36kwu8Q==
X-Received: by 2002:a05:6000:1091:b0:31f:dcdd:726 with SMTP id y17-20020a056000109100b0031fdcdd0726mr8080291wrw.66.1695069128448;
        Mon, 18 Sep 2023 13:32:08 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id lw28-20020a170906bcdc00b00992f309cfe8sm7002116ejb.178.2023.09.18.13.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 13:32:08 -0700 (PDT)
Message-ID: <c196d2d5-a5be-6557-f316-26902add0af1@linaro.org>
Date:   Mon, 18 Sep 2023 22:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 0/4] Add qcom hvc/shmem transport support
Content-Language: en-US
To:     Nikunj Kela <quic_nkela@quicinc.com>, sudeep.holla@arm.com
Cc:     cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230911194359.27547-1-quic_nkela@quicinc.com>
 <0efe305e-031b-bdf5-0268-ca1c6d562653@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0efe305e-031b-bdf5-0268-ca1c6d562653@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/09/2023 17:01, Nikunj Kela wrote:
> Gentle Ping!

Whatever is written with exclamation mark is not really gentle.
Especially for second time... and 7 days after posting. 7 days and you ping.

Please relax, and help out by reviewing other patches on the mailing
lists in order to relieve the burden of maintainers and move your
patches higher up the list.

Best regards,
Krzysztof

