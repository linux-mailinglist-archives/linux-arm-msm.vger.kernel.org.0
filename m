Return-Path: <linux-arm-msm+bounces-100547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIC1M//5x2lMfQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:55:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705634F092
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B974730763E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1F7386C22;
	Sat, 28 Mar 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="YNZDXIzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C734C81F
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713002; cv=none; b=Cic8jolhOraoYMMmuRCEijsmfDCYzlohtI0vDWlHVtqgX2Nljrzug416V0wIzMkrK3LH4BH0rilANDWuRQnjadMWDv5mnNqxvNvpyN72nQx9OCV1mcrLjPf4RCIKfB5hK163ZN3Y8/DrOHmx1Zp0fJC5A5O4AFG288RNGb3Qoek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713002; c=relaxed/simple;
	bh=pWkZJVf4vSvn7oyzP6Y/Efbf5AAdtodIC7JUreUYvrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOrHLaUO23zJSSG5jnI0hdyN8t5N+85HOmot0y0XuuXvd/BdpIQGZvqcB2yND5ndcw7zubKRVRw5lWikoapE1XYh5x684PSPvVzhH08arbX3X90MrXK/fluCYmIuhh498ZnKZ8fv4fHXJ6XSsUSkAfbdHiqpHOeyxWVo6IW7s+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=YNZDXIzk; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8FA443F606
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1774712990;
	bh=HJjaH7Prdft0dSeI29mmHk8qu960nAVWe60SYMS7+aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=YNZDXIzkK/XevaWy+buMlLln2wpfZAakvl4gz54MNxDkMoB3A11D8MefVgk18DPsk
	 tlB1a4O1pG11HRRvgg9e1HgXcIAPPszAtvuXnPPOl6vNLoHG0kUecdUXCCSIC6b3Um
	 DhCFVPPmZVD6cmXzoOKFV4u9jon3jXJ05H/mAKZ+pBLhsI60BRcF0I7A8pq/xyr3b2
	 AOOVYfNoT2VRQzHZvwjF3C33io+ifrT/2rx/XwGorXPvPF+fXkK5FC2qouzYqOL9Xq
	 JeGIpe8l3lsDXUozR+UoU80v1OhJyzf01WsMMLR/aiB8dD5GTly/i3/Zhqj+G+XWvA
	 Co83S6BHWyqnyMFD5XuUXQXCCqsSnxtDj3wAn42ULdJuUafFSAVZhCfZ5CFdTFxDJC
	 MtG1hLr3JAaz9fPME4x8+cP2+RIxS5u9kFCXXD6qvk/LmJZTYJBhfihNlH2EPFzi//
	 SaXTz9Py8hGN66QJEEfkss1jPpucRprB8Xp3nZsvO9sFDUWjEXhQihdTa3ufXLc31F
	 BBXslrdAsEJd5rLpDqxh314tm8eHfmaosHUP5hidWi22rIl6vPHn5+jkUyQReNR9VP
	 SiglUWU5gwF++mqAmtHWq3Q9gNeC1yAL/JkJQ+N/Vh0tGfvyoj54X1n03okZb1vhzt
	 EM1Idj9OR5Q50YSAhFuhGNEk=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439ca4b3d0bso1837037f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 08:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712990; x=1775317790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJjaH7Prdft0dSeI29mmHk8qu960nAVWe60SYMS7+aA=;
        b=Co+ST+WguS3qf+KqqmwNmLVrCsEoPuw2DlnJFJcJc2t3nkEWMWTytgVEP5nogeT/ua
         c0coIU3ro1lcFyRT/z45rbEZcg/kxeNhDzDtccg8YA1znQpIJk+u/jFYy2LMpQFGcYne
         7XRVF0zwrV3UkrWti8wqdGqqdj5eUJyw86hFvb5Aws5WhhRXwICAv23Y44hpAI2ZiPUV
         M3nHweYFCv0TEo5wbb0Q/8dTFSzS6qrAQVUykmdiQhk+qOzeu42Tfiuc0EbF517XFhXi
         HviLkZ2ivEQJlPtZmVg6w4bYg4dzT9eJAW3qxqbMeOmLRYTNIIVPO2uAQDonPAGLlPou
         jzwg==
X-Gm-Message-State: AOJu0Yw9ZplDbyfyUsxibR+HVWakeYmN0a+vv5ADj6doxZV+jGB/SvCO
	hh0ZmCK9ha7U6zsx2YPfX5qJ1wvnW6OAoXXGmUmPhOiTWG0DuIvvDyQtx/39ByGXCEI3PR2fuHK
	tl4/pU8kPXxdbPWLhRl1/4/kJCqfrwQ9GRskLC53dPX20D68EZUtpH2IuaiOl3lUnvWyGO6uejI
	Sfz/uez3I=
X-Gm-Gg: ATEYQzxvyCoYKZXFHguDDOCD5QHHhxP121ObNyP8k4Yztcmw18NvnpuYvTRYjw0nDaB
	jubwedRv23nnw6bNXiQmNdbXQxq1b1XK8ITUiOFX8vWGNaT3ahWJ7SomPlgChqc3p/X08RE4IBT
	O/sw6eujAwXJ6cpI/QjYumA/oV99lgS+k3RnyznSLEpHhHMotTEIOcPTz7emCEQmi8HzxHbDbb/
	/1SPnjT1Ac3BVwYbsRSb2+mjBiBZzoejhwYf7LYSaC6je5IG4E6ZYijWi0Lx1ExerJS0tanuzl5
	6+6bn2V4r4UNAF7CyIB56MVGQRCotymUwRQCXxybYQVNaHbFhsv34A0OVJs9lDXnxTIihCDwRAg
	cys0rRojwHNjlV/o7JtemSOV0qPuZvYGvztQ=
X-Received: by 2002:a05:600c:8b46:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-48727f0ea89mr100915045e9.11.1774712990081;
        Sat, 28 Mar 2026 08:49:50 -0700 (PDT)
X-Received: by 2002:a05:600c:8b46:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-48727f0ea89mr100914765e9.11.1774712989627;
        Sat, 28 Mar 2026 08:49:49 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:35ad:2701:1e88:df3b:5eee:779e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727192012sm38011165e9.32.2026.03.28.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:49:48 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Date: Sat, 28 Mar 2026 16:49:21 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: fix remaining gpu_zap_shader labels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-zap-v1-1-f6810b9b4930@canonical.com>
References: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
In-Reply-To: <20260328-zap-v1-0-f6810b9b4930@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tobias Heider <tobias.heider@canonical.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=pWkZJVf4vSvn7oyzP6Y/Efbf5AAdtodIC7JUreUYvrA=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBpx/iakuc/9GkSSwrWk33xLCURAKHQ9PKQbhtOr
 y3crrdThPaJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCacf4mgAKCRATSY8DLM/p
 2klCEAC10UuHW1rHMKWdYX4CwY04VaKi0h7kcYAmL3NLIAugi5K90TpdP13qmcUVPlNQnZ5641n
 orN40L9uRMnOK+bF4WZV8egjqUi67X4Yj9fGdu1Pyb0tYUg5lCAttPYooKqi8veRpfZWcXlWtgT
 0aZ794NXcLqAnoDw2I3qIwKduWse1E/YbGSynnpb5JtMv7Ww3QYyslQHF9+hLvffCC1sA0rOsSl
 iPW1zU3PrOLN2vGgFn7RBF9GeJQVw4ifC5oRQuomxxVchoQWH3UizhFetgevoOeRDG01UKN5wqR
 zQg2oW6CuVyYDCJdo1B9kA9HBxercTVEQdqWOZCpMzejS/tSPWGk+eha8yBTJYVwJTCNr74Jvbl
 ZZUnescUo6aT1doz2HiiKOIm4hrZw3+PaEQZWUVBykFwprHu0qVBtmMChj/yUL7wN5wQeu2KVp7
 8aWK6lRtVcS/ZhXeopE1r8lAYBUeojZIqL9b6HYHDDVtIr1ttYIg3nnfkdQRNR3pLjG7YfxWipn
 PkKWJusJtyvzk1Bd25WWfYYAV71XJ6d+UQc/o8xcnO7J/YUR0rrdsqNx18ff6y81h+g9lvsHxJ0
 ozOlnR2Z/0/itXnrIVETFiFPUl+elj4VoDuTEi9xGBN8es0sBCPz61QedgQQd2Hb5cBHT3hzNpN
 qDJP1L9mNyW1coA==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100547-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[canonical.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:dkim,canonical.com:email,canonical.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6705634F092
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Most qcom DTs were converted to use the gpu_zap_shader label instead
of patching the gpu node in commit 2377626fd216 ("arm64: dts: qcom:
add gpu_zap_shader label"). This fixes the remaining ones.

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi           | 8 ++++----
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index d77be02848b5535e4478b3104ce49423b5df69cb..42c0c7a003087f181ecd6228b5a8bc4341b1250b 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -718,11 +718,11 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		memory-region = <&gpu_microcode_mem>;
-		firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	memory-region = <&gpu_microcode_mem>;
+	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index 20a33e6f27ee32b22821b39e4acc441fd8ce55b0..a048ca327f6026dc69f66c24ea2bba1c10d18f7f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -791,10 +791,10 @@ vreg_s5j_1p2: smps5 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/Medion/sprchrgd-14-s1/qcdxkmsuc8380.mbn";
 };
 
 &i2c0 {

-- 
2.51.0


