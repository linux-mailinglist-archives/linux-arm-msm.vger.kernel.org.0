Return-Path: <linux-arm-msm+bounces-76579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237DBC831C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 11:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEDA93E4CE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 09:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A4E2DECA3;
	Thu,  9 Oct 2025 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qEVTNfY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC142D73A7
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000815; cv=none; b=QK9AY9s7uhA9kk0Yw9H1U8pAg9Ori7JJWSnBREWI4zAti0zjIGrBQ9pB5sHPDQtTlNaslYY52EsMugT2z7mteywVCxwk/rSgCNXdQjd3Q1RlYCYFyOlSDK6MyTXrgV72Za3Z80Ggl6PAIyJraSnykg/d9FMKJwzoLCJfYb5ExcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000815; c=relaxed/simple;
	bh=yLdE29W3q6fp6RFFvLxYUfrIrhtGR1wmDmW0Sr4YfZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfK5dX0K7s+ua9ULfS4i1YWUk2HF64fpVfATkZhB9cdrHAQXEL9eEsvTp3H1M0LQo2Yub8/e/mNDFkHCRkF4PSQQAhTyGzK7FzIdXRD2C6UnFIN/D8j9C5mWP5+VyQ/RjVwaB4Neskj8V35E6P6FIFS7g2vT83mAbEhHfJ4luMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qEVTNfY5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso1330434a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000810; x=1760605610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4NjgC9RkbCwMcFDlcSxR+iB4R9yIvYJSpP6iT4sVxU=;
        b=qEVTNfY5DM6LhBvMP0Bdl9LTz+/JavDr93pk0+ov8L74QYTW4RyfAch8CfL0AXIOn3
         knPmLBrjSeYjTnXZefmi7r9mi96oKbu+LK49T+diBKCOhhNa7y6BfjuIOIVkEiyO5InC
         U+ri5s7755fEnsRarkCNtXZ24VWL2Nha8c/bfKZy3FvYw4qCva3NAdgIZ1PSEyij8ZwC
         ktX5DtIOlONTr+RO0NdlFYmvAqfTv/zbW/QUMrgsO+1WTRRK2z7qiMUdqYJgAxQtVbyP
         GAqa6gxNAsvv+nC9bHen3qEPC9tRQnLruUgbSCtIWxlfyueP05JEghTEKXqEXE8qs/Wl
         ymMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000810; x=1760605610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4NjgC9RkbCwMcFDlcSxR+iB4R9yIvYJSpP6iT4sVxU=;
        b=AjtCuFhCBqkwmeWzgO+1sbLRzZDQzGy/EI+NKnXPhdhx0uM5eUCNY0WvP6ipuUheTQ
         PHh87uL48/MEDy+w2hCRR51re2ss8agmcWIMcT4adompn356rgiS6ZezehUttqG2ZRAc
         AeT3TXtwtBNebQ6sQaGusAh42qlQ0IdjncmfHdIrWv2JdqdCucc3+vti3u2Prar8lo8U
         gjcn8z24tafsKiHr0oACBox2bepASXlhW7DNIK0zq0UXliRyy/Iq+fawflPf3ZBwz2Dv
         ix5n/qZcYdHiuRls9Ux5NI0Acwvt5XyCbHCHPquQLQOhbYzUu1RlVVMNIRj9ssUs14Sa
         44Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVZpwe4OheK8d9X/xLF2xiFb88JHt7aSz9kczjy4ZUyKwlL6kvfT2Yyw9Gcy8Xcn5ZaSxpt0asm/AdojZv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw881cph5Ht4eeWTaiDnyhgYhn8aaqL/dgNeahxU++EADXjFVX3
	Tx6gdaS6AN94sbe+5nim1gVUmzNiuqCVR34CIzUnILdHwVGs7RaO1BkHKhmI6nUlm+w=
X-Gm-Gg: ASbGncviS6frRkwak742e/v7Pgtw3tV55ZYIiYzDHJw65lx3uOPl3jM3qY+VQ9X7lr0
	0ReeUvStH/0S3bhUjbvVofenxYrZfnx3U6oqXzFLIJrrvuRnQQW9XpYg5su2gRoIpNm8WV5236J
	UxGSOBk9KIxPafoLKxji31btTSjSnLq7bO6prKHXYdgmSQ6EIrKQ4WSNgl2j50hJ9InbNLyN/CA
	S8b3eRp90BsELAPOJZSkuZX4J15FqsHdL7j5USlrjOpWMMH6tDmFHv/NI/eMO6pX9i+e4ReYizy
	abu6EOsnHblLf0TiEubS7U0oobvt/iLFOgT51TIB7w06LMpDmvQnsm6Gifp6GR41grh7dTIHDrO
	Kfeb8bTEW7VZdE5x/kKladzCNi0CzZk9YgfrTafutVUTlNCNZpJSJkVTsJTjLUYO3yy7HnUWJmg
	aImQlVyyaK+Sx19igwYeejUpiQjN8n
X-Google-Smtp-Source: AGHT+IEGHEsWgFTbqDlcjmaxGAtchnOTHZU+ZqbHIvrNZjcqWAofDGI4WU+100Z28ra1wVCmv9Se7w==
X-Received: by 2002:a05:6402:51c9:b0:629:e50c:b058 with SMTP id 4fb4d7f45d1cf-639d5c52cdamr6533867a12.28.1760000810172;
        Thu, 09 Oct 2025 02:06:50 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:36 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcm6490-shift-otter: Enable venus
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-6-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=892;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=J//KKH4NjGVxe+yIfbxvzMAr1vNzhSAP+lT8QV/hXkI=;
 b=yla1QJRbGcCv57mtvOUoDOjq/Xyu95e70upu7Js7Qn/849RcV1TZ0roEh3wf7o45VP+LpkUSt
 lXFf/kO0FWQAk5WA+lK9U8lPfA8xHwlxzsO3zlswLBccWF97J7CUicJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Alexander Martinz <amartinz@shiftphones.com>

Enable the venus node so that the video encoder/decoder will start
working.

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index af6f7b41201d..a3e6b6a96530 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -981,6 +981,12 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&venus {
+	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
+
+	status = "okay";
+};
+
 &wifi {
 	qcom,calibration-variant = "SHIFTphone_8";
 

-- 
2.51.0


