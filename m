Return-Path: <linux-arm-msm+bounces-97759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xLaDHyBZt2nwQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:13:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF262934E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 502D4301379E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680A521C173;
	Mon, 16 Mar 2026 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+EJuaft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46631F12E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623574; cv=none; b=MRmi7pg468tcy1Thn+PwTOePsJ0Ohi/j1qq8sNjmrIUc47vqWQNUsTNUeGfaTK0Ha+wYyjsaxpz0R5B5ys9vvSzHfz7tK1Slz8E8FoHosIbfbfbqP74wc9nW+Mu+Xl4ma4i7UvaFh8AqGFt68jl9W9JTSO6VazSPHYl0b+gzVRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623574; c=relaxed/simple;
	bh=Q8g+dmyFf1oErSWuQHNucIhfVfVOZgXSMdSNemqqcCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2BFQimSXf6Xi8gdTBGd00wpe1bnD0tlvECO2sfXND5WXWT3tfdLWAHuGFhXfsLFdwGG8azJrMPOV3qHjKzfIpVlKWYmHP0OJfPah7NHxyFPlWcuj2MXkIp/gySyCkS39kP+2ZwDOLTq8QAsp43PQnOAj36/CbRrXvE5pa5FEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+EJuaft; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so47931125e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623571; x=1774228371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR6dNrqowAF8KlOhi+bFuPgwocDMrBUnZUXIhi4XQ4o=;
        b=G+EJuaftcDMH9kKNvQHclmGnu2ZryCh66EK6pm15hIUUNLSNiCWarHYtxn16R6lM7s
         ZnjqWXkqjpA8W05/fLpKhk++rYhPqx4H+bB/lF/PaTK8LrY6emQdh8NHI+glH1H+tc3X
         OQOBrZIqiWC0NSjRlKPxJPLE5TpUEhFfTfhweveHh12Lck2q6UKke3+ZwHe0YW/ZRUhg
         +W/gNa+/210aLUU0X9tEY7/eW9OG4pCQkGsVCxlKjqUBHNWiMvsW1+8S+fMlClKwxefK
         2FdhpOvH6A2qQqxf+VgKVLg3naBHGiMK/pnZc8ol1G5GcuTqPUDbQJ7pN+r0NXWUaim0
         fC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623571; x=1774228371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RR6dNrqowAF8KlOhi+bFuPgwocDMrBUnZUXIhi4XQ4o=;
        b=f+ETE7E9V/UC4LG20WWo7XUU8vhn5tNoLbRBypR/7uuob/VH+zSscq0t1ut7owP5SR
         pZ5v5gBqwF17f4WKhjumo5sC/jEmmpbZvOAhAtzRG/PYw5JBCEqKgBUq4954N5uwxDau
         RjXWB9Nzrvx5urBdidx2IvfSvlSA1WbfXy68IzSLoezuwbcK5CdPG999ReVD3AfsHE/U
         nY+UquylSC4HtyO2J05H63YT7flbnrm6T9qril2n4qjBgWbyrYhZkysxgwJgDoFaPgmy
         rUy36WruhFwP553mjujELImi7ibYyY0aNz/gzQSg6y15aJ2j7P4jTTSJwjKuz2rERiAa
         Hqyw==
X-Gm-Message-State: AOJu0YztGcmeyCfGkdGlguDnv2D24ByjieDVGK2xw6io/u70SskVAxSV
	bykwnWREekfc7L+0p1SurMZSOwrw5oNAWmRI4JQbc4GGiKZ9j3ZONqlCdVPaBHQOapo=
X-Gm-Gg: ATEYQzzXh033q2rIgQrKtR+Aj6eGvozMC8PRm8XWzxN0ZFU3ijfgyBFxtmzIVsS/j4i
	FrkPSgkk9b9LoJ3bSqy1EcaK4c7exkpuom6qxO3BPiCnOJdLK7y4B7nHXVH8ks3bG9cZavvFfsz
	JQFl6MY+HbDgFXEMp0e/CYoRyN5eS4jIKo0AWbxE+taNNJg0ut2IZmK6uIOqro/inW7zWS79CkN
	5WaB8JAOAWz0wH0qX7xRS/g3kVtdMsTWCCART3phbtiA0mQJL2+IH0XDi90xLLaofJPm4Rl2HgG
	06lrzSq5jgI+4Lz7EiTXBi8l0OvzbjtLcuwWmC8R7Z2xAvte3UAWL2duIos3yvpVrlTxx7dbg2K
	D8+KBcmB0rFqVDxaO5DxbLUR6IWX6JxYKX1Za5garPDSgIXqAnnC2TXCznoXsm5sYQdLD9HSjXv
	up8aqXhNzHrDYyh6DxGIEThBfVmz2e4s7zojs=
X-Received: by 2002:a05:600c:3b14:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-485566d6e54mr192199535e9.9.1773623571426;
        Sun, 15 Mar 2026 18:12:51 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:43 +0000
Subject: [PATCH v2 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-1-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1kY3fzrf0EJ6mtZTG1cebA/6nD+2lxpdUcAD
 PsJ0mGCbb2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGAAKCRAicTuzoY3I
 OvE6D/kB6UTMFbKLM1dXg82YDo+5pSXi8HPkLM5TTF5z/yNKHXx7TOBUdM5PP1o0v1UtGKk2iF6
 9vjPmD+z9trGjMWSLVa25Cx9ZRZ3bnya1xLd+eXppWAX4Zx6ClLmFqO9SZRShaMV0z/+CGTMhAN
 bd9guQzk5dhMorzIT/dv6Lzp0nKedgcqVF5gHlqMxfHlcLFOoCPwTy73zn4iasCCiSvOWIaGu0u
 C/z7IscODkvk8a1aDQ+0pUHHfJV64RIppt29CiJCQZdd7H8aFNxNeE7bddYDE/hqTAGiKqFc+eq
 XoSDHpAUXe9zgxIGX3xrgN/F3/HsNw1nW1jcTfpIxfS2325C3lMVWjcl37B7sV7AWnH/wzv/0Lc
 x8ZvQbPtcPIRn0Rd8VGNmm94EBytbc6Uw9x9aPIT6nSTCXRPCloNUuuP5axKya+Lxfp4UvPDXKP
 H40eo1eXpTBt3fXoqpUcDqXy3oV1gIepRGPiOKXfX8YcNinsXWckUpjr11o+T1Nufz/lWxI0mGe
 23RYL/HAdKNTzzxOFVtYHnacWD+Ao38Vn/AWdAnb7IEVcPWPykQaGkCp2NeYW8OTgOXOD0PtUuN
 37tqyLxoDKhut0QH4CXlaHEA9wAn6ze+x9GqOU5v+EvOf1bfLMQAeJ82IDBFIzsE7gXkfRk420f
 ySNgOMWFTKCCnKA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97759-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 1EF262934E2
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


