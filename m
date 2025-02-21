Return-Path: <linux-arm-msm+bounces-48963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9D5A3FB96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E8B16CE11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC7420E334;
	Fri, 21 Feb 2025 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AqJPxeaX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF91FF7D3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155601; cv=none; b=egp2Vm5JzxY4o+Nob+pc8Zf+ljNGDrsMBDJ/dC4xzTmq7gtarWf5xq/csJ6GszRYgXmbgvg6E6+6HNefxGVqciSzWqLFMdrBA0A9uP+An4XYJ0R+MxZaMHZroQ3f4g2VZgwGOvKZtTd6hg2B+lbgDxpWqV1e6Ty1KCuAoGGbLH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155601; c=relaxed/simple;
	bh=k+eaoBDEiV/v/571srMqiYgCDvaRgVbpbTz+O7zIC7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OLbKn7PXu/A/f4BzIJ3hIL9tJ23tJeLNgVlQ5SddCRlRIpObpUOY0+JsVfPSMRVUOR1ZD5tNDLhkdx7/lqq9q84W6mmZJWLInXBpgaeufElRh2zfz0K81S4Ivyt8ReQrdwS5rkmZbVVrTTDVdKrJQbDwVpId/j21zCfAqdhYB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AqJPxeaX; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so424326a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155598; x=1740760398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3iw6hKjikBCxVEZdKgu4116iy//8boYuOpKYntKgu0=;
        b=AqJPxeaXWZpO5niAhvqKyd+bpyirZl8sw9Sch0bKSACLKBE+fxHZBT/6FLBOXkkQHG
         AXl0aHQa0wgWMh+rjTSEIMMmO5M/NuBdahploMIWsD72gX5iK179rAHKAuWRS18/QZhe
         K9f8JwMdfPt/rVFB1Sh6KwBeMwCrWjrNEYcEbSGWFrnQVmkzCGw5xQEjbA0S2eL9S6o0
         ZsSKOxoVX4aGxc7atG7ZKSIGZWiD49YUfP8EWjX8sYR0xkQ7xsw+6RbwnpKLZV0PwxKn
         djEmR81NXZSpzs6GFxGhDra+oGn4xW+Dy4kSgDftDfFHJC4iLvqUqLw6ZWrlaXiqNlJX
         h+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155598; x=1740760398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3iw6hKjikBCxVEZdKgu4116iy//8boYuOpKYntKgu0=;
        b=S5zmrIa4oRU+UKE8a8B3LnPF9rFW9m7ib+OEu1zYhVpOH65ah6gVWK1S0d8C7dQ+Ac
         oXf/CDM42DhM7eBgAvV9WM69xEvFqKK6V9vFAyPW+Z3s1CXMZiqG/VFL2ArsbVjhWb2B
         BbBz6AGQSHIdPjFT++OYGitsbnPbivKvhKmMFBT8HynbUbil8YlA9ucienZfHUIM2jJ5
         h7Nz0mhpo9f8NTUpQcIcvHZKkoQOVl0hoMbbeMNxrm3HjXUViy0mD3/cGDm/3Pepczv+
         EQradevvcPPjdKH2GQ4GYWWvjdd/S2qIJKeKRXPLPnB7r9liubLnxAAF3KweAPvYcu6L
         NfCg==
X-Gm-Message-State: AOJu0Yxq0nhUWeGcw3D7S8L90zf77u6Gze8bcrIalMT+pq2Z1H/vbesz
	Abu4cxZkfxYK+pJm4FEVEHqp4Zwst03ztbQyd1rD7H41yOVKsWebKyXQMAHCmT8=
X-Gm-Gg: ASbGncvMai4MeAbvfCExO/TN5fNCCWe92HtNgATdBM8UVy+VvX8IjYjBwqJKdiTUlah
	sVv0w9OqWvJWwsbO2WajLXZFTlrhgqe3qc0eoAC+uUNMPkUtAlVsMIss+xDTvQA6sB9vcCx3dSH
	29MXN/RgcDkqPuCQZFdDsxF9TDbAUzEhNo+HJSB1PW+d21tbTMDasl0DPop5+UVzqzbKpCaEBN6
	AAfwVYbso1USge8vU6JamNuOxeZgs/d2jFvPoiUmhgy2nBNuhCJnearXYJ//o479vnJqNfyD3tI
	ZpoL2aUUObg3mQGtI1fb8S7aKqlYxK3rg9orJhJy/Zz1EdO+C+I63qbtQ0YJ1APgN1l7FALbMo3
	t
X-Google-Smtp-Source: AGHT+IEu7y+YxCXPnUsYn64daCxbLq5KBXVjYcY0SneRjy7cICXc6ytelS9iRMCcZFiC70h8skV9Dg==
X-Received: by 2002:a17:907:3f90:b0:ab6:58e4:4fec with SMTP id a640c23a62f3a-abc099e895dmr150442966b.3.1740155597747;
        Fri, 21 Feb 2025 08:33:17 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm906814066b.157.2025.02.21.08.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:33:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 17:33:07 +0100
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: sm8750-qrd: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-modem-v3-3-462dae7303c7@linaro.org>
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
In-Reply-To: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=k+eaoBDEiV/v/571srMqiYgCDvaRgVbpbTz+O7zIC7c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKrHA0/Af+/nk0PU5yoU8f3LJNXmLAEEaaCDK
 pTBuPjnWOuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iqxwAKCRDBN2bmhouD
 1wmcD/410/xPnOqzA0ntt6GOStQjSzlKYVHbApkU9vqaoigwukTy57MznTigG9NSVvsPfZ5NObs
 eRMYGMpGNtsRdDbcy1QpCdlmBNuPDeNUYVJUYHsamHb1/QSx+fQNmmDF999v72C1ZxlV3aw3EdI
 +Z6x/9H2QOMWpqSuGQ0o2B8SPlsHdMf9MepMsbCHlAFNvHjkwZ1oSuhplSniQh2yI1Hd2SWTb4q
 XNveF3qdGSnTs1Lw4ULfpecXUSuodmQducLAALBk+Wjk0sQXxS7JTC/ZGF28dRV8Tc3lMkDuuDk
 5OrhppKcotcQ1UsLM8n0drxK8BM8H3Nle8YIPtFOAZphfI4rj6ZyZUzBeH7Lrys/aO8spSMrbSh
 LyDpN7MBD3tVgg8bu+eBLTZrqbZNFzydGf+UchFUWsuiT2XM3gyeE6XaUSv0NvqJ6LrVPKsGN3g
 t79cigdul6VqACBuW7JxTYCgRQ25naYp83M25UR19Bj+yPpLGmXB8BEX8/PuPJSKDxQ53nmIxrn
 N3ZtGINTzZ9o5j3QLkIA9CtwvHWkpKwo0PF+sMCItYVwwDnBPpWRNYtZ7TvlD/oAcgOk3SDSQ91
 E2mXEgKvxe/6dfPM9r42UcnVma8rWZGrkmDETrD+LorVG6TEoDhDCFslnAbgbV8PSxKTsYlFQTy
 suLqTL0AuM337Aw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the modem (MPSS) on QRD8750 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 7f1d5d4e5b2813c59ea9dba2c57bee824f967481..840a6d8f8a24670a01376f8fce511da222159016 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -796,6 +796,13 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8750/modem.mbn",
+			"qcom/sm8750/modem_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


