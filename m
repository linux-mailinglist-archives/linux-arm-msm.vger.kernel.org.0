Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD4640A2E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhINBzQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhINBzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:55:15 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E0C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:53:59 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x7so10631667pfa.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8R8uZ5D2TVyo2nitnNuAgsr6dl/BysOehMz47YEjYug=;
        b=iJ4GLwVshqcEz83D3hXgoL02tLfPL/Lyfjv/8yCWtWbngh5V0Jp74MTfwF1qcPwhuL
         hrJvw1mcFmXDPaK3MZt5kSvnJx0TDvt8z/6ySNKgI7loyXaVi8XZnFlcIGAnRt8pc8Dv
         Y3FSFGsJO6B2gbV0Dsqb9efogRor5hOANmNlbranmydHi1QXuLtkm4tpx1k1oAt+xA2x
         Rr0pWB619lVz8b8I5pvuYkALNsGGdKmix0TuJsGPzf2toIraAcpOSUXodFisZk4h3QSX
         7p14HndwmIgaPF7KIxzR3b5nkdcnDne8I0se1p50LrvRh2QEDtRQ0ipZdsTk4DvazNgP
         u+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8R8uZ5D2TVyo2nitnNuAgsr6dl/BysOehMz47YEjYug=;
        b=dCa8FRjMUGCLWmkpsNfEWxF8mVNyB6f1ZVmRn5STi8jhoAvHjnimR8aKjOqURPxoDW
         +px4VxbFX7yrLQ9zNylQ1V6iSul/o1RD6IHazJgV1Mc+KuQS6oCRss47+2rcUn5SFxh0
         RecJfdXwqE9iu6naQKzNpxY0Ojo19qFBNyl+F5aP+afWJwQz7VpebQxd+OnEjPD/T1Bj
         CEjkgEQQdhaZ17Q1nN41p6ettBOgnWDPe7jkd+BBYYpeGvbjaRj/TJqabRuHffwZRzbv
         DXcgE5QZWxsDu+niWn5QylssZ/NQEFbQtyQftDGWJnkuqbul/KPQVoQ/v1xOxLjA+57z
         D74A==
X-Gm-Message-State: AOAM533QNPHmVLFtKVLGRK4Pv3O8qUzPd7RwSGyZFkvrGcjBclBUi+Xj
        dR6rtpcFKGyHbBIJA2cfFKdUXw==
X-Google-Smtp-Source: ABdhPJwXBPapl5IhJgWeH7CcTs8uYTChCxksoMIaMnx7hBB7Z+P+xGt0i9P8OntKX/LeXus5TZldDg==
X-Received: by 2002:a05:6a00:2188:b0:412:444e:f603 with SMTP id h8-20020a056a00218800b00412444ef603mr2282149pfi.86.1631584439080;
        Mon, 13 Sep 2021 18:53:59 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id fh3sm8089088pjb.8.2021.09.13.18.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:53:58 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add compatible for QCM2290 smd-rpm
Date:   Tue, 14 Sep 2021 09:53:47 +0800
Message-Id: <20210914015349.29295-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds compatible for QCM2290 smd-rpm.

Shawn Guo (2):
  dt-bindings: soc: qcom: smd-rpm: Add QCM2290 compatible
  soc: qcom: smd-rpm: Add QCM2290 compatible

 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 drivers/soc/qcom/smd-rpm.c                                   | 1 +
 2 files changed, 2 insertions(+)

-- 
2.17.1

