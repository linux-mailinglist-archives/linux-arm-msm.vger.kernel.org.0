Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53A776D091
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbjHBOuF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 10:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbjHBOuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 10:50:04 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7D2E43
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 07:50:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso75180115e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690987802; x=1691592602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAHVSaTsySp4/iq2nezztbJaxbq3n6xFWH6opjsxQZA=;
        b=M+Y123G+3t2JAhPzr+rtwee6kv/L7NBbRe/ovY5qN/rqfBJhUVy4Sb7a4hsiSA4sgN
         I9pIG74RIrHVoy//3CF4saaAL0ZnCIAWOFYPiUiVMVhluT6aGqmdxC7mPy0zH7QOo+Um
         ueOR5iAr7sNyxlESx5VTX4I//7UkCVWUeB0LgnvtABOHIzUbbNIWrjgQhbFDWT01imO7
         sR7SWlWlcTj5Gquorw2OK7fIkchwBD//VztSmwoCpHGXDw0iuW3cd6exSAw3YWnjmsUg
         69cydWH3nLT7KOKpKdenZV5ZKQL9NesSPpr9tAbF4L1mBRLDOCKGPJVzZu9VxiLUxGdr
         4iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987802; x=1691592602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAHVSaTsySp4/iq2nezztbJaxbq3n6xFWH6opjsxQZA=;
        b=IVYza/6MSkcZhdF0Aala1qfsA94xasYGjyLjLzz9Ss2E3ey4u0kMT5h6PjQno21Bnk
         QD2r1oz6211nsH19mHpvtCE3TmYbDgU9VMoaIqP7jT8rJRJ6aL8hmahBpovrWBVsgxLy
         Kd1ghdr6RceqdDfZLgDfcOD1p6iWe5/a/HA1+CW04pqaLIkfCXxrdd7+v/9VlxA5+tKn
         hUNlsVKQlk0cvDyzEStMN3K99hKg3szxYR5r2kzfb98zY/b2iVxEYvo2L/V7IfCt/5Vs
         mF2XYalo2jj6RALrdg+kiSSTTNrj1bE0JLt9ioiSOWYi0CmYTn7D7AbG80OvQhk2whlI
         ioBg==
X-Gm-Message-State: ABy/qLb0+3KJwAjBA0kQxivOb9C+mTxdKniruZQdUvfke/XqQyq0UNvD
        XzQd/3WZFkeTHmFJK8PEFLCntQ==
X-Google-Smtp-Source: APBJJlEzu7CcvSRCRrpXtSbaIgiwpZkEdzXPjBVGlCYX6V2naYqBMNEjp1X9DV/azZf9+tY0RZZpKA==
X-Received: by 2002:a1c:7511:0:b0:3fe:2f31:8bf7 with SMTP id o17-20020a1c7511000000b003fe2f318bf7mr2274718wmc.26.1690987801929;
        Wed, 02 Aug 2023 07:50:01 -0700 (PDT)
Received: from lion.connolly.tech (host-92-17-103-66.as13285.net. [92.17.103.66])
        by smtp.gmail.com with ESMTPSA id a1-20020a056000050100b003141f96ed36sm19371033wrf.0.2023.08.02.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:50:01 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH 0/2] power: supply: qcom_pmi8998_charger fixes
Date:   Wed, 02 Aug 2023 15:49:27 +0100
Message-Id: <20230802-pmi8998-charger-fixes-v1-0-a8f1e8b84c1e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdsymQC/x2LQQqDQAwAvyI5N7C7Bc32K6WHVaPm4FaSUgri3
 xs9zgyzg7EKGzyaHZS/YvKuDvHWwLCUOjPK6AwppHugkHBbhXIm9KozK07yY8MYOx4ptZS7Fvz
 tizH2WuqwnPda7MN6hk35Otw+X8fxBxiOMv6AAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=499;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=YdEfPeF3NGtDiJSPgF/VR890I3V+DxDCuwPEWivcz2E=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhpRTuRKxBiVTK3j4p/A/zdtwhL+VRUXY/spz5hkvqv/or
 bA/vvdKRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIhwWMDFOKYzjnFETGPPvv
 UXmNtW7BMzGX826pBuuWVd2S5Wl2j2T4n/Kz48CipsDOppWOKVOmxJve7l7nEzPJ/R7jjHOCcqt
 3GAMA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the useless CHARGE_CONTROL_LIMIT_* properties and
fix incorrect status reporting on some devices when the
battery is full.

---
Caleb Connolly (2):
      power: supply: qcom_pmi8998_charger: remove CHARGE_CONTROL_LIMIT_* props
      power: supply: qcom_pmi8998_charger: fix charger status

 drivers/power/supply/qcom_pmi8998_charger.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)
---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4

// Caleb (they/them)

