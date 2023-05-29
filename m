Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6056D7145A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 09:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjE2Hld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 03:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbjE2HlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 03:41:25 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5D1137
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 00:41:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3b4ed6fdeso3082890e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685346068; x=1687938068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIyR1lHJkA+sNFp9J1o6uPmPADLzeJ2t6TMfApH2cO0=;
        b=G4I84p/8BXGAdQhmvw9H0kqEpMVZkOZUBt1/JCz/TZyyBkJgH/IVNGlt15swfM6pMU
         +Fz3vw2l93bpO61w3Y+E990mCaxZK0f3QXKYGJNdO1bjSIkEotzDCWZNwoa2rOVGuUNO
         EHDv7+aXWMsQyIRxe0nJszhH+zeykKrEwcn7YFUZFi3YDUVX/u46i0vk4t/34hJAfAEb
         Q6Jw/uXk9OfQkm9iNVpZfH/o+jKj+73h8eIwawuDVl9h/ElsGaqsxjDs1rrezm6RP+4j
         7FcFeOdfk+CUI/2xH+tFurLaTKS9UsTdVahpKofk0V8vY8sSEDvdS9zcOzkZO9vLPANZ
         cc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685346068; x=1687938068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIyR1lHJkA+sNFp9J1o6uPmPADLzeJ2t6TMfApH2cO0=;
        b=LehZvqNMCNBXixnDmm/1JSK8RTD+qGFdZp4Bz5iA3S4lYe2fsnnjDkPf+U2wTEyek/
         1410nNtEM3yYx3kBbG0QtbitlPjb7D5918UFAOeb16gpac4COUZS+dRPXGXLdCenR1GQ
         0pelkN+ypxraYUmHmHqt5bdXztJtaVpUxYC7s6cGJc0TuYMjmqSVv2c6emzEGQvl8s2M
         V0gV+qbUcIvvu1alIH92Ysd2QsUkO26bETRIWqtY/pgfPXVchEu90+9CJKqYBZogSLnU
         NBL6RJqiQNwA23Lfi66BuoPc8pBTubfBlgigfnl/Z7Kdgw21uWtptJ9rU/j/PEBAfhBA
         7H8w==
X-Gm-Message-State: AC+VfDwb4DCqnoyEBdzBnErKjYSrugAH20W61QdGk6O/YaNIwDr7Qr0t
        HUavRsxErfJjIqz9FX6D0J1C/g==
X-Google-Smtp-Source: ACHHUZ7CGoVzdq3YVY4Qh7oruPyoZkhaD7bLodOYquMFSgOk89OF+fipcK/1Q84XygMuQ4wDmXzFjQ==
X-Received: by 2002:ac2:4423:0:b0:4f3:b2a7:68ef with SMTP id w3-20020ac24423000000b004f3b2a768efmr2891357lfl.10.1685346068232;
        Mon, 29 May 2023 00:41:08 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w25-20020a05651204d900b004cc8196a308sm1876082lfq.98.2023.05.29.00.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 00:41:07 -0700 (PDT)
Message-ID: <a8d3d68d-d202-ddba-3289-65b347807538@linaro.org>
Date:   Mon, 29 May 2023 09:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Conor Dooley <conor@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
 <20230528-decode-creasing-f5b3996163e5@spud>
 <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.05.2023 15:36, Rudraksha Gupta wrote:
>> Where did the "att" come from in the compatible. Is this some carrier specific model of the phone?
> 
> This is the code name for the device. Since there are usually multiple variants of a device, using the code name differentiates between those variants. For example, if I left this as "samsung,express", it would be unclear if I am referring to the GT-I8730 (code name: expresslte) or the SGH-I437 model. This is typically done in postmarketOS: https://wiki.postmarketos.org/wiki/Devices and XDA developers. I believe it is a carrier specific model of the Samsung Galaxy Express.
> 

Please fix your email client:

- wrap each line at about 80 characters
- don't trim messages unless they're very long or
  there's some other good reason
- Don't send v(n+1) as a reply to v(n), send it in a
  separate thread.



Konrad
