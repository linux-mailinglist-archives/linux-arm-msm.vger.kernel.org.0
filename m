Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15C552FE1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241999AbiEUQaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbiEUQaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:30:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134DF5DA59
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:30:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id v8so17042277lfd.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PGBKowGCoeyprTPxflo5hOw6ZsrzCB6ERHnnGHq/KYo=;
        b=Ypcu4oldjujCnq1a0IGwU6jLY5+8WCUreESJXATi6Qovw+IleuNJSO+2jmPE1XWKN0
         hKc/k0bwQUKpkype0T6QU478eaxR6ZCQacT93XOrauRrCx4iQxj3At2h59XbPN8abk8+
         HEx4xTZX/v1EW7hr2lDTU3zbvCPeVyzsy1lXY/Q+j2ZqpmXDbYt/TzJ7klquZyXBfKaZ
         QO0Hdde9Vto5oLZtIgEmiIA81Cw7FR96CkBYYXP7HL6awGac1mvigRv7wMLceJreNYP0
         2LKAsGzJE2/M7u9v52sM+vdncj4VlWx8+4GaNtXB9wju5Xj27dFs2Cz6cRCePxIEukum
         VTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PGBKowGCoeyprTPxflo5hOw6ZsrzCB6ERHnnGHq/KYo=;
        b=bySmWd4hy8kHktc9A86yvrLEsKD3K1s6mdhusVNKF/DOPAkJ4dqpZybbxCNSe0Nm3z
         F2269SlnTQFpRj6UJGxg4/0cvjU7xYP5K9vKJuwn5rYY+qgWrodAq8zbFR7k0p0QZM8j
         Cirh6J2ky9u9JBfToy1kMXhLqHpeu3+LEcWryZDvFROSQyon+XSIetKyBJjr3bekhQrU
         pxNuVA5LbAZXDE81z9MJqv8v22hFjuX2mL+Kw9qdVO/GqJCPCmLKdfFLzplhYpv9MZNh
         JhjU92Y7XXYypnZqI7+AYyHsTDBy0tPmpiaI2gJXOMT4QWF1UWeaGWl5992e/X8AAKhj
         h3Rg==
X-Gm-Message-State: AOAM5338QaX4asLrrkayvKlG+cuw0fdL3LWCTbEpZElaS1m8/3IqGQWW
        R939rI2dmvoZeRpcmUBbJmUKdQ==
X-Google-Smtp-Source: ABdhPJxL6iU3sfYlXLAgwObscAzISzM2kLl9BJSHVBNyiFP7oul0c4GdOkN3gD7jEf6gm2Ysq+6zZg==
X-Received: by 2002:a05:6512:e8f:b0:477:b08c:1727 with SMTP id bi15-20020a0565120e8f00b00477b08c1727mr10740433lfb.309.1653150614443;
        Sat, 21 May 2022 09:30:14 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q20-20020a19a414000000b0047255d211e2sm1107915lfc.273.2022.05.21.09.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 09:30:13 -0700 (PDT)
Message-ID: <d89c882d-08ed-a212-a451-55f08235fa7f@linaro.org>
Date:   Sat, 21 May 2022 18:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 11/11] dt-bindings: arm: qcom: document sda660 SoC and
 ifc6560 board
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-12-dmitry.baryshkov@linaro.org>
 <20220521162051.jufjhqzz4wte3h6z@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521162051.jufjhqzz4wte3h6z@SoMainline.org>
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

On 21/05/2022 18:20, Marijn Suijten wrote:
> On 2022-05-21 18:20:49, Dmitry Baryshkov wrote:
>> Add binding documentation for the Inforce IFC6560 board which uses
>> Snapdragon SDA660.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Nit: don't dt-bindings patches go _before_ using these in dts?  In ohter
> words, should patch 10 and 11 be swapped?

Yes, they should.

Best regards,
Krzysztof
