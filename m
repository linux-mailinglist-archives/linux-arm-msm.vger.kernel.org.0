Return-Path: <linux-arm-msm+bounces-32652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5539881B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA8B11C22C66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364B51BBBE2;
	Fri, 27 Sep 2024 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/IltFPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2F185B72;
	Fri, 27 Sep 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430381; cv=none; b=J6Y74ShIDWPPaiANYN80g5SWmCIfmp/8pRbZAJqpB//gZg+G/h1kCeYb35i706xtOwK0K9MaJ2NB0pMSArlWXzeuo8myO1fpRiAwZwE2oNS2GJd3DiOxmkEoOcToS7Ptmn9Cko2Mcu+tc2EjdQpHc1YcXoRg47jGcD8aqBEzRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430381; c=relaxed/simple;
	bh=TvSAspa73kBCcXKu5GHQ92Nm6Hk8ZYg+glSB6UsK3ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUY+Qw+HXIN7tm0snS9LS/PrPN1uJdixgmRvHPJLhAuEDUZnp3or+idd8PXh55GXoLkCMa5CnsnqboMV3xmq5wFQr2FYu0zhJOsfwWhrkDaZQY7W0RNKbkgGrQAjeGkr/xzX3j5amSOY7BTH/0aJiQ2r3yUT64huGicU/3iJ4mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/IltFPh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b01da232aso14353965ad.1;
        Fri, 27 Sep 2024 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727430378; x=1728035178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY7KFPgf9kSCJX4nHdbRgehEUp8pgR57emfdD/L7ESo=;
        b=V/IltFPhRPgsDqjkNqces7pbBUY7ib/h0/sMTq2TC4Rr+d1F4GSZ+FDNa5nwkxCPhl
         /TiY9QajZuZfjdZDYLc2eYxDJCozO8PO5eC/l0H+So4XNW75eelj1N+M/evUwW/ytLza
         ZH/t68pdjoCv+y+wmWffQLIAF+iRiIAw5gRU4YQua3RTIolqC0g3B9pAM4468kANXz4X
         0s/nt3k4o7OIrhoNaKeSU4rI6f/u2z6WLHSQPyZt9bbeFWWUlLPKDoe/QJ4UQVz9dk44
         OgQAW2TQbXhmnT88PjxpEM8w5Zd+w+iVrXOOzhIc8ghj81jFHcvJnd62LAxV7mgJ7QAj
         uwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430378; x=1728035178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY7KFPgf9kSCJX4nHdbRgehEUp8pgR57emfdD/L7ESo=;
        b=SV3CBpuS9CPQ012KApSgV5r8A0PIfz81s61BXbrIbaqNNwJERrHtS6l+7fDHTmr68J
         KJVp86mftY+EgJlidzmwB951HFJG9VPaJ0qxMy1STokFnPwcjTiw3o6VZI+MNfFUgHig
         ic/8Vp1K5491fEmKzTWK90fRuBZXvdD4VbSwUT5ZTA0BWtW/0CGuKqILmgQUGKZICt45
         4DQT+8afiim8k4d7RT6QaccZhshr9CBeswSiU4IEV2eKVCsgTltbcqUDlIk8+KdfAL/p
         tJTtJTQJQHTwRUD+ffmk+LJPoMV8S1AHx1qf7AP/QlqdSTXK+8ZnnNP8sJPwEiEQpOZN
         K2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUHUHNjoocq5/8sshAPq5KL/RFWnVmwB53Fg1jO0Gv3z1I4qlG3rt+GpLeLHCjvA2+v7uEp/bAwq+h/@vger.kernel.org, AJvYcCURKrihRyfxTJEsHff26hMZTBfANJA0C4eyOyMbypXOP2BoGKv5EWeFVm8zX/cNowPZtJ5UWYvgdnKM5ky1@vger.kernel.org, AJvYcCWNStrr1TNkAO0wbL5CCvlVifP+1vgs+tZw1EKxUsocGkN+GAKOt+h8CsChUSFdtAg1q35vThYgbAM7XtOlSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNFCvzPWFHMmeqcsIDoe3KpdxuV/t5UxDWGXPAAjsUd8IQeYGJ
	VzkJHhxIzRWKMp/z5mKcFpX4iGEXCR69LfUCUQVUQBBxBVffxAM=
X-Google-Smtp-Source: AGHT+IGXzyrJkHDc1xHtIGwpFyBHUZvukgczBdzVIrZVi4U1h6Aep/RNhIJ2g3HzSVUTn9eGDtQHDQ==
X-Received: by 2002:a17:902:da8e:b0:205:5284:e510 with SMTP id d9443c01a7336-20b365b8af9mr43587175ad.1.1727430377983;
        Fri, 27 Sep 2024 02:46:17 -0700 (PDT)
Received: from localhost.. ([42.116.8.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4e61csm10533895ad.237.2024.09.27.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:46:17 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 2/3] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
Date: Fri, 27 Sep 2024 11:44:19 +0200
Message-ID: <20240927094544.6966-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927094544.6966-1-alex.vinarskis@gmail.com>
References: <20240927094544.6966-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..5d8afdb3b6c9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1731,6 +1731,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "dell,tributo-13" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.43.0


