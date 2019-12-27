Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895C012B17A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 06:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfL0Fcw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 00:32:52 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38300 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfL0Fcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 00:32:51 -0500
Received: by mail-pg1-f193.google.com with SMTP id a33so13921612pgm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 21:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DNsQCo6LXJC8qwpw5lLZyTWBH87Wonp/iNPumYIBIeA=;
        b=uHM3rh/xMixeEdGho0V1/5lGpU6VG1/HH/T6XemIFGYsnmrcrteFrw0IqAZHxYaJ0s
         uNH8CHUWtdchxN+9CaSvyP4gXsrwdWe5QWtZNR3X8fWzCS5363hiy/T7wGE1m5YhV7hh
         bdVN3ByBeY5QKvpS0R+p7Ide7Z+12wWKvfXDZogvdyH0CbVBSWFMATsbGFSVU72Kd6iX
         e15T15UJuA5cfgx8ukGCXiiJ23SCniTp/ZhcZRjBy3ceBSLc2xlxrBfDwuASiTVF8bBu
         F9qAHVK2fMH8EJY77plt5xiTpdRMF6kdWJ/uZffL1tnkM+Uw8nhwi73WfNGTRPQipUwT
         eOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DNsQCo6LXJC8qwpw5lLZyTWBH87Wonp/iNPumYIBIeA=;
        b=iHEiRyxVh4gGNW7P8601QAvyBWYzTi39we8uHMklsHvduNkUSFKI0x5iH79LSmq3n1
         t6RH8y6cQtx7TUWp+tdbsY48Sjzqzxptms0dwWcrZhRncwGbYzyYQGM8kL80v//5S0fz
         IiWSD90PwMvq5aJd30GqDYBl0pqG4C29ZCj0XHY8on9mx8JAPG64l1opIOrQ6o8SEct/
         trwXw5UJCcwACCg8L5IEdFH/BrYei7kUcPZ12kxWQzvGYYlMvRWkfkrX4/FCFvWqyled
         vGtLKsMebWI1vmjdDeS6P9iJn2/Dg2817GTro+rPtrxBw37wVI0jcnBgH65rStKpZ6z1
         KyUw==
X-Gm-Message-State: APjAAAWSdT+KDEhsGqz8WJP+No+8o1PljBu+BZcHRJ9BqtFdj/4NQqdf
        3T9WfKuccFMsaPZU2+rCzsSxeQ==
X-Google-Smtp-Source: APXvYqyiRlqXJsIiwAETAxfq+/5jWNahW0z2oKyFwzUy1QxniQMUf9zzQ7/zUYDe5YgBzNLcYZsDkg==
X-Received: by 2002:a63:d54f:: with SMTP id v15mr54357940pgi.64.1577424770892;
        Thu, 26 Dec 2019 21:32:50 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c22sm16789196pfo.50.2019.12.26.21.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 21:32:50 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 0/8] remoteproc: qcom: post mortem debug support
Date:   Thu, 26 Dec 2019 21:32:07 -0800
Message-Id: <20191227053215.423811-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following series introduces two components that aids in post mortem
debugging of Qualcomm systems. The first part is used to store information
about loaded images in IMEM, for post mortem tools to know where the kernel
loaded the remoteproc firmware. The second part invokes a stop operation on the
remoteprocs during a kernel panic, in order to trigger them to flush caches
etc.

Bjorn Andersson (8):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce driver to store pil info in IMEM
  remoteproc: qcom: Update IMEM PIL info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region
  remoteproc: Introduce "panic" callback in ops
  remoteproc: qcom: q6v5: Add common panic handler
  remoteproc: qcom: Introduce panic handler for PAS and ADSP

 .../bindings/remoteproc/qcom,pil-info.yaml    |  35 ++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  10 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  10 ++
 drivers/remoteproc/Kconfig                    |   6 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 150 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   8 +
 drivers/remoteproc/qcom_q6v5.c                |  19 +++
 drivers/remoteproc/qcom_q6v5.h                |   1 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  27 +++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   6 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  26 ++-
 drivers/remoteproc/qcom_wcnss.c               |  17 +-
 drivers/remoteproc/remoteproc_core.c          |  17 ++
 include/linux/remoteproc.h                    |   4 +
 15 files changed, 328 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.24.0

