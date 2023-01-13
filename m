Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71CC669E7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjAMQo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjAMQnn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:43:43 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACEA1FD
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:42:39 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id cf18so47229505ejb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2qfQi85BFXWzJOoJ/C3jhHUUhELCYlryxRCopmVC4E=;
        b=FJi8siw+vXtF8D9mi5G5vvDf0lPW3f9pv9Iv2mdn1DnyXqeTqfNk9isOW/Ak7Ety1u
         yATIlfHuoBfZjkYoz11aWRvr4AJ6raeyyxEWvbwEBApB/rjJebvWvxMEHYo1pQqhCp42
         RJaFcPnFxTpn/v3NvFymFwNRkM2fgZobdg/BzC5Fo6fZDy87EJZ33KTUkfn+Rc5dRUhB
         kucSA2aMKxml8CBtFs3jGhf2BICu1rP4b8GYY+y0+pwKIYLvpfmTvJpCcH/EWhflora6
         EUMSYXzVbGdYt5Oj5aqpeZT1Vu86TCRRbcTHMlrntskE4CK3mNgW/POij7vjsP34Da3O
         20ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2qfQi85BFXWzJOoJ/C3jhHUUhELCYlryxRCopmVC4E=;
        b=uxNt1U0qOubRlRbLrQxqISZpCdFAfUGixaASUHKDtEZIdrBGQZlyscS3QBYaD1j59Q
         2eVbfVOiASLv878xmNUPqs5UZegVth6sEHGzTbMBOJk0ddA2OX3m+HMOGVGRGlbCfFhP
         4oOQqUJRxqODdg4TalGavP/azK7BFVeK4qeykND2Rol5aDTwOUUVXZRYTJCyB1IMO1Qm
         5oy37njsG6beKo9QGsdSzZen8IqLGAFHByrAl5GEa/gnZbGBjSyJFr+7Y2YJx0DoVjfx
         XygyAc98aB1IxGZg/Zrbz3MRXnjvTOrf5jsz/7ieiOlx9J80v8OEdWHmsvq2xCv2d/9V
         bQcA==
X-Gm-Message-State: AFqh2kpe+F0vBGitt1ZpebNVS+TU6Q/Kyv7Lu45gzaP0Khg1udhIuiR+
        96QkJzs0p/SlQAd4FiJ1+ZZ+Zg==
X-Google-Smtp-Source: AMrXdXu9Z3Wyw2FmaT/keEdSguCI2C4xDyUJleWKV22VndENhfLhB/RhZnxZD/s+XT/m/3NrJ5mjnQ==
X-Received: by 2002:a17:907:c498:b0:7ff:7876:9c60 with SMTP id tp24-20020a170907c49800b007ff78769c60mr71047961ejc.15.1673628158089;
        Fri, 13 Jan 2023 08:42:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c10-20020a17090618aa00b0084c6ec69a9dsm8661401ejf.124.2023.01.13.08.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:42:37 -0800 (PST)
Message-ID: <37755ba1-e8d0-cd9e-73a4-6501746022d8@linaro.org>
Date:   Fri, 13 Jan 2023 17:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] soc: qcom: smd-rpm: Add IPQ9574 compatible
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113150310.29709-1-quic_devipriy@quicinc.com>
 <20230113150310.29709-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113150310.29709-2-quic_devipriy@quicinc.com>
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

On 13/01/2023 16:03, devi priya wrote:
> Adding compatible string to support RPM communication over SMD for
> IPQ9574 SoC
> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

What exactly was developed here but the other author?

> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  drivers/soc/qcom/smd-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Best regards,
Krzysztof

