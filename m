Return-Path: <linux-arm-msm+bounces-107986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNyLOHM0CGpAeAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:10:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F50955AD74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37D123024C93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 09:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F4D380FF8;
	Sat, 16 May 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxa/nnXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8056738886C
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922547; cv=none; b=bZfGo6FX6tK+1gNQC9qWJ2Wi2D+iPvFnjxgg7IPZpikMP3bbO8zTkiwPVQdgqCPoV5r4LHLbpE4f0/lmXbXDp9zh4MZcM7mEFRzdk85D1cTltPOwpAAyJE5VG9bLp95GY1CQTVjHc8zwOMEqHe0YO1xg8M0hEQKvWHOFsQOWDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922547; c=relaxed/simple;
	bh=pafJOlmj/Pbct9eaGPsT9zX+cN6FNk01V8U6Qh4Kino=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avi7WjJuPZFOHMRzonO9ZrTnJLjEDxQj7uVVF4DPxXnMflRWxjf3jDbobDb20cagw63vf9PPCZkvZ7uBC4IWknxXrIesP4lsra2bmGyQ+2Pgb+IG2fw77/9oboniv3Qr3Lc/B94sIc/APqKNbRHHSnWqnpfZQtOyY9imBmTOdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxa/nnXW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so1382309a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922544; x=1779527344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEWYWzmPTYxe8SSU8eAxSX5Syznr5DfzGqZhv2Zb9KY=;
        b=gxa/nnXW2JLW/njkd/+G5Mgd5E3afaU1Y4rLh9HGRAzqfCXzdVo8J0vmJb8kF30RyO
         qaTrpPv+oQTmfhFWvqJNDW6s60Ym2ImH+rn7mZ00ZVrxKcyFSMHlZkneDPk0wNJdtuKW
         5Xo7Uwygg0x8xPy4LXraOGnlO/V4Q5J0AIXHU5LMEsxsJNqQ/JqZ+avI1VCxJZv2Z8fa
         J19N7IWZ5ykpOaAJMciqNLnOrHZkJ1nt+3x7SMQpRQHCVwgnmmnPlsN19x8YMCWx3/aB
         p/WJReIkPQ1FfrhQ61Jcd9V5vq/wj8JJfOt0Qab8ZwyZ84MfRyZWefE8SeKC/mlLwBj+
         mLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922544; x=1779527344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kEWYWzmPTYxe8SSU8eAxSX5Syznr5DfzGqZhv2Zb9KY=;
        b=oN5wXSHmhrsETV/K7uF1KQI1LDEEqqYf3BZhqYKCtWB2d5iTW+V1czfIhM4V/zGZKA
         j3RyoBrOQDhR9us5TZzPiMib98LkGNyz+MExdZHgPk0STBO+2Gh+uHpvRW5QpSYOCDo4
         LhXuMtl01+cFTkgsxZSisXMN10b05k3JALBoj292r3EoY7HFjeqq7IpZf2rXOg0DuUDV
         QtPwqpp55UF+UsXq05BEL3rlqC2L0I0PuQdZHosQAm78Y/n6n/5LrO9XSy/Ovxq8D8DA
         RjHCaxIxN525nf9bmZ7ocHRtsW1bzkC+giG8SKTm+uSUaecDlCulY9RX8hx69gZS1/Iz
         uRfA==
X-Gm-Message-State: AOJu0YzXAHV+Xzwln+oj1Ws1TVcReV2WC78LfOTmhJxV3x0149jb/GIJ
	d3uyapOJdrZAjtbNEhj5H3hAbRTK/J/dGQept5dY5lreJRkHHOio8/S0
X-Gm-Gg: Acq92OF15IA/LAQytB3/wOZ7Uk8DuJozLSx7Bycep1WKp8sanlOmEl7rS1i/P1de38g
	MzMwO7jcCgTiaQv/844+lrYUUQ2xGkeOa8yudEId6jk55AzKxWSD+ONwhumRwc3SLOmri64GkQy
	eSwtW6WRAwQEd8VoSrBlQf22PKpbTmrNrDt1VUQ3sLL1jf5YAfIWFnqK6dmXItA+nRNrjBt+cJd
	spDXXfQ4xKrcfh1mndn7FghOl42BOGpsYQAeEXBneP2hbbnHvpEpwBm6cLKwr9iBXErsmkxch7n
	buMJkLT06vzjUT+SafsbGOdyax2tEv5H/Jwg5uYlp300fpDiSdDJ8xbPp9+iLBOUSdPh8+vlu5k
	agDdzrRPG/YWiAWHPUiBopSJXIE9kjZ1z8R7qZZd5IiDJ8kF/jXXtFq8nqW8Ip7Q0DJr0fUKIEY
	q6xhoxFPk1TXdN0Gvx6WvX5QCRM3EjvA1Df+ocxeS3d8B8PsPN3bh6LPH6m10dEp4APU/JCcE=
X-Received: by 2002:a05:6402:3254:10b0:683:84eb:54f4 with SMTP id 4fb4d7f45d1cf-683b266e97bmr2679426a12.0.1778922544001;
        Sat, 16 May 2026 02:09:04 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm525848a12.18.2026.05.16.02.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:09:03 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v6 3/3] arm64: dts: qcom: sm7325: Move common IPA properties
Date: Sat, 16 May 2026 11:08:53 +0200
Message-ID: <20260516090853.2873223-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260516090853.2873223-1-zstaseg@gmail.com>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4F50955AD74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107986-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.0.0.28:email];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The qcom,gsi-loader and memory-region properties are common across
sm7325 devices. Move them from spacewar dts to the soc dtsi to avoid
duplication.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 --
 arch/arm64/boot/dts/qcom/sm7325.dtsi                 | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..7db9ae1c3cef 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -971,8 +971,6 @@ nfc@28 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm7325.dtsi b/arch/arm64/boot/dts/qcom/sm7325.dtsi
index beb279956df6..59adc7fa5976 100644
--- a/arch/arm64/boot/dts/qcom/sm7325.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325.dtsi
@@ -15,3 +15,8 @@
 &cpu5 { compatible = "qcom,kryo670"; };
 &cpu6 { compatible = "qcom,kryo670"; };
 &cpu7 { compatible = "qcom,kryo670"; };
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+};
-- 
2.51.0


