Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19EC14AC78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 00:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgA0XOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 18:14:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35846 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgA0XOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 18:14:50 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so489127wma.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 15:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QMJz4mlYy7tqyD3ucgKMgAQPcQ9juNEDl3GjRL9QoFc=;
        b=oKTvjQPZsEovabDcJ7V4X5v4BgpKhsMhmxx2viZ/61OmCZjP6MprH2I0Ser+38oq7U
         q3tA3QwT2iS+vAc6RHNoUBADTq9C3MJO5ditg1JtT6oSnf2YzeNMdKY8YPUN+YC4C+zU
         X5yqMdle6UwZ7YKyywp0H571PfVs9yhD8QkMrdjCcss783yskg52gJAPUhFlrYrbDU9E
         VWJb5oorVMZq39Lic+kS/7Pxa7ykuKr3ygR87NmYU69gGtrGO9GiRFQPqsJtd0X884QD
         1hY/n9dgpCKDCRDiwJh+r9qPBc9eRuDW8LeDTA+aWF6PMTHVgqjUBZGEQozxN1lW/wGv
         WT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QMJz4mlYy7tqyD3ucgKMgAQPcQ9juNEDl3GjRL9QoFc=;
        b=HZ1RDwJ9SjG2TbrnsvFch7FnGAWEzIurCkgYVpbdZny6v2Lj4LxjSLTBb+BjMvtlh/
         gjcuewnXkwJLmDETUaTGqYbBY3Pdwak8yNI/rE5sbqNWL8BqwqupWeiR1WscZq4f5tPv
         kCFs1wTjuKji4an/erXwILjnYq0P68oPkJz8ncAZiYtF1tfY/1SW9Lktez4TNhfUlLNG
         /ZDlszC26TsqyiZu8xJDcZuzAJabXxHO9X2L0Tgituj9Ga6FoCv3huEpnFZF+Miv8lvz
         IH50m7hstT5GJAfKwETN8ArTeV/LkBRXiYOINEXUQxaHXSONoyThAakLINyppiN6HP/Y
         /uDA==
X-Gm-Message-State: APjAAAUbLGyncYEI4VsVqaeYwws4DUbHFf4PvQu9Jn4cVvFxTldB1j+v
        uOkFXmZfP4uJ16i3DYB5Zh3RcSMAJZo=
X-Google-Smtp-Source: APXvYqyobkLB8eOJnrSnnROHjxYqfd2OuHbwffQmf2m5ImilvvtTPNoZDys4s4lbIUqU2F6y6C0MQA==
X-Received: by 2002:a1c:9a8d:: with SMTP id c135mr916371wme.183.1580166887454;
        Mon, 27 Jan 2020 15:14:47 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id a62sm438252wmh.33.2020.01.27.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 15:14:46 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        "Angelo G . Del Regno" <kholk11@gmail.com>,
        Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>
Subject: [PATCH 1/1] regulator: qcom_spmi: Fix docs for PM8004
Date:   Tue, 28 Jan 2020 00:14:39 +0100
Message-Id: <20200127231439.3562452-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes: 2e36e140b8b8 ("regulator: qcom_spmi: Add support for PM8004 regulators")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.txt       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index f5cdac8b2847..8b005192f6e8 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -161,7 +161,7 @@ The regulator node houses sub-nodes for each regulator within the device. Each
 sub-node is identified using the node's name, with valid values listed for each
 of the PMICs below.
 
-pm8005:
+pm8004:
 	s2, s5
 
 pm8005:
-- 
2.24.1

