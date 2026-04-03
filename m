Return-Path: <linux-arm-msm+bounces-101652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEfTAyrHz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:56:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25029394C5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 640E73027157
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF2A3C1409;
	Fri,  3 Apr 2026 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4j0QMeLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6393ACF1E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224534; cv=none; b=QvBSd6VVUETuFK6n16u4bJ6ugtrnNi31kf6/FAKXHud9oS3bOqrxBCGCvgtjYR8xLcqOkC/8Dbu1LdqrnOn3FoxqIbjkechiVIEwXixf7b9kzusa+xosaGk7Ij9INvXc/8b+bptW0RxUy4u+r98aJQQCFV5mwGC/jh9dhOFP0g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224534; c=relaxed/simple;
	bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaQi5BJVC6L8aCwuk/e+0I0sAtT91RA02m2cn54wIjQi8zZNbjmSGgY7r3FA08RR8QiwZlgQYD6a+A+VbPQwgI1/ZpS2QDPfZFANOT6oys59CHilxeDmZ/bghS+qFE1jkoxF/BT6dvrb9cEw52sJ8leJwndFCiYRQ7OWZCGj7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4j0QMeLi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b982b0889d8so260617666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224523; x=1775829323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=4j0QMeLid4kOG+UcPl45sYTvbZMQn7MK59ELOOB1UTelF9wBWCF9eXKLcEY8tuyQvt
         AKiX6dZmt/TG+9WQBiIfw2iBRZK/3UNmHr/Idx0N6lUIPfwgGPDgHzk5iegkISC3dCqE
         /YntSiHddnLvw6fXA0wgoBFiTXGUEYJume8Bn/fT4K4Hz4n1s7c90rcTW2rpRzw+3SPJ
         brGvhfLo30ADRWBM8QVzpERzVj+t9WAqunOC5II1wrOqtDmqkCgF39AtJ3poq/i74lvL
         q8ZEDuDouyN5DoM+NtfmepBTiL9d/+b3DVgHTng+Lq+PLRurdwtB3ZLlMjCbN60UeuDG
         6Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224523; x=1775829323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xu/QbQrF+RhfA92z9P5YF9wreIVJO9r1YHQM8M/36Jg=;
        b=ZVmGfaZ3W9nvAoRXcc87Dl6tSMsjQF9ZOycXA4UVf66Bb5/Hw5ufpmkFXtrC+qDWjL
         V9cxKmpkY1HMOgEOfJeZ/m2/Q0iJ5FS2qWFwRXIxyIC2xSaTj1NdVXAhGehQSR77Hy2P
         nS/eY2Dp842JhrM25hKXhR75zr+el+AMg/c8ysjDastCDmG7UXeJTaOKVdEOp+ErWyXL
         FbvUqM2asKcnpJ/t6mw+vFC1Zx92Txl1p5egWOIfFrFM3Yt1nwCYOP7K4dctEtmzcfqb
         AzRBlX1FLDPVGOCLiW7KzRHqspYugjGFTB4dIffEFjvPxXGFfAhsQbnroI76hmo24wbD
         LB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+l1HL367jQ1BkTLaolJn3WifLJUu36984byzf0gvK++ud2QHNjWDZC5IozFDGG5+6ZiCDnNe5QBOHdVVc@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyFPAIRVRw10VCOBz1qWSd0odvZnZv55jAm35j8S59cFDpHop
	svRulohZH+G9SvtZItbpZh931bTWLhuFyMunHdz2l7pmyxNKrfX8PYAqvROLtR33ZDQ=
X-Gm-Gg: AeBDiesipOklBVHtT1bRaoYaJCn2c+QjuTYOElnmMHXTjz/0Xu39RnF4uffdR6GdDjl
	w8vAg3iXa868byiAKwiEbqdk83U7B1VkB9Uy1+7of7tI2+uMpin2PztWtfOBC10O9YoGFVCD2HD
	Mh9Gm27QnV5O0tL9KpPnVBlrHrmKgBhD0h9E1RseT43+cAEPIZHNeVH7vd9cggnVAoa0zzn6ylc
	GA8wnLMnggbMbdgyul5uTLz+i9dhONl5wwXb9PS6mRunY71lRIVrgEhyWiC1cOaA6MbtIlQS2IL
	wrKV83/eg1egMwcp2RhCF3kju4xb5Uf9t2x2GhN3iB06iw7rypYnQA/vdjYD2gVSP3mnvJufZ6N
	WsKLtArHcUGXW4+AqWwoYTb48OPfTetdG3GvT8dmv5M+fIxrL4h/nvND5HP/URMHMOswgewKUu/
	Z8G0vwDXAYCau5bBKCK1zo8d3+pO74n2TMyhOEhti5PiECZQytCqeEHg085930PkqztpbbIG/g8
	rQY0kjWvvJB89gCZJfnvNU/cG8BR7PHncPj8g==
X-Received: by 2002:a17:906:6a0c:b0:b9b:5164:906a with SMTP id a640c23a62f3a-b9c672a4f0cmr157218266b.4.1775224523388;
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:53 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1686;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WiO7xxC4vnoDFEP8yYgqIU+yonljli5p0uLIYnjF80c=;
 b=9xLHPNbkt0sV/SMYIy8WN5UbmrF1+a9f7EhbS1150zHQgK2ZkM3gLMQ3RUV3bSz9ea71I2aJt
 R2qV50g74/zAGlFDurH8tXrwoGm2tG7BDnEuEDClBZR1UMTaig0kdCg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101652-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 25029394C5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Thanks to Alexander Koskovich for helping with the bringup, adding
the missing pinctrl to make the WPSS stop crashing.

Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index db72418b7195..d8ac495ca7c8 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -242,7 +242,7 @@ wcn6750-pmu {
 
 		clocks = <&rpmhcc RPMH_RF_CLK1>;
 
-		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
 	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
 };
 
+&pmk8550_gpios {
+	pmk8550_sleep_clk_default: sleep-clk-default-state {
+		pins = "gpio5";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &pmr735b_gpios {
 	s1j_enable_default: s1j-enable-default-state {
 		pins = "gpio1";
@@ -1049,3 +1060,9 @@ &usb_1_hsphy {
 
 	status = "okay";
 };
+
+&wifi {
+	qcom,calibration-variant = "Fairphone_Gen_6";
+
+	status = "okay";
+};

-- 
2.53.0


