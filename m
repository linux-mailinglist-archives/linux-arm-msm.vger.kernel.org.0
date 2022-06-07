Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00A453FEC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 14:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243707AbiFGMbW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 08:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243723AbiFGMbU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 08:31:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413CFC4EA7
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 05:31:19 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg6so15053909ejb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0bVBZIpTbV1NVEDZVAeiBc+vcx1NnNChCpdEL4H7wUg=;
        b=fEsNEyiVyn4LQ4vSljRmJJFYlOirmhQAdjjRVQ5sjPc2lZDUwqXiEZSkjZeXl7O8D0
         2rPoTTajTVEaV5zR3AKyzJpZJtBX/O/cScXf0hDJvIbYd5Hzpt3R+xG6SuDavZN4r5Vd
         MM/l79Yr1wWODXoyP5K0dUcxjRh2/CA3TJtJQ7Hh/AT+YWGWx0/DF57NdpMeVdIzngz4
         rAU4i2tmrZf6z/+eypOS0wKWko1BJ5LHXP9gzI49GWcYduRfwMY2c0Zz4rZVgjxhUBl8
         MOEzf4xkxvPEKMt6/naZlPLhXM8YdTk9dbH2ihTyFPw1O1MBsTmkCMRIm+tUiNDIAgTI
         vMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0bVBZIpTbV1NVEDZVAeiBc+vcx1NnNChCpdEL4H7wUg=;
        b=JrfNiDXtEMtzhg0bYUu2d+Ebt72/8T85Q/tpc94JvCOlKtp0JBq+KowjUQOpSvhMhR
         EHA8akXfraXyn+7VQoxFI06QlrI5otZ7bTTSqZm212EORONvQQd93YIF+3dLLLx6Lz/U
         iPhuHcNl267OjLJcTIekK/4o3TBvGg4ikCDpdbXIBGkJd7eCnZ/NtUBEMk6gvxYjaaQs
         NAqxHhuk+A6H1y3sztmdmwfdki0i5Jzb8U7714oSKasAf/sM7iYFE5REbRJWnOdMd/3g
         IZIPDQQsIMRX4AoOcSpnl2rLwqjTlJEWXeKqORrVSgFzLDAemf+MgvrbrcaBnt6uV+Jb
         m+bQ==
X-Gm-Message-State: AOAM532aQSps+v/8o+6hzOw11j8OlAhIKX/ZYsKOUrqVWr0CVffUqvOR
        N2MjnBob/CDc2r/+EjR42Wusqw==
X-Google-Smtp-Source: ABdhPJyJTPqtj65zaAKLcpzOo+Oyji+7r+MmVERsSyki9/O0672e5B8VTsFaRPkDbVji7Ok6efqskA==
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id hq4-20020a1709073f0400b006e84b0e438dmr26317862ejc.391.1654605077853;
        Tue, 07 Jun 2022 05:31:17 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709060f8600b00711edab7622sm24387ejj.40.2022.06.07.05.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:31:17 -0700 (PDT)
Message-ID: <cf79be5d-deb8-09f6-0f17-3c3639e670e5@linaro.org>
Date:   Tue, 7 Jun 2022 14:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: q6v5: fix example
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220606132324.1497349-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606132324.1497349-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2022 15:23, Luca Weiss wrote:
> Use the node in the examples that is present in msm8974.dtsi, which uses
> proper flags for the interrupts and add required 'xo' clock among
> others.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
