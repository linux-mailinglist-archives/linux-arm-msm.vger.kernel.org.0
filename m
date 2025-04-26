Return-Path: <linux-arm-msm+bounces-55818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0AFA9DAE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 15:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FC447B3570
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ED6187553;
	Sat, 26 Apr 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnmdSIpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39D139CE3;
	Sat, 26 Apr 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672533; cv=none; b=mSzhpJbcykN2HRm95dBLmMVJJHg8xPI9tHPXnZ+UJbLMXPfwLSdP8ousxaX92dyF+TeNtoHcKYYV896lsvPq71aHDSa5OhPlrPBF0Zn+fzn/WLcJ0gMgM7upcKk6odf1gxKoTOF2GrCt9NUcGyJjkW9+95UVRnLjh3B54U6kLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672533; c=relaxed/simple;
	bh=r6iiGw0WPshoyykVfAw4KQSvu1jD7CE+zlVJnLOPPv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LA0kNirs4Ibc0ZId3DiecMvqDreIsQvaRUazCsnN3NNBp73sy46EkCV/S5gjlg+DkNoWxpG06Gw6XljDWhEx7odHPgbN/UAZjtcUl0FeZsO/vjv8GEPA9ooQCOOdFTAb8rijwpBYH7ILX55h0VMZy1XbbrrhdrCoXqCPI+oGOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnmdSIpN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso551682566b.3;
        Sat, 26 Apr 2025 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745672530; x=1746277330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8SNfV9cq9fPWvvPmR3dGHfZnD5tEVE8UIBf0qCYzhM=;
        b=WnmdSIpNnp3P2gz13iyDLejQfafoXnhLyQA99xbTf7NYSbCm5Ji8mxOrSasCL8xPmC
         voL3hfqf2jrcSVL5ikEpeTvPBGMTapK8jSOkCc37q3m9s1kJEqyGzFnS1Wbskc1Wybdg
         qi57vX/tSoJY/ILebUt75H3pA49K6paQQ//YeV5mUS4DPAmJaG8bb/5E7NOc54edjPcJ
         cFslrI6rVB9cQtwYNq37k1mBuDpTyAlYkjPdbM6iFJaENzkcwdUSIa5WJ6cMmqbqsbrZ
         NcFsb0G+sSGdt5JTlZw8LLju7GuNeKbkFc5MFpSjEXxnJzHHKVA8IL6OV8h317vHAkdW
         0XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672530; x=1746277330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8SNfV9cq9fPWvvPmR3dGHfZnD5tEVE8UIBf0qCYzhM=;
        b=QhMbC6PjygKR5CrTRzLKb0hBXrw+v2HmYjSFZiKMpjT3MDeY/tlDkS1HMEwVnVYtX7
         +k0NIN3/0O9jXssWnuCfl05GSWKF4EI6cwxzbthIiCyE+YHlolJsv+lR0R1j7ejCVaMo
         3HDSzDhKWenED4Jz+QaQ6KoDn1ZmCJwDfBtUMP4fknMXjEupP68nljULkTXj4xof60Oo
         NRGZVMTEdhe9IvE4Yi2uQSCeDqHCAUci9PsX62gNDIB9zW9Y58a6bgRRW/8grJB+fkHl
         or2cYswQ25mHHzPSfWCq5berPbUpPqO1fgZi3J+0JS2zO5v74AZujWzGwbcPokkfetUh
         8w+w==
X-Forwarded-Encrypted: i=1; AJvYcCU6Hh1XkCexq0zPypTkKHUjvlNX8NOFby+howBtYTiNidrg68CDQqKtJi+85rzb/Pnc+wbj0YM1Haz9@vger.kernel.org, AJvYcCWUbtUeKIwJxr11n3vO4hosgPgLP9Laj8ZxImC8ChQDygYz1lY/rmNdufxQbvkP8DYIZsZ7wuWn9/q0@vger.kernel.org, AJvYcCXfwyqIgANOjQ6ZriKuv858br/ISRgF3zqMoZMhrrWfXIdbHlK45awwW7zYZwgQzgCe6jb0TRYbwa/XkMOtYw==@vger.kernel.org, AJvYcCXjNGpCjBVpvhcKFb+Z4GoMy+bkwuc1eOT0Z5MlGYTUwU1VbH0WlHLbkPNM5CGjbRdMu6efAfAGrBvseddq@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTg2u/wPvpwGiBjzbTNvq+4BsQy+9mQoxx3Y7ibdNUWpOBgtC
	e3QBfnp4RnwPOSgSrLMg0nXzeF0lEYUyLTgBfSqxzgtX4rjtvLw=
X-Gm-Gg: ASbGncv/xmQlGECE2njUWSUGxGPATCp6tQTlYpQimITfAMkarX46rR+rEPR6/xNG0IU
	9ifSTeFOUd6VpksPMYM/c870ZYRinKyJ2OrTc6AcYyNYMj86UOkIv6C+yEi7tbZL2JbC5v9oBR9
	L2h1CQNFlCf3Ym7E7H0WeWlwTzxRhNKO4VhAUjFn10usZwWGOqZbvDDnzANQfJp5eSI15ImPyH2
	krGcCEOPINZi8s1+7waz9XGp9QmfztjoiQ7i4scH79LIfBnIvuUDa3xTf2X/bUi64T2UXn4b8Dd
	CXW/XdUBnYBCRuliKdmcuCZLB9QHr56GNQo8XumHtBIoL7LAWoZKkIEJ
X-Google-Smtp-Source: AGHT+IH2YTLyT2CKTJomrhVRuhbd/VTA7sNweMrZ0foyNW42S7w/N2QLF+cmKSSXpKAuB5PuVK/CCg==
X-Received: by 2002:a17:907:1b09:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-ace73b2370cmr435693666b.47.1745672529456;
        Sat, 26 Apr 2025 06:02:09 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7affsm286452566b.170.2025.04.26.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:02:09 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 3/4] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
Date: Sat, 26 Apr 2025 14:57:59 +0200
Message-ID: <20250426130203.37659-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250426130203.37659-1-alex.vinarskis@gmail.com>
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..79128d11eb51 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1986,6 +1986,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,zenbook-a14-ux3407qa" },
+	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.45.2


