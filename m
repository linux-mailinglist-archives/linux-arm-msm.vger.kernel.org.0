Return-Path: <linux-arm-msm+bounces-38151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D049D07DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 03:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDDA91F217A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 02:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E2638DC8;
	Mon, 18 Nov 2024 02:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tygw5ctg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F4360
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731896679; cv=none; b=h7Wo62EJLv0s2sReYmRiyp/EMFTF57mHJ+oNGBN4y3Q7ZHDnZ0U6FC2q5K5lPFRlZVjKxm1yXVmfGgCEp0ucLI4LtTvA0kW4Xfmzum/LyXU4zGJ29HvwPklS1UstmR1IId2xISplstr2gh3kc+vNi/hMJAkZPFOz3LxH8299umg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731896679; c=relaxed/simple;
	bh=k3eyVUgvTJkKbvoXpMka4VR0FOUVAWdTrp6FJEjjc0o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TGmyXvDmDgBsST754TRLWLOpDmkym1lDu3t3O9Y9bL8mG54CJjSWRCc1RJ4IAGeYG9IgyfF4AwIul/MQbiICHTV3cpUOCwt9m+WD9V8GalVa0/qd3PjiLdIfJckZzfWa2cnRHtMgDOjkWRIVFUzFOCsDZpj6zCtMYbSbW7me3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tygw5ctg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so33748325e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 18:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731896675; x=1732501475; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPjgWhLQCkTakjfZhT/uUqtaJNKJd0vGZgcQQ4R7uyQ=;
        b=Tygw5ctgnQNfwteytDhRTYSHu0qKkLqgi0PBBggtGC2Iil+B5aWtYIPBe8JFGiKDom
         uR5DW3Wbs7oP8u0m5/M/ZTEybkB70ughhrMmsZgKuS7lazHEB0nSLV6C2LLnrXqa5fjK
         sJa8uZSkgXnBftHDHscXeZKH38P6hZnn2rHTCXpgYv+AQqVGjSLRTwpK/lBlvwRIUvcv
         jNOHN4YFdWt++JE/TmqgTgdTbBp8UJMSN+rax6J7wR4309QyITuZtyC4mkCFvBGk0jta
         7Fa3Q/6cIgTeEuw6H1XYbqUsXU8qM3BriOyPcNKj+Z94YxcZmdrjhnkPs5pYYIG11fuQ
         cgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731896675; x=1732501475;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPjgWhLQCkTakjfZhT/uUqtaJNKJd0vGZgcQQ4R7uyQ=;
        b=MUstJN9Vljh4dzhfKzuJHY46vVhqamUOuNf61ygH+jvLP7EeBxFN3WPgNUwuRGHVmW
         UiSzDoVpDWFy/t4SVclJIQrkkhjY1ZEZuQC8M0eCPblNKWSaDrMOqAj1mx+jalNtpILd
         zltENyrcN/w6d/sqlo0KHvwXQcNtneBqyC40l1sbTgZ8jt7GyI2fxrLFrOm6K/YjE0YG
         xiUx2aFif6476umCQpJ+lO5NADOTryzhZ+veLSdduH2Nt6QB1vdCWpALFaIW64htZ93R
         jp6+6DDIxXB1eHk5Mgxut7yKeNzSAZsndZ2XgIpIDzuxKVn/EFApcU0sfrfjf3oQLzQC
         3yIg==
X-Gm-Message-State: AOJu0YzRlHyKYNat0+37umWIDhDA5mSH7lSNfmFQgFuv+w46MVgDNvmV
	OTouxUPhwhQVyNwcWjfBoEuGBwzhbNnb+Zgyb6f1BjjKNrCNPU2foo2rswqWBwo=
X-Google-Smtp-Source: AGHT+IHoVxhlL4UOF7WDoLOsycgCb1o74foUHlXwahjrJcecC+yRs/vAT7J/fQ/8T2Sm873bRa/fYQ==
X-Received: by 2002:a05:6000:400c:b0:382:3afd:126a with SMTP id ffacd0b85a97d-3823afd1568mr4338493f8f.35.1731896674856;
        Sun, 17 Nov 2024 18:24:34 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2e35sm11387902f8f.5.2024.11.17.18.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 18:24:33 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
Date: Mon, 18 Nov 2024 02:24:31 +0000
Message-Id: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+lOmcC/x2NQQrCMBAAv1L27IIbUrB+RTzEZKuL6SYkrQZK/
 27wOHOY2aFyEa5wHXYo/JEqSTvQaQD/cvpklNAZzNlYIrrgw2IU3RoqtxWNRSLs2sfk37hscZU
 cGXP6csGQFida0Y3zNNng7Wgc9HIuPEv7X2/34/gB8bMFNYUAAAA=
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
multiple power-domains which power it. Usually with a single power-domain
the core platform code will automatically switch on the singleton
power-domain for you. If you have multiple power-domains for a device, in
this case the clock controller, you need to switch those power-domains
on/off yourself.

The clock controllers can also contain Global Distributed
Switch Controllers - GDSCs which themselves can be referenced from dtsi
nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.

As an example:

cci0: cci@ac4a000 {
	power-domains = <&camcc TITAN_TOP_GDSC>;
};

This series adds the support to attach a power-domain list to the
clock-controllers and the GDSCs those controllers provide so that in the
case of the above example gdsc_toggle_logic() will trigger the power-domain
list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
respectively.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      clk: qcom: common: Add support for power-domain attachment
      clk: qcom: gdsc: Add pm_runtime hooks

 drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.c   | 26 ++++++++++++++++++--------
 drivers/clk/qcom/gdsc.h   |  2 ++
 3 files changed, 44 insertions(+), 8 deletions(-)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


