Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD2D2842B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 00:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgJEW7W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 18:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgJEW7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 18:59:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB78BC0613A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 15:59:21 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id l13so5943013ljg.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RasjbO/aKL6xgHWeTfDO4Z62vB2SneSkIEF2/wi8pU=;
        b=whkj1phYySdBon7CnDUEmBOZ/0aFMH4iuzdzxXQrlukCooJC8YCyB5sjsU4hzII5VE
         jvV0bGnoU4ArFEptzrwTQA4tYpKxrdCSHnyknjRoH4asygTJqTQaFLCGXELxgWm92kSo
         rrIwzybdmh6RzFA+WAijGaQjBd4LC64dHsZcVr+eLMndehAcC2LQmP+H0ES8A90JSSOJ
         SCjqs/+2RLbdIXbBTn3ibyLKerUiHNynDx2CEk+Ut2gJb6HkbXdscitVUUlDcX6Oloq0
         VZ15/uMjQ6od6QR7aNQo2UNG4G8LE+Sf8svm0wE47nmq6Cv5dYuvUBGWtk2DsksUCJmj
         JZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RasjbO/aKL6xgHWeTfDO4Z62vB2SneSkIEF2/wi8pU=;
        b=RndgXWylQPRNZWcfte5sYo3YpCOgM+ePC65+Mu9jmWtlNs0IiMcH6npAN3fu5Ki2r8
         ED0v0jki/bsrPgEW3uvaPg7glRNzIX61Yerj4rPjA+WgSaIdBM/tpBHeSsfGGgkmPQAu
         CWLZFujSWT1cJIl6m3v7vXOfRNq0w0hXewgvTH4pVdh4ZPTUnkxg2z2l7g8NaT0I3YjH
         fsMpfjIqNCWyYg2Ocf1csz8dv+KZOEEFJr5t9No4M0c3HsR9f/wuEz+4dGEVqu+6YZN3
         ChHx70uGW/6FOgJIWqCh7OBXMrGHKBFz0Ee6wvN7WkrjaxiNVmoFddUTV9rDB/XkbVfO
         6/jA==
X-Gm-Message-State: AOAM531bSUl+Gnnfoby3YIzh1aUw7hC0HqIiBGcW143/wjQy1GubBtAe
        tkZ4+HYLm6jzBs5TsCv4oTtk6w==
X-Google-Smtp-Source: ABdhPJzMqwVqhWMjmTzL/sA2ceLh7lj7NhlAzV1bg48rIU9irVM3XDrI79l7ijRYojZaxg4YJVgFSw==
X-Received: by 2002:a2e:b167:: with SMTP id a7mr644524ljm.359.1601938760189;
        Mon, 05 Oct 2020 15:59:20 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id x4sm353831ljc.80.2020.10.05.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:59:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 0/3] clk: qcom: handle power domains supplies for GDSC
Date:   Tue,  6 Oct 2020 01:59:11 +0300
Message-Id: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 MDSS_GDSC (and the rest of display clock controller) is
supplied power by MMCX power domain. Handle this link in GDSC code by
binding the power domain in dts file.

This patchset depends on [1]

Changes since RFC:
 - Fix naming of gdsc_supply_on/gdsc_supply_off functions
 - Fix detaching of solo gdsc's power domain in error handling code
 - Drop the dts patch, as respective display nodes are still not
   submitted to the mailing list.

[1] https://lore.kernel.org/linux-arm-msm/20200927190653.13876-1-jonathan@marek.ca/


