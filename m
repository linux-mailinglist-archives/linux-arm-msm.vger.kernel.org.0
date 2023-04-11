Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683FF6DE1A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 18:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjDKQ6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 12:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjDKQ6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 12:58:39 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999C13C17
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 09:58:36 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-504a131087aso1755841a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681232315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCI8HZ/sqT8uZruNEoU64IrLVLV76Tr4mIJ2/SDzWnM=;
        b=jacvY4gWemomibfBu07AFC2MVhBs3LlhuquyvAbQJqh/4L7lCMzcsoJPDoL1M+sZZa
         kEhdQ8QFCV+xq0biYjjhFn8JzL+8o65zRoZXZppdGguY/ajAPcUNK5Dvb3zFygF6wA0y
         xpjihEE6Mz20z+STJ1ketHrXVAgUPliJ7WtPCtpbO1jWP+7di5P8Ddyl67lLIKpdAPww
         bgRmPFMsqJOKBvPjkwZTphsnKAQKEd+3cSwOlGEuDcPCEHvHffjKMgXeFBjj5w7SKA1O
         cHrAvsF3IEcGrAxsmFr1H/TxEAAXW4QnUW6d2rsKise3W5f0SfV9NOEv1lWd0Xp0MLCQ
         vljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681232315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCI8HZ/sqT8uZruNEoU64IrLVLV76Tr4mIJ2/SDzWnM=;
        b=Utl54Cwntlug3uyP2OvmZvPsLchYZ9znfUoUxAktN+WykyyWTz2/NJFIQUz6upUSO9
         36mbbpIcwLMgEqtKl4/lhjFW6r/L+BeZ7209CfErE9BFtKiSp744mn1ZSijIS0uYsEPz
         P5wLy9dwmWWSvBqdM8HI+XrPMNFrksGgLRRdGBKZXau+2MstgPD57BegSZqlKeYxxNNQ
         DfCTS3Vcf8HreNWHNeFkybJC0NHF/UnghnNT6SEOgJSMVUHlUyvqxWuBm6F5ExAn+AnP
         iTq37+PiKtaaAW5uvZEOZx6ceo2AZ/MDBBsJnQ6nGYQ7V1am8CwOHEFy5o77UKP/wXus
         TJyw==
X-Gm-Message-State: AAQBX9cCySbZfW1+CAzzfHYnY2OVqbYIIAwKxnwzHzgsnj54LylkQMby
        hMFfvTcdy18T/41t4mBVUi2/vQ==
X-Google-Smtp-Source: AKy350ZmQF7p/rWRn51SIVkwSxIVCC0CafdQC9hc9b9qr25n6qkB8eJbp4GoDTSBoMglCVeZbR/CFA==
X-Received: by 2002:aa7:c2d2:0:b0:4fa:fcee:1727 with SMTP id m18-20020aa7c2d2000000b004fafcee1727mr10878208edp.13.1681232315042;
        Tue, 11 Apr 2023 09:58:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f1da:c117:3657:c8a? ([2a02:810d:15c0:828:f1da:c117:3657:c8a])
        by smtp.gmail.com with ESMTPSA id e14-20020a50d4ce000000b00502b0b0d75csm6075033edj.46.2023.04.11.09.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 09:58:34 -0700 (PDT)
Message-ID: <887eb9f6-9882-37c6-4332-ddae7a354187@linaro.org>
Date:   Tue, 11 Apr 2023 18:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-lenovo-thinkpad: correct pin
 drive-strength
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230407180710.128815-1-krzysztof.kozlowski@linaro.org>
 <ZDVtXkCON8DFUDjh@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZDVtXkCON8DFUDjh@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/04/2023 16:23, Johan Hovold wrote:
> On Fri, Apr 07, 2023 at 08:07:10PM +0200, Krzysztof Kozlowski wrote:
>> Fix typo in drive-strength property name.
> 
> In the future, please try to use the established commit-summary prefix.
> In this case:
> 
> 	arm64: dts: qcom: sc8280xp-x13s:

Sure.

commit ca1ce7207e53cfe69aee5002eb3795069668da53
Author: Johan Hovold <johan+linaro@kernel.org>
Date:   Fri Aug 5 11:23:17 2022 +0200

    arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add alternate touchpad


Best regards,
Krzysztof

