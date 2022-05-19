Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C25952CF7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 11:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236170AbiESJgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 05:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236139AbiESJgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 05:36:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F0839819
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 02:36:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so8127624lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 02:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=onybpRz7wsYWveJovLHOrWhVwS59mEc1/1KqKRSfSM8=;
        b=olD6VpysjkH0jLBOwKjjLej//tuHVwkIXXvAbGNnkujihoM1hth00fHiy4HmnOqNz5
         NurMeKarjQ4KzGRViIgyAzi5Zk/wL2z6jKZ9zBzmX3bRmP4WD59B3/rBulhbLuq4l9Ud
         VpvxatVl+qtrBoAguRV04PA8ETpuSwLaxmnQuxAyU5sfk0ILo5BMwn2SAUUljJMXbKUc
         DLPQa2FbCUKLE1RGq39iGIZvCPgv4D9vLYptATyWeLzJJg4Dq4/tC7D2Ra/x4uw67gMa
         5VF+imrYYgwcuqyZjksGQ0UHackcL+i3IEl9XQ1bnqU3fDXW0d+ACJW8CtXn7kZePN4e
         gdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=onybpRz7wsYWveJovLHOrWhVwS59mEc1/1KqKRSfSM8=;
        b=EmBDSnVzbNjaE8os4voA9wFXfuKSijxK0Nzi1iJWpbY4AHkHqWZ075TRYareiJGS77
         1FVzXDR5hWPVLuCxQRx8iVm52aIdWaB/Sz9cHpppoosmVNTD7C/VywTuxaOiyB/ESBlP
         bltiOYDFi8ojTxZpp778G3+Ct1QGSioTXEhga7Io6sTJmnQmOsYNP8aykVvKriTm3HAJ
         Ber6wDVJy9ZR5ngAPUc/pG1tnbrVmoBnilQ7K5Fq35jfEO5Ggde4oV/Fwit35JEo370k
         6VgBECUoGEXroKNy4SjuOHlwykJjJMEoDF36Gd4AtmMTplX7NzErHkG6fuRhJ2ebQqCH
         p5ow==
X-Gm-Message-State: AOAM533/iyJ5amK/o/HafDEqlzUwvofhOgDzrXZwgvlofyalsvcZGs/g
        UXeZBxsqT8Y47gJ7Pbbjv3wBZQ==
X-Google-Smtp-Source: ABdhPJxntgUVPNj76bvSLwp38vj4ad1KYCyoyK/YGXfzgWo8T9TlfdVXZQL9W1xLmskk+oq6gg6EgQ==
X-Received: by 2002:ac2:4c51:0:b0:473:ab19:87d9 with SMTP id o17-20020ac24c51000000b00473ab1987d9mr2679623lfk.634.1652952962883;
        Thu, 19 May 2022 02:36:02 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o25-20020ac25e39000000b0047255d21153sm226325lfg.130.2022.05.19.02.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:36:02 -0700 (PDT)
Message-ID: <9425835f-1674-225e-9558-7b2ba1952879@linaro.org>
Date:   Thu, 19 May 2022 11:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom: Document xiaomi,natrium board
Content-Language: en-US
To:     Alec Su <ae40515@yahoo.com.tw>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, y.oudjana@protonmail.com
References: <20220519074112.25600-1-ae40515@yahoo.com.tw>
 <20220519074112.25600-3-ae40515@yahoo.com.tw>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519074112.25600-3-ae40515@yahoo.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2022 09:41, Alec Su wrote:
> Document Xiaomi Mi 5s Plus (xiaomi-natrium) smartphone which is based on
> Snapdragon 821 SoC.
> 
> Signed-off-by: Alec Su <ae40515@yahoo.com.tw>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
