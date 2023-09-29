Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 364877B2D97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 10:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjI2IRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 04:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjI2IRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 04:17:48 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD4F1A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a64619d8fbso1867677166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695975465; x=1696580265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66rvkY6nt3zzF0mpqUIENHQMbB23JKE+nvkcL4m8tVA=;
        b=Hb9M4+i3bpVk9jMVMtYvxuidJL2C+MXI0PHKs4puyWKeSDXwpjrvVG3uyBJzIkS6j7
         rpBuWLQCdqt4WMUyMsfetASiUJSKfRsCV2rvlFa3xwnKTxngmTvlhKE6PEPEM9DozRwb
         W5dhXC44sw0ENjNtkV0i2+tR5Ms3xIKNbDCxPJtlFsyZP0/NaRDyInG1k6Lx6AeiGCBA
         zqkC3HbOAjbzFmmGIsuv9Y09QtEhyGrgKmugPfOTaxGf595v0KePZBVM1Xge+WbN8y21
         OYhsoEcYcAyGhKkbjb5cqwesGPhS9MIgWt4Og2lrIYr3fhnRKtrujrvxiKGUtEoDIHpL
         tMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975465; x=1696580265;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66rvkY6nt3zzF0mpqUIENHQMbB23JKE+nvkcL4m8tVA=;
        b=DXcH/e3P/G+OT09N7AgRWogrmbTo31OfTezD9ieenAmHrdOZQFBn22wzRfdjeTENuZ
         wTYqvV+ORijjDJc5mSuL5pEOumwWZABZxKxJmiU5vg1tNIdgozJdz6BwKuqKE8h+ef9/
         6jTJo214Z7haVZj3ni4wx2eg7YYO9Zp8ZmENBOypAL6c+K05S5DsMdgBysUIUlmXlqJm
         9UPcm/2sCcuFN1GKcnHh0sGl69TIcY8ybzjUfLRKfS2RZnIANhiKrI7BOy/HWDbgcwut
         ctUd2beo+DUwyG5xuzxUK460cYRwtiujIbUmq07kcg1bgTwWHpOBkMmTqJqxPzXKB1T9
         CXPQ==
X-Gm-Message-State: AOJu0YwIvZC86G7WOkB9iOX2bLKyzpbNjeE4LM+HpwBqRTx6ToJStU5U
        4Zq9a/wypkmoUjw29lBCZpqiyw==
X-Google-Smtp-Source: AGHT+IEsowCAPiGmVll0HBC1o9aqBDNau907j51HRKt0KOCTcIMRKiOvbnzOQIQ53bXBnmcS9Tvceg==
X-Received: by 2002:a17:906:2243:b0:9a9:e4f8:3501 with SMTP id 3-20020a170906224300b009a9e4f83501mr2597811ejr.43.1695975465197;
        Fri, 29 Sep 2023 01:17:45 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009adc77fe165sm11873803ejo.118.2023.09.29.01.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:17:44 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Small updates / fixups for PMIC spmi-gpio
Date:   Fri, 29 Sep 2023 10:17:37 +0200
Message-Id: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGIFmUC/x2MywqAIBAAf0X23IJthdmvRIceW+0hFaUIon9PO
 g7DzAOJo3CCTj0Q+ZIk3mUoCwXzPrqNUZbMQJoqbcliOAw1esItiMdV7jPgWmvDbNuamhFyGCJ
 n8U/74X0/es02eWQAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the schema to use plural _gpios label in the example. And fix a
dtbs_check warning in pm7250b.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: mfd: qcom,spmi-pmic: Update gpio example
      arm64: dts: qcom: pm7250b: Use correct node name for gpios

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++--
 arch/arm64/boot/dts/qcom/pm7250b.dtsi                     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-pm7250b-gpio-fixup-f407ee98425a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

