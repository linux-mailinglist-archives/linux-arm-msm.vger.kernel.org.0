Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAED3604C0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 17:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbiJSPrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 11:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbiJSPrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 11:47:19 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291A11D5849
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:41:52 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id j8so234277qvo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0ceYVTwSJB8ccQZxmQCbl2zZtcaTBh+8PZFVFjj7pc=;
        b=lAPeGU1vVHrIERvJnn6ykIPOI+2UFW7fRoRaqQxRk4IfJzUdXaB62b8qt1ay5U2Kre
         pezihyOgPFtbxsK27L4+7wB4jDNBD4Uvv4PsVhUVoUXvmu8agK+FkR0NUWKRn2kvIP4W
         BPz/q5ZlZSbTOqw8A/IshgTa8u8D7NRJC4huz/nhusYlBZWgErPZfdagLh0Xax6qRrrK
         oDpwjlBrPl7+gVsH0pKXS97jWURZvV8645li3zLPjc5MkzJGDLj7JHN87IrEYN+55FKy
         6SREwO7qDnAPqpz/S9ZN/iPXfLnx8hxhEx/mU3IB9jk0GBzbG27Dj8qn1xDGUiLcZ0BA
         XA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0ceYVTwSJB8ccQZxmQCbl2zZtcaTBh+8PZFVFjj7pc=;
        b=ZK1stPM0+gUsUL6Vio4lxmLW4UXKBMCMB2vUGBGAxJunRi22u6QUJOSmgDj1NimPib
         af64J4PB4mmb7Ob7uqD9C5jgNaDHc/jxpw28SmOmr8OijKzgPNTOvrmeVTEY3B077cub
         MTugs2/IFWvmNLtqNxiT6fQ3Ea4mYCM+gft3SzAkV9rc5khWmydlNyXfS7ZsUYnj+20z
         4JQ+8iFzr6sK+4e/sxFbwJvlbLIJFEEPefFRFV5BwKLrDVlx6PLsj4NWUSyPf3POAg0G
         7pST+AQDT/us+R+gFZW51RXXRKL9A1yows+61lpeNqTIPCvOW5ZDP5lFmwOUDzPsRmsS
         fVnw==
X-Gm-Message-State: ACrzQf1Js2HZHrLFVv6Xknh0HGbta+Bye8tZwL00AylLrNkHuKQLANoT
        HPeaTV6PBPcwEBbb6H1OxewArQ==
X-Google-Smtp-Source: AMsMyM4690QIj1e5aDq+SATm8Xi8DLIniBPwM5FgSW72DXTEXRxde1H/kFDfoKWVHqvr7oQ14AbQ/Q==
X-Received: by 2002:a05:6214:2a85:b0:4b4:3f9:2639 with SMTP id jr5-20020a0562142a8500b004b403f92639mr7271033qvb.93.1666194102877;
        Wed, 19 Oct 2022 08:41:42 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id s7-20020a05620a254700b006ec59941acasm5250673qko.11.2022.10.19.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 08:41:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 4/4] dt-bindings: pinctrl: qcom,sc7180: convert to dtschema
Date:   Wed, 19 Oct 2022 11:41:40 -0400
Message-Id: <166619409804.178762.14168255120927060733.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019001351.1630089-5-krzysztof.kozlowski@linaro.org>
References: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org> <20221019001351.1630089-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Oct 2022 20:13:51 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm SC7180 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[4/4] dt-bindings: pinctrl: qcom,sc7180: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/ee3d25dff30ca1a4a2afa66da81465accf2b045a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
