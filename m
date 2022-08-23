Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249CC59CEFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 05:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239221AbiHWDAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 23:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239315AbiHWDAR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 23:00:17 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2CE5A834
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 20:00:16 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so15263934fac.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 20:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=bjV5e2UkotDtwOzVATF34/U7fC7PX6CJAnehb3qpJfY=;
        b=bHx2Z/grCVb0PTuIK5PvVrWSZQOTpvcU4vPeAw8uHdD1AZWhLrGeaENHl9cLaIZyDp
         YXe6AqegtoZLhKtNGxcWGVzvT32gU8doei9PfA2REcjXeOIAdxSBTDO7e+tIbAA5c2EM
         4Wsxcoh9wYt2FJ62xjiIsrvsIHK4478WkvRFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=bjV5e2UkotDtwOzVATF34/U7fC7PX6CJAnehb3qpJfY=;
        b=Dlhnga8zK2VxPJlviFYToe3ca0GIj+bUWW9gwTN0K1hRv77jH0AyXbqtXkiECVOOjn
         AfoNMzKpAaio3rblbM2Pz8SV0nmUNVlRckj6ma70DqYN/zfDrUKDFuNhk9wAej2mCxmy
         jYs3NtS9KtyQUnIpurJO30e6ef54Z1i/XVCloiwFYAemooFoOZBJn60C+eOWH3uvDe7T
         SU7No4ZNGkI2Y5Jg+o3sWupFqa/igOevQxq8eRo0kPLzp9M1fQzoRBCsTkuBtLLrFeoY
         XYG+mzp5PcfHK5vrlfvCKZNTQ+MGUu7ZPlPthp8QvQ7nhffOMQjR5QfBwvfPKBiTz45v
         pNpA==
X-Gm-Message-State: ACgBeo0xhxqOXcHhJ4+ykw40bAX3BjqdXzdEczvJI6Df+VK3SF6FfngY
        uAy+HRY3j/0k4k8nkddK2xH1HyXlmel43IhnoUMYCw==
X-Google-Smtp-Source: AA6agR6NuFJEoswZf0ydPYca5vlPJobYmiK3bvyMD5ngQqSkejjppZMeHrTnKI0kG94UUhEVO6QDseyu/ixpu/5VVqM=
X-Received: by 2002:a05:6870:e408:b0:11c:37ad:773a with SMTP id
 n8-20020a056870e40800b0011c37ad773amr555285oag.44.1661223615728; Mon, 22 Aug
 2022 20:00:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:00:15 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org> <20220822184900.307160-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 22:00:15 -0500
Message-ID: <CAE-0n51CNfAa1oRL4R1csdM6Q9nbAOX8UT14AOA33ZDZ-WmP+w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: msm/dp: handle DP vs eDP difference
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-08-22 11:49:00)
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. The
> aux-bus should not be used for DP controllers. Also p1 MMIO region
> should be used only for DP controllers.
>
> Take care of these differences.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
