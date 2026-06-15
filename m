Return-Path: <linux-arm-msm+bounces-113240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Re2bD8IxMGoBPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:09:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BFB688B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:09:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="n7y/vxpm";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113240-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113240-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CF0631BC743
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C96541B36D;
	Mon, 15 Jun 2026 16:57:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2191A416D1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:57:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542638; cv=none; b=dR1/SX7fLnLjl/PEWQJeDp3uMIGPcTkXp7bg8iTweaH4Ew50q167ua0Fgritpkgohdon58Zygg6mlSjs8+q5gJ2oe7lFnzhjdqeXhWFpIIUUBNwF3QCBu6DlzvEFmLi/JRfe5t8in1Xb/MM+DeVgpnGylGQIrCX7DbRnk6ZS3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542638; c=relaxed/simple;
	bh=Q++Lf186tcvSnhNbpXMGHHXwihp6Nj2/MYlU3xEci64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yq6fjnC1hH6wb+JhDrpmjwc/2yXABdrSE3EgnoUGv49EfZpheoFNb6IWPR0LqVgdht2noHmuHVfZzDLeY8ygj3YUREalTosUYeq1pB9NrgVw9y1oTBTJh5UZQLY8AwS4CjyX4Ca3u3PHjXg0goxaxTn0AAn6d0ex4qCUz0aNd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7y/vxpm; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4908b92904fso43680685e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542634; x=1782147434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjyMVm4fYYqVPsgeWiKX2v7WFAJCpVCyaRGSZIumw3A=;
        b=n7y/vxpmE0zsY2wMuUR+SfyWEUlbOeFm1Ekn9BChRC9EmctRzTMINuuwH2CRE3Vrfr
         nSUXY8I3GGAd3e1H2VvX/t9GALp/qgQ2L4GVeiIEmijkpc4YAfQcVDIYuqMdScYvaMM9
         ck4GWexKkcmugdV8/NlpvuD4d3C7rLSH1g4sm6Qy/nLXPcOt2QIGkSjsnVSFkvQKCI1E
         KdMT7nFzrSRB6+G7WymYtu/ZpmQfWKppceplu3lY0s4MLd46TEjp7pZ3VpOAhq1se90m
         JcopVEgVEZ3Io6/Qm251ARwjVjQyAso6tTNXl6fbnia+Z4DtxZ1ElChVI+z4U0xTPnUF
         c7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542634; x=1782147434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjyMVm4fYYqVPsgeWiKX2v7WFAJCpVCyaRGSZIumw3A=;
        b=WHlnWTWK+Gd9AlIzucQo7lw8RxVybiIYPMiWg33WMv0zxBR4F/QlZ2oamFM1CD+Tr8
         ektuivj/kitg385k6cSnQkf3mG1L+90usNcytfXPt/tu3rXaXrOi0lPhr2Bj3guG9vYX
         6mYCnTEdaOtui744cD77it+eMlr7SgJPy4u9QWvF0rSrMm0LWmB3fdDZOInVwIrArNde
         qSzvIwky8jLsOflnZ5UUVl9vGxX9LoS6j4GIzNHKKwbBa2rixIWorcYCiHuXhyzPVGFr
         OfbiQd26Rzv5szzZipRPNrqYkv3ZMPM8Rkw85wTJF1JMapMkN1kbybKVcqmAsbkwLmho
         bajA==
X-Gm-Message-State: AOJu0YxwY/a8LOG8Z7YjrdntKutj7mmwAXtWHMVADRvkp/OReRsFuT0g
	Pn2uAEYTvxNKweRX3cgtzqVMquUznG3+cA7WM4uDohfUolf0UnJTACXz/vvJ2Fsi/fI=
X-Gm-Gg: Acq92OH54bPgd0BGEVMMfP9qTfFFLdd8i7kCRiljGCqa6cHROs8pCSNxe1oqmXgsDi9
	bGPz5f8ycEJmx6DJLlsNLDkGP42SLU0grHJkQO4fsxJMcmIQMyDX9UB5SdTQzWwyKAN58Dg8zUB
	6JghakL0d4+UI40LhNVtDh24i33/BfujM0Wpk4qDI6xN7Rw8+TLBI3AupK7Z6Ln+At4IEB5YozA
	iS8u+xphR0wftivKQoQFG12Ww+KpDAIbEgSdw6hypDdrQZo/4UKSRGYw3IsIaH4Q2Zsn7FqUyrC
	nBElpwLpPPpWnNMZa189Iw3FBxCHm0ZcglK/N/4LsFGhvD0CRbD6+B8qiyqcczCnKU6yayD7NFt
	vThdRfUKc9v/hKgeLU24wpY27Hs7Cn7jvanhBisjdz+7tHfo0PwXyfkIwfysW4VeXQdR7NuFg/K
	TS3tQomCSyl2pz2GPaqg6/vYvMUuaBU/0dNb2/DnrC6GAC
X-Received: by 2002:a05:600c:3f07:b0:492:1e36:bafc with SMTP id 5b1f17b1804b1-4921e36bb41mr153680045e9.36.1781542634466;
        Mon, 15 Jun 2026 09:57:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:07 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm8650: Add missing CX power
 domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-6-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Q++Lf186tcvSnhNbpXMGHHXwihp6Nj2/MYlU3xEci64=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7jZAiJqW5AmB1lC7UlqNt0vIWrJRHtTC326me0
 PmXRnEiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4wAKCRB33NvayMhJ0S34D/
 4wC9TFzb6OByWn6XRk30aSwG1MOO6TDGE/O8Zy/RyeNfPPs4cZUoUxa1Eg4qAVm6ut2RlvzxTReou0
 b7Lg/kHLVRGnN5mUOw/ebWHNwtxi3RwiINm1PAV42JmYueR/g/IVKAodgxcb5ojsRFOmqifs3Qzcdu
 BlbOzm8Hr/KaUYQV5JbDiaSJDkuMBeUjtXbH4ZWQYUYYnwrcD6j0uR9GlsEmIEyYx6Bo+su3j3HGGA
 a7yQAT/KaqQyzND2fqPYy3SF4hxUNWUiJbpKEqXelYVABd+KRW2c5fYCmhpF1cBlQ/2yr/aTI/L5Az
 inpmUVKLEWqWgZ+GfPDFUfluY1F+NkeMCbBgWEEYDhjMdR98tW2fe0AXhQMp6XkpZGlW0n58andf8/
 VozIOiApMLpUGlBWqUnNbzeb+TbhW2iA7UsumTuisIbG1mxHE+Wr4nFErwQnhRdz9eOlzDnajk3sPn
 cRfPqaadeGMVht5+vF4C5VOkBnwB18MXktAVrQQpTKcKsHRZZNnxrMsFWqhlb/5IPxdtOOtxPbeOXS
 sdA+rwlfITleBcmVmtHErPBzvIBXupBjwuhmlicGQFMOGvCzognf/ayoIEi3f5OPXrw/nCO8382tks
 cErQXKVTpGgKGvRKh1n8sv1K7eHjSK/3I5/LWxaIdJ9iuW5oigJ9u05DViTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113240-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:abelvesa@kernel.org,m:konradybcio@kernel.org,m:quic_saipraka@quicinc.com,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93BFB688B2C

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..8365e97436d6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1963,6 +1963,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1


