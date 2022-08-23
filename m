Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A280E59E5C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 17:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243452AbiHWPMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 11:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbiHWPMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 11:12:09 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D95614359E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 03:22:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id v10so13049797ljh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kW7te9++6zj/2sA/1JFiFaJwC/VuRhhQ3+OUD8QzdyQ=;
        b=N+3+nblwaKvranNQu5ZLkFEJVD0V8Kh5L1aCicV8oOG4puiJizV9xHY/vNdRlz/YCM
         JD0EzOieszeOq1Ev/NFpfYlgnlK6Q1vWCk5MK2sEAD0SvuS2evY3mpagh+yDJIL3HuQK
         1fDkSspBXg4AFXl9Jp5mD6W1pWHY+/k2SEhbvjj0aXFWSxGPQvj5i610itPmlpXif0il
         qe+p/TmU75rvtSRUAybCkAXGRsUwALRO/hKj18XGoLgB31yMBvFTv6w+92VA3eRl6ix9
         RvPGkGjgwWdaZPNV3KuoVHBpcqMxMB/3nmcH8mgmKSnlZlhK/gmVh9bpnINTkDzs7ReY
         oUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kW7te9++6zj/2sA/1JFiFaJwC/VuRhhQ3+OUD8QzdyQ=;
        b=mt7SoimNGX/WZxSg/fjFOaHBTX3jnlMyt4r+7O7aiihUkTZv7djBHvs9dtkUqslR5w
         +gOhYux9NOrj8+6yVPzMouMCLn6I86kGnkB14MCwwvDYLWM93CfBNUqAxfGBLqlPexws
         tTW2Oc9rz3WIcmKDmr3mXjFQzG2Zr0G71TrILZ5VEMiEVcitxUkFRoOE4jsYPRDeVB8/
         a5Pm7uLfkAEh1waKYFRdn6FxbPX3xVTWYyQt5JRpnNEIWoiuJSFtcL8nCP3otHXOeuXE
         bL8oInBvzCQH6Y0F+n7l5Jpg/yvdOmtOVtkK79VtCyP9QQwQCj3AWG9OyeJrsjY8S2Lx
         IBCQ==
X-Gm-Message-State: ACgBeo3AIZPDQpFGSgXNQVOgC6xJjG/jwJtzuyaDZo6JttBhggTukrfG
        jp7IN3eAXZXPaLPyOYRd6jpaX1d4TXxc48eP
X-Google-Smtp-Source: AA6agR4lvtDEQD5n2gZcVUqeIv4vFwxirf/UExZM2GSUkocuDpW/zvL/LU5ea/L5NBX6eKujEc1qpQ==
X-Received: by 2002:a2e:b8d1:0:b0:261:caee:4049 with SMTP id s17-20020a2eb8d1000000b00261caee4049mr3186459ljp.405.1661250133956;
        Tue, 23 Aug 2022 03:22:13 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05651c0b8b00b00261c6342636sm220772ljb.14.2022.08.23.03.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:22:13 -0700 (PDT)
Message-ID: <e810c877-82a4-c9ef-5f63-c22c246cf340@linaro.org>
Date:   Tue, 23 Aug 2022 13:22:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: move DSI opp table to the dsi0
 node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2022 22:11, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
