Return-Path: <linux-arm-msm+bounces-29026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27F9578B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 01:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278E91F238BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E24D1E212B;
	Mon, 19 Aug 2024 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DgpiQ4Kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B571DF678
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110594; cv=none; b=tfjzSX7TPvwJWghGd5lkaCt7jFa3WGSl/276YoQvYDP6jpHvAMtg9hC6mUjvrjB908PcauhkZ4vsN5K+od7MDyr1lObpWR+AzrlHdu701qadDFiFaLlRkdeJocdiozLrKleRvu9TbtOER9VsWqpJnoT+AJHt7QVXtiQ3I1O9ydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110594; c=relaxed/simple;
	bh=bnMnLpZp/vOPSEYX30lp0wp4cH4DtZ+pQAK/e1kQwZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IWoWJOH/n6ZPtSFsNSY2/SipHKY1cPddemy/L9QadlDFWtCiiBKIwkNuWjEdNo1+6Ts4SQgNMlShiZBVlphIEuYfSLgQBu+euDjIqxAtZcVNe7E53QhOJYbu34B1a7qQ+3jGTjaCmcAopqfNQTrHwpIjFEKI/WaZISc7rp9mGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DgpiQ4Kd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201e64607a5so34190845ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 16:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724110590; x=1724715390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLDC5jns3s4C83X1DcMxdP9cS3cEbuLuxiBTxLxZvgc=;
        b=DgpiQ4Kdmbp7cEjO69IK0su1y6FtOQtpPB6YH2caTXSOWmgq3rYKMjS8xKgGLIXTtT
         aIJUoes14M1KOrSXAT0/yuwKbESZDeHI7oAXZsAS6QuQs3EOuGS+DuvKkrusg/Z7eXfX
         dazz1y47M+xKy/F5hxTr22baVG4eZjqtBAQ5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110590; x=1724715390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLDC5jns3s4C83X1DcMxdP9cS3cEbuLuxiBTxLxZvgc=;
        b=hNT6GXdn3ql6nfk13QbjxmD34OeObpKxFPAsPLTWE2JLwJgBJ9CHwc3kTtXUP5z1qw
         jY4U4w9NA6SZAYofIukbFVJlCMo7h3dvDanJ0VdQh/dzXNcr7/xnuZStyjasQz+rIxV3
         +ZgrKNsM9A0IuAetvB5q46BufgEEHJWTu4ufe1ETOIFQe9in6c9Bf0J9NNj4s8mYijfV
         NBKus67Pej4vXdrQwqK759OvShlFptDWRLHZlsaEoswzSz83HPuTXXmlPX7bkj+gVwRz
         hxqEotNVlhof6vCKVHnN2XAC58JXmVazaj/vF+iRe22D0MmXYUyrzXTWHXqTMagxQ6vx
         UjCg==
X-Forwarded-Encrypted: i=1; AJvYcCVSuyjrAc1OjcsZjR8wzqpfUeoVmQKEW7P5xs9ihZbk3g4VAcvNwv9jtpKfbSv+N8wJiWnbJK7kJRLSiQN9BdHrp3nNv21CHHp+5XF+Zw==
X-Gm-Message-State: AOJu0YwhV4LOMLmhyuHjM7t+hoRl19fGPKBjJVumo3NeCIR+5Cz3Rmn4
	Exjs5lgbBQ0pG67VahH5+q0lpeHyszrWSE1sQv+TEuPAuZ2XjW84Cqky+3YHRR7nxqbu7IVA7sI
	=
X-Google-Smtp-Source: AGHT+IF+AD7Zm81meDhqLkHnYjIPgLHIQ0TzFtOkcrvdzaom6Dh2akLYWZlQIUgyro2on4aBmpYOMg==
X-Received: by 2002:a17:902:e883:b0:202:3dcf:8c47 with SMTP id d9443c01a7336-2023dcf8e43mr59296145ad.59.1724110590261;
        Mon, 19 Aug 2024 16:36:30 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-201f0375acasm67703585ad.161.2024.08.19.16.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 16:36:29 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/2] clk: qcom: gcc-sm8550: Fix shared clk parking breakage
Date: Mon, 19 Aug 2024 16:36:25 -0700
Message-ID: <20240819233628.2074654-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amit Pundir reported[1] that a recent commit 01a0a6cc8cfd ("clk: qcom:
Park shared RCGs upon registration") broke USB and audio on sm8550-hdk.
These two patches fix the issue by skipping the parking bit of the
shared RCGs for devices that can't run so slow.

[1] https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com/

Stephen Boyd (2):
  clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
  clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time

 drivers/clk/qcom/clk-rcg.h    |  1 +
 drivers/clk/qcom/clk-rcg2.c   | 30 +++++++++++++++++++
 drivers/clk/qcom/gcc-sm8550.c | 54 +++++++++++++++++------------------
 3 files changed, 58 insertions(+), 27 deletions(-)


base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
https://chromeos.dev


