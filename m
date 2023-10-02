Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B797B54ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 16:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237720AbjJBOUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 10:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237694AbjJBOUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 10:20:35 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7770CE
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 07:20:31 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53636f98538so7249591a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696256430; x=1696861230; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRr3QqlzCQWTLZLmH3nUHt+TIB+s/7OFIih+wrwlQUw=;
        b=q3I/m6Sz1V6JSfTHO3I0kmyOZF6Dv6PgvGJTOq7zCq+sjl0TyOy0IgtOZPFvt30fxH
         W2sedPwviWXMz96fqgPuxZT1Or/8VN9Xrbb0cL0UdM9xlglsYgTsIe19/z+aLg8ZHeHE
         nxHc4J9T9MGQNdaq1EIINa7MqSOqjsCgyuQAfXTTLQJ3Uuq9RprN20K1EhSCPv/eoRuo
         8DoGvIBAF0cn4btnP2ik1U+s68an5yWtX3lvBf02HivgpxQZ5cla0GLfULDxwdj0o703
         2aAYKe6aH2BrGFuKvoqYn8BOK4j+7Ulueb2Go6lOKKtJE33jnzUIEv8EdLVT+7xAu89z
         tJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696256430; x=1696861230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRr3QqlzCQWTLZLmH3nUHt+TIB+s/7OFIih+wrwlQUw=;
        b=lViKcaaCHnoH19OWUWbmL+6F9DLjiTmBwydzcMenLhAapzQK+4FZc6vwPzAdgnZIT3
         8oWD2wkg3bf/6fpTWzHBQLQeHB+WUHPUEkvWZYTeGQWmIsNi1GyVL5OlvB7nwLDj5nDj
         7V+iHGWyo3tMsRwUsKTpf4cIy3zd6BlmW9JgDg1eb0bi4ZaeR/y+e02L7n7bEVUV0piS
         BVbRYAJAMtUNIGFXBR8qCkJgnNlFRkuN79UGh7EK+2m8H/1B8af1EV2B0IoJNuXcLjdE
         A3FtwoWsnETFUda9UbAa3W4rSWLpp9JtZ2y496sp2lFtYc4gBkM42bQR9SbQuze+c1B7
         P+gg==
X-Gm-Message-State: AOJu0YyP5vCpY3RaAlf+Befqkx2iao0AYEXotHuVpVRcPcW4uEGBZCZC
        GbyxI9SOiJSujv/qzuxsDlurhA==
X-Google-Smtp-Source: AGHT+IG+5pBPGpfhRiQjipm0PUKoj/S0erQoDK+x+Adetl3oP5iuERhHtv3d5+mNQUvxQIkjUjcv/A==
X-Received: by 2002:aa7:d80a:0:b0:530:a5d6:583d with SMTP id v10-20020aa7d80a000000b00530a5d6583dmr10118640edq.11.1696256430236;
        Mon, 02 Oct 2023 07:20:30 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id w10-20020aa7dcca000000b005309eb7544fsm15583356edu.45.2023.10.02.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:20:29 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Enable venus on Fairphone 5 / non-ChromeOS sc7280
 venus support
Date:   Mon, 02 Oct 2023 16:20:28 +0200
Message-Id: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzRGmUC/32NQQ7CIBBFr9LM2jEUQimuvIfpguDUzkJoGCWap
 ncXPYDL95L//gZChUng1G1QqLJwTg30oYO4hHQj5Gtj0Eob5bVHiU6PCiulp+AaBCn4wSirrbM
 G2mwtNPPrl7xMjReWRy7v30Ptv/ZPrPao0MfBmTHOvXXhPAcu65ITHWO+w7Tv+weNjcDwtAAAA
 A==
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Devices with Qualcomm firmware (compared to ChromeOS firmware) need some
changes in the venus driver and dts layout so that venus can initialize.

Do these changes, similar to sc7180.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Reword commit message 2/3 to be clearer (Konrad)
- Link to v1: https://lore.kernel.org/r/20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com

---
Luca Weiss (3):
      media: venus: core: Set up secure memory ranges for SC7280
      arm64: dts: qcom: sc7280: Move video-firmware to chrome-common
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable venus node

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
 drivers/media/platform/qcom/venus/core.c           | 4 ++++
 4 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-sc7280-venus-pas-ea9630525753

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

