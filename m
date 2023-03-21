Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6870C6C3D79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 23:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjCUWMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 18:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjCUWMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 18:12:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D46567B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 15:12:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y20so21015617lfj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 15:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679436767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCUJY1Hh2EModZGNwH3Cf81RyZQkzt9KGfduADVwZqc=;
        b=hLPidQvGUMB5Bz3P75QcMGu89KyHxGgata9Yb0577gCwAgqVZaOj9u6vWxMs6ay8Yz
         Bs8ShjszRic24iBvTcdihJA0ihybRFyZQIvf44G38klno8DOTDuD18lom2rOLum+fUyQ
         f/VR8xzcG4cdlMLSXxEJeyqjXJuswiIv8we1LFGE4AzB3Nh7nRQmSqkow4DKT1aupg2l
         uOyLYc4ev9TyFa1aLFnR5YUD0CO2WVwRGT+8ARLF8D6UxpkzYsRwKPVtbFjnQlFSfQAQ
         cJ6vDQT0lW5PlnKT2RcFxA4cLBmLueFd34L28A/x2K+nGPSkYPBnk+8Oo14FaJThYVHP
         CXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679436767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCUJY1Hh2EModZGNwH3Cf81RyZQkzt9KGfduADVwZqc=;
        b=nQuQBkBHPRkBCZVV9Ql0EhWCIfD1IjZSwV6Ws6zIUB7mUXkpPogJYtJqw1HdNcF/nV
         tv2kYGnm5OKifJercDCCoRSYke76j5t+da9RWtqasJWIrkb/xEcZohGzl3mLXZIZfHyC
         2hbmqrB6UyXu8UWBYWY5HbfGM461w7BYX560crFXBqne7vgNcbQW+OIThV4QV122xkHo
         uPdlDhzyRyZtdI3kCPUxZmcqVkD/o5P294vd460ycG3JWfnwnjEYaIHDJUnlulCIVi1s
         eQsEz0miisz9OoTgAooN/N9KHt8qBhsRYehgisnEGZj5Ym/H90/hzCjJoLxxSRzl3tMp
         JLLw==
X-Gm-Message-State: AAQBX9d++U0j+XvqRv/BsVMlv7tKofQ4HRSRrFPR6GtUd2squyqpLd2s
        RLAhyNoo0WcRxLGT5h3Nol1VbA==
X-Google-Smtp-Source: AK7set8j50UEJEfSenglA09AC7xT7EpQaTHOGI7NOY4txTgVS53FJNoG+bBaHqIcASRnCcvMKMG+Cg==
X-Received: by 2002:ac2:4116:0:b0:4e9:6097:add5 with SMTP id b22-20020ac24116000000b004e96097add5mr1363441lfi.66.1679436766836;
        Tue, 21 Mar 2023 15:12:46 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id o15-20020a056512050f00b004e9c983a007sm1220344lfb.289.2023.03.21.15.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 15:12:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 21 Mar 2023 23:12:28 +0100
Subject: [PATCH 1/4] dt-bindings: usb: gpio-sbu-mux: Add OnSemi NB7VPQ904M
 mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-topic-sagami_dp-v1-1-340c8bce4276@linaro.org>
References: <20230321-topic-sagami_dp-v1-0-340c8bce4276@linaro.org>
In-Reply-To: <20230321-topic-sagami_dp-v1-0-340c8bce4276@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679436764; l=1173;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hofgD3Pg2Wl7Hj4Cs3d2T2t9S7MypKBJJexKG0UTF+4=;
 b=FVYoL7k1VXDlpelZPfqkyTov5Jj9u4GO0zOfomLqGzPF/uKldcr7iBGllsbkkxNRgpSUK0ceumzo
 oUlkCHjkB4nxKbFPnVXNCPo3IIkpw6mxUGewhAwXAVu6P6CDhu+8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The OnSemi NB7VPQ904M Type-C DP altmode redriver provides SBU signals
that can be used in with the gpio-sbu-mux driver. Document it.

Note that the -mux suffix is there to indicate that the gpio-sbu-mux
driver interacts with the mux part of this otherwise quite sophisticated
chip, leaving the "onnn,nb7vpq904m" compatible free for when a proper
driver taking care of all of the chip's capabilities is introduced.

Ref: https://www.onsemi.com/products/signal-conditioning-control/redrivers/nb7vpq904m

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index bf4b1d016e1f..a7206009b691 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - onnn,fsusb43l10x
+          - onnn,nb7vpq904m-mux
           - pericom,pi3usb102
       - const: gpio-sbu-mux
 

-- 
2.40.0

