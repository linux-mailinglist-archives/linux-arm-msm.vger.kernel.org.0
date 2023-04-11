Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F05F6DDCB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 15:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjDKNtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 09:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjDKNtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 09:49:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962BFB2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:49:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a23so11014873lfk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681220959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv9mBwqllCVgpG+pErhUUNeUCHYiHOxjJVeS4sGEl6w=;
        b=IwXTez2tWetktvvP5m7tKBg3FhlY27RlN6k2MpZNkYho6oo9pEjuELaOdYXo2eU/gk
         fM/A3Sq/C8i81lqvRSzDXX3DneWfwhkT781aumY4d3caHvm2ZY+/4HTHcGxtzEmqtFif
         +OKLQyzXJ2d4iKIdrA3KViFrHX5n9qmqVEUmucP3e1L6pijFxEl3p1UA95vv1tX8OETE
         xkV7jAhN4oY2C/Tt74WPD4SxMPp76wIhU9U+yn4ig88R7UVEKoYIGZTvQel7boSkjP9L
         vhAOLCN3ysN6yyIT1+qTcpXKT8YRUh5Wd7pdq6qVakqTyilSh3kinb6SuJf5x/FsO7Rr
         b/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681220959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv9mBwqllCVgpG+pErhUUNeUCHYiHOxjJVeS4sGEl6w=;
        b=5VtdbPXcb1MV0nWyv0+0szV4njXmVcY47LpiOV6d0F51bgs2u22fspI7G56pc/GICO
         +GNMTh1hjS6+A+yB5McR9R69F41Kznc9+thaqWyXx6eS0QI9m1LHMEOHdkUy7MFPF1LN
         scVvXzPbHc/j1BhmZHo7xN1ySkidBeeIV9rEo84AhRoTz0k0EKoRWytrAjB4Dv/SGhZF
         RImy1XquPpVhtHkwLTqTLXcvcHA0y9fSPtYmPQ90cFpnITJL+k2hyShx/EKlq0MpHCIo
         +mP9gsShsJp8pRP29YmttSUjuoQr0UjL0JWsQdBQWyW4DofJl6sl82BFYvWcWBbqBErT
         a+Jg==
X-Gm-Message-State: AAQBX9ejuaVlUsYOxMhLeTNakJ+cPOsuVkJQ+Q1aM6FazdhhOgsH5o5a
        FoM1ef3aRvaJpmUlmIIMtldd2g==
X-Google-Smtp-Source: AKy350bkns+eV7usImrRqDiQp/3QtO56h9zf8CvM6NY8JvbiZa07dA0o4wQGi6JiiEu75vY47EjPHQ==
X-Received: by 2002:ac2:5609:0:b0:4e0:979d:56e8 with SMTP id v9-20020ac25609000000b004e0979d56e8mr4369535lfd.22.1681220958919;
        Tue, 11 Apr 2023 06:49:18 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id y9-20020ac255a9000000b004eb2d6160a4sm2563707lfg.32.2023.04.11.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:49:18 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] SM8150 Kumano updates
Date:   Tue, 11 Apr 2023 15:49:14 +0200
Message-Id: <20230315-topic-kumano_dts0-v1-0-f1852c2a2378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFplNWQC/32NQQ6CMBAAv0L2bE1bBNST/zDEtKWFjdiSbSEaw
 t+tPMDjTDKZFaIltBGuxQpkF4wYfAZxKMAMyveWYZcZJJclL0XFUpjQsOf8Uj48uhQ5s7URjay
 Mk5WG3GkVLdOkvBly6edxzHIi6/C9j+5t5gFjCvTZv4v42X+LRTDOmlPtzlJflHD6NqJXFI6Be
 mi3bfsCOSIJXsgAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681220957; l=737;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QgiWHzDdNhqoYpUovwty3B2BCpU7Q4vyNI4yPn3A1EQ=;
 b=GCEJ6jHBGVbQbfqsBYGR12oUQDxY55Fl5K4g3yClhBWgDEFJOZjgE+l5Sqo8he05zHEYg4yvDMdW
 /UkiOz7UD5Ku8irMhvmSxH1KeP0soHh+hbQiEUyoyJ1QebCUqwes
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add gpio-line-names, set up fixed camera regulators and enable SDHCI2
on Xperia 1 / 5.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sm8150-kumano: Add GPIO line names for PMIC GPIOs
      arm64: dts: qcom: sm8150-kumano: Add GPIO line names for TLMM
      arm64: dts: qcom: sm8150-kumano: Set up camera fixed regulators
      arm64: dts: qcom: sm8150-kumano: Enable SDHCI2

 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   | 336 +++++++++++++++++++++
 1 file changed, 336 insertions(+)
---
base-commit: 009795d283d1f9f043e5a4ff97d4140cde17e2d3
change-id: 20230315-topic-kumano_dts0-e6c1725cf25b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

