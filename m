Return-Path: <linux-arm-msm+bounces-61081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0EAD69F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ADE33A6EBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 08:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10B921421D;
	Thu, 12 Jun 2025 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eeeec68B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078701F0E29
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715642; cv=none; b=IN9BQWzBdkZhLSSuTtDZ2xsDv7vwrNkGicvVTM71hmYveTAVKoELnjMJrU1NZUbcGBV/vozjhkSD9xD0VmIGPcxoVu7Zr3R1fZD7P14/UNo7aQV02fHYpnF5ZQCB5bTCNfR86814clhJl3fKatYR4dYTWOV0rm2PkIPL7QsEHi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715642; c=relaxed/simple;
	bh=8tDz2WWtHl5iNiZtu805A7AYCZLwxYys726Q+3nadXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kq5z3DvSXxv/Dy77ivFHeWPWgTqhxtZyaDjnK6wJktMaGUCpj23+QHNLUCmUiPNtpwFzMiqwWaOG99tdnpZBVq7zNnVCJ2VYYbI7CAZ8a6ZlI03oKbm5ms6gm+IrDIOZoN31W7LKqNNo+QBkWUoaeLytllTJiW0qJKSfQjRroWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eeeec68B; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a35c894313so607197f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715639; x=1750320439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EsXhAjGTTQWpaDRlErU9rdRhfOKTZnFTlIFcBZuhGs=;
        b=Eeeec68BK+ZVINceo2v3/MoOp6XZjFie5jO82x99y06q5MJctyeOMq0LVWL2idfgxn
         pXuVu+z+x1M6hjoATQ/YPBdwNryPfRH8/dol1IoTwZ5ClwNimNCtMrZv3w4gsSXMTDFC
         Myy72ZJis11uL2KuIh9rmFZSQrPL2CVTd6w6pVXJtGFIvZINUBr+HeOxzIFR7R872qMI
         8Ows8AGMrBqKwpp+Gz94kqnESkDiyO1UgIOP/haZbZQOKhKDu7H0SyYgcG5+9QNcm2Kb
         dy+bnPa45mPbUxAWaRCizI2SnW51CLdF7f4083CE951yMxgOLgR/hQcV7GTBmhwzzf+Q
         GCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715639; x=1750320439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EsXhAjGTTQWpaDRlErU9rdRhfOKTZnFTlIFcBZuhGs=;
        b=gCEbw23ir16t8cNCliwKBp06Xds8ThEl9Nc3z1xro06QjHXmXcchtiK/XCyt+jdLC5
         IT/i5UwtRN2p3MsCQ0SOuQmWxnLCC2BDme1jvht+XNeVUTJ0ZB+gekJ6qRSjKIkdwMgL
         M0fcziJglHdKx51saMLw1Mtjn++Wcj5cPo7irGYYs2+YoRyZNQnK69yDlVgsazxXLkQX
         J0VFxcEZbsvJ6d3dluNXIesgsHdO7mEVZtcgEbSpmjiAPP2OCtCrDdpWQ7WL5OjcqlJ/
         KX0DTkmwqEtjsiUp1nSGIjR04eNQjcF2AouBsXYDlPGtPr5GqbdUUJC622HSqd9oyYbu
         cuyw==
X-Forwarded-Encrypted: i=1; AJvYcCVvp3Y45qN5O+hSzHWf0WitQ+1vup0VTMmqH9QAYCukz0xQyHqrWUE2yUYb+sIKqKv5rNsdjqcnkRQDWATW@vger.kernel.org
X-Gm-Message-State: AOJu0YyUThwrygrLU8KFzvOJ8h3I8GcwQiusaZROZMXwJXs94j0fkPDT
	aWAjtu+Eb+QPv44x6/f+S9Oumns82VvztYhHy+HxYuelAN6DTFu9VaSswOKCTc6pEHUS+SRmUY/
	wu1kea6c=
X-Gm-Gg: ASbGncstKL2zCV5LUOGob9LENAQL5VYtmB/3KGtaTWmfbczJi8ETVfw4/BCWIndHnh+
	gdTcvYp8MB3SufcwD8L6ry2rTfr8wya4S0DxSoBWsoArJ0w1yPQIdicy0+0ILlytzE/nrtRw5lN
	60z9XRZkku+ZkCXASkhtt0KuNfUUXDWgqLCtH0tyrvtnr3tqOKJ6kReKhf2z7BoTE6UixaeQz2o
	J2QESUoabG1bRJeOHOaACOv+Ur0vbAJZEw5NAo3syEVFJAu+NMK2DWLkKw0/jvnR47syVa0dkW4
	psTC7Tdxit7PHm3DGpyQxW+9+RNhh4qFP3V9GhysA69r9KeDPPaZdrnrYvZ1O4OaMGV0iOXUPZ2
	2BGiXQYcJ5qczWXykQ29DwRM=
X-Google-Smtp-Source: AGHT+IELKF2BpPbSWqRYk4Gz6CQukHgSMRWMkrUf0ssis7ZGRpZXgfdefuUMTWLkzrdWYkstVJZCJA==
X-Received: by 2002:a5d:588e:0:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a56130ce70mr1541851f8f.55.1749715639161;
        Thu, 12 Jun 2025 01:07:19 -0700 (PDT)
Received: from [127.0.0.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm12942335e9.7.2025.06.12.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:07:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: qcom: camss: Fix two bugs in mainline
Date: Thu, 12 Jun 2025 09:07:14 +0100
Message-Id: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALKKSmgC/x2NQQrCMBQFr1L+2ge/sbHgVcRFsK/6oURJtEZK7
 97Y5SxmZpHMZMxybhZJnC3bM1ZoD43cHiHeCRsqi1Pn9dQqJoufgsjyhvNQj6NiCDb98Nf5zeh
 6jr4j2TNI7bwSRyv743Jd1w05S/pscwAAAA==
X-Change-ID: 20250610-linux-next-25-05-30-daily-reviews-47ef54eee7ea
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=8tDz2WWtHl5iNiZtu805A7AYCZLwxYys726Q+3nadXg=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoSoq0qnkiS+TZmmJnu9CFHauELJP3na1Z5aUm+
 he35PUBSsOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaEqKtAAKCRAicTuzoY3I
 OjYpD/90owDahLx/oFJlZo5Dugmf1+6K/ibsQ/tHTcVrnVzTfDIQ8SgAsyKaCu3rT9x/pIvsRoJ
 8swTBTOFm1n9Zvjt+i0lDh5FY+gKvOmsu05f0JNTzBYZjjFkv1aAE7Noh48Zqrfjym5qBmeIet9
 VTxj/mDb5wyg6Tx7A1/te2bhnJXqaBl2/d988Ouzsg8DWMxIAfZlLrQ76dG0JQ2deoFiMHTvE6V
 h0O3k1rgwBE9nSHbqUrY8n2t2V8y5GByYHrezqpxswjMfdQ4wqhFaulTgLhuSEq+dl49QVpcRL9
 tPxXcEqzxzpATIg9Ep7CLFXH+eAkppLZfcDEiXIK18GdFgOJhTxW2ppSvlNNOXtDzH9XgkqLTW6
 lgZ1tWxtjhdDkiCxN65I9vn6cbKELju4a5VrS4qH4jsufLB4ebc/XAfX7QLGCYyIBNPn+dhBglo
 Edp9BoOx0kNd09gFw/qZFIKrzZupQtHjB2oqLjREzpcr9Mqn583jai+4UKPfjoqa+3eH3N9/BjX
 AGQOM6v+uBKPXB+ai/pbih3ZeEZFVaH4T2mJkZ/+vKR//o3sS61mdXMGJYPqQ6PxuFCJiZOayj+
 1ewPnybUvQR0MkXP75LDSIcac07osETEn+xRX3NjvAD4mWIFHhGjCS0rdQEcxWziJ0UEv6/nc9T
 OQxxF+8eicIIwrg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Two bug fixes here.

First up SDM630/SDM660 hasn't been probing because moving the CSIPHY gen2
init sequence into a common location also moved the default case of the
switch statement which rejects non-gen2 devices.

Second is a fix for a very longstanding bug which is a race-condition
between fully enumerating /dev/videoX devices along with all of their
dependent data-structures and gating user-space access to those devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: qcom: camss: csiphy-3ph: Fix inadvertent dropping of SDM660/SDM670 phy init
      media: qcom: camss: vfe: Fix registration sequencing bug

 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +--
 drivers/media/platform/qcom/camss/camss-vfe.c            | 8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h            | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 8666245114d979b963dc23894a03c74ecab8a7a6
change-id: 20250610-linux-next-25-05-30-daily-reviews-47ef54eee7ea

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


