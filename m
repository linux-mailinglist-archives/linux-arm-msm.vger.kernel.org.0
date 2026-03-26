Return-Path: <linux-arm-msm+bounces-100086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CgeEEkMxWn05wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:36:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF629333840
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 752573039F72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CF43C3BFA;
	Thu, 26 Mar 2026 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMt//jnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE293C5530
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520834; cv=none; b=SM9/2zijvO2t9Fm3AJWpWwXR/A2f+IRLoUl2Qp1A1hFz21w7oQwYK3ovlRzwk4+FKykICqm5C3tUyCK7YCzw1b8Q1O3HypHB6RsKzv0vtq9Ktg5ydh+dhBMadZAZqH28WAf2KrvZjYl5sSkVTjiyRcsPAlS40H0zaoMR1YT7hS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520834; c=relaxed/simple;
	bh=Q8g+dmyFf1oErSWuQHNucIhfVfVOZgXSMdSNemqqcCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7MuHif32V62Bni23ekuMqvCPEpZ3DlDHVeEp27ST7A2fgBpQ26/9scuFCuMtcafgLG57XDDg6JLFkRaoRhfE8oWfzc9YeY2Buvqc3c2Hx6kegwK1laFcdLfhbyxvMCnuZp1jxo2xTFzVyumkp6ngaZTLntibJmavO9Cm1M5Vwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMt//jnQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so736287f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520832; x=1775125632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR6dNrqowAF8KlOhi+bFuPgwocDMrBUnZUXIhi4XQ4o=;
        b=dMt//jnQy/PUj1fAKQyhLeEEiP8Z3f0c5UZpkBrLFmEWsp0xJJBq+5DsMzKyqfkBif
         fdGJFJ4aK8o6g5D5hXND2UsGeNOAtfQXO9FoQDYmAgMgJ72lypGDrn5uZ1RJXaZ9GhaC
         xSsfI7PrBLr4ODN47buQsCvkrt3HfNMDeDbZqZ6TkUDVf8PofOzqJiayxpHyTIViRJsq
         IMyEclNucKjkF3PQtqvfQL663aY0Igjo1lih+KgxQPcsQRalzbUSJQHPWea28Nm7XZBT
         qnVHXIZ0XgxkPE8EjiiECYPCXkjKr7w71I99z4kPoYeSUyhH7A/OJmd9NsP8xSczcoV7
         V38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520832; x=1775125632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RR6dNrqowAF8KlOhi+bFuPgwocDMrBUnZUXIhi4XQ4o=;
        b=tYhTZL2G3AriGZL8EyjC0hOj8M1brPyZHrTZc/npcHBvg2kluuHn0DWvEDL4C2Wpgi
         cbpHs0U6rmJKMYxJ80awDb3GOBEDKSAMWO0YI6b71ZNiN3mcNUPD+x3QTNzADGO5tokH
         2DEyTT72d4id1VWxw7UUamETYCa3Sa48ZV6OQvwsiIXcUnxGNCNmOJa6hadeAEhg9B6Y
         XDJD6zB8Nam7JaHkFSuIaCzLuV0copVdWkEm6k3Lr6GKshMtvA9BKFmsyhs0N41GhRje
         WmUnIraBibU+u+WztHo7tQMm6XZFNz3/Sy6HEPJfVcD2JTW/k00OftOxYEbJoG7EJELy
         cTtQ==
X-Gm-Message-State: AOJu0YzQv/DS2ne355IzAntdOaLzgiTaAKwrlAESv/7J1xNWHyK+dWjI
	JJCc4F/2eMdy9ubh/mGF4Y0po/pQ7/BSXJXRfDXvkFES2cmpnwqQUJNfbupnaJVUYiQ=
X-Gm-Gg: ATEYQzyKg+gMWYH96C86rU5kNwHE0mp+q4DzAkYYYDZy1JPKPzCoNRKgnRUslut0inX
	nQym7XoP0zUsm7WBJuvUZT8meDt8zfBqvX49uqD6vIFocUct1ySHWtiqhckeVnNjCFbEZQ4FANB
	fxwglDCGNlwJ7LcX/br+iDt/EnBZsyqBONkM34KrcYODpswwaubFCJ8/DMDl9ebKuabpXfV18st
	T3Z3Y0SwblRWAyQ1s+zPDk0C/ny/IH1iZa7+lUb7p+h7O/tBdwpbJnlHCuv8JJlNtFpNRpL5lUw
	G9VdmM7B0qwFWN00D8q4iTXzIjBzgpT6oFE3KhKe806YZQXBcInaqpF2/Uq2vNBaSj34zLpRy9K
	G2Z8uHHqsWDxt7cXiPUqhuK2lsM+E/45xzFBiDOTYHXtrp1l2m7YMrVFJh3k4B40doRAmGTtIdw
	pymKVMm9LGeowIvVN0M0XcU0BB1i8L5J05oQ==
X-Received: by 2002:a5d:5d0a:0:b0:439:cd10:aaf1 with SMTP id ffacd0b85a97d-43b88a960a6mr9871040f8f.53.1774520831779;
        Thu, 26 Mar 2026 03:27:11 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:38 +0000
Subject: [PATCH v3 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-1-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Q8g+dmyFf1oErSWuQHNucIhfVfVOZgXSMdSNemqqcCM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQobvnsH/NDTpUPQPEtXvF6adHwLHfEfAknNy
 DqGkSlw/NaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKGwAKCRAicTuzoY3I
 OrOJEACkMXUyveAfq4tUVFdVlXJb5eA1lcnmXR8z8qnTITS8Pzcjjs14qg2qt+n9LSOfHlMRoGj
 syGx+zlzszEdbR2GKzE5opMpwSwhIboNIWFGP1hLEi4yBtdnK0OMTJX1JHEqTtz3GzpZZppPRPI
 bgwIk8S4N7MmvDbjC+FmWMRVKfwORPDAFGFScfiYJ94EBfEtpBsDYdiXo4Jq8TnOEbITY6kgmxX
 0EaVHcRhr0vy5xBm4Y0ZRlyW6/BVWRJ2DCcg8e/SZLlwBKJpcYrhjLSzMeap0+tvHS8CPr9khpC
 opZ0/VlFncIpJKTaMlhkQ1iewKGqGb0X/Y7uwjmujLs/vhnpxscB7YYCtL9nVp3maQ2sCFNuLfs
 hXncbSTKSfANo0geiQzpjKkyqxRCXvHWl8q3U0+RHITTgeKd6oFlOZrkvWhxgeejHWwSwWOPupj
 3ik1/QR8vtOKiJMVt5fYfaWALFkavRvKyAsds35AUVRfcEsegXm22OhUALJLDg2dbxac0V6HyWd
 6Nluh6Rrx4wY6nEx7ntW2j1PzJBvDqbP1y6n2ja43/uPZwDbb7cHUpPFZTI0o/48oBZaW0Ob3Yk
 jmXi26shais3wj9T3lhIl5hu7GpIsmAr92anIGGXw1veGpZ7g/xnyLmnW5lkaVkhV7FmhIDQawR
 m6yQPFA5B+/hRoQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100086-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aaf0000:email,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF629333840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189..029ec012d0a94 100644
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
@@ -5464,6 +5465,22 @@ videocc: clock-controller@aaf0000 {
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
2.52.0


