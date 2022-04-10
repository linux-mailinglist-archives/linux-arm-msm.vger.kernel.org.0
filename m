Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B1D4FB0DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 01:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbiDJXrO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 19:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiDJXrN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 19:47:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE3E1D0C9
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 16:45:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o2so2137172lfu.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yjP26hSDnI1G4H4to8/mQn99hO5ICfo5ZSgNeliqLSo=;
        b=jpXw39N5r52tqWxd7i9I19lx6zBBoOKjEpBA/GGGoPWye3IhrPfNj2VTbNmdncm0r1
         Sn6G2IonEOasOeKAh8fB+OeXyUq2DipPRw7kAdP+LMuoz9BYfpUodYTMlTnVxq5TUigQ
         1bEqYTQkdqK9cGP/006m0IpxiPFYYVmIYtaQPQFpDBVIRmbehDlGfoohKrDc+4TGtx1j
         16xm9P2Cb4apRXn0zv6ukaBJQBJ1R1Qgk0vg+RFStH5ybqRFdI/sbtBQk9JTs6eczz7J
         ceVBWA728ohL+KT85WmRwKLfnPKQ+re37u3Rf4acfqCy/HiWMBinfaMVngQwjjpIsRwc
         g10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yjP26hSDnI1G4H4to8/mQn99hO5ICfo5ZSgNeliqLSo=;
        b=cv4gVpxuI4EbHcPW26yjv2bmVUWALwIRro5zicuZw+xfZ97tRZjHXmperH2W00/lXf
         rgJClqOCVWagUfZ4txqU3+q4KDA7jZhaQrv0LmSkHEKmO6X3oKjBBjWG6UocTEgAT0dt
         XBLp3D/ekNYdapfnUFuT3TH7Yj3ItVkHk+pNT3Gf+y5c882t7QBAxk3wV3cYxQuHo/ot
         V5NVzHudtwae4XBEelnan4WGkqTQ4GUsSgFMv1vWeYgT4nebSXVe9QLcj47dYB4Ob5v7
         wR/wEBZK9sBMD6O0j2kaf+5szSmeYs94jNKzGOIn6oYfxmTIp8xHlitC/HJzdOYlnWkh
         NOig==
X-Gm-Message-State: AOAM531LEzJ9D5+Qc5WcCSx784XgmkH2Z08/dvtUcMSU4yYwQHRbLDIn
        phNh5c5laYVnXkDc9oQ/RUGgzA==
X-Google-Smtp-Source: ABdhPJxMh6D5cwlUtzDsV6EDkKQjq18N7F8h35knzU61fMq12tiwwNYlQSPfzq+JNIl5xrh0cDoQ+w==
X-Received: by 2002:a05:6512:ad3:b0:44a:254b:da97 with SMTP id n19-20020a0565120ad300b0044a254bda97mr19645005lfu.485.1649634299578;
        Sun, 10 Apr 2022 16:44:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m28-20020a19435c000000b00464f6d27ff1sm1153881lfj.103.2022.04.10.16.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 16:44:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sm8450: add thermal zones and cooling maps
Date:   Mon, 11 Apr 2022 02:44:55 +0300
Message-Id: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
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

Add thermal related definitions for the SM8450 platform:
- Add two tsens thermal sensors nodes
- Add corresponding thermal zones
- Link thermal zones to cooling devices provided by CPU clusters.

Dmitry Baryshkov (1):
  arm64: dts: qcom: sm8450: add cooling-maps to CPU trip points

Vladimir Zapolskiy (2):
  arm64: dts: qcom: sm8450: Add thermal sensor controllers
  arm64: dts: qcom: sm8450: Add thermal zones

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1056 ++++++++++++++++++++++++++
 1 file changed, 1056 insertions(+)

-- 
2.35.1

