Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57C91F8186
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 09:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgFMH2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 03:28:10 -0400
Received: from relay-2.mailobj.net ([213.182.54.5]:53868 "EHLO
        relay-2.mailobj.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgFMH2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 03:28:08 -0400
Received: from v-1.localdomain (v-1.in.mailobj.net [192.168.90.191])
        by relay-2.mailobj.net (Postfix) with SMTP id 7782612F5;
        Sat, 13 Jun 2020 09:28:06 +0200 (CEST)
Received: by ip-25.net-c.com [213.182.54.25] with ESMTP
        Sat, 13 Jun 2020 09:29:01 +0200 (CEST)
X-EA-Auth: l5PGjICbplBVFZcRa5FKA2zra6KgVtI3bKKlzxVI4zWQmjSg40+RR3Y7KSoqMunuUU5MCzo2jPXSnQAq/d8vl53sNJi8as1PHh4Ozu9DOYM=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     sboyd@kernel.org
Cc:     konradybcio@gmail.com, Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Add SMD RPM support for MSM8936
Date:   Sat, 13 Jun 2020 09:27:41 +0200
Message-Id: <20200613072745.1249003-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

changes since v3:
- added my missing Signed-off-by to patch 3

changes since v2:
- fixed build error by adding forgotten qcom,rpmcc.h changes in patch 1

changes since v1:
- added a forgotten patch that adds the compat string to the driver

Konrad Dybcio (1):
  drivers: soc: Add MSM8936 SMD RPM compatible

Vincent Knecht (3):
  clk: qcom: smd: Add support for MSM8936 rpm clocks
  dt-bindings: clock: rpmcc: Document MSM8936 compatible
  dt-bindings: soc: qcom: Document MSM8936 SMD RPM

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 .../bindings/soc/qcom/qcom,smd-rpm.txt        |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 50 +++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c                    |  1 +
 include/dt-bindings/clock/qcom,rpmcc.h        |  2 +
 5 files changed, 55 insertions(+)

-- 
2.25.4


