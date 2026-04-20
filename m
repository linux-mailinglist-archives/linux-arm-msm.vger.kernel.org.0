Return-Path: <linux-arm-msm+bounces-103834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAMBOg9+5mkHxAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:27:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65958433472
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3D9A301E7EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81723C3C1E;
	Mon, 20 Apr 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKoOhjRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE83C276D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713218; cv=none; b=bTeT0XwKDZFXAHs9fw7C8lazPu1h/bB/1wivHM627uX0WjgEQEKTjhBKVsoSAzVaEqYRD7Np7ioXOg2Us3fFb16gbkwO+BOZppxpqbC2H49f+K/VWdikkoYpJqdclHmcSXMIW7Huo5uNnhkcqaQ6RTOSpLzjc+jH7W8ZXBuU3w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713218; c=relaxed/simple;
	bh=q/KD6vbsCHIP2YFsYt8cPRg7KoZe+g3bSUiSIqD/e14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbMqhFKYlth9jBtN1F8h08gW8OU51tXsz8J3cq99xkqKaofL39bPZoMkpmc7k26FuM7w8lKy8rUxrL9HnXlPrgFFCnHnfAM9OWZPHgd1D/RzNggBx0B5b+efZ2sN05t+IKDhPBTNeVCrSzlHTp4BR1Q19da0gEWqoYfnJjTIsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKoOhjRE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so35229405e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713216; x=1777318016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4tLDDmxREE4wgs5r5ScyPH/634xf/UlA99QJ6WpHiM=;
        b=lKoOhjRExnbuuNKUKyS+OpCeS29yHwTrzARgVjAt9q1M1OskQWwWzZlnWAsWIzbAqd
         b+aqap7Nk+n4TcxkJ7qeomo9CudmzdXavbRdd6+SuwgB+I7wS1R1n+cCfDG+rUhUllMs
         KPf/4I1VWGH805WsbQ6irrABrNLeq9lYgBAGmtuaquymOnCKNQGGiIUbqVWEsuKvZpXB
         UZceg1a0EayTDAa6lbq6lmld3yptR/4OZpqVFc96NPhXezNK7bQE+/rvV+J7KeXpiydz
         Cp/fH+55D4rJjqzW7ahsPjLUc598eHNvGEBM2c9NmNEOAnN0mr4zmmvAhl0ow3JnR+zD
         tlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713216; x=1777318016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4tLDDmxREE4wgs5r5ScyPH/634xf/UlA99QJ6WpHiM=;
        b=KQCFiB+NwPw82EMk6XVmCZNDKzIBbALiobmENDy4m5Fq3/2h1By7+EtggW6+r94j+4
         /nUksmcD+cKHq0RXej9OMxtOJ3TwlkgLLBE5xLLywizz70MzGuz3NeVvIsdqN+82UNyR
         /q3T2A6mYOGr/IkL90+c7ZGrPFrhAqiyzCNAA9VAMRfNtJVsrnm/Chw7FIY4ZnOdVhBK
         0ADWaNPRTr/d86z+6qeNL5TchKjja48FSO+5eDdG+oOpT1SheqlJDqOObNXeDskLVUNu
         GwFOjs47JI2vb+HUau0AZx+XWqEIFNqZg3d1S983DrkEpXej6TZZYwMZj6P8lKyc4zBk
         OmQw==
X-Gm-Message-State: AOJu0YwSCSk7dJy6YaFu/ED2ZVdT18XRxXDL/0M+SGUldxgNxJogM98b
	v6VAkeMDVXJQUcWep00zVl3g7uC+7xvBRGPFrAPg6btv52wjhdmN33MOuqye0oJgkPtHVeb+5wn
	uEo1UHwt6Sho/
X-Gm-Gg: AeBDietECgWkXaSBc9ipQIsHkKPlmsvl3Ogw/QgXPQwzE62pVkBSBHWBWe+WHyieQv7
	ZpmpbqGP8jlE7826q2P7rAx1tYMbyAc8weDBBLIE042mCHFvBz2AClynZzP4PSqjPySefoGPmT0
	vc6hUZqilc+nHsF0oxvdyVs2EdAvIipgxdP8VirDEwx6sdcWbqc3rU0oE1A6ORGIxJR+vRliXH8
	oI5TVa3WBfwhM2pZyoStZdspDb1NsP5LgBUBXFZqKeMHIKgOd+ihYvPTFNc3uqj+G2xA6ccuCFP
	LfbkvPLMciGBYS1omz466UFDsmY6dQyKLcWiMXnHWpOhVoq6qvIHTsRZNFUFweXimpqWrIJjZRO
	utAmYxAAgmS3kpO2eUnllHS3YzreyZTqpPDT/5feOHYXA1FR3ZJnpJKRxB8ttdkchTjRc8iATjv
	JSsFLxyvXwRG/8GF9MwTLSBNwcrYbNBf9bMJumVnhTw1dF5XC0f1R4fUM=
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr73622275e9.29.1776713215554;
        Mon, 20 Apr 2026 12:26:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 20 Apr 2026 21:26:51 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8650: update the cpus
 capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-1-689e07d8ab8c@linaro.org>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=q/KD6vbsCHIP2YFsYt8cPRg7KoZe+g3bSUiSIqD/e14=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n38c3+m2fgLqbAWn46zTOOkWJO7AdvauiaRBhkm
 cmjXu4iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/AAKCRB33NvayMhJ0T75EA
 CGEcy7ZMkI8DnMdJaKTxwbnJgnAgroene+BtHHaSmodVFVb3vQQNWdmMg/foyu/sV3sOKjJjtfjkGh
 q5bDKxvkanMcYgu4f1zdILEOiE1vFfC8M5Tx3uSkPqOBmhPeBry2rYC1/T/jz3HOIu64UZujrwWAnw
 i5nsbbnW7/1WfG/+ApW2RsXK+ANyVKWnWutvUJ1T0uHtd9mI4YHq7Y+UAtJ1oVaICjH5SPt6WujA7T
 p5bdfAP3Va3MhodPRbYeXU/rElbNo+gtyG4ybC31+LNgEYGzdsobSuIQSOomS29FA4Rj3A19nqEV/G
 T+2kab4zXuPettJ2lO2QSvY1XwgxtY01/s/7wAAvSiz7K7bV772X30ZXbpWkW0YsJI+aWnS/6c3r0B
 o+3bb9zHHCX1gND88j9QK68Nb0fGBHe91P8A2QVHUjQAgXt9uczTKCgAUKlrDYfP9tJxjgQW23ZHLW
 bJ6ARcYWr7Rk0lsD1TLqLwrFivjK+1Vjc7WvitxZiT/lMSBn1Hjxwj347Gi+X8qXa+crwB/MvtcIyJ
 lph75hu4TlPV25B/ZLfsjPUqzbUOpFvmqQqSbz72O76euyDe5XB66uG7m2KKSq4xOK5vRILxDdigG5
 ggwmJFE8gcTlKcrkB31A52qGz9C/ZTZD26FDsDH9Yd6s23aLMqummE0ht/dA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103834-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.2.88:email,0.0.1.244:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,0.0.1.44:email,0.0.1.144:email,0.0.0.200:email,0.0.2.188:email]
X-Rspamd-Queue-Id: 65958433472
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After some more advanced benchmarks with Integer, Floaring Point,
Encryption, Compression, NEON, ... on the A520, A720 and X4 cpus,
the median gain with the same frequency range is:
- 281% of A720 over A520
- 126% of X4 over A720

When adjusted with the frequency delta, we get better values
describing the difference in capacity, showing the weakness of
the A520 designed for very small tasks while the A720 and X4
are much more powerful.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..42977b04346a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -153,7 +153,7 @@ cpu2: cpu@200 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_200>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -189,7 +189,7 @@ cpu3: cpu@300 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_300>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -225,7 +225,7 @@ cpu4: cpu@400 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_400>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -261,7 +261,7 @@ cpu5: cpu@500 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_500>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -297,7 +297,7 @@ cpu6: cpu@600 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_600>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -333,7 +333,7 @@ cpu7: cpu@700 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_700>;
-			capacity-dmips-mhz = <1894>;
+			capacity-dmips-mhz = <3591>;
 			dynamic-power-coefficient = <588>;
 
 			qcom,freq-domain = <&cpufreq_hw 2>;

-- 
2.34.1


