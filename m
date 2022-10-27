Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0B60F984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 15:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbiJ0Now (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 09:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbiJ0Nor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 09:44:47 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559721758A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:44:44 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id w29so1097449qtv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKn/+G/EIfphW6J6w40w7kIidY+JmH4foL41VvXvhK0=;
        b=tnCH2v5+9qm1A/Cge35QGKmFbHAPyktM8IUJtXzPD3Ih9NPf9gVw2VtvlhEY5cSvYj
         FvrZzJyknTReO0yM4nZdOCLvdl1urCFYxFHwurKdfMzt/u897Yp/T1YzmfbNhOudVMzp
         EWIk0Yp+KguTlbjxA+i7xzLXIkC0VA2ErCOgb5SQVjQxNxiwp2kK0EWQSH2gISqBVhPX
         Pqpy3Qt2Ff9frcmuZu19q03y2Esoi9CZHlPmIOuDGWRw11OWGxqc/MBltOnIE1nJ5QGW
         mg/Y4q1vTpzvW90r0FdOblFxiUVqtDYK8TAsnjUpy/uUkJR/H9a2MLSCA1C+fiy77MAP
         c96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKn/+G/EIfphW6J6w40w7kIidY+JmH4foL41VvXvhK0=;
        b=T+iZmus0ooFfbeCgN4YaCksOPsNHltxeVZ1q9ftQG1mFR53fIIElWpr+IOge+b9+JT
         G4GT1xN9+I/DqTbkDu5sbbgqpI3fjRXHah5vhmHqE+655NS/q4m9txlcCbyK670WuLwV
         9Vtl33Gj0EkOjTQQMumqncfPfE1hYlInDlbOzIPOwDDjGY06CjxsKoXCwxKmn+y9Vo0z
         oVM4TJ0XvJkuvB/tKEijbehDBRcZ2tt05BThAwABqGNR/ULUdEdHDMzgXEo8Vzvt2UaK
         KtdNCCDuYe1LjhMUJMcuitCTzspZs0EFHvXFVzH84iseM5x084k0chqPcMri9B1LAqSh
         UKug==
X-Gm-Message-State: ACrzQf38cze23UJv/xOmjOIUjUUnvdOJpETGVYdROxk0h8r4PWWfHH/O
        gGf8/WYJnTDlFyJaurBZELz3mg==
X-Google-Smtp-Source: AMsMyM4ZGvH92zP1xpXJwpP7nqOtHt9bZ0w2io2q013LPhHPHRoQaGlJDTw0GRDEhVrcXVWMkJn/sA==
X-Received: by 2002:a05:622a:620a:b0:35c:bf9e:8748 with SMTP id hj10-20020a05622a620a00b0035cbf9e8748mr41479832qtb.494.1666878283534;
        Thu, 27 Oct 2022 06:44:43 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id br40-20020a05620a462800b006ec9f5e3396sm986099qkb.72.2022.10.27.06.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:44:42 -0700 (PDT)
Message-ID: <63679d37-8b9d-db52-0f73-5bfd031c353e@linaro.org>
Date:   Thu, 27 Oct 2022 09:44:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/6] ASoC: dt-bindings: wcd938x: fix codec reset line
 polarity in example
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221027074652.1044235-1-dmitry.torokhov@gmail.com>
 <20221027074652.1044235-6-dmitry.torokhov@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027074652.1044235-6-dmitry.torokhov@gmail.com>
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

On 27/10/2022 03:46, Dmitry Torokhov wrote:
> The driver for the codec, when resetting the chip, first drives the line
> low, and then high. This means that the line is active low. Change the
> annotation in the example DTS accordingly.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

