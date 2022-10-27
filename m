Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5F460F987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 15:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236310AbiJ0NpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 09:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236295AbiJ0No7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 09:44:59 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB26619291
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:44:55 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id c23so1102738qtw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IywnywGUMBqnA230cooxKE3/DDofM5SGlEeMa5Z+U6k=;
        b=SCtG9lV2e2OftccTsxJ4CiOQptrXZwSqcmYyR5cotFu5nDP+4lY8IfU2Bvvbr/Wo9f
         cQBlPiQKusrGqnIdMjZdnt094W0goy34AhcNoCryOJOP/L9CLxprWY9qah1wD6hSpyO0
         yjS7iofkaerCyoBxYGyT7OgO33DGqEH6BkhMybzrjwxwFc+YRZTB8l5xFJVZUZ8Dmx7c
         J0qkUNjyHiTuB5kagLjVw+m/+dszAco6MEjEYiCxLPB5QSgcj/H5N/EtqmHJmQzHLds3
         aEYqWQXBHkRweGVwy02kS2OEi/zUK0ffHkie2S1EJVrYTx9wDJjQ8W8Se7na2wW5LPj8
         luHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IywnywGUMBqnA230cooxKE3/DDofM5SGlEeMa5Z+U6k=;
        b=hMhrhYviX0JLTopq7FZjh6czymVHyXnPsoTd/7eoS1+MNGMiykeOK1DSs+43EQvr71
         jofAWKhfLqdxUseSau+HiyjE7cSvZc0kBjA2k42iyCq6CfXFDxlw3qil2t96DUV+qqvp
         Gp3UvWu6Np8ZLZVmhuJtMyJxyr6xdGCf4metJOciGRZ7cqHI+yFbu/3zGyp38z17NIpY
         AahPlPB9Vd0uEyPqjFccK1BgXWS+RmB5eCZUsEUsvqJWeF6JFW7CsyeLRShHGvbyrsOq
         zAdJBmGBI1ac/RRioVIVA7dcrJ2xIaNAVHSpS9XWLgnIYJ1qczBhhOl3VJtXnGYr+Fok
         NgSw==
X-Gm-Message-State: ACrzQf39PhCwGhWOM0YkKDrGcluOzS2VOYUe/t5oa+Q43csNGAcZilBV
        iIWJRJcDQ6x3QxZP+2q7c3w4JA==
X-Google-Smtp-Source: AMsMyM6mjNOAf6RNAHImQahDAkSgrafrYeQQU9zzliB+TOFsUtO9UESmI8Hp+rROUKgkmnb9xMT5iQ==
X-Received: by 2002:a05:622a:44c:b0:39d:c1a:3299 with SMTP id o12-20020a05622a044c00b0039d0c1a3299mr32437151qtx.330.1666878294728;
        Thu, 27 Oct 2022 06:44:54 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w26-20020a05620a0e9a00b006bb82221013sm1043494qkm.0.2022.10.27.06.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:44:52 -0700 (PDT)
Message-ID: <c372a6ed-11ed-7fbb-3833-c1ead08c1d08@linaro.org>
Date:   Thu, 27 Oct 2022 09:44:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/6] ASoC: dt-bindings: wcd9335: fix reset line polarity
 in example
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
 <20221027074652.1044235-2-dmitry.torokhov@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027074652.1044235-2-dmitry.torokhov@gmail.com>
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

On 27/10/2022 03:46, Dmitry Torokhov wrote:
> When resetting the block, the reset line is being driven low and then
> high, which means that the line in DTS should be annotated as "active
> low".
> 
> Fixes: 1877c9fda1b7 ("ASoC: dt-bindings: add dt bindings for wcd9335 audio codec")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

