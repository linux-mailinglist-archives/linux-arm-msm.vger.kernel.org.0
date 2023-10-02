Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5247B4F31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 11:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236152AbjJBJlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 05:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjJBJlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:41:09 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2E69E
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:41:05 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32167a4adaaso15633857f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696239664; x=1696844464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybb+TX2Yr+4fdiR5/Q6ko6tUC5VumPuBodZb0zBeRPk=;
        b=dZlybY3GxEtLmRf6wF6BibYKiBJygGKJaY1yDfOv8Y7tNgvBgV/q6SqUnuQnUn6Jdp
         6VhDJurYzIB1z0ksUs2UjCGGwOQFuKDcvwhorgfrBRydiAR0gNJXhxjKM/0K83gOJFYr
         VE88X+pSgFHuA01LU2FloWNZjV83bB041S4eRjVMC0kKQiHNXPRCiG5PrThrpfkn6Wbu
         gKw8JjjHvKnpou4aoheJUBIHwLgcowsn8anV6jBDvh25USwybovvFwkQGX6rz+rufauP
         aHfEnRSJl1yaLiiPNcWBBZ66vg8DsjSCg2obe37WkN2CDGZbg/BQjynDjwMGKDyPgnxB
         Q83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696239664; x=1696844464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybb+TX2Yr+4fdiR5/Q6ko6tUC5VumPuBodZb0zBeRPk=;
        b=OVmpOuLKaP55UF1e97lnLGp5MfWtIwGCTKJBt0T/kyzSTtYj4gxikqJex1EfNq3ptE
         s+Edu1jyfReCwSgk69FCiBW6Fbb1jXF36/sI16Dvo9lhXnrw+nU/EUjEk69YtaoPJD48
         nXDVr3JlzPbC0D7aiuSWcn5lzC5Fh7+9pqEkY4q7d1yi8Zk2pPXIYyQkEeiLpiActGs8
         zXwmg6POF4UrLvCNA2iBvOY+JZ/eLV2rpnao1Afz1vYaZ3nPZQfQPtro7m94JSpd0SKf
         ozpOHcvJtd7A58C1Kok2vUAMYHf1iNvlMr9/FMeQujSObU2o6uTG/J4+80hMnjHECsld
         sa/A==
X-Gm-Message-State: AOJu0Yxn0ZonQmGWqOfuw3pXLZasZ1+OIITq0mZFRlfxexjS8sAJQCZt
        nNkj92oYcx4CUJZ69C1+liwP8g==
X-Google-Smtp-Source: AGHT+IFomp7eeaOYOU4xGUyCwHb0n6mST0gZMRH5wBq7Z30l32U/tKw9twAwFWmBhEiwL6c7M/6veQ==
X-Received: by 2002:a5d:408b:0:b0:31a:d6cb:7f9d with SMTP id o11-20020a5d408b000000b0031ad6cb7f9dmr9717930wrp.24.1696239664047;
        Mon, 02 Oct 2023 02:41:04 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d50c1000000b003142e438e8csm27628559wrt.26.2023.10.02.02.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:41:03 -0700 (PDT)
Message-ID: <7c842030-ecc1-1302-4dfb-fc10f458f63d@linaro.org>
Date:   Mon, 2 Oct 2023 11:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/6] ARM: dts: qcom: add device tree for Nokia Lumia
 735
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Jack Matthews <jm5112356@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20230930221323.101289-1-rayyan@ansari.sh>
 <20230930221323.101289-6-rayyan@ansari.sh>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230930221323.101289-6-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/1/23 00:08, Rayyan Ansari wrote:
> Add an initial device tree for the Nokia Lumia 735, codenamed
> "superman-lte".
> 
> Co-developed-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> Co-developed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Co-developed-by: Jack Matthews <jm5112356@gmail.com>
> Signed-off-by: Jack Matthews <jm5112356@gmail.com>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
