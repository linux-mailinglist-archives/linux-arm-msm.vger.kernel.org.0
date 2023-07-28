Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A392776650B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 09:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbjG1HPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 03:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbjG1HPk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 03:15:40 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583F72682
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 00:15:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so3093535e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690528532; x=1691133332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fotJlPLg/3aVUxDnfpn1ssIHFZgy6nasrdy2qS4uw1o=;
        b=G9zqfbBE7oUr1T5JHk0Kxp40aesKAkeUkCeMGoowd7iZ6Tx8/opQxO2k4/AYGBq+qo
         80+NVU24n9WaHdlAIdaXH3s1PLfE5Rb7l9X2bsIK6g1cm9/JD/Xtmfwrfi+Qruv95zN5
         DfJ0mTTaNJixDo08F8c1f9F3+R9NjIfqWuMvAdS7w795HnFFZ30se0hFVrJK6DLVzHP+
         WUVavpibE6QCdQDlFt9ikbA7ASbV9AfOUFjSgvOq5zVmnRNvp4FlH7cevhiO/glydjMg
         TgpIUTfms0a8HyVtBdJAdqWNzsL1QYz56XmCQEmpGbXVbXrBmskrXkH2lhJoyPezKXLk
         +b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690528532; x=1691133332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fotJlPLg/3aVUxDnfpn1ssIHFZgy6nasrdy2qS4uw1o=;
        b=faOgVyj2K5aHbcX4GTtjFM2CtB8JPF08oI3h4kbkKyGNFga+8pcSVCUF/RvoOVOQk5
         yndlZJWajm4RiBssDt+XFMlfuXj64w/i3BQSRdePpDmAqnMtmJp2j0NNzjtBqRcwm8A2
         +Gqu5UxKTOUTjc24gDM3Nc9nj46hm/KeWurd/F0b++Rbk8PTjEbbcvxnSn5snALRG8HJ
         XHoZBqShMMcKyo0J+yH1tY6L10fXG+/X04qaPK+0WsCX/F4bjVhzUlV2gx9VFQ/ARnDk
         tnfZPJhfcGKbH1ZXX5xmiOi8hdw/WPr2PwamEw5GZg8nToR06KNIsT6oNI1RyC/B0AZw
         /zcQ==
X-Gm-Message-State: ABy/qLadDfBh865VGemQqtUrbq6yz8hvEBQE54iiMJ/eEyOG6StHUTuu
        9GuTAhSElTYM1uTWjYXEZpHJgw==
X-Google-Smtp-Source: APBJJlHDzG9r3L89z7e8mDuIPzOfkoQJTIEtNvhM5Z9fsZxbzQztOLAMUV0qIc6ViSlMzQbcQwx9Pg==
X-Received: by 2002:ac2:5b9a:0:b0:4f8:7333:d1fd with SMTP id o26-20020ac25b9a000000b004f87333d1fdmr1168724lfn.34.1690528532577;
        Fri, 28 Jul 2023 00:15:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n10-20020aa7c44a000000b0052238bc70ccsm1469189edr.89.2023.07.28.00.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:15:32 -0700 (PDT)
Message-ID: <11718654-24ed-ed89-81ac-f773168e216d@linaro.org>
Date:   Fri, 28 Jul 2023 09:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: qcom,sm6375-pas: Document
 remoteprocs
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
 <20230725-topic-6375_rproc-v5-1-a8e9cde56a20@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725-topic-6375_rproc-v5-1-a8e9cde56a20@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 19:33, Konrad Dybcio wrote:
> SM6375 hosts an ADSP, CDSP and modem as remote processors. Create
> related bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

