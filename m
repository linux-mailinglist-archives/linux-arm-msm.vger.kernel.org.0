Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B94F5EF1AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbiI2JT6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbiI2JTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:19:55 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C6B31DE7
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:19:52 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z4so1344066lft.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=a3atssBxjXoEzroWAbTukg7FItDTIRDpuyhop6mTfvc=;
        b=BO0XuIN7pPFfyBzqN8GXL7LxRR6DgTITSn8rpOWqAKy4MjxgGAJCHzZ48BNeUZgS1h
         M7Gc77bCCLRF5ikQu6IHnxstobiEpSchuL1II/RCPRBki2Y56NeLzAVq2w4z6gn7JG7S
         +rFZZykGmVXNSpkxjFBKsssBVTS5IbikCsDyji7jo5P3MkwjDNRKRIaToAOIMO9bcRAw
         HrXgcr7pf1YPGgyJwT/PZPsnvnhMIbj8qTnIHxnWktN71URha00KHQgOX8pMbY8CoelW
         A0ksyuxGIGk5EMt4C8vBqwUtHEpB5oIu5bOfTDP5Ll3jNyCBPHZkPTxWfZYzfT3W/jok
         THSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=a3atssBxjXoEzroWAbTukg7FItDTIRDpuyhop6mTfvc=;
        b=khL6HAdHOafprCW9hAG9GgFcoOwuV13oMj2cIAjz6vYb72hysn5USZNfgQseyH+UAf
         du7vXhlWSgujr3g5/br+qfM/M0nulQNTea+/LSYe0sj6S3s4uRCYXyiBYNk73uO8Z6br
         lOatsG3c1Sn5dbeSMmpKCMHSnw8npaY08M8AybNh0NB9xJHYMS4+BW2aL0ueKs15uRDh
         CFY1f0d4k9NCDRdFJ9vtt1Rg5o89kPSf/EaRORALGxTNDsiePTZlzW3jC2RSZFRvZ52X
         4bwg32qsj5x8+I7BNEL2WfLa5/o2RV/Lnmv624esgLHfYpPzCPtC+oJx0i7tXLpFUEJW
         idVg==
X-Gm-Message-State: ACrzQf0uHwCS4w4IaJillogGBIzFvE0sYE3IR0wOkyPIQEFk94I/k/tS
        plFoQK/J6pMbFkq+LU71ThBS9w==
X-Google-Smtp-Source: AMsMyM7h4ztX8XbyjYO6fw+78rlNWjdzYEjMrTInWx1Ob8XV5ZHx45CnwiZ9XY5GkjjxMjABu+gtNA==
X-Received: by 2002:a05:6512:3052:b0:49e:fcb2:c1e9 with SMTP id b18-20020a056512305200b0049efcb2c1e9mr876563lfb.260.1664443190966;
        Thu, 29 Sep 2022 02:19:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o1-20020a2e0c41000000b0026c1b85d8b3sm655247ljd.34.2022.09.29.02.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:19:50 -0700 (PDT)
Message-ID: <c97e3355-89cb-7fca-2734-be221456b622@linaro.org>
Date:   Thu, 29 Sep 2022 11:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 5/5] dt-bindings: remoteproc: wcnss-pil: Make supplies
 optionally required
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20220929050209.1464526-1-sireeshkodali1@gmail.com>
 <20220929050209.1464526-6-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929050209.1464526-6-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 07:02, Sireesh Kodali wrote:
> On MSM8974, power domains are not yet supported. The platform uses
> regulators. This patch marks either the power-domains or *-supply as
> required (instead of always requiring the power domains).
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

