Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2112735159
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 12:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjFSKBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 06:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjFSKBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 06:01:47 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46DC0E42
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 03:01:21 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9786fc23505so391841466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168870; x=1689760870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbI0QgBrLQeLcssg9rtiXrf4wd4jiZkZw6E10JEgTUA=;
        b=FPSJiJtSEk/no4lgqWvvrdwb4/c3/hu6uSCtkZpUmEfFc3yDjt/3SRLpbClBFa0/CW
         7rZJv01v2wu2HzpFQdz5Oz9SwyHn4L6kpkQTjAiKJASgjSZopzvSV8SCU3abeO9c3eN1
         ah2tfkapS2z4rAtNldVh6LuXCKaR8It4GzTa4Rgsed49Jppk7vpMa7l1ZO3PNps2p/i5
         U/F4cj9gW3Su2BOeX91m2uRJnXQanc/gF99T6ZqrdkvOEJd+ZgQ7nq6GCQz5TuNColtw
         oYjyZymMwS7R7i6qM8RL6YfJed0VRevThl1kmTEKSzbKy0uw45HWl/IpwFy1AmGkSRWw
         Heaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168870; x=1689760870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbI0QgBrLQeLcssg9rtiXrf4wd4jiZkZw6E10JEgTUA=;
        b=hw1HFCKGoExfdRxbXBVME9IwaPCNpBFpcxFN4nyfGYdv6OTMVpDz24T0hYdzWG1ftc
         qHGQqUwRm4X6xFwwhhTQrf7pgNwkRiDkjKlRzLgLybyTmpQBeszqidDjKAUBYIZsBmhN
         7XBinwOUXWQ0OKAMnSqZF7wVqrB1PEjEnPiupSWtP+HjsgBU438PcWJtCCkEaahdwLmg
         zNbMY5Fvpa9h6qgEM4IqecTQ7Gc38lCx7ELhPqEA+INDMdJFJMvil774giznrxOpo123
         b/S6r+BC9onvNLNM4OjPB8pkONEbUruS9sQOhkJ9zNAM03YCC8xVX+qZahcv+sdfaElz
         XgVA==
X-Gm-Message-State: AC+VfDxJBiXPGtxkkzPJEMYoCZLaIYZaXIXwcrW/pgZGnI26K30N2qmC
        h9NB6mcWoVQCPTF6tXyTHGMU7g==
X-Google-Smtp-Source: ACHHUZ5Wr1zrmV+IjWFWVTXosVcRAtRvvNHFtvgSBWCz3QOkC9lX35h4DvGtLQ/5bDWuyYiewgMk2g==
X-Received: by 2002:a17:907:6d1b:b0:977:b397:bbfa with SMTP id sa27-20020a1709076d1b00b00977b397bbfamr7953183ejc.6.1687168870176;
        Mon, 19 Jun 2023 03:01:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id si5-20020a170906cec500b0098638cdb8b0sm4616780ejb.158.2023.06.19.03.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 03:01:09 -0700 (PDT)
Message-ID: <00b8721e-da69-dcf8-8f64-9a9028f24d13@linaro.org>
Date:   Mon, 19 Jun 2023 12:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Document that SCM
 can be dma-coherent
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>, andersson@kernel.org
Cc:     amit.pundir@linaro.org, Will Deacon <will@kernel.org>,
        sumit.semwal@linaro.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@somainline.org, linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2023 17:14, Douglas Anderson wrote:
> Trogdor devices use firmware backed by TF-A instead of Qualcomm's
> normal TZ. On TF-A we end up mapping memory as cacheable. Specifically,
> you can see in Trogdor's TF-A code [1] in qti_sip_mem_assign() that we
> call qti_mmap_add_dynamic_region() with MT_RO_DATA. This translates
> down to MT_MEMORY instead of MT_NON_CACHEABLE or MT_DEVICE.
> 
> Let's allow devices like trogdor to be described properly by allowing
> "dma-coherent" in the SCM node.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

