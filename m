Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED8E5ED70D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiI1IDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiI1IDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:03:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E607B784
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:03:38 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j16so19217150lfg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XwUsEk+Rjap/yTJlcalNvg3xlLZS5J+olMeJh8xlh6g=;
        b=Elx7DSsBZ7tXoSnr00JBxqGacZWHrIIWBypZ1Xg6ivb3plbZipywaBm6a4DHnd3Z9i
         CngVvKmrQJnvqcB4Fj9O7Xvbossggv8CMz0NMdZxWDQTrfFOKNxUMfG9G9SD0zqmejw9
         F8yOwoszrz3GxQxe+uKaYQaW+bMuafW/iZHzZmHF6dQSb19ONeigdoMo28kj69oSMXSY
         XjdgvPWQIeAd8hQYEzLCBnpGlpTRXDA/NXKnEZWogPZrbj64UELWaCD/aXDrNKHwcP2s
         bYnPNha9LnorycZJ6Lz8ddpwSBdJAInRZVshmUe9RQwTnM8WxnF/DzDBT+u7BTAbCARO
         nxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XwUsEk+Rjap/yTJlcalNvg3xlLZS5J+olMeJh8xlh6g=;
        b=axJe0c0hU1I+RRtJfBYPaZ6SmfFdOsHEjLL31lhWItClJhgbPG7nll1QfrQG8DwQx5
         aEYpUKq144n8SV2uG0rkqiL5r2l91eHxH6HtN7iNVID2Y5eCLe2RxGQMxuLCIznqcjWG
         O1HtgUXbk4NoInHnz3YOGqGlhhuGNh6EFzzvSAOVQUNSrKReiPPT6FF0HkEFfVkelTwM
         GRPJzAQ/vLF6p8IKpysRqkatJZHssVMuIVOF3vms/YR02q/jTA5tvkIsU06HxYcGC0Pj
         5RBrzgZ657/bgVElHq/aYJ5pUZ+OVM3lqrnh+MXBcWMv6ksqLiq4qLCvYHidtmrwznbW
         4+7w==
X-Gm-Message-State: ACrzQf2W3eWoxP40DTomYclXlRGva/7z11PP47yE2IhkWdU/pKyF6Dz+
        Yjm8Y9gt4Wzkc6U6mU1L+BggNA==
X-Google-Smtp-Source: AMsMyM5OMggdDcDt9tiAF+qSaGT2pL3sFWbXDzeUJw2Ym+6LVF4OwoWI14xxEPaI4Qwsw7yhOXGkQA==
X-Received: by 2002:a05:6512:3502:b0:496:8e:9307 with SMTP id h2-20020a056512350200b00496008e9307mr12262052lfs.504.1664352216681;
        Wed, 28 Sep 2022 01:03:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h27-20020ac2597b000000b0049f54a976e3sm406028lfp.58.2022.09.28.01.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:03:35 -0700 (PDT)
Message-ID: <6ef4588e-5d03-953c-1ce3-14ee1a456545@linaro.org>
Date:   Wed, 28 Sep 2022 10:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq6018: fix NAND node name
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201218.1264506-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927201218.1264506-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 22:12, Robert Marko wrote:
> Per schema it should be nand-controller@79b0000 instead of nand@79b0000.
> Fix it to match nand-controller.yaml requirements.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

