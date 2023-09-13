Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7210979E0AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 09:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238427AbjIMHSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 03:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238552AbjIMHSF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 03:18:05 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7076D198A
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 00:18:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52a40cf952dso8546050a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694589480; x=1695194280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5E2GWmaKgMk9eaNY11kumMiKx9QbIcNvdM4XUjWrJ44=;
        b=dtbcUaxcxcGEyOr/O1cRE+JinMzko/z31d/4lugS7cNJoHXNu1JnA4Z4WhoE56DV1v
         U4KD4KBc6boQbqzcEIKP9ZVlj5MKIH1emk7m16Wk5ZiN96CPeurfCmutbPwCYVb/K22M
         weK44nqVo+9pyRdsrD38VMW886f8Uw8HzkFqA6ZdXwtZXrY0ZM1hNrTbEd11cPnzmj8O
         8Et0yRjIbG1AuJauWWsBrNOdb7L/tJuKE9/e2QEMwubT5VUXLPzdnmXNECwWFbyfNhpI
         /3jw5U87GVHlt1X0jjSgl0dk1T9GWC8Sq6lpxYeP7xWt3220jU8yD1MMxNfsUgarK6XO
         FzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589480; x=1695194280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5E2GWmaKgMk9eaNY11kumMiKx9QbIcNvdM4XUjWrJ44=;
        b=LXKkgnWjfe3Xlp4UmEEoXB9rRy60vUrx/9LoP6WzkMmY9FbvqsP97L/fyyQcWblKaA
         r9KajI0UHJLbVk6EpL8cNIWgtMHezDYP2iwIUuQgVaY+6V6TdYZ8mJHMnsouOb38eqsI
         eSdc0PHk9BLyGfv64DBChOV18IqSrvA9Oubj4GwadUF0DP+2Qv0BQUoThp6qQILzgA63
         kRX2Apg6S8kWjbnwdrHWgFpRflOW3Umstqzr3Ek9RL/SJr6gVsQ+Ki/4H0JN4ci98csj
         YQNyHEXG/+4ZmXSHoy/oskDUB+2zEVGrsoEQ6MMZQbcBDFaFUU7wrYOUgEj9N/xwX0XA
         IUzQ==
X-Gm-Message-State: AOJu0YxRgzjxvYXFry5o5Sojs2Gb2XGWfiZdVGfF5u/Yl8MP0HHEbJzX
        +v4vCEAC0lGc944irjrGPPZcvg==
X-Google-Smtp-Source: AGHT+IEIxkxJMHTHddH6e9vxURb7vyya0U8l8ijNR3g0bzw+qT3mlAGtTd1Mz3CsBWlsWVc9jIz9CQ==
X-Received: by 2002:aa7:d1d6:0:b0:525:528d:836f with SMTP id g22-20020aa7d1d6000000b00525528d836fmr1588780edp.18.1694589479936;
        Wed, 13 Sep 2023 00:17:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id bc3-20020a056402204300b0052348d74865sm6702364edb.61.2023.09.13.00.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:17:59 -0700 (PDT)
Message-ID: <c4420c00-5c45-c46b-ae73-15c6d8af0694@linaro.org>
Date:   Wed, 13 Sep 2023 09:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 14/14] arm64: dts: qcom: sdm630: Fix USB2 clock-names
 order
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v2-14-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-14-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> The last 2 clock-names entries for the USB2 controller were swapped,
> resulting in schema warnings:
> 
> ['cfg_noc', 'core', 'mock_utmi', 'sleep'] is too short
>         'iface' was expected
>         'sleep' was expected
>         'mock_utmi' was expected
> 
> Fix it and take the liberty to make the clock-names entries more
> readable.

This was already fixed:

https://lore.kernel.org/all/20230723141849.93078-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

