Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B96B2632AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 18:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730928AbgIIQtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 12:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730921AbgIIQHR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 12:07:17 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886E7C0612FC
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 07:43:01 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id w3so3893996ljo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6qDammCrp0EwptO3CtGoLqfo/rfLYjc1bnqq0Kza7Dk=;
        b=tD1KRG99K87Slut9PsLD50bnWV9IHs11Nt4RlM90goxiLCSr9qyu1410xG6SClag6H
         YY0ODvIYZojAHdwdoKhUe2PXv3AJVY7jLbZDYDuqX65dp93gxqhr/0EcTkH/VBl71W0k
         80vfCfofoM4PYefyjo8pEwfKufwtJu+jfONlJ3MsIjZ4ers1TbTk8USOODO1UUgwpF1I
         vlriawyCAdUTXHwyQQntwnEnbAE/3qSyLOC/UpyfNKMTY2qt2aSKsa8jSyJhFDIuqDrp
         1BeY6PwsaJCIDYdKMDwSzF/nBr/8mhM3l1gc6s+P+iTlk6Jb0Xw62GFWRWLmuKOAkkIO
         enoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6qDammCrp0EwptO3CtGoLqfo/rfLYjc1bnqq0Kza7Dk=;
        b=fkP3r13X1vtf1WRhIRgZvmgLZBpM2zDc7MV/P7GB0g397TQpoI4Y626BlB9/alXPac
         HtSnpyUTesD+PVQ/yCf3GEAtpsyjjAgK7Wot3/r9RDTSGT4JwrtQK+5iyB2+OxH15TOo
         uQCRvr8g17rSTXJrtgu2UQD7YnpeVH5b2E6aGGr78IWZhleyuFpeNpcRGXBc9cWamhlA
         iWiiyeaB9JHEj/Q5FM23wG4FV2U8jDJxVYmYSmTRw+InTmkI79+6umbnkvW/wbFKphwd
         aY8aX6PtiRN8lWWus9YAsixpcadZogcMQxmIvLjYvWWYU8YDl0FIjoaVT4uVgWnyEjhJ
         qFfw==
X-Gm-Message-State: AOAM532pkR6lB7W0iEbrIPWskOrdU6XpC8GJCKfmKDMbTD/IKbhGjy95
        voEAtOF1+l/hg5iWIYODYILqDQ==
X-Google-Smtp-Source: ABdhPJxEuBTT8aEEjg3YXCValq4V9u4nYF0bTkCsaxt0ed3aIi4553PjjA3SvY86niYRjVh+SNxeDg==
X-Received: by 2002:a2e:b615:: with SMTP id r21mr1938629ljn.341.1599662575775;
        Wed, 09 Sep 2020 07:42:55 -0700 (PDT)
Received: from eriador.lan ([188.162.64.155])
        by smtp.gmail.com with ESMTPSA id t12sm621665lfk.26.2020.09.09.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 07:42:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 00/10] qcom: pm8150: add support for thermal monitoring
Date:   Wed,  9 Sep 2020 17:42:38 +0300
Message-Id: <20200909144248.54327-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch serie adds support for thermal monitoring block on Qualcomm's
PMIC5 chips. PM8150{,b,l} and sm8250-mtp board device trees are extended
to support thermal zones provided by this thermal monitoring block.
Unlike the rest of PMIC thermal senses, these thermal zones describe
particular thermistors, which differ between from board to board.

Changes since v2:
 - IIO: export of_iio_channel_get_by_name() function
 - dt-bindings: move individual io-channels to each thermal monitoring
   channel rather than listing them all in device node
 - added fallback defaults to of_device_get_match_data calls in
   qcom-spmi-adc5 and qcom-spmi-adc-tm5 drivers
 - minor typo fixes

Changes since v1:
 - Introduce fixp_linear_interpolate() by Craig Tatlor
 - Lots of syntax/whitespace changes
 - Cleaned up register definitions per Jonathan's suggestion
 - Implemented most of the suggestions from Bjorn's and Jonathan's
   review


