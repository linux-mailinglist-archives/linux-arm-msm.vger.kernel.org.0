Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7607926D670
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 10:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIQI0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 04:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgIQI0b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 04:26:31 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B217EC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 01:26:31 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 34so917116pgo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Nh4GAOm0hko1A+aCz8p34Bkc9Qfa63CrTHwVTOLmZ/Q=;
        b=aqfkc6K7oRz8CuKPVuJ9svnfXtEulWQoGfMrGhrLhJNm8fsD3bSxy35//UH+Zh1hWH
         oCqdryDeW8pFN671mxDd18WF3TpRVKULPgFIs3f0D4cPhR6niTt0/0e49mFADYH4FCqo
         bpLRz0dIBSIdmUZs+3SAXnnJEtbHWEBsRIdcMPxmnEVEKbNquU6lSz69G7tlQuQ5nnIu
         SuPx9s5e++JhMgbhFhZLhdzJ+0TFznMavD1SA0KWBCoOdWM8hze1EYrS2JfHHoKt+p5t
         j/hqg3pVvKnpMfTjfy68x+IC/XUU6KU+JCkExxAxtgU4UuMvKhlon3GN8e3esxOrVb/N
         gR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nh4GAOm0hko1A+aCz8p34Bkc9Qfa63CrTHwVTOLmZ/Q=;
        b=QgSdsOCm9j2jHg11pnRrKMIE4RjCFwNPoiHgWObrkNGp81IjNr0DiqMJt3rQWs+rV4
         3ic64EBPAf/ViLgBSM0Xh0vBQLwJz8bPefNeWhZF9p7Pwa3MN9GBciIaylj13f9hXfgO
         7SlW2IfjCCt++K5/y8Dvg5Xf4hQQIad140g+qB9JfrOMYN9hdVRCXfRauk6rtMsZ7UMr
         FdaBi9tejOiR0u9VGgnLEYOgXOOSIgKad1Haqh549UIwj/PsMgVKYA/I31hbXnDNYK3H
         HWT/BKKRKnaD2ugoKYvDa0ttEmCCZmu8wSb1+v+tY6oHR/cFUC5RWn46uMXpqwtMfXkQ
         J5aA==
X-Gm-Message-State: AOAM532vXGnlm1EXLH7BTo6QsyfQ90Vjjy/AE+Jo793gLQVGtbcIG744
        pc5GftasESYv4a5nqgAtoGC3
X-Google-Smtp-Source: ABdhPJxFftULprDAN34zvVrtfr+slMh9VfI1wHiCOeETwNdkVr+PNZmpGajFLKlo/WdTIh8mT02ezQ==
X-Received: by 2002:aa7:8084:0:b029:13f:b82a:1725 with SMTP id v4-20020aa780840000b029013fb82a1725mr23997407pff.9.1600331190897;
        Thu, 17 Sep 2020 01:26:30 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id g129sm8233194pfb.9.2020.09.17.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:26:30 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add USB support for SM8250
Date:   Thu, 17 Sep 2020 13:56:19 +0530
Message-Id: <20200917082622.6823-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds USB support for SM8250 SoC. The SM8250 specific patches
are sent by Jonathan earlier but didn't make it to qcom tree yet. So I'm
clubbing those in this series along with RB5 patch.

This series is based on qcom/for-next branch and tested on RB5 board.

Thanks,
Mani

Jonathan Marek (2):
  arm64: dts: qcom: sm8250: add apps_smmu node
  arm64: dts: qcom: sm8250: Add USB and PHY device nodes

Manivannan Sadhasivam (1):
  arm64: dts: qcom: qrb5165-rb5: Add USB support

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |  46 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 287 +++++++++++++++++++++++
 2 files changed, 333 insertions(+)

-- 
2.17.1

