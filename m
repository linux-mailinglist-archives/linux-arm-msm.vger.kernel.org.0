Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F38C5EE3AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbiI1R6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbiI1R6H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:58:07 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC89AFADB6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:58:05 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g1so3911252lfu.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yN4um1smP2F+TG5gs5QZ/TQl7Asm8vT5j1tAoh5EdtE=;
        b=QAYAKuTYdWnjUNkoD3f97AFFeK+Zt5jtzGznQ25QEkUbrKqHJPPwKwzVGQE8vIX28e
         mcK0vxPVfutBcX5nzO9DEON2QN0j7w3uohHrywzBH5Bw3Rze4WrO4IrwaKxJRAzMTAaI
         m+lc8dTm0Symkc5YDGoSSXRfy8xJiTV5sqaVZjI4XTudeoXlfA8NSiNJAFhekrVafJ78
         O0PR8ZJ0bcUnPAHVrRWQi9JfEIi1VrDmR81YKWjUUjOBLAKm5IgU3D9rLLWTcpTkiz9a
         d+F5vMkaRrY3NaDz0k5rrzqt5t96DRBKGNPcwZvBSmQJJS7yFZ4IVH2Xtbl2QG2dAswa
         0/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yN4um1smP2F+TG5gs5QZ/TQl7Asm8vT5j1tAoh5EdtE=;
        b=XPsKTy7oJBvNGDZuxfH0yXqu+s3zZNoHRAhN0Uu5ozGeMurZay1J6AjulYjFslPKYw
         MjX0eArAufAR7ygQJNhGJoYIZdwXV21cEMZnYdm2mbK01Fl/Fqczs3hTI9aexjq9sksI
         syWowyl+YE0HrADCKsI2ca2MOn1PwbRhKPHXrqCDlh1amMy7+8gmLTObPkYz9WlVTCQ4
         44sDk1xMC+2gP/ktXAtEJpK2ms6mUk3W55IFc4teNSKloCD2aiqFADhR/VGx0vqLMxFh
         s/RPsqLgAgKYQH9QVrm5vnjlNZlnYLgB+U/vlRGbRnjaSczz54dMzxEEL4blM1FFV9EE
         7dJw==
X-Gm-Message-State: ACrzQf2XYAcnM5zmvl9bFI1IHGfh2Do75OBU555BFjdaff2q1sDk3FC2
        0c8uAEZ0SS5C/PPDC70SdV3g4Akc/e7NNA==
X-Google-Smtp-Source: AMsMyM7Y1Bcl1q983mWPcLp0VWzsDMz3qyObuMrAc7qUT2H1IgABRMOmHy5o8M0QFdVyFh+1CSzC/A==
X-Received: by 2002:a19:7411:0:b0:49f:517c:9889 with SMTP id v17-20020a197411000000b0049f517c9889mr13081756lfe.283.1664387884223;
        Wed, 28 Sep 2022 10:58:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p18-20020a2eb992000000b0026c3fbac3d0sm502698ljp.127.2022.09.28.10.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:58:03 -0700 (PDT)
Message-ID: <c2305614-b15f-f17d-878c-6c2a0bbb2409@linaro.org>
Date:   Wed, 28 Sep 2022 19:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 4/7] arm: dts: qcom: mdm9615: remove invalid
 spi-max-frequency gsbi3_spi node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-4-b6e63a7df1e8@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v1-4-b6e63a7df1e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 11:14, Neil Armstrong wrote:
> The spi-max-frequency property has nothing to do in the controller's node,
> remove it and fix the 'spi-max-frequency' was unexpected dtbs check error.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

