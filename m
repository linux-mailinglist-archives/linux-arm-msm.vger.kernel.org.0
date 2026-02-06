Return-Path: <linux-arm-msm+bounces-92052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKbgBicAhmlhJAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 15:52:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C3FF3ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 15:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 402953058A81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 14:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D41242882D;
	Fri,  6 Feb 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3F17T1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A19428495
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389449; cv=none; b=c6Lw9NmIHVxBJdm71mLsGEn4Y4ildll/PxkVdC/o9KuVPANtxV8SXUw7V10M7LGP48LrBUvZKmxXpdrSDE8xuKvQNRfA9RDXM/JRYbLyJ2RLGsXdmpdCimVhan430nX4odJPUDcSpSNL3d3R+Zpbnt3YY54KuDOO2NnrVgKqXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389449; c=relaxed/simple;
	bh=UhlMaTJRZ9fLa8E4fuLuIg9nXiWgxX4wZpZOm+FPpVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpEVveNZtowaOkeVA7VdC/OEhQ07AFExfQiui1fXbePG8Ch8k0vkElLBWc0S8xOOokQkKq8HyyblF7FGPzNBLJWR4YDXxvjhcqxVKgZxZ5ftSeYXZ7UtNiiUakR1BkfS1p90HOP1NC5/JuyBhkvN24Zkp/jx2qmRwfhIZo5KJfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3F17T1x; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so17218375e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389447; x=1770994247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZLm3gI01t7k0CB1F3RPdej8cy0OV8XKyJkxMLlBgyY=;
        b=l3F17T1x5KmKDPKefmsOelWKnrkIGrn0+Tr36gcjkJ6TFZrRVMSXBRZcYQdIEJo0Zz
         KDhSIfKvCYpuEQo/Lw0lgeZGJWPF64dQy2R0B/CHP+sBTfdkf2E0sU7F7X+VlP07K4Sg
         9OGVa07wG8/BLOdb19Qy8TM46vtJiGb7FRAEAcaaaaHiBpYB1/XdgCT9ZFJb1hFpvzqW
         nZwAyfNIfRJiGeYWweoQ9UYHSfxJRFOrjPZusbyOCxa37cmB9io8WvLUogWe8kbFvai7
         yP2D3zeyP6vwL5bDnmjXiv4W1kqd3XTzh0v/tEPl9Ecm6dzZOI0Yea7R3Yue6Zpioiu+
         YDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389447; x=1770994247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZLm3gI01t7k0CB1F3RPdej8cy0OV8XKyJkxMLlBgyY=;
        b=jx49/18bT0yOLwfToFyUtp/U1tfHZtcyuCETpoLyaPyvMrgfW4xeC2fM5XXoScR/zw
         2rUT0X4dnrdfPNcuwDunwxNUFh1727ldKlSDhRWjbCbJ26Z0ycnpT/85fP+nShwz8lLY
         beBe7vWOX66xBxMYZU2nxvkfmC6W22SCh/O0oH9M00Dsjd5RmP34rmA6UEUJccmJwXj4
         AttSSKt4+zX/FTbactDxf/8W92EfXS3mrHRbfp8UAYI5pIMqCFphQ1KdMpAv1gqrAym9
         kouWyKLKzovM6JNcm4qHzCgolZ1w6/i/AULaDzGSpcOOxXsUr/q7SXteLCVI3+d39wA5
         e5SA==
X-Forwarded-Encrypted: i=1; AJvYcCUHA0bMgpHCtW/W6yCuCbyk86ndCxIpwYm5tQtKQvhYOI0LEpH8sX823EU0DIizqtmTC/3b2774mUx7ugL8@vger.kernel.org
X-Gm-Message-State: AOJu0YynW7aMaNEgRn+2nlPWQHX9GiTZaNW2JoCCP/3SdK9khAxTVSER
	k6OES62hiPYH1ggCqcl4WknyRSuGGv0PB5iFRdScv3fgiCI+wZ+F19rKbuXqVpjIV7A=
X-Gm-Gg: AZuq6aIxXC9MGdoeodCtGD6BQwg36Z3bi/lQ4Z/5saJbYii8PWq/6RYT8uQxp96bG6g
	FqwYq4/GUZequdsXR72/fbKeu/1rU1B5jmkR3SyRixGHsTA6OYNpw5y1mxnS16DD2sH1kyxqP+P
	ClZkWC+auW5regGL6P2fttBdxDiM75fiBJ+P4X9VH+17dUOq/WMpteJPtK07K0TzsMgeMJ87y4t
	zF6vuKAHqBNjITk9LFB7G4/Qn1krsoFvHbd0n+pka7oiXmfP+wuM0VQ9IgSCvUYp0kb5KZw6fa2
	fcfOlrUsjVrhcaFLnURM4dpWyLg6gxcDs/Oa1zNop2z8r+fLbD8BAPHD0dUauxEoPJbiz1gEhHK
	M89ZIZvBlkhIfDL2wpBQQ4I1YuK1UcxEXbB6jF4QsjELUy3e8NwWm84jPeOQybJPG0GOFTg7F94
	8KV5w4gT1fl4yQf/qc4eBKkTJfDW6dzxz+
X-Received: by 2002:a05:600c:c04b:20b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-483201dd234mr30633915e9.11.1770389447403;
        Fri, 06 Feb 2026 06:50:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Feb 2026 15:50:36 +0100
Subject: [PATCH v3 8/9] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-8-5b79c5d61a03@linaro.org>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UhlMaTJRZ9fLa8E4fuLuIg9nXiWgxX4wZpZOm+FPpVM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+9dOWkQJdFemEvoKTFH8uS+Q1yurC4xUWEq+04
 Ez4l+PWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/vQAKCRB33NvayMhJ0SWWEA
 Cllz+WrqIxsNn6L+HEzJo0XSTb99cY1OZnLekrQchzm8OSteWlk0Kkjo77xwJ3O0OckSF/v80Cqcar
 BFD4sAhTbleidT1MrwOiI9kLphkIHuyce3SrFjA8H4BTI3fjHrdMPPU9DeS0jw0PgG3YZkIWhZZr5b
 zLv6LfGiuvFkikodToYoH3vrbT/FzRSNWzh3W33qMUpfpVCzwtOgbcyFYcD/RuRmE//y4odhejSVRs
 sWy10lGRKxgk1dLCZsTM8AnGXFTKI3/l1+GAhYYVKyTskZZFzhFyLQa4keb3+T5JeT3LtXFO+d7QdD
 J9LEjWTlxcCiDl8gpLLGEGQCZr8llsp6ORuWu94QlTiGIHZdVxPMS0T03u2y4j/n8IF3cFIrKzzU79
 5CHgeY9Rphxai1kHkQoYMNRN4sP9UTfj/tpH6SvJB5Vjsfz87PrjfU6tx3jLPlaiCXDUpEdZAramb0
 fSSj4hJ+QCI2dH/kjrpPOCewEv2EiyyHjRQRGnckASODzh0Ah37uY727Yi9L8Zxsj04ubdKWzTtQ77
 6j4UKKPiNDJ3JmFzfJFOfZrKneNLTXQnQUpbs2x4RBBcKqQE3EHyN6jjzfPyWCaxY/jTtmXrX5Yun8
 VMctwj3AjUmzm3OwGz0p6iHVDwiWB2qOyRTUzKx5NeIXqWw6/PXzpfyMlQdA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92052-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 6F3C3FF3ED
X-Rspamd-Action: no action

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index a7a06f78e564..6098d6201002 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5773,6 +5773,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


