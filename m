Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D4B20C3BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2020 21:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgF0TeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Jun 2020 15:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgF0TeQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Jun 2020 15:34:16 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44A2C03E97A
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2020 12:34:15 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id s16so1436298lfp.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2020 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69MBcMDXHNYxgXYtTugtvx72wF1ub5Qsq1EL6T7j0eE=;
        b=YI8OfYwsheSeh71u36LYp1+M/Q02yvFYqxDAU3uJ6W4bq7CqPduf3ZCHNoI+919FSw
         dWbAfiaAetmnQGk6YrLwTfAMBsWJl0/JbTKnEod9vGrD+i72NUELFU+cAErsuAJXbZOP
         lquoLXOSKUG4cQC9uAGimy02HEnukHbkEMoYEWxpEMIYcO3lh3Us/Qd3/YdXHHhSTR6u
         rZTuK6Cd/HgBD6lqn4mWL5+KWpy6Z6Rk+F8B3/ti81DZ6w6vWB84qdKkBgB1vYHykpD5
         87u8sj0ffMX1/NlpdsfftKpy+wx5kJkGVNu5/xEk+Ca+O62BLODYLkSzkingejF/MGfE
         ezrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69MBcMDXHNYxgXYtTugtvx72wF1ub5Qsq1EL6T7j0eE=;
        b=izfRn1mTxvMyJJNGihcoW8a03m0X5AqgZoUKopEfxFJZJi7QcvRK9yCvt3cs+d+Vev
         Y0IKjDY0wOdgnJ9pHdwkcHJlNhff7AbEK6CyPsJM/c4nZd/bqT3S7embUEZkY91UucFC
         ZthbtESIuvnmKyVu/zbHmUF6KhsAIT94fKqxyURcFH0R69IkuNtikV7Zs2tuDrUUqqfb
         fL0xLQQHlDlApklTH+/j+4q9rId12zz+r9awiIPJE4Kg36Ev2NOzrGnEryEKzI8yfphL
         Oa7RiEcN2h/VNwnuJ9v1EqCf71DuK6vxu6w0h5KWvSM7qVPqb2a+9PL5lS+xd3y5jxIT
         oZ+Q==
X-Gm-Message-State: AOAM5307FssUPP5KaBnjakb+1Kn6YlqsL/HavwbN6DpsGi+RC8yDBi6q
        jb1weNQXEOD6sS2ir88fDwhkt9blfaEdrQ==
X-Google-Smtp-Source: ABdhPJxwIUAXrbzd33RSSoEz6TwA2SFWIdAaigp34yhptEHKLzfIcUDqex+s/0by8U89t5N07FTf2A==
X-Received: by 2002:a19:1d1:: with SMTP id 200mr5342687lfb.57.1593286453852;
        Sat, 27 Jun 2020 12:34:13 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id a21sm991063ljn.2.2020.06.27.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 12:34:13 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 3fa8f19e;
        Sat, 27 Jun 2020 19:34:11 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/2] Qualcomm MSM8226 TLMM binding and driver
Date:   Sat, 27 Jun 2020 21:28:29 +0200
Message-Id: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block

Bartosz Dudziak (2):
  dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
  pinctrl: qcom: Add msm8226 pinctrl driver.

 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 123 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c        | 631 ++++++++++++++++++
 4 files changed, 764 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8226.c

-- 
2.25.1

