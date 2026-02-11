Return-Path: <linux-arm-msm+bounces-92600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOENHblzjGk6ogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 13:19:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97512423B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 13:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB760301413B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 12:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F5332D0E8;
	Wed, 11 Feb 2026 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1bbpVcOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23531985D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770812342; cv=none; b=tPQAokmQCoOCYy3Ip9N1SAyK8tpn2RzyBU88FoJgk2PdPDyLAQnov96ekOP2BxJXg9Y4PGvIbF+8P3ksifhrGlwq3qnWizza9IJLB7ghwvX4QW1qtV0sP4lMChQkDyExzZfDthyAo/4BDmDosJjAgoSTxF2ScxzUoDp4nAdBJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770812342; c=relaxed/simple;
	bh=9A4gWGZFOxwDhK7ZmTb9tedSw5n3x7/bEPDL9A0lbN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MxbXtuQ9ogjc1Uc18/Ab43UC7/MMhS0A8zEKxxFuuNGmqYxiwos5ObsYbGjWitZkUev/REyu5PXEvVRPmv8rLr8qC536ht02/NjcSVR7sy2KAV5XaU/IGQPR6gokjmNDCFvRsO17Mg3wO4U09dDEpEOJq9a4NRi4h+KSyW9xxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1bbpVcOd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so343269866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770812338; x=1771417138; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dzpOGAu3+rtyHx1s4OVXpmAjZ0G8S1KZFSUletwwEc=;
        b=1bbpVcOdJgXnenLSGY1j60NFJtAfyqfoGxLb/LxMazckaC7hNbwoZMJDhKUOS4xg/o
         YNw3oSB2SarsqNGGIjAsIctEe2hgl9QQN3JvMaYXTvyQXa7sKog90SB9J2a2YdkE6n06
         qssytXNV8iQ4A3abRYBTv+HHnogsLEiVjkFm8v5NUD6GPEonxqqUqDexGDUVHcnr20vS
         DnFMs+HggCSEruCcrl9+I2kmskmSsWy0lMzXRuALhoAorZ/TDSiBweeu/Co/ee4lwbfu
         Mj9kLi4mFViSY2Wi0sH0MbGoxvXGv326fCkz57Cv0XlzfmH4kDWSNid6Ll99gcrhiS7Y
         88SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770812338; x=1771417138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dzpOGAu3+rtyHx1s4OVXpmAjZ0G8S1KZFSUletwwEc=;
        b=gD4M0TQTYScKh+5+K1kdFWRLRotKJpdlHjNnPcl7r5sAIUIXuQF9fJcvXbGpj+5A4J
         j69ebrdGI2gdO0UdCVxjRtnC4OnzOuulUr5sVQixvfZPbxhGVDky8qY7YV+NiGhxfmzh
         IhQ4gKM9LFPjnUWRg4l1SdGY197W68mCBhvbviRSCgWh9y2n6fBsFJxLRDHWYm9DXfQm
         qu3JKJSH9ll+RfO7Xoo0gKPptFAF/ye0H534F2qugVwlvYsaZ4w4KT+jKCqjmiPUZGOB
         He+S34oVemwkDZfpu9EigFoL05VxSYPjvW0GlSfVR8tMWaZcOfv2d4zUn7/bs0Epr/xL
         bbrg==
X-Forwarded-Encrypted: i=1; AJvYcCWe2Ijw8JjgfeU/P7oKuvKTOjp+zBMYQbHBLCEG+mHezwyJngQviYmg2U1PfQl7Q+NofKEwEhBC/YDcxOPm@vger.kernel.org
X-Gm-Message-State: AOJu0YzabF/7Dnq4EihP4h6J0GTJWKrRzY38TBVdbDH3r37PX9me0HyF
	QsKYxv09DpE+2x9pZp2n0APzNzikH1xulIPycS46G/5XwBap5E5amEI/aKsGccVhGOk=
X-Gm-Gg: AZuq6aJnAZUeRihgLVT5KWM1dRXQs+iata2YGnCzKCWf1iG8pT+bA2AUOLQni3wOnGg
	JhstmA9u5Ikk/gl7rL3vu44BKRqOzwHFw+puJX4XtXERvzhi+7upciRBhzhdKcSBbT05BSgnXT9
	oQzY1cJfX+0jYfYjXmLz+3OmZZyrlreQR9TY8yWOUDsRwi78NI3cInyIGctTXN6Jbs6OiU7vM/t
	BGNPvr+GZx+5UrI9UhQDzdFv/bUZf2zcCDif7jvwnZGdblxVdOj5zCCLBe/2eJCQL+h9kxltcjl
	+OslsTqfUMpgxxFJB6wBVeXPX2eQBWrU07RfAEmeZzQjlQ3tLA8QyH9ueNexONQYYS0/LaA09ba
	jHhUoFlTxpgUK8H7fLsPEZzA6ftMVTvh4OXuRyXaLmJ3XPRygWOABF4mBKwAOn+V3hOB9BU9lRM
	bjpz1DVe+DZGLOjd6LTsg0/t1zvwBkT0/nZbSw/DOkfkrwgCp4OXME8JTC4D7KdjkhokHqExKaP
	Kam
X-Received: by 2002:a17:907:96a3:b0:b87:124c:5f65 with SMTP id a640c23a62f3a-b8edf415a37mr1153663866b.51.1770812338337;
        Wed, 11 Feb 2026 04:18:58 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9d0212sm55791066b.26.2026.02.11.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:18:58 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 13:18:57 +0100
Subject: [PATCH] arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBCA4VfRnE2ZUcKryAE7w6TQTklp393m+
 B3+/wWXaOLQFy9Euc3tPDKoLGDZpmMVtJANXHFTMRHuZ7BpR2MnrDtRnYVa1QVycUVRe/7bMKb
 0AV8TzMpdAAAA
X-Change-ID: 20260211-kodiak-i2s1-39effbe18ffc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770812337; l=2016;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9A4gWGZFOxwDhK7ZmTb9tedSw5n3x7/bEPDL9A0lbN8=;
 b=pNemSz99lPFip6qwzHK563vh87rqx0FItMyLu+rIfVoSahTuANBU3u9aIFLUaX4j7Gvg6lO9+
 iY9QmGnbEmVBMvBSesRH5C+9aH6T2fsWHDzbjVO87w0AR8+/5cYHceh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92600-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email]
X-Rspamd-Queue-Id: DA97512423B
X-Rspamd-Action: no action

Add the pinctrl definitions to configure gpio6-gpio9 of the lpass_tlmm
for I2S output.

Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..2e53e99e86e4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3036,6 +3036,58 @@ lpass_dmic23_data: dmic23-data-state {
 				bias-pull-down;
 			};
 
+			lpass_i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			lpass_i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+
 			lpass_rx_swr_clk: rx-swr-clk-state {
 				pins = "gpio3";
 				function = "swr_rx_clk";

---
base-commit: e1a106754a75d08a60acd0d72bff339d7cfe8c3a
change-id: 20260211-kodiak-i2s1-39effbe18ffc

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


