Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D6460AFAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiJXPy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbiJXPyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:54:25 -0400
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A218675FFC
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 07:49:58 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id b1so17113419lfs.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFZjX5S7TOtvQCwB9xl/hGQf5yUtgAWOiJRBK3Mc0r4=;
        b=M/DrH1WIigY7MKVYeORXxguZGdlaMYm388Q9Y0zeJXJAYpNHUHnC/seWKCRCDKVHZh
         FYLajzsz66qCaNceZ4vmnt6q8mylKNF6hvucvj0kq6KjGhccTuNPAZWnq83tJUI7Z2St
         13JCqldQNVjW8JcEu9r2l5ED0Q3ZFdZIr9V2BFb4ECvtpBhJlie6bxLVirhOvz3P8+yc
         0xYFfs46bfRCSHixg3T4aH/gR/HPM0R3W1YWJdu5KYXrCiItapruc5uPaS87CZjTypfF
         ZK+d7HI9Y8/0t2DFftZ6FMqgICqwl6t9MaqXPtoysb99Gh9xPGzLnUgX3I4RVBkksVBp
         UDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFZjX5S7TOtvQCwB9xl/hGQf5yUtgAWOiJRBK3Mc0r4=;
        b=XAU44OosgbwybEucpJWHCSwQzuuKkKJmVxlckVTUkT2y3KBplL0ThicsMJzwA7T9cs
         13SjoXuajIPb7Dns2+5hDcMPnpJ8GPR2HNhlkhOF+RQYCEOwnWX+T8wAitQabjXcBr+7
         YOgHfLK+Ba09HaeTdtmVop+r+knSgzT6/aDwNu/Q1fdROzS9wbM8HxdO64xB2wHGPEuJ
         jVSkJr6SN83XJK7NySR5YKBWa/usffZ2IhJgwxFiSFl39m84t0ACmltHajsx9EOF+yvC
         H0RtvmY/UI4cVLCDb7BrhH/V23RDgcLo6+UWKS+pTslabCWzm8hNg+UEsCd6aBVDrM7e
         uk7Q==
X-Gm-Message-State: ACrzQf03sjRSVMmtsRLlW1PfhpYyZI3qx4CBjkhfr0SwBfA5kheTgpBB
        n3VJnte3Vl5KW/McYYCXVlUQNSdG7jLlAie1
X-Google-Smtp-Source: AMsMyM6Cay83Fhrt2am2YSVlmOjugpbTdf1Ui3AKwagVyB8ovojrmkQXtuTIMd3QITZ4VR22jyyMYg==
X-Received: by 2002:ac2:5b4e:0:b0:4aa:301f:3e2e with SMTP id i14-20020ac25b4e000000b004aa301f3e2emr2873383lfp.90.1666618468819;
        Mon, 24 Oct 2022 06:34:28 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n28-20020a05651203fc00b00494643db68bsm4531561lfq.78.2022.10.24.06.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:34:28 -0700 (PDT)
Message-ID: <e19e563c-842d-d54a-c986-62526a58b468@linaro.org>
Date:   Mon, 24 Oct 2022 16:34:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 07/13] phy: qcom-qmp-usb: clean up probe initialisation
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> Stop abusing the driver data pointer and instead pass the driver state
> structure directly to the initialisation helpers during probe.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 46 ++++++++++++-------------
>   1 file changed, 22 insertions(+), 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

