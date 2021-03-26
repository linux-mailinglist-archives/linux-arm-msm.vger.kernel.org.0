Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C2634AE17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 18:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhCZR6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 13:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCZR6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 13:58:13 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5652C0613B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:58:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s17so8380802ljc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcQzTMILK75vkJ7HrFpUsFeadhrqqgnoJj8l6pMg2E0=;
        b=cCmVEkNAO3CSNkizj4S0CRatIlx/hUglkQbwApjM7ENh8SwPcOpZs1uMzs0IhHFffj
         +zPKkHr6LEPRvPliUxpOhsdQVhQNqATADL7DLHol6UhdDNNTT72BC4AxkRnVbc1gICOb
         ByWrEnKtbQ9aNvEnhj8BGxaYzGzUjSs/gme/7iIZdBS+kCUtjRRcFKS1X9+fDvJksJeM
         EsOGRzJhlXL6rXmQfvPqq+LBG4bbThRjjEpfD6B4JaprJ29fG64otsF4/IxvOGS08wTE
         nIl+AzGFYfJP9aaQw9ixIDQoEiOHnf2FGxJRW/nP60DFbBtJvN9Bg0u8MRjDEV1+9b1B
         aJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcQzTMILK75vkJ7HrFpUsFeadhrqqgnoJj8l6pMg2E0=;
        b=JFhfnWo7xWyEo7irnW3EGYWk0j5xZcWu+/AbP1EC0J7QB0+UfyoGS79X8Y8qLLa4vY
         9K7EzWRisN5SMO+QFMe1/ImozZZhC+YIxuAXBirV4hYMBbLhz28NwjDvLoZVUshn8aPF
         zY8Ds1Lx+CAqe8vVH3/F8P+Yf+fCFUA+YEvQSrT8YpQlFu36gQ9znmvlqpWcUBDbUxgT
         AEfe7n48PP0xYfLaa1yUiIb95ldyM5kQuTjJHcYaAEISPYYFOvN2TdkQWBZYque7l4+A
         azFrhg+9MpSa6algTM6Ir9dj27NiISF1sKwrf6OpWXX774I18galuc2t2wkXRmbeaZOO
         s6Aw==
X-Gm-Message-State: AOAM533/YPerVAnvBiStvotdCOAKXDKBq9rdnqee+gOiQ/oXxd5rxh1A
        rREq/yA5NwahyYZfBprLKRRUOQ==
X-Google-Smtp-Source: ABdhPJyI9bZ1TlxCCO1oNWqQBchjpGf81z6SKUqDj3MKClhNympPrzkOi3o/ISuyUNtfEsYQFoWacw==
X-Received: by 2002:a2e:545e:: with SMTP id y30mr9897883ljd.46.1616781491377;
        Fri, 26 Mar 2021 10:58:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f3sm1249554ljm.5.2021.03.26.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:58:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] phy: qcom-qmp: provide DP phy support for sm8250
Date:   Fri, 26 Mar 2021 20:58:02 +0300
Message-Id: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
 - Move qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy from
   qcom,qmp-usb3-dp.yaml to qcom,qmp-phy.yaml
 - Do not touch qcom,sm8250-qmp-usb3-phy compatible

Changes since v2:
 - Drop unused qmp_v4_usb3_rx_tbl

Changes since v1:
 - Provide dt bindings
 - Split register renaming from sm8250-dp-phy patch
 - Add respective changes to sm8250 device tree



