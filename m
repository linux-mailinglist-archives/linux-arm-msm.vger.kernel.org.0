Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C0A51C2FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 16:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380826AbiEEOyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 10:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380811AbiEEOyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 10:54:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414C456FBD
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 07:51:05 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t25so7875140lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9gmiWZUovL4EgKGZv1XysM7Vv9JRtdnlzkcKGDMZaRg=;
        b=Glo5Jq5MFi9MsPbdn/xQ47c2s33ISP0qerYzTtbbmoSr9Y3I6/3g4V0H/1NA+Jq7KG
         XFWqveM5p/rgq+OCM28cunt3DVq13+Iud7eVwkg64FDK2UqKqyjFBQBmbOPTBeWVyTv6
         tQf6D5fuSQ9OsrziS3Rg4GP6wQCoohwPyS3F3q5p84eNwawqJk0zIeeiJFd0CYcsT789
         RF2n7Y0TszTNISlC6rGAyEZ2aTRp2HmB1JVpKCF/oRyuwzOU8BF9pdJfbbG5QE8gpiEp
         fVxL7ZnOt4KNxrYc9Ugur5Pkhy6eE6DCAP6Ds8AVi+xIN56rIMcaizWNO0ph94rUJjhT
         GnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9gmiWZUovL4EgKGZv1XysM7Vv9JRtdnlzkcKGDMZaRg=;
        b=r66YQ/0EnYib3HdCnrDBFcsKEb5bW8HngKM839+uKD1+l6THPyYWRfhOqA/DZcMYgC
         gUtVhgDOmT47c10Hy8mlATXLkeUHq2mXhqTdqwyynNbM1BrmdpxftRyUzZ2pMsK4q/eW
         rFbodleGm1Qw9mYIN3CoqvmpxY8D671yiBjQuFBQ3bEyZPaHdX5MdUmW3J5omXhfbVji
         KMJlxNzyAsWgbbiUP6xgcvtk9K0VBgOs6k4PIk5dcxI6EI1/d4ffkTYWwuPbhH2rfveR
         a36msmmMj67pn4FuZsTXAgWHqa7yXq8dVTCE0ev3fULSQUPRoJ8xongHl2K6+8XeSzB0
         SZ+Q==
X-Gm-Message-State: AOAM533HRG+ETm97/0zMl58omoG7AABXlCYOKIipGNXQkylegwVR+2tu
        kIlcV7gYJ1i7MChZkEvwsAG6BQ==
X-Google-Smtp-Source: ABdhPJxatxTiLNG/Ew+NLjt/XkRR4+0vVsMgTmDXDyddLLkegRDoKBINoJbJ8kvEVw+Jwix50aaHQg==
X-Received: by 2002:a05:6512:22c1:b0:46b:a2b7:2edd with SMTP id g1-20020a05651222c100b0046ba2b72eddmr18954384lfu.133.1651762263526;
        Thu, 05 May 2022 07:51:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h5-20020a05651c114500b0024f3d1dae8bsm227238ljo.19.2022.05.05.07.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:51:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: enable tri-leds on RB5 board
Date:   Thu,  5 May 2022 17:50:59 +0300
Message-Id: <20220505145102.1432670-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

Add LPG device nodes in pm8150b/pm8150l include files.
Enable three user leds on Qualcomm/Thundercomm RB5 platform.

Dmitry Baryshkov (3):
  arm64: dts: pm8150b: add Light Pulse Generator device node
  arm64: dts: pm8150l: add Light Pulse Generator device node
  arm64: dts: qrb5165-rb5: declare tri-led user leds

 arch/arm64/boot/dts/qcom/pm8150b.dtsi    | 10 ++++++++
 arch/arm64/boot/dts/qcom/pm8150l.dtsi    | 11 +++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 30 ++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

-- 
2.35.1

