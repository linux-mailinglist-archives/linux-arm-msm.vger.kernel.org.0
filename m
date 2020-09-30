Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A95627E5E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 12:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgI3KCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 06:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgI3KCL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 06:02:11 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1C7C0613D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 03:02:11 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h23so660382pjv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 03:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TPF6YKdz4OEVC8EPsySKMAkJJaxtO9jBU1rqnEtldNQ=;
        b=d+s3AQEKnZn0OUF8cNY4yT+LUckpBFghzZVuu+U7ioW4R2aIqwBgmJrSD+5JOj6gd+
         qxr9Mc+YgJ1OKrCQNHzmQmy45PtPZW5+P7BbwP8yAhajEXBW3ESNI85knwwULO7eLzHE
         0TeHmbljVjTZLcc85C444BNdUDb8tBGrIiFyInuzHe1l+zxA9OWIXfY8u+jg1f79VPw4
         qOdDEXgPkXQBP0GCGs+kw1iQK2HRyHUpsBnRPdc7WSuJLUCRTzR2ekZD4Kh5nP7x0jhj
         Oz2sYP/KdGJUWNDbEjKzCnjpFv+vC3y6MCjILfu3LDItpfmUs/tEYmzmlRtXDFUEI+7a
         /TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TPF6YKdz4OEVC8EPsySKMAkJJaxtO9jBU1rqnEtldNQ=;
        b=oWkJ3vFmJJI5V9LS4OFX7TCWmwN1WuoJEqIqCs/3l1Fs/JKmbFiOR+hW3TYkVBneWv
         /4baWJalGiW8j/bYlv/dX9aU8vrI/LRW1d0r44W3cJzeCof4vQYnDoAPBiwR9iaDuWOE
         aNcVnZs+Bvzf0ZUsMRpJPM8Yg6wtLyyxXNxtefldPF2QZoCrL5MBbMKEOk3/7mqr2SYQ
         SD83dznmDCiBHskPN219t9RKHr3QIqXs4Al4+cmQo+jCdB3bz2rD3pL9pNlGhJr4+tXe
         8zHGGlc22zsUUkGPgipIKpxIUfRamgDlOFq27cQrAo1STAaGLPVqr58B4Pv1kj3lHS6/
         L5IA==
X-Gm-Message-State: AOAM531ZrDFLRt52LB4b3CjJH47nbu4l7BWxdwj2C2o/0C8iIjSY1TX1
        WpGn/0udy4K78ZeW9R1gKkSWHlYHxBTUi25/
X-Google-Smtp-Source: ABdhPJya4sefjAvwlYSQDZpNkFyXnQ071yq6/CRkAkkWEECUcxm265GOdq0m1WwIOXZJGigPPPROFA==
X-Received: by 2002:a17:902:9343:b029:d1:f3e1:c190 with SMTP id g3-20020a1709029343b02900d1f3e1c190mr1846628plp.2.1601460130636;
        Wed, 30 Sep 2020 03:02:10 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id b2sm1890002pfp.3.2020.09.30.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:02:10 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     stephan@gerhold.net, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
Cc:     shawn.guo@linaro.org, Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 0/2] Add MSM8939 RPM power domains
Date:   Wed, 30 Sep 2020 18:01:43 +0800
Message-Id: <20200930100145.9457-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8939 RPM power domains and associated document. This is based on
Stephan's patch set to reuse max state definition:
https://lore.kernel.org/linux-arm-msm/20200916104135.25085-1-stephan@gerhold.net/

Changes vs v2:
 - fix max power domain state value.
 - trim code layout.

Jun Nie (2):
  dt-bindings: power: rpmpd: Add MSM8939 RPM power domains
  soc: qcom: rpmpd: Add MSM8939 power-domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 27 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 10 +++++++
 3 files changed, 38 insertions(+)

-- 
2.17.1

