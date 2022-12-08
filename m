Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCE2647A53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 00:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiLHXr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 18:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiLHXrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 18:47:55 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37321CE7
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 15:47:54 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3cbdd6c00adso32735707b3.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nKV6BT6LEw5+/sJcf0i0xfNz3b5Jl8HAfbTDKPVt8Vw=;
        b=VZPX0cvTBVVGGwtx4GT5F80JCgxOkH+f87BOJ+ZLvw4+FASwy5Jevkv3jxFtS24CTr
         7EOmoqAEmxhSdrFH54sTdwuYaLF8GC90mMIOv+WdwXKI3nif4JGFq3MmUeEkMZLr2HCp
         NwUSRTz8OkShpdsrbAZcCAVypQLDquNJZbETLv3hT2iAefubao/lEJqmXaKR5JCrS+X8
         a6EuY1TKZnxrEDADa+DLnGxSYiR6p2zEfgTS88G8CXIMilXSFNTK7H6MID+vZ2H8kID2
         Ttj9//d6z3hbpT95cK0Pz1B+NuRbXS2QkJGI4RoVsAuygMwo4VgxhBWPPBGUQJ3fgcXn
         mFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKV6BT6LEw5+/sJcf0i0xfNz3b5Jl8HAfbTDKPVt8Vw=;
        b=Pn8exA7J9DYZCx9MNxsT8d/Qi1F3yL0RxZAYmZYBmfCydzquMXqwcgoy6fipoXvxFY
         Y3o00AXNucdMkkTvcDbx9y+dXTbqgXPJOF2tC94VbvkxN0wNX6ufksxFl64yvOzuRJlj
         f8zrfKLN6mQnARat48bWmpoLsIR76Ex06/xDVQq8Fapc1eE7A4sgF6VAIdo8A4GkJik/
         lfu8U0P0OFYMCqBMulvVeZJ6hVwVk+BoRiiIZaR1tYgvomu15XP7uQrdBRDNV1CVLWwk
         1N/Vt249pa3/glczpUtI6uyv0C6t79fBrDK8GAUoXgJB1A+m2jG++0tEPN0+npZhBnDN
         gw0Q==
X-Gm-Message-State: ANoB5plwDc7Zh26MAP1OnS8aY+QQeonGl7gVw0Qiue6LMIQVR/TR9bPV
        NLlbiRcOMHmFUe25nxVXl/QvSvf6DNQXrRFcv6IWFA==
X-Google-Smtp-Source: AA0mqf6nKXdmqB7cAUt+vD3PhoN3eOlGWsTR4vgctHBKq07KXpsU91IQFVITL+i9eN10ZoLyicieXaZaj4sh1tbG05Q=
X-Received: by 2002:a81:6704:0:b0:3d2:61bc:e6a with SMTP id
 b4-20020a816704000000b003d261bc0e6amr39962281ywc.132.1670543273423; Thu, 08
 Dec 2022 15:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Dec 2022 01:47:41 +0200
Message-ID: <CAA8EJprEq6F3T7iz-oMiagosR+rdPo8Z05vgz9jNjaq2uFv4MQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, patches@linaro.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Nov 2022 at 15:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
>  1 file changed, 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
