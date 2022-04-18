Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F157F5052D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 14:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbiDRMxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 08:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240347AbiDRMxT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 08:53:19 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A488C2DABE
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 05:34:39 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b24so17267312edu.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6241TLHhdB4xCdwqVq3Y183uScpx6WRBDKMnSlRkT/0=;
        b=I1q5WowfHGg4AYWPFBJrF0k2Mm0KNHheFaFAZF+qFn44/2/ZU1wcLieZom/0LMJun1
         wAcnagi3X7LYKywHWjDtD8ofgNCACHohC6j19x17GLa0nvQEt5+OZxFr+fHYxhmLgOw3
         wdppARxZDbxGEFroC4C2uWG12zG6baWjpcfOFsTFd5Y4RfQ/D7orgYrd+l1bY+++rqHg
         i8f0G9RRsMNlVDTqFhIKpkiVPJ+W69qcrHWw/sNzmTr+u2T/1k2rYGwhViTIBqWP5LyQ
         m1wiYXXKl+bjQ3mlReChOdVt8oB1BwQ0d1KsiypiABsQdsA9Eblo7EpDwEus/g8FOWsZ
         SB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6241TLHhdB4xCdwqVq3Y183uScpx6WRBDKMnSlRkT/0=;
        b=6neVX1aTqlwpewhtdSsbujzxYbsMpEPUujKOG0OwhrGvDwQS3e0HjQ1O392qL2aj7i
         k0zlFPHwZ8IUhfcGAG9tGuRIy26Jk3f8HbYNVWVZH3bnAQT5FTsX37UAbnllEIb88R4N
         2o4uLVorkh9Gsjb7lDhkbmsf+CDoaEipcka3KAdVZ3TRZbHa1bwHp1TsClKGslBwnyhH
         7QXX/qDQlGoBI0KIEYm1+e982TE17XD6PNqq9nBtqL84cSUTK9H+xCFPK5Ek+owGHjV/
         aBHKMduXJqvudIOa6bks0zPItjbW/UN0IjP4oDq9Ed2ZjttDTN2+Vv5QAEK0Nl6yA1Jx
         MybQ==
X-Gm-Message-State: AOAM530HhDJoBwphhAtqilXRqCpylG4ikuXBR1S/JrktQUpzDnjtVwht
        4MBsFceNSjaVykaOSF3Z+9E+Zr93eEwwQQ==
X-Google-Smtp-Source: ABdhPJzaDF4We3SPdcNurLHia3kwHBzGwUL6pZjk9hZZG+CG6zXaVqs/Z3RnbdyrKl2P7P3n9lAMSw==
X-Received: by 2002:a05:6402:14b:b0:418:d06e:5d38 with SMTP id s11-20020a056402014b00b00418d06e5d38mr11797329edu.90.1650285277781;
        Mon, 18 Apr 2022 05:34:37 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906671200b006e05929e66csm4538082ejp.20.2022.04.18.05.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:34:36 -0700 (PDT)
Message-ID: <eeb4218a-e0ec-f439-5161-0433eb6a8599@linaro.org>
Date:   Mon, 18 Apr 2022 14:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/23] ARM: dts: qcom-msm8974*: Fix I2C labels
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220415115633.575010-1-konrad.dybcio@somainline.org>
 <20220415115633.575010-5-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220415115633.575010-5-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/04/2022 13:56, Konrad Dybcio wrote:
> Fix up the label names and add missing ones.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

This might conflict with:
https://lore.kernel.org/all/20220401201035.189106-7-krzysztof.kozlowski@linaro.org/

Actually all your further patches might.

Best regards,
Krzysztof
