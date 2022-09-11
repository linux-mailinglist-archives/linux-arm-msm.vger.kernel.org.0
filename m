Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2765B4C99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 10:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiIKIVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 04:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiIKIVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 04:21:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752B726AF6
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 01:21:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so10005682lfo.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6zmGVdl11b0ROAYxJ+gThLkfrhcRSy/y+Qy1x8CThhk=;
        b=nDwGrgcnx+keVT3odto1xVqLJ+66LZ8HDgiH7wW8CrzwTOv4pckH668zS/bDdSiTBw
         Srv0Q42Qzr8FB/tKKZ17vnZU13bb4gnpkkPW5unaeWOIOLWqOUs5LBpili1JzIQJIMt5
         e6YZi7AYxbqhbpDFcclG5wSmr3UeZhXzS8GSGHpr6Gyt34tb9UtAsyWDC0Sls9tuMpzB
         ecT2k45NBYNNiUxX5cldvKJfb3rWwVo1jCk3QIWrxAA6WgfLU0CINS7bm3tnZDwGsjCV
         /pfh3c2Z10/k0Q5tyL7cJuYSh/BIl5ReDo4xNN09Vr+Xo69Afbp4RH3nRmNV58OAXCXX
         yUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6zmGVdl11b0ROAYxJ+gThLkfrhcRSy/y+Qy1x8CThhk=;
        b=dgV8jYZ/yJQazJWmmOVwH5lBlZ3CrPHEcn047EfgEJ8OCWi+HvR8ONsfZCufeY3n5q
         ihA4UxthcfgyP3dLVwsRNnq7AA+Hn/3SrpIwW6ws0BmgvkXcRF/dEQv3Dl5ZgNKBO6an
         HZelMiSIIpFQS0QY633+Geq6e3MOgFGYqRiJIMiIozTUhDEKTlJ7Jb7VUK/tUeUMGohh
         tiTWDJCAq844zWLaAxH40bHOxotWGfVGy4uOFpOte3k1CwVaQ0oZyyZgtwpM0yiDeB6I
         LiHvmdhDPKGzMoayz5CzpqDxb/yFg/KZKecGC0BW1QiTPVW66FzQe1v1Tjxpdht+Ecie
         BySg==
X-Gm-Message-State: ACgBeo1q/8skVXvXz2EnrWWkuQDnhpqPpxbxwEwV6qajVLIHaZ1bciOA
        F9ZyV5cS4b8MyPmfnUKGKBoC+A==
X-Google-Smtp-Source: AA6agR4aRzDrW4zZC9GGeuLpHwH2RX8bvSmlMmS16jge3BxxOtj4fsVpMVMp/7gf0vo0+kIC37bM6Q==
X-Received: by 2002:a05:6512:33c4:b0:492:cdb1:f5c2 with SMTP id d4-20020a05651233c400b00492cdb1f5c2mr6808363lfg.406.1662884484821;
        Sun, 11 Sep 2022 01:21:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z5-20020a056512370500b0049901524a73sm533798lfr.114.2022.09.11.01.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 01:21:24 -0700 (PDT)
Message-ID: <60327375-abcc-73d0-6280-ad82af31f145@linaro.org>
Date:   Sun, 11 Sep 2022 10:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/9] dt-bindings: ufs: qcom: Add sm6115 binding
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-2-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910143213.477261-2-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 16:32, Iskren Chernev wrote:
> Add SM6115 UFS to DT schema.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 26 +++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
