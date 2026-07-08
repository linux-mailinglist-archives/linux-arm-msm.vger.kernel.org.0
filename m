Return-Path: <linux-arm-msm+bounces-117445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /jHiJWmdTWqj2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:44:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A1720A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:44:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Z7j5QLUp;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117445-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117445-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3540301AC21
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37869369D57;
	Wed,  8 Jul 2026 00:44:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD5A367B98
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471463; cv=none; b=rK6u/ZXcXgVuRr/10lu7pk7jwN0BoqMYnr1jCZd4lS7LeguWWLC8t08Y7MPEOYJ/lptoKPPwLMWvlCoHk8bVTNUYaJOUmSJAa+cDQcYENsq+e+po5p1tjKQi03qGa3SyNueop6KsF/HNpPDjgI65OpxfaJn9vzmewQAouQwx450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471463; c=relaxed/simple;
	bh=pWBNz5LfXepJgIeDWzJDJHv9jPzg+TX3+coEE8bqAes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLwsM9lSwXrlbfeANalSC7JF342ZSFeFlb5Yn9qUYNTo3Nlp/wTPLea8HfkrUXEsvS7hDjppGuicbOHTGpjkYYhLDhhwvUvKTcWCm/vaS4sbwFbZGfwpcElMrVu+G/V9xQDn/121l3lT71DEUi9RESTlNI/xCQQly4bcur2WXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7j5QLUp; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so471085e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471460; x=1784076260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyDeSpSoWJue+yqqnuU2hzkr5O5i91lX/20TqIJnGes=;
        b=Z7j5QLUpzWq/djw76RkvPofC+T2A4BhEzbx47x4qFUOOz5+pOM6kOT8lyEfL/PMhKx
         PgHzgd2lR0PJIFGHHH9TZUnZLkDUu6FatRK9lbKlDOM/Dty9YnnTu+XemIOsbUbkKBbg
         pwYU3qKFawq6TtXIt7clHAgrODotQcfbdP9kTlrFnld7KMkrI6+eVxfJgRWu88zvsr2B
         mYSC1/k9KVQh5Emc+tZQ9IKOQIPPON8itZ2H9yHSH6q34RGiCnRBterTZZqb1vs5R+Af
         xV1Lyw2dUNsaCsakFzhK4UAYNd9splHVfkIWRv4YMX/rnKYqM0dxcNft5T4J18sGiz5T
         wZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471460; x=1784076260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyDeSpSoWJue+yqqnuU2hzkr5O5i91lX/20TqIJnGes=;
        b=OSvU58PopH6UG9QqA127wmp7GFDiOKSqdQeTe/kvAx5eGokwikhWQ5gua+ts89SzsA
         L2Rq1RGRAjWqthj0y4FoxqsDStulUu+LU5lZjBDpm4rU9YpeWsTxfwqGdMHduxU6uCfb
         9ADQogJEP+bc8y9bb5N4twQdTxqi3hlvOICcGQgDVRkoe5jtJe3aSiAxx55GJBBP90+F
         5jDowq5PDbFZSuV+tSYjIuF43EhGC+d+tf1aqqGOc/0z72HhgONlOaFPkEMDnR8cPuHX
         d4cfEAJ5EVy/PbmmHjwDr8cKO4NALvGu25EvQWiWDuVNIk1UIfL3pTs34yt5SBdP6AHN
         0eRA==
X-Gm-Message-State: AOJu0Yy2v1XAsnFvO/Jq3EnNPUUlAEfhWiIK+g3uwiNvOYoVGX4kwYn+
	L8ys/5NGD6E9kSH30W8w6hylKe7bduwnbKc3KDDq/kQQfqzhgK4XSqTskLoEx5JDtrY=
X-Gm-Gg: AfdE7cm+5q5HJ+9rNBWg12IIY9C8jEzd+oFu2Q1vN/b+bqRK3tfhtRGUYVDAFDvTjYZ
	rJ1HN1byrHmn94m0gd+cqi0R+kAIcTqxhX1uDGxeBlEzQR7I85lNBf/lGQoEZRVyHl+r+AusQtK
	cTQnyGKpha0X2Old920cTBR9u5FRfJ9+vlJxq7NnVS/suMXeEjPZTGsnuS2h/7vueRQ/FOEsjii
	aGaBO4vazLCYJovm1wGmfluwJf9Ek3pVALP5sM7FM/wZ5M4Rddp6u+qjHmiMnHT+8huFVoqOcmC
	w+XBIPT2cU+h9EV+Vk3tXtB5Yv9J/8tMmz12V46+kXWhZJO92CY3IQYUem9LW6ExlqHnxTdw9YC
	H/lFPeqzVcPn5xlqQ8GBKWxgQ13hPzJ+EahhL41vovBAOEr9kPac7+qhp7xBIGmjiHHB0dSfoSM
	KMM4PdYV8ThD/gFpF0fNW2Z1o=
X-Received: by 2002:a05:600c:6206:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-493e68c3aecmr1450445e9.14.1783471459859;
        Tue, 07 Jul 2026 17:44:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:19 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:08 +0100
Subject: [PATCH v4 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-1-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=pWBNz5LfXepJgIeDWzJDJHv9jPzg+TX3+coEE8bqAes=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1bmSpJyLHbJdyV1Z0tTG/FN2q2WGHxcFN6G
 nvzJsTpnUyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dWwAKCRAicTuzoY3I
 OosXD/4pMB2Os1FPkWcnEJBkXpGZHg2LseNqF6dqV/SBlwUsXgqVTWi3LZxjPmb8rOdLrlftvt/
 XjVjxwmMZE6kDCzHu6XU4Yp59Gtyzt0v41f+YVHIqUZc9Zcuh2s3NdBgFWT+b+j6yud8th9p2sn
 wbHWx4XoOXGvzjnxTA//efhNsszyDCe4lyRuFlyD7m0pmWeteib3gXS5SLmCA1u93LnLLYe1r27
 ucJtV4QoCMid7gbo+UyMavNhe/t4blPXG+sZRbgtVluAFKh5gIFDYrIya0enEWftu44kkVsPeml
 xm+SZ+ed88q124JZp9rmgD/rfEF35winw8orw3byq3CQZV37FJ16oEIHTYUGKdWgjoMegVtP/la
 YKzUKhdwydtcFvY8Jactlpa6/WO17CNFbgOOuT87TEoxWWXvjALA65xCLI9mu3Ye3/FXrToHIIH
 7myK0rUwJKHWI+k1cl483FkC1o4AdFEGFRuspol4haT1ebLdF2UJLWoetEB600GCyeY9uXiYiJ5
 CYO5NZHhLUvEv+dmFlN3uC0Fvp3YazRNhd32XGSohS/7AgTMl3EcEVIsgiT+IUzfi4tgaha8Nun
 j0tPohOpP47PdRzPg4CRRjj0rg/wvGNsqhTv6uMVsA7dJ4Ynd8mikNmvpqRSEoknd9cqwRfFFKm
 /C+j8wusbNjMyLw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117445-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B2A1720A9F

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142b..9a8d6f020a391 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.54.0


