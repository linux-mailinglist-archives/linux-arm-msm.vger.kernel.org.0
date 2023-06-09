Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A70F729EAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 17:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240881AbjFIPhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 11:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241659AbjFIPhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 11:37:36 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C39930FA;
        Fri,  9 Jun 2023 08:37:35 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-76c64da0e46so81840139f.0;
        Fri, 09 Jun 2023 08:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686325054; x=1688917054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oTjKIZ7azTHgw2pBNs7zKCt3g58q7A8ytPzbYsnX9c=;
        b=PSTbbanRUyRpN4N5vUsPWGpS/ilf/wk9SCscM2XzIDb5lY9SR1EbzrlZ+4S9u7SuW9
         0D6FxF2tO8cPaIlhkLmlfSb96jUeMs9aYZAyPry7DvV3QQHz21dYagGXN0qdjj1+wJsq
         HN5ZOZY6mrvt0d49xQDdulJBAB2N7Fl+v1w678XxL6f9zC3KArtJZHtbGo0m0kpJPWb0
         waZndZarpzB6dZWDovH6PnZGk7IqZt5pNQEep+VdXeflAu+HpQvGJlQjPfgLmCdVZbeW
         fC4tLS0JWhMl9iMbsvMXUH/nbFCZGLDWLEVPcySXl5FCBdEF5pcXepoo417GmEjkio/t
         aX0g==
X-Gm-Message-State: AC+VfDyVkgz3dGL2hiGHHWg3FziRASKlC5jNevjzFpj0RhcOheh3y5dL
        mKcA8JKDPxxLyRBgFm4oxQ==
X-Google-Smtp-Source: ACHHUZ7sQGgjnwd79XuSKsjkhH3R+CX/AXWDT5rsE/7aYgV6ugwqWjYzOSDIVHLCmJcdsuPA2SU50w==
X-Received: by 2002:a6b:6119:0:b0:76f:f54d:36ff with SMTP id v25-20020a6b6119000000b0076ff54d36ffmr1935105iob.11.1686325054238;
        Fri, 09 Jun 2023 08:37:34 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h20-20020a056638063400b0041f57eeedc2sm1056437jar.16.2023.06.09.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:37:33 -0700 (PDT)
Received: (nullmailer pid 1104746 invoked by uid 1000);
        Fri, 09 Jun 2023 15:37:31 -0000
Date:   Fri, 9 Jun 2023 09:37:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-phy@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop
 legacy bindings
Message-ID: <168632505100.1104691.4662082864689299098.robh@kernel.org>
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
 <20230531023415.1209301-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531023415.1209301-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 31 May 2023 05:34:14 +0300, Dmitry Baryshkov wrote:
> The qcom,msm8996-qmp-usb3-phy.yaml defines bindings for several PHYs
> which predate USB -> USB+DP migration. Now as sm8150 has been migrated,
> drop the legacy bindings completely. No device trees use them anymore.
> Newer USB+DP bindings should use combo bindings from the beginning.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,msm8996-qmp-usb3-phy.yaml        | 80 -------------------
>  1 file changed, 80 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

