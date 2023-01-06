Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1056366037D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 16:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbjAFPjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 10:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjAFPjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 10:39:53 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDD1745A5
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 07:39:51 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gh17so4262045ejb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 07:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NpkG2iR0UwWdydoahMJc9hyZ5gZYg9PaDSDM09B2by8=;
        b=hAXkKOvRnZeyOHvhWhrsKr+W9+QkGEcmw7NHYO0rLBGVHP/4Tm+JVMd8eBRKLMaAJT
         KJpveSZmD19bTLd8kM5JGxm5gG1WwIqD2jMEggSDyAPkJDdtIFbnQSwIzZNyNoKvg+HZ
         ceef176g3aG4BL1TFlLNh80cpEVuY6bWtUEP8ZXjY1XSxE7Rm0pnd9PhqYEBE0KhSyqy
         DBwlnNsId2bH5uromjldB2xxI+Mf6fjcGINxNjQWztfudoFk1fOMhVn0zErpdM6pl4ba
         xKW1rGgppefIhvZfqp/c5oOC+CPvWFQsd8fAfGNqrwXK8T5XY1taEQlKmo64sG75aajQ
         VmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpkG2iR0UwWdydoahMJc9hyZ5gZYg9PaDSDM09B2by8=;
        b=lg1VHPv/RZWmM1TCqar7LanBdY9YovGJgCj1GYfiRjdcTu2NUs0fGllGzBTLsWg2vK
         8iKydSsvnt7Pmfbuei16zUd+6NXHJ7TgV/s+Ni3spfNZCWOj0dQelD74NrULpGb9wRj7
         wgISiqNcePZ03dDyOxIVVqWhoihlamcm9WS8y2m3QzHLSlaT13rxtJF0gemmlfN5H/kM
         0EFUhOlFzFPpvwhYOhNiEv+iwdXhDqgAoFVXJY8gzSSMSLMB9vtiO7LP4FsIP6CKzHql
         EzsvsSRWupIZOeiEV+v7OlW+1NtKKchMKwwvFF/1lLpy4RTarf5Zvyju5kwLpvs9E4Cb
         YtZA==
X-Gm-Message-State: AFqh2krUTImd3lHEZyprX2/l/6ds2pTrBl6++XxEO/aAMQpfrxX5LM/H
        CnVXLurO53XLXP98D79+rJBtKg==
X-Google-Smtp-Source: AMrXdXtCz2VxsduHFn7Iu/9+O5xy6oPKtf5ciiIpoxGaBNjyjW6LzJn4v6l+97kvsAcLckwVhP9ZCg==
X-Received: by 2002:a17:907:a08d:b0:7c0:dac7:36d8 with SMTP id hu13-20020a170907a08d00b007c0dac736d8mr49899341ejc.10.1673019590109;
        Fri, 06 Jan 2023 07:39:50 -0800 (PST)
Received: from [10.0.0.3] (217-149-174-217.nat.highway.telekom.at. [217.149.174.217])
        by smtp.gmail.com with ESMTPSA id gx8-20020a170906f1c800b007aed2057eacsm496235ejb.221.2023.01.06.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 07:39:49 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Support ADC5_BAT_ID_100K_PU and use on PM7250b
Date:   Fri, 06 Jan 2023 16:39:41 +0100
Message-Id: <20230106-pm7250b-bat_id-v1-0-82ca8f2db741@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1AuGMC/x2NWwqDMBAAryL77cImxRR6FRHJY60LGiXRUhDv3
 qWfMzDMBZWLcIVXc0Hhj1TZsoJpG4izz29GScpgyT7IkMN9fdqOAgZ/jJLQUEfRTi6RcaBR8JUx
 FJ/jrFk+l0XlXniS7//SD/f9A0KVect1AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.2
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the bat_id channel to vadc driver and add channel to pm7250b dts.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

---
Luca Weiss (2):
      iio: adc: qcom-spmi-adc5: define ADC5_BAT_ID_100K_PU channel
      arm64: dts: qcom: pm7250b: Add BAT_ID vadc channel

 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 8 ++++++++
 drivers/iio/adc/qcom-spmi-adc5.c      | 2 ++
 2 files changed, 10 insertions(+)
---
base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
change-id: 20230106-pm7250b-bat_id-1050c2f6d016

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>
