Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C00694874
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 15:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBMOqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 09:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjBMOqn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 09:46:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2731BAC8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:46:32 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id p26so32382610ejx.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1exOIPHSYmL5uzXyoMQqmCRo76O7cgSZLsIwMj/7J4=;
        b=vmDA8UY6WmolbdF8ccUQbL2DaHZieql3DQTgoH1mm0tvJSo8MatLxINE3SvOxUBPw5
         oLBvXAx0AbxYodYfXTKE8zY05KM6YIWkEcZUAseoQPwT+/Jv/5pVvc5+7ViXjQ93G3E5
         7Xqcg5FwQqsZum4b9G9y1+kbT+9Fb/98vhVzxCjdVcZsmU7TGTyfMq8WecwJR0oR4XH4
         jEPGUOTtCg86MzyxjWVq9e2n32RacnNZ9HxG65mkvI9EiFK9nEmI4Ysb3ZRiQvJLHoWb
         Fx0Ab59fdGGErom01mZ/KFfTrgGPuFsWVyq8bjraxFBTcr+J/HiWTbzfv8oNC1gtmAFf
         KKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1exOIPHSYmL5uzXyoMQqmCRo76O7cgSZLsIwMj/7J4=;
        b=kFzt6VYUa/Z4kMXg8LRQemOEvzaO5M4KD+tzjOdZehdZMyrVqTuAsWjTG1uHYT++kf
         r369h3S3c93I46CZbUceDZI+gY/yHoTu03jb3zndethSvbnctqx6NFrk9tGrDR1oHeFm
         uiHuqb4JR6Co+TrgrK7y9JirtukrzOvCAZXvLwHr6OjlDiX8/qmkHclwDalWbqm6jxQg
         lv1VzdHXocAxAiCPQ5+ZRxzyFihURz5R/owCMzOE4mmIf8236v4mPHLIYdO51MyBnw3X
         ALYXBXhlk08Bgy84Z25A3VyNsgSNZQ62UGVGuw0b6rS22V+vKgQ3Mws4puLudKvDw8Hi
         fERA==
X-Gm-Message-State: AO0yUKXrgvJ4eVtIgONMdpsRmqDoXr7pNBbSU2AjEPC+6hSdt7dqckeG
        b5+qOqEmWtc8uH1axjAgd/XD7Q==
X-Google-Smtp-Source: AK7set99KwU3Phjfqh+b4R9d0N/+4wB4zfC7izD71bRQDNtOh8Ymb7LWlfmb4R5CFgSlz3PFw7eodA==
X-Received: by 2002:a17:906:488e:b0:88f:9f5e:f40 with SMTP id v14-20020a170906488e00b0088f9f5e0f40mr21507345ejq.68.1676299591496;
        Mon, 13 Feb 2023 06:46:31 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id b19-20020a17090636d300b0085d6bfc6201sm6884208ejc.86.2023.02.13.06.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:46:31 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Enable remaining I2C busses on sm7225-fairphone-fp4
Date:   Mon, 13 Feb 2023 15:46:29 +0100
Message-Id: <20230213-fp4-more-i2c-v2-0-1c459c572f80@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVN6mMC/3WNyw6DIBBFf8Ww7hjER2pX/Y/GBYxDmYVgoLFtj
 P9ecN/luY+cXSSKTEncql1E2jhx8BnUpRLotH8S8JxZKKlaqZoW7NrBEmLOFYIdJSLStaNuEPl
 idCIwUXt05VS2Q63gzWtp10iWP6fsMWV2nF4hfk/31pT0j2ZrQEJvSI6zMT3ScLea4+qCpxrDI
 qbjOH7qJGTOygAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The first patch consolidate the two different styles where the status
property is placed in the dts, and the second patch enables all the I2C
busses used on the phone even if no subnode is added yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Enable gpi_dma* nodes as well, mention that in commit message
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: move status property down
      arm64: dts: qcom: sm7225-fairphone-fp4: enable remaining i2c busses

 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 67 +++++++++++++++++------
 1 file changed, 50 insertions(+), 17 deletions(-)
---
base-commit: 09e41676e35ab06e4bce8870ea3bf1f191c3cb90
change-id: 20230213-fp4-more-i2c-f90ccce84e46

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

