Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E411B421CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 05:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhJEDZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 23:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhJEDZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 23:25:39 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A11C06174E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 20:23:49 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t189so24383810oie.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CBGP4JeTMy9r2mkV+w8aOzY9PKCdfwV7F1VUUh8lVlM=;
        b=FhhkTJOlAJhYys1fMEptfl/Li9cuTs8I1DNR9tw/Sbeb1vPhjcYHd/XTb7aD7ea01Q
         Y8b5pqZQwKUfE709gXUZxjz4RrykK2uK2TDndpw8HomHu/2ynOq159XevNgUYYSfFxX/
         nfAJr2otpn8vZ8Qh7AkahpjRnFzt8dNChpus6POrrF10IycKlw2rAw7JKxc+yRdP7p4c
         OKD/EWf+YA2liLpu7n6chdla928jth3x9Zs2N6nm63qo9qqu6+QBPiIE56U722XaqWfW
         GkzIZU2RU+nufQiFHTDoylHT8KOuugIO2jsSeE3j9FBavQSgQxooEs3JOgh21uDkNMdj
         /wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CBGP4JeTMy9r2mkV+w8aOzY9PKCdfwV7F1VUUh8lVlM=;
        b=2nVI7vQZ204F4LB8jl+5HZYkhtCj0Wka6++u0k3QhKeNhbCFBvEYYYocNPJbRs85qT
         7+Z7/SqvMuOEy2r/bdhjjvDMRZXjs9V/oU42UrS19al8WCp5M7F6j4kIX1FAtoOg6Vwf
         FomkF4YWJ/aXZHSUuIPxTz+hRRMsxILA14h5P8PTCHPBRwNeTLQ6yotKavC7BJ+RHlt8
         w99TiORG+q0LrC9auUk/uwgaI/NIFskLXQ09ZGYc/8+LFQsmZfFAWUnpYNY3JQ+PwvYk
         Vkrvn46LXHF14NT90SZMyn/vR/CQxn8PQmYf2fVtxnfSmtjSuNAZ0mNfV7XCOllaZWNN
         78Eg==
X-Gm-Message-State: AOAM532t47nzDmzpO9pxl9W44VnE0KESMHwzPeSESsSKKuZaSCuiNS91
        jF/lKZ79meH93G4tL14Hl9Xz0jgolvSJaw==
X-Google-Smtp-Source: ABdhPJxXU4rXbiYbs+rxlcEX/8lrg/5Lz2+zgdU8UDjcOnils8Xy6v6OFR5DkN3v8CKf1NK53P6JZQ==
X-Received: by 2002:aca:4b95:: with SMTP id y143mr624574oia.178.1633404229172;
        Mon, 04 Oct 2021 20:23:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j4sm3111955oia.56.2021.10.04.20.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 20:23:48 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: dts: qcom: sdm845: Add thermal zones for PM8998 ADC
Date:   Mon,  4 Oct 2021 20:25:27 -0700
Message-Id: <20211005032531.2251928-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe ADC channels, related thermal monitor channels and add thermal
zones for these.

Bjorn Andersson (4):
  dt-bindings: thermal: qcom: add HC variant of adc-thermal monitor
    bindings
  thermal/drivers/qcom/spmi-adc-tm5: Add support for HC variant
  arm64: dts: qcom: pm8998: Add ADC Thermal Monitor node
  arm64: dts: qcom: sdm845: mtp: Add vadc channels and thermal zones

 .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml | 149 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8998.dtsi          |  10 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       | 140 ++++++++++++++++
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c      |  41 ++++-
 4 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml

-- 
2.29.2

