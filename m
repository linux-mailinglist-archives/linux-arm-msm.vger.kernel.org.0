Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A635B7AC3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 17:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbfG3PY6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 11:24:58 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40864 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730013AbfG3PYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 11:24:46 -0400
Received: by mail-qk1-f193.google.com with SMTP id s145so46896897qke.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WRQrRymvzeuce3KKDbksGCaiWLluhsSldgXmnzTmp8s=;
        b=y4t+HM1gzG3E/sK8yoWFX8FDHUW4HdMLmLbt/cIJqBMgLDJ71onmHxZPXuKyUkHaxg
         iriURYdjLTQwVa5uDNBPkJ2ZPyjb3ZWnQIqtpvcQgO4wRj0B/bmhvAWBObA32nhn1xFY
         j5DnUpbNffMqYSsmKeyXaTdP0OBjCRh/xqwWe44VkcUy8YQExEbcxLYLW3MktSFoewjc
         c+Pul3W9Hw/RRpOIMKf6Q+A05UVHAf2tc3EuxAyHrRI5WaToby0adDO665ppycGWkpcu
         KCSdoRgWUd0qCiLlc5Dbcpgddpli/glSpFxlzM+SsjNviSfmJkqlpTEfpi4hgLBk+U6U
         EeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WRQrRymvzeuce3KKDbksGCaiWLluhsSldgXmnzTmp8s=;
        b=FtKXHWdAt7mqm7get0mgm4L6J7r0jbdufqyFx8kSeIGRSb2WNODM/QzxDcRIUbDCID
         R7btTyf7JvvZTGp3VyJsJm9TWdfC64CPxOozeAarDy6dKAQYncKwA01ZiTYVHiPKOv7z
         QoJbJjW6MzkWZy1JUBeu3e4L6pBGy92+v4Vracp0OFdCic/niWZ1UlC+/eiGEW5gqigH
         FlhPdAjpdFAkdXGICsQdxq/3k0T2eGEixpA6tJlBTftm0M0X5D6ONX80IJLFwzPmybUf
         KxtgMAJt1FnmVNp5BrIc1+LNQr56rP22o4NUkHL7qfEU0M+m76FlNPn1VL9PRYYpvu83
         bN5A==
X-Gm-Message-State: APjAAAVPb2XFKy1Zh+Fs+2YAXvPE+opE+NFGA7t9d+8hCFj2DH6duXhj
        MnXjLJXqFJ3my7h0NYqOTmi/ETG0TSw=
X-Google-Smtp-Source: APXvYqyg4l1a/B04E8+LgeFlAnxW+Kg5rRx3jm0+QKFBC6Q4BagEPljVLBschqWhEsjHslipIZbtNg==
X-Received: by 2002:a37:97c5:: with SMTP id z188mr81637690qkd.5.1564500285402;
        Tue, 30 Jul 2019 08:24:45 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-245-97.washdc.fios.verizon.net. [71.255.245.97])
        by smtp.googlemail.com with ESMTPSA id r14sm27251082qkm.100.2019.07.30.08.24.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Jul 2019 08:24:44 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, amit.kucheria@linaro.org,
        vinod.koul@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Patch v2 0/2] Add support for AOSS resources that are used to warm up the SoC
Date:   Tue, 30 Jul 2019 11:24:41 -0400
Message-Id: <1564500283-16038-1-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Always On Sub System (AOSS) hosts certain resources
that are used to warm up the soc if the temperature falls
below certain threshold. These resources are
added can be considered as thermal warming devices
(opposite of thermal cooling devices).

These resources are controlled via AOSS QMP protocol
In kernel, these devices can be treated the same way as any other
thermal cooling device and hence are registered with the thermal
cooling framework.

To use these resources as warming devices require further tweaks in
the thermal framework which are out of scope of this patch series.

Thara Gopinath (2):
  soc: qcom: Extend AOSS QMP driver to support resources that are used
    to wake up the SoC.
  arm64: dts: qcom: Extend AOSS QMP node

 arch/arm64/boot/dts/qcom/sdm845.dtsi |   8 +++
 drivers/soc/qcom/qcom_aoss.c         | 131 +++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.1.4

