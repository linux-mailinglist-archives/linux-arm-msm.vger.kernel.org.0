Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7CF72A22F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 20:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjFIS26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 14:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjFIS24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 14:28:56 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2959F3A95
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 11:28:51 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-33b3cfb9495so9001535ab.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686335330; x=1688927330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwNlstd6GLY/gpYePGYsVq8R17Kj6KhaKvtt1rti+C4=;
        b=rboeRG2yRA94EUvvID0LlH4crt9keRYwTcSwURW5fEAJ3PahctoEyCxz2GCZaymQoV
         EwenNrbkbGIVPF87Iomux1SdIKGrRq+k7KHJzKNjcFhoQZoHZ8k7ydznTLFh1t6o70cM
         UcUTV8MKHrVXNeGl1qbieauwvdfNJ8lLA3youcegQ1r1dmGnuE7SmVBGqxEdb7OgciU0
         7KtamtiYj8BBKe4W/2QZ520bmAoSsnwwj9ZfPsqhtOfsoyu8N2QrYbNJKP3okLtdHlfe
         kbsHe/NZf+j0wEbXrzm0X0xg2TvCG8+wH2UqMQNfRVeSbomjM6JWU0Ux5VxzXxmddmLr
         w4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335330; x=1688927330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwNlstd6GLY/gpYePGYsVq8R17Kj6KhaKvtt1rti+C4=;
        b=eQ2om3RnYlBToGrrLm0it+rZV6L26bX/EFJC93wyTgB6zsAIdgFf+ASVbAvsOCkUgE
         YOGLSlAHVjZeFr2lPCY90eHNZDPpxVhb55aLWXaDca28nSEw6xQTodvdtcFmOQeCAlGG
         zUahQ0CmHAqhZt/aGQgoO9O2aLMM2kjJ6lAPEr/JxY5ETQd3O2osS69rLKdPQqwZPd31
         rnSJ4V6408iLAU7hJxav5GEgvLbJy2n3y2rWKc2C0CphBAskgCeSt1bCuNs9I0J+OGZ9
         0hX5CvaAtvAE0k64eFVyIAfG2oNtAIIAq8OALeD2stiMMNRoK8lf9PBMMIilic7NRKni
         Yn7A==
X-Gm-Message-State: AC+VfDy5StRPgQIlsDP1eVYnTkHUC6PMinrXrB33T0E5HGstmxNAexCL
        c1iE6CzDLv3Q8IxQXJDHBT2aUg==
X-Google-Smtp-Source: ACHHUZ7Xmpyaxn0X+knYWrv5zpcoikhu29c88lVDDo/mBpA/GcpMOfcE134G00xIJqEdpMbw9oFI7g==
X-Received: by 2002:a92:c892:0:b0:33d:825c:3266 with SMTP id w18-20020a92c892000000b0033d825c3266mr2338606ilo.1.1686335330422;
        Fri, 09 Jun 2023 11:28:50 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id c10-20020a92cf0a000000b0033aa769d1a9sm1230196ilo.72.2023.06.09.11.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 11:28:50 -0700 (PDT)
Message-ID: <368ea795-68df-ebf7-18b5-3f5abfe2d189@linaro.org>
Date:   Fri, 9 Jun 2023 13:28:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 22/24] virt: gunyah: Add irqfd interface
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-23-quic_eberman@quicinc.com>
 <1c386f4e-e2dd-eb79-9117-9b19877f2ccc@linaro.org>
 <0416ee79-ac07-aefc-d83b-bc21894312ab@quicinc.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <0416ee79-ac07-aefc-d83b-bc21894312ab@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/9/23 1:22 PM, Elliot Berman wrote:
>>>
>>> +enum gh_irqfd_flags {
>>> +    GH_IRQFD_FLAGS_LEVEL        = 1UL << 0,
>>
>>      BIT(0),            /* ? */
>>
> 
> The BIT macro isn't a standard C macro and isn't defined by Linux, so it 
> causes compile errors at least for me when I use it in userspace.

OK that makes sense.  I hadn't thought about this
being a user space header when I made the comment.

					-Alex
