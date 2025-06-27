Return-Path: <linux-arm-msm+bounces-62724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DAAEAF4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 08:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3BC3B63AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 06:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA3C21C166;
	Fri, 27 Jun 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VB/lAK4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349EF21A458
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007356; cv=none; b=gShU/kaBo5dJ4NOTDbBKIlcfAWuXhpi8qEp5Qou3X1NVOGjTbeP1Fouv5M5/SecwRvHfoHsTJ1EbOjSoBk+eEyJRfFw1jrQkj175z7w0nWYK+Z+xx48hjXMf7N7S0NYZIBD1LXkfunxBPvF41Vz8tLpv8Peojoi2vhIsjSpq4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007356; c=relaxed/simple;
	bh=HRKYSDD5aEl3fpXcNcNVmNhnN9+cdeRs/Hjz67cr70k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZivwu9STE6nZOIwC8WIH4ICvDcf8tMYK1iPthNxm2uJRg/hmgBGi2T+FWGwJzcE1kXZDUQgHhiHup6EJr8iGNJOVqa/C+km0TAc4It/4CZXmuDP8rlr9WwwQaSKI611w5m4MOUFcqw1wo995oNFzZqXPxvaIULokTkWOpLxIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VB/lAK4v; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-adb4e36904bso371283266b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007352; x=1751612152; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OyVyTnLvcUYUCVnJmVzdUrEtcXIeCg0NCslSbzPGUI=;
        b=VB/lAK4vM7G3sAZEijjfiWt5SIZBy9pfIRGW++FiO++auOKOvSXUCXKzXw0AvYL9dN
         oSAMsS7ViwEYtotB9aVLNpuA6QBJdBPG9mOXTksBDn6WFp8bZmZYtHIfv+ggoXSsOebM
         7tmMAIkNkJ/ElZm3BIx7ol/q0a6hWrlts/LJYYqv/XOJTUDAQjnXplDYNIXX0OANqno5
         hSeSOgl8KoR979VOBSRUjgXE3Fj2/j4055HrlgBF+FNrfNqdgkvJCrnVCE7FVdgqXIyQ
         PCmnVQu7z7B/nCfHqg2b0p9XYWS6mKpJGqVk0wndAbFGX6v6oNIp1RmxeCid+5KyVgqx
         JqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007352; x=1751612152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OyVyTnLvcUYUCVnJmVzdUrEtcXIeCg0NCslSbzPGUI=;
        b=broLXVw350tRyoMD+LsHZwpIgCA1QMCjjZ1/0hb5ztHF9bGI0xlRmaoosy90biVn2z
         viIBavN4OJAaxPP8pMkTZ2SpkwQsn0JcobqotKNQB+MGKP72hODHcLMTvDdea3g6AHhI
         lWGfqK8WNYx8BtzBVtWvakJMhCnyxk0TvTtfOX1aDYt/lQ8PS4n7Cnz7ptzfvXtKAKjb
         VBXDYsWgLH8BYKo32TZJ36ra75jl9cS/kcwBlbizSFu5CiJtEDEuIVBteBGRxt8Lu4Uy
         ZM+absOdkhnrMULSUQwS96gyRcP9kUEij0vRcY/WZjBH/Z5UVz46gJRqPawA3cNOBsxj
         HE7w==
X-Forwarded-Encrypted: i=1; AJvYcCUaYwOeILFxLCU444qSFrigDYrv0LZZxP5kEieFzW+lMzZ5/pcJ7T1F8OWFDC8Vss9OmYf9+i9c3MVAQPzd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn8snXQZQzB03VfFdSWYTtSR3tIXYvA1EMEtz1mR/R/QbRD7Y8
	kXJA60DQODaXXi0KMwv8VqflXU/Y1NNgWTxk6eSjR+58tGSCFCI7G3v/1DqUiyYcs8c=
X-Gm-Gg: ASbGncuu0MuiW1P9DXSzO+0K8Jhn2/9vCGMG/I44mFYszCKEuTwtXbXCrSVo8+raaLa
	qRzyMxSy5XownzP3XcXwNLjBgYF81p1YSLkSQY6sISCHeuWzlUKSLxw5GA/9DJWckeOvdOmmwIb
	Bs1xJpxwUiCjjQWIQuSLNEUkY3nXhMYQvu+dSR1+NpEPhDGD1JZ2OgP4OMHhiltZzcWyt5+1FHE
	kJCTHvyk8amNk900S3BR7E6nHaf/aDZAHGxcbyL2TWOKzszYaAvcy1s9xVtJJaef7k9u6OQ6rMU
	fIQhmf6k0s/PvHu+14cGuz9erf9pKhfMsJX/FL8lcy9W8sTL61O8ZysPJeApGDXUTHuQ0ToYAxA
	Co6exUwJsb5SW1hEJC9+IXCVsTrW+I+qC
X-Google-Smtp-Source: AGHT+IFjnOE8NEuOzdjShiuz1TfX1GtkNhAVAt609Dn5g7Pd0R6rLxmR5Tj2cwmvAKPv7UsDwUE7JQ==
X-Received: by 2002:a17:907:3c89:b0:ae0:d903:2bc1 with SMTP id a640c23a62f3a-ae35019f2e6mr171046566b.49.1751007352601;
        Thu, 26 Jun 2025 23:55:52 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add support for remoteprocs on SM7635
Date: Fri, 27 Jun 2025 08:55:41 +0200
Message-Id: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1AXmgC/22NQQ6CMBBFr0JmbU1b2oKsvIdhAWWQWUCbKSEaw
 t2tJO5cvpf893dIyIQJmmIHxo0ShSWDvhTgp255oqAhM2iprXRaijRXrrSCcQ4rRg4+CWVuQ+e
 MrE1fQx5GxpFeZ/TRZp4orYHf58emvvaXs/9ymxJSVKUcXG9VpRDvY0ccp7Dg1YcZ2uM4PuKRx
 qK4AAAA
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=986;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HRKYSDD5aEl3fpXcNcNVmNhnN9+cdeRs/Hjz67cr70k=;
 b=pH1MuTyeCcISIwj8Evc1Kddyilr/htJ3i7P0g83fcN7B7VvBPn5+W5za7kTR2IJUmlQc5yJgO
 jM5GlQbE+RkAuwkGek1ngqy0p+uMBqjrAOkKxBVRZgkJ+P6UqqgG/XP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update default firmware names from .mdt to .mbn
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com

---
Luca Weiss (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: document SM7635 MPSS & WPSS
      dt-bindings: remoteproc: qcom,sm8550-pas: document SM7635 ADSP & CDSP
      remoteproc: qcom: pas: Add SM7635 remoteproc support

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 19 +++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 ++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


