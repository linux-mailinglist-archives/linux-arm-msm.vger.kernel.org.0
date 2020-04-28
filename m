Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7811BB271
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 02:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgD1ABr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 20:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726270AbgD1ABq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 20:01:46 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767D5C0610D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:01:45 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so7600730plr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nzlTHfR7hFdD1oizXMfz09Kcd8VyPhh+IZvp5hf/Cw=;
        b=GEmbiSmZ+SKuKCwgVlQekXj/+yFNzE1P+atI4JedZgi2WiZmpqEGCN3xp3WGKlHhPu
         BFIRnFlFlehyGzA83Wczy6rwlBjJ5t6ZrjCxQ4f+Iz7PziWvQq6EB0BMpEkAfWy1MdtE
         ekvEaAoK1rQT7XQ2SWd3ZhjQnCNINewMLF199NrbBwsFuiprwGNqlJhSuO2wQQPia4ib
         Pv7SL0pelZ/hMVe1JsWf4o59FIH8iqnQx+T+CgGJ7SDny5ix5sYSzihMDuGt6EoQNPn5
         sy3nK1hG5xkLqTtRaIh8hm99PthwafIIgn2iSk4ty0Dpfrit+RfhAw4T1Zn4MURQFVhb
         WdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nzlTHfR7hFdD1oizXMfz09Kcd8VyPhh+IZvp5hf/Cw=;
        b=Tv6q7l+IoDziGAwAvaZIZL/ZUPnHAaJcdm93xk+U2loTGmaT24vv/Sp8Wmp4f0D8Mv
         qimP6IwAXSsMYKzeCGFEL7o2OWzzm8Or77VOWcs4z6ZixAzu4aIqJ7mtCWmX+07Pphwy
         9I2zIaEAzpYl/TyGnKgYmdTO4UTP54ik3mAif9Yrw5QtS99d7s2bKNiy72qlwpr0rJY6
         2+UWZ8HoSBpiVmVhMIiBKk+wkqlg0vDT5eMtEGf1PKu+izGZANSFNzZ0Vou53k52b9qV
         D9xAWE6nqmieF4y8GtLgNP9NjZFdEyebs1X8VhkSo+MZMX2JUOMUsc7e3PqT00Vdnu4U
         1pLQ==
X-Gm-Message-State: AGi0Pub2LohqeJ3H9YWY5weztamdZeOpCU1tSvj0I//q0hUu38LtCX8l
        HB3KxSlQJzTF/5EYPvdUokU5Kw==
X-Google-Smtp-Source: APiQypIonDTh3jzFIn6vMcUkguT9HYXi2h6aOEXE5aT9m0hdaIn7sOZOXacCYA37T7NFEN0tHe3hjg==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr27031025plr.0.1588032104765;
        Mon, 27 Apr 2020 17:01:44 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cp22sm363850pjb.28.2020.04.27.17.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 17:01:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8250 remoteprocs
Date:   Mon, 27 Apr 2020 17:01:09 -0700
Message-Id: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SM8250 audio, compute and sensor remoteprocs to the PAS DT
binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 9938918b2fea..49ec30454198 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -21,6 +21,9 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,sm8150-cdsp-pas"
 		    "qcom,sm8150-mpss-pas"
 		    "qcom,sm8150-slpi-pas"
+		    "qcom,sm8250-adsp-pas"
+		    "qcom,sm8250-cdsp-pas"
+		    "qcom,sm8250-slpi-pas"
 
 - interrupts-extended:
 	Usage: required
@@ -44,6 +47,9 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sm8150-adsp-pas:
 	qcom,sm8150-cdsp-pas:
 	qcom,sm8150-slpi-pas:
+	qcom,sm8250-adsp-pas:
+	qcom,sm8250-cdsp-pas:
+	qcom,sm8250-slpi-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,qcs404-wcss-pas:
 	qcom,sm8150-mpss-pas:
@@ -105,10 +111,13 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sdm845-cdsp-pas:
 	qcom,sm8150-adsp-pas:
 	qcom,sm8150-cdsp-pas:
+	qcom,sm8250-adsp-pas:
+	qcom,sm8250-cdsp-pas:
 		    must be "cx", "load_state"
 	qcom,sm8150-mpss-pas:
 		    must be "cx", "load_state", "mss"
 	qcom,sm8150-slpi-pas:
+	qcom,sm8250-slpi-pas:
 		    must be "lcx", "lmx", "load_state"
 
 - memory-region:
-- 
2.24.0

