Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184CD6E0C9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbjDMLfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjDMLfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:17 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A34A5C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:49 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v27so4683640wra.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385682; x=1683977682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BSMsmRcBzm9a9F0ARGDiJoIhh4OmCxmbiTOKI4boyU=;
        b=W4PlFT/XWAOQUyEjXNI72N0r4kenmbJiwGNxSwcpMUi6HLjpO31whvHe3fKXUmWTat
         8zpstm4pqEMGVWkKEKnlN13hgKTZAxHOYSgsWX3WRzekLUxbutO/sNfrVSQNMlSKqePO
         CjEY93A0E7L/qn+9cuin2UOE5VxejaXt5BJ73FRynnYeXMdqgIDHyl3BTy/3mZ4dUuf8
         LODUDY/Kyj22zScNQix+nshZdkPCih3+kOgGKQXK8iyKG0Sarr/Uvycq0vXnOg2+omLg
         QAd+NEwo7LhFbgExsVWR/xEexaDojg46sccLZpGV9hiwpM2f0QSfWHm4lwT66wXP2eda
         o83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385682; x=1683977682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BSMsmRcBzm9a9F0ARGDiJoIhh4OmCxmbiTOKI4boyU=;
        b=eInkrxS8W7kRFlI+OKp4Dz1E6XpFORb3RwhJoTCDmoAJP+HVOZKGIYOWHjfMtdbPwf
         MNi4yuJCnpO0KZnYXqY3RtLwtXNyo36trdNXX9VTW5hfMjLfRGvYi9PazuD4WYXvVfeY
         kohzhRlPVNuGbGpZDBOTjKS5ZmtMYZ+pjWjwxQAIDXs2DVykd9jexhHZqbR7UEGS37yo
         +VaeZh0WOYy/iVu4Ns64lF1Bqf7+35tOdB4DBRCeqdqnE0/99yGI8505YkMq1OWHNrIj
         gNsP3eb5eEYFfUy3RxPaY0jCWvN0PfmVebNw/up2un7OtKo28xtGT0b8q3v2adtDUIc4
         6grg==
X-Gm-Message-State: AAQBX9eJWVtm1nVlNuDt89ERrPVkNsKBPyquIw+vaJbdU87a9gjO26Xd
        0Mf+NGFOeY2g9wULcNXRVFqdPg==
X-Google-Smtp-Source: AKy350bqTFr2hSh2GT4LuhiMp4Ssh6iN0iJ1HJkoQmHwTomOr/kpC/rafk7P6wPCvZr31Ivqrg2sYA==
X-Received: by 2002:a5d:4042:0:b0:2ef:b4ac:8e5 with SMTP id w2-20020a5d4042000000b002efb4ac08e5mr1317145wrp.28.1681385682326;
        Thu, 13 Apr 2023 04:34:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 01/14] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark reg as required
Date:   Thu, 13 Apr 2023 12:34:25 +0100
Message-Id: <20230413113438.1577658-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The regulator code needs to know the location of the register to write to
to switch on/off. Right now we have a driver that does this, a yaml that
partially describes it and no dts that uses it.

Switching on the VBUS for sm8250 shows that we haven't documented reg as a
required property, do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index b1cff3adb21b5..7a3b59f836092 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -25,6 +25,7 @@ properties:
 
 required:
   - compatible
+  - reg
 
 additionalProperties: false
 
-- 
2.39.2

