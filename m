Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE25569808
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbiGGCbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbiGGCbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:32 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A9F2E690
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:31 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id be10so21935331oib.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=toy7Vh9evhy+pgP1ujT+/9BHMTnFqA/22pVpy0wxf7Y=;
        b=c0vygMx1bCGolwRhDHRBlO0CoxmAGDm8jm6e5Aiib8nX++0g9aQEi1kjYlOXQIN07D
         c28WE3Rdb1uqmEJYOd+AexvHuuTls/u9PHAJCpPYF3Kv8DtCZP+Sf+ocotPjSCi3FQKc
         qr6rdL36Eyo/yFClOUkcqN0UpwKi9tH6V0sF7FgH9R9GOTxWjlMEAmD8RZWkcXvuUNqH
         1IIfBuRCm2/Qnq0omUx3zHtUuDzJV5ZYYBeOcWMsMnjxNX9sVoVMeTRMNwmlwt62MsfL
         EbGZWT1IbGfXl+yXsOpmKMdBt5OxxWwlAqwFhsZtjgwB7aJwHV7xyH3LUDA4pZ4H5LO9
         AHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=toy7Vh9evhy+pgP1ujT+/9BHMTnFqA/22pVpy0wxf7Y=;
        b=cSr+mRb88TCTjlEA1+clzUjNxcs5EsBegI7TwIa807GnS3Vi7cicImWh55k6+Xuv5t
         ei59wnsLDypHjyBF4ZGMZegi2X0yZ2g01nMNf/76LKdpYBPk2326JXaPI3rdKzm1Whx9
         +qW0FANjw0NqgvlFqJPVztl098yGSjCMGo0poff6OCNCGylhVXyfYwM0ik+DSI+e9ekd
         ZvN1cooILwH0ECV/wUz838CuBKaNfeJLg5gEIJ1pY7jRAQ4dhUlH5j6Ecle+otUJXy6a
         MI5XpMJSYOXRYpjX0+kGAfQuVz9JpmXMdwh02zg8FzuEnbNi71yqT5IIYkBLxNKXXlFX
         kXDQ==
X-Gm-Message-State: AJIora9tpBDu9G+DsV2kI9FXkz/9B8OYyjgmh+34oQvzcuVQt3DE+F27
        vWsKTVW2m0d6kbleqOJGy0Tyrw==
X-Google-Smtp-Source: AGRyM1tsdwefRGXNO/afKrOxgjNsKCTOA2PNSZsc7wMmOWdIAxgAu5gCKVSjwRIW9K3vEBq1Oz3A3Q==
X-Received: by 2002:a05:6808:190:b0:335:b34e:87f2 with SMTP id w16-20020a056808019000b00335b34e87f2mr1056071oic.193.1657161090733;
        Wed, 06 Jul 2022 19:31:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/6] arm64: dts: qcom: msm8996: add missing DSI clock assignments
Date:   Wed,  6 Jul 2022 21:31:08 -0500
Message-Id: <165716107315.864223.4625751110199099026.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
References: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Jul 2022 17:54:07 +0300, Dmitry Baryshkov wrote:
> Add missing DSI clock assignments to properly use DSI PHY clocks as DSI
> byte and pixel clock parents.
> 
> 

Applied, thanks!

[4/6] arm: dts: qcom: apq8064: rename DSI PHY iface clock
      commit: 9c10bb43db82bc9289af50c39cc940aff79b7aed
[5/6] arm: dts: qcom: apq8064: disable DSI and DSI PHY by default
      commit: d8e51f13c31c585caf6a9497627ecad14e78211b
[6/6] arm: dts: qcom-msm8974: rename GPU's OPP table node
      commit: 864cfdeb76735909a9afcc314416ccaa1ce82a1a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
