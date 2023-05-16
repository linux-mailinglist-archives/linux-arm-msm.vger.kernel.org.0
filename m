Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48EBA7053A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 18:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjEPQZK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 12:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjEPQZI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 12:25:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722EC7EFF
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:24:45 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50bc37e1525so26431564a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254235; x=1686846235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUikb9CiBvwIkQSA68+r5AMXjqRggL7xlVoG0Lr7Dlw=;
        b=zdHgs1uhk9j9Fvzet/xg1PnShN9nZLOXcBd5FBheGTgp9TlWjxTJU14JCV0NbL5iWB
         kz9xu5cj2TSFOM9HEqmCTtf9wh3TMGXd5cYS0xScf3yu/WHN91uj+EjBGqKfiodtFVP/
         w4BnYXhQ7RPXHJd3c6jPXd5is4H0oycDa09CiHjpkFj8sizx0idRlBgAc5eSIzR6ER7X
         4fr8siO4cffBArmjQxPR2AANjU2RoQGfZXCVdRJH96uF6nmnMaXpM1kCy97Rdp5KPbbB
         ilF9vVtaz07RRBeiWd4mh1Hdh3hVczEWyXuLhSMblBtPWJE/s75/UDTK4hdIJTcSRa8d
         zGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254235; x=1686846235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUikb9CiBvwIkQSA68+r5AMXjqRggL7xlVoG0Lr7Dlw=;
        b=EEezUbksSIvXyYxr/JFu/0zwDTsH/ZuVtj5aeAKiz1c0LTypLmjndKrAv72AVE+sp6
         WbSJvDFmghfIDFrGjQbF0m5h2JfwGg2w7dc8g5l7OLUNxl21/I52HvZP71+g0lm7x57U
         PuS+ojqjBPgdRtOcNBuHs+ulrMEm4COY5r5ZgpgWBggEQT1NZHtUOSfa18Nl426X0n7Q
         2QDw/yPH4eob9etovWBlxOW4KBpakceuoVcbGgS6GQC3EcIiyplD0VRFQI7cZsuELBU6
         yUwsnSSyHmxd2T9TD79g5z8bZTAwU7Ltwps/W5qdwh1HXZNm9l4cu5tiJ3WGE5T6kWpx
         IPlA==
X-Gm-Message-State: AC+VfDy53ZQF4Mze2g+jELHIImLPU2t8z1Rp2qx4ohoW5i/LWG1NjZ43
        snOQvPIoeDO4A08cEftAxy6JDg==
X-Google-Smtp-Source: ACHHUZ4ciV6/qSxcU8jgXk2c5v9kXV6rVKisuEt1ztrBycY+7PN5s1cdFG7yNt69mDvGaQR9JvYSkw==
X-Received: by 2002:a17:907:9617:b0:94a:6de2:ba9 with SMTP id gb23-20020a170907961700b0094a6de20ba9mr40789193ejc.68.1684254235712;
        Tue, 16 May 2023 09:23:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id m26-20020a17090677da00b0096ae4451c65sm5101707ejn.157.2023.05.16.09.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:23:55 -0700 (PDT)
Message-ID: <138ba3a3-0f89-e612-4e29-0e4d2838489b@linaro.org>
Date:   Tue, 16 May 2023 18:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: document AL02-C6 board based
 on IPQ9574 family
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com
References: <20230516135013.3547-1-quic_devipriy@quicinc.com>
 <20230516135013.3547-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516135013.3547-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 15:50, Devi Priya wrote:
> Document AL02-C6 (Reference Design Platform 449) board based on IPQ9574
> family of SoCs.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

