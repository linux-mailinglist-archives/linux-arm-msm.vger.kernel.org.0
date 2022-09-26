Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E941C5EB561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 01:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiIZXST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 19:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiIZXSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 19:18:17 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C852A723E;
        Mon, 26 Sep 2022 16:18:14 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id v130so10125765oie.2;
        Mon, 26 Sep 2022 16:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/VPqA+Ek8QtP5pfgu0YyQnv/XSoVrA0G4H3niIHpRLw=;
        b=fPOEQI6lVhMfnSAXMPAqIav7phCwWxCC9k820xH18nQemEAgB4Fczkn4zifSps1TJ9
         mOPTpct19xBWJzE6lxphvWNZLiptaC3Nqa9kTRQW3E1nGHrKi1a4hTP0Tsm1hBu/Klz1
         ztIzrPHvhDLqolaOBm/S7veZcv7S4NOgpPIO4IzYoQUOWJOxfFZTyB0YM1WpmTg8uQLs
         fhXW66z0Mu62S5nr0AnqpnxjlfLmKhZA1foFV/z0ZmTAnhkEOCGYHd/z7FEJdjazyVob
         msLFQtxprJefZ+lDdpnUl/0HUUVpALh84YS34LSnJWSVTa+1QO3uiiPpHtJ9Ztqf058r
         dqCg==
X-Gm-Message-State: ACrzQf2n6N2biXiWhnoDkEPSxU8+ry6FUmLH3qtAc0C0ooywBjkeUPUf
        oIHlkSFB5wWAG+aApKUDP67rAATqgA==
X-Google-Smtp-Source: AMsMyM7gXM9sEcSlW/jlbRbRX1jbCgTiZp1J8NlO3IV8x9BQR2Y84Aa7gOjkqLc+YV+CpPU5wjUD2g==
X-Received: by 2002:a05:6808:118e:b0:345:9c3e:121d with SMTP id j14-20020a056808118e00b003459c3e121dmr541410oil.211.1664234293408;
        Mon, 26 Sep 2022 16:18:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 7-20020a9d0c07000000b00655c6b2655esm8247356otr.68.2022.09.26.16.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 16:18:13 -0700 (PDT)
Received: (nullmailer pid 3156327 invoked by uid 1000);
        Mon, 26 Sep 2022 23:18:12 -0000
Date:   Mon, 26 Sep 2022 18:18:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Message-ID: <20220926231812.GA3156261-robh@kernel.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924121900.222711-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sep 2022 15:18:59 +0300, Dmitry Baryshkov wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> QCM2290 platform uses the 14nm DSI PHY driver.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
