Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6B5797A80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 19:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjIGRmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 13:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238741AbjIGRmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 13:42:36 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B82192
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 10:42:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52a49a42353so1674894a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694108502; x=1694713302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay34GXxNUofxhAc81/JeevPO+3hm2Cch8I1vOjYowqU=;
        b=uH6niiXWe+bXTFm7xMW/VguH2Z8OZ/D630mjHuixCEOOn1BxLfQFOibttNIrzt+9dJ
         oJ863YoqtX1Ea1/7IxN+wbazlk/zNNojnJj663OY4vdtk0fYi5cvtvzVMdnftt0JcD4s
         kyOmo2NrdbKSEAp/57oyEdy/gGmeM+X+RAUURhA8+15CnpYXHdjHHvsdgwT93DBuWkxS
         73fHbPyRuN1NXl+yQLgWNi/qU+8sqQ5BhAaCG4/NcBicL2iG60CpryO2jIT6X20JA6FO
         RTBbQN6mrjFGLvJ0D0IYBM3byQJCcibX/YcywXJiSq6/s3VmjdeTprvdJSbGB6rPVQyn
         ZTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108502; x=1694713302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ay34GXxNUofxhAc81/JeevPO+3hm2Cch8I1vOjYowqU=;
        b=QV30IdI+VY0II5mIlxXrEHdN9OLCYC58ESnQfqktnaMNRJbEB8dV2AN6Rl7j+Ijrsz
         Xu+cZ9P/Via5JHcyeQIu9zZCWYuVVojCOX1KjBFqoT2u6Tk4ByREEwGr44sqhkofcXG0
         ckcBXF1lbWA8tJWCC4e2ob8+APUNSy/YgW0AmEH5st1gX04oq2WXNiL3ZlU6/6b0ZcYV
         qS6v0mKtm6WqJM0I9a6VJgd0JFatb2EbVOnd0bqDCYlG3HUDrHpfs8g+eLfE8FsL/bW0
         esEfTn5469cnQI0r/LoH5hWxPmi6l9wyipyKFlT4zQWJ5/efG42swVt1qmhDOLBJ71WX
         aeUg==
X-Gm-Message-State: AOJu0YxYactLjKbiImfukJg0noKVKaahu3+ddPfyVaiP2yJKDFlalYOT
        psRLngntDgsysqZTWn7q7XhjLajDCACYI1o2v9q7Pg==
X-Google-Smtp-Source: AGHT+IEiKc5oozjVZRkGlfk27r1RulB7w0fpD+yatMRdkajGPq2JHqn9PrHpLF0yOAqbtvdnc8mC+Q==
X-Received: by 2002:a17:906:9bd6:b0:9a9:e735:f621 with SMTP id de22-20020a1709069bd600b009a9e735f621mr585811ejc.15.1694082332395;
        Thu, 07 Sep 2023 03:25:32 -0700 (PDT)
Received: from [192.168.37.232] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906805800b009894b476310sm10206104ejw.163.2023.09.07.03.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 03:25:32 -0700 (PDT)
Message-ID: <d3ccfb3f-c793-4a9d-bac1-da05d37cd00b@linaro.org>
Date:   Thu, 7 Sep 2023 12:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc7180: Add tertiary mi2s
 pinctrl
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru>
 <20230907-sc7180-adsp-rproc-v3-3-6515c3fbe0a3@trvn.ru>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-3-6515c3fbe0a3@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7.09.2023 12:02, Nikita Travkin wrote:
> Some devices use tertiary mi2s to connect external audio codec.
> Add it near the other two i2s pinctrl definitions so the devices don't
> have to duplicate it.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
