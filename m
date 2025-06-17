Return-Path: <linux-arm-msm+bounces-61571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CEADC67C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AD48163B0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72E7296145;
	Tue, 17 Jun 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK/R0VPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731B2295DB4;
	Tue, 17 Jun 2025 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152653; cv=none; b=N/mjaRiLwQOVjh7qkxJyBxmyHB7nWOJNtKhCIsMQLontjAvWgdB5S7Ek4HwH4akGt4YiItTAEGf0vBMZj0XmC5VrpUDWm01j/MqOyd9UCUu4npCkXgurnlo85070L0vKyI5RK8QMJllI0bVfCzzOBjmhVVIMy5FzqtNedznaseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152653; c=relaxed/simple;
	bh=ahXYpy6b5z94lLRpTJNKCrx/2szWukoc47M+62W5SEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4yIKPq26/+wYMO//xGl0mrmo+zxZGxE+N3T6gcxEoUFTA7X4+5HjYLmdd1HM+HFChDF1LAFjekpsKKHjYiQn/fmNPcQNFCzrMWlPjnSr/vCYbIe/1bHgp3wka2uICFG7DrkawGIOMtq/TuNsSYhkAe3N5eXv782dvLomID893s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lK/R0VPe; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74264d1832eso6167147b3a.0;
        Tue, 17 Jun 2025 02:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750152651; x=1750757451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUy2iNvi0PiX0CYP7UDZSBz4yqEIrUjnjrM9oMXgtwo=;
        b=lK/R0VPenTT5FTAyOADFD/TgeiLQuzNQonfUDtPKaVSDFojcxF1GZcUVuXzv7E/h9T
         OR4xZfVOCV+BRH8FuNSgCUTAVGsf+cg3o613mGlm35HEG4l7lb+nysb43fAI+GpMbNH4
         ufjOuNU19Ii52w0am7Blf2ra06Z5ZcWfHLHUy7QYTVXiP0jttKBrKcFmU+gmfnTzRWzV
         k6kUlqNE/pleEIBe0Uy2ZYXeJcL/hEm39Kcio+s/mB4fEVugplfKn7plY2CMU9L7HS7+
         ep94WdWhLz1QJgo71hZP2bqiB7hUXMJI8MUtk5W72hYKyPayVYZSPVWmXVFVjs7f95bR
         c9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152651; x=1750757451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUy2iNvi0PiX0CYP7UDZSBz4yqEIrUjnjrM9oMXgtwo=;
        b=M01zditqBH0zXFHM/TbjwAUzX0FPxzTIrwS9MolxSVY7iPAbrmYTTVcG4WJNS3ZwqG
         LBikVR7bc0MmgKCe7qtEv+ueEAh4ws9Mi0NoaO0jKgIjGjlFD59uuy6XT/4mvVx5staG
         LaXp39yl4EDGSShk8b1i9KrgYdv8wP8+PxNJOV9A6/wVu2vB7Jb1rz/CiOTYscMcCwtP
         ul1ryhbKASDXJVISaNbi4eVRbSl/yHIDsMnQkqE4CK86lGF6VfzxWNsa2q7hGStulDvY
         aILjQ97+CKw6QfJYqCyhtO0Cc0Vd9I3cKbHZn5ivP2aBW88YZ8hBcbwj0Xk9bq1m+PF0
         sdLA==
X-Forwarded-Encrypted: i=1; AJvYcCUapR71z9IsqE2q/4I36QMCYLZxg0PuqI2JSFRiZryfqwZP+wfJifWlL7oGOcepDeMLqAH4d/uwwK5U1KAP@vger.kernel.org, AJvYcCVZk9+sz8tGL0X3HFlTp7mc5uyquCDHB6cd1W5/VC0f5LTlaiuG7WbkfCfapXS64wFDG14i+7x6ZtKm@vger.kernel.org
X-Gm-Message-State: AOJu0YxqAdKbS6ENrhD6wNOND5qHIKPxjUL78PgE+KngqKJMtCJ/GqR8
	xhvqef7BJRy9ML+BtlWbG7N/ir9YXmAFSdPswuw9SZ6I4VifjCoiIM1x
X-Gm-Gg: ASbGncvjeoD5u2rHEixXIs+SG/GbEO1+oOxWQpRV+xjgZ30DkU32Ud1sq2zIvZ1YDJj
	DOZEvOEXxCRxgxn74ipsQEViL2kCzHQXkTYnNISR2jLnRS2oFisFqQga+lNe59QMaXshxZ/xn4/
	bn8CqXoV+c9hr9JnaUwciyDvTaPCAdQPczRvosB1/c9lH+4/uXOB+lO2glvzgwTlUBIq0y7SMhp
	dUkjN+MRzOO/jrr/NwAxm8TcR6pZIJE1hwkOXwrpS+4qmaBh0dE+oU6B9BPGQx7E0A0vY1Fzz5b
	tB41ZsQvtirae0211Y8iDFD12JIXWvzpLknTVLO8xb22Ltd3/9frqeX75Lao
X-Google-Smtp-Source: AGHT+IEK+eNCuv6Irhscm02qIY6jE0+50/H0iDnYviXAHobFD+Hm0v2Tiz35A2McOjw2OnbjoYzaBA==
X-Received: by 2002:a05:6a00:3a19:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-7489cffb6bbmr15975596b3a.23.1750152651576;
        Tue, 17 Jun 2025 02:30:51 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm714417b3a.57.2025.06.17.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:30:51 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Len Brown <len.brown@intel.com>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Ntmer TW220
Date: Tue, 17 Jun 2025 17:29:29 +0800
Message-ID: <20250617092929.1492750-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617092929.1492750-1-mitltlatltl@gmail.com>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Ntmer TW220 to the allowlist.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be..0fb829975 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2000,6 +2000,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "ntmer,tw220" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
-- 
2.49.0


