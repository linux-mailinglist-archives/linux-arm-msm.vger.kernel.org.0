Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD135FE422
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 23:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbiJMVTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 17:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiJMVTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 17:19:14 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA6539BB0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 14:19:11 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id o2so1302069qkk.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdQa4Sc6lXPDk4eLVgKrBJoxIwtdDyftfTuzXhtgqag=;
        b=xXiLtrZxmTJB0QUjoV2MP5lRyPH9qYiv0ttgpO9VVSoyoWFECmEGWcP9HH/6IL+6i6
         XU/Is8HVR8PbwCHLAAyAp4GCfrWse7/omn3aEEzTdy8GUQyjzffw5RkSnNNphDS+S02F
         pVq8itm6asblEVoFLtJ84jkH7yHO66BoFnyzHimOR5Y2lluV8mCR3DBkUPp3QZXSU8gz
         5L/9LFdXgWh6Quic86DuupCKA62r3xtj6/renFCxaXKb7WPgtJ36wIEXOS9bPxhB5lzI
         4UeNQdze9t69+l2na90cg7iS625zDyb1Fd15Te2pm/+8/eago27aEi6Ew0Jl0kdHlH1O
         gWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdQa4Sc6lXPDk4eLVgKrBJoxIwtdDyftfTuzXhtgqag=;
        b=Iamo8j+B9NcG9V/poZdzoPjhLnNp8a40KjljY/wQhHzMG9mbfourxwQikwLlhf6J1A
         X6/MhD8pfg0bTHjp0Xd2i37i1KaKMwScpczRC7VmvHdjVwPlU0doYhIucKi2WTllT918
         zesthOmY5xBgcZ6DI5RCQTLld0uAy0z17cuwHh/GDiitjLlSHjmb8QNrQj/gR1MFScOr
         DAoGYxYe17SJ643D8rmcU3Vjl26b+Ox0Pocgtn7KeBGTonVY2I9tCAf1o/wXmv38nCqV
         WI5V4vVLo/aO24I6SKe3ErWHq6bzdRXE+PS+3j0cKm5lQ4j6VkaQrZ7PjF7qGi1T2b0e
         lnew==
X-Gm-Message-State: ACrzQf3iDnt4rmMdrqvoyL1WyM2XiO5Tw3+BTP64kfgFN/lBO8vUIGF9
        wKBNsowhnOC+f2r1Eyng+USPlg==
X-Google-Smtp-Source: AMsMyM5FSEL4ZcJOm04pRm55VzmthYq47dNfsl4AJ3TG7oDdZBUrvCAwTXawIX1+kP1G3VxgQ/pFvg==
X-Received: by 2002:a05:620a:4622:b0:6ee:bd1f:fef1 with SMTP id br34-20020a05620a462200b006eebd1ffef1mr1569030qkb.778.1665695950902;
        Thu, 13 Oct 2022 14:19:10 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s19-20020a05620a0bd300b006bb8b5b79efsm661373qki.129.2022.10.13.14.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 14:19:10 -0700 (PDT)
Message-ID: <f824335c-893e-33a8-5889-df817ab5362a@linaro.org>
Date:   Thu, 13 Oct 2022 17:16:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/3] ARM: dts: qcom: apq8084: fix compatible for l2-cache
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013190657.48499-1-luca@z3ntu.xyz>
 <20221013190657.48499-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013190657.48499-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2022 15:06, Luca Weiss wrote:
> The compatible "qcom,arch-cache" for l2-cache does not exist, and all
> other Qualcomm boards use just "cache" for it. Fix it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

