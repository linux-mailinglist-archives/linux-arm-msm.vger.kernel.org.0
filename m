Return-Path: <linux-arm-msm+bounces-41049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9549E9362
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80AFF1885F40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1449E225797;
	Mon,  9 Dec 2024 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEq0oy64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056C2248B2;
	Mon,  9 Dec 2024 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746187; cv=none; b=s6Ju41LzU/6bZINHuK2uwsKCnaRqeIYBXrKrn540iL4rKeUPMlycC9uLOhfhRYJGkzku2l1/ZT76w1j10KdMElRwol+/iME9j8H03jyxECb8F+GZjGdXJtjwaU/enKuIBSDp7QYUhrNySPgw/07l0WamyG3dt6PuNlWqg/9A0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746187; c=relaxed/simple;
	bh=2tinpZ9cO2Cfmec7WC+wgRZ+VOIH0877oqaFTz105/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnJ8XeNirsqQuoob4GzSj9ObCMrWRKA2YptZrOp5Q0U0LpVpRS65LdwRMMq3Ix+5h1HrIGfh8Fo6FRvxJlehNoFDbHcH0qq5U8vlxW8bmlzADr6qc4zgLfmdcGRdAAr6GX3JhTbC4yVxvXiX5Al4khcZLv8pcTiQZA+lE8wnjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEq0oy64; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6332dde13so474812666b.1;
        Mon, 09 Dec 2024 04:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746183; x=1734350983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7ZPpMIf7KljHM0C/BgCOacX+DOYg1OD4FK+PFwISpQ=;
        b=YEq0oy64j80dx8JC/keG/qjQ/jRjhKokTTlKTKSTB8lFXcib6qhpJj0Dxjo/FYs3MA
         7s3GZHGid42q7A6f2daKppLq+zvpZ/UrDA2BtqluYBt/nyZd/qpEObZ9JoIJBkY3tF9H
         KdciIwVa2YM7sR0QsWE9EbYmWM5rTKoM/kFAUmvJvVEfnQF7+LPN35Nu2zvPyqv2zivS
         x7OQ4W0a+neRB/qGrgXchqx33tFIHHCWo8mq3hR8TWYEOXPzqZyMUr+AGk+3hahojFHv
         86B1N06maPrDLF00XFgO3Yf0Uk/WySoETjnum8zrdKPp3QEWB9bMhrkYrgFi+wnXKNqQ
         7JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746183; x=1734350983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7ZPpMIf7KljHM0C/BgCOacX+DOYg1OD4FK+PFwISpQ=;
        b=p3828izcKwLFoc7qeSeIhyjBgq1cKbNCRl8Gb5MG8rthAXyzCQlMB8cmq5knoc8Wf/
         LqvzFwizIpRTXgsnvQs5mABHXWpLRFXSS5l4fRrEy5BSw1FLhCd8140chDmJWkdxrXx8
         PxmF4SV4FmcmiPoq4/KxMsNW24H3VDKa9f0LBj5So3XLt+ogHcaKdDs7dcU9S3jPjXMv
         5u4DNyLoJLjhnPe/h68K/lFURwSf6MdFMmf9fVKrkQP4cKr8UqchAD6suU/6CqhfwMzP
         +IfrmP6iWbeRoaZkWCOIMLodaNIm+V5CWmGyhj1cIlrCc5TtTWOILC62HUJ9RsjmLjTr
         s4kw==
X-Forwarded-Encrypted: i=1; AJvYcCU9TGO6Qs7SaEDoP00+5GHP7A1v1eRC/LtBDBpavrV8taFBN0GPCXhnWLy3vyJPmkezbguk8DhhEF1K+9N5@vger.kernel.org, AJvYcCUlkprazXyPyZGRadSttxUUB/xOMTMSvPIIwtyzgCwBs7L4FxOAWR4nj5YdaVLlj57dhwM8hEIUvgf2@vger.kernel.org, AJvYcCXIx2fEsWjmLsgYpIoZxFBjsADhWLrajE3pso/C1Vjf4KHDbfec2qnBc4z7kG/4PXG57X1VclAn1UVb61w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4sBUQp3LhbnmcRV4vKgFG6xaGmbp0dnc05nvmBlYSPo4gPJaa
	yO1K/9m6j6oBKrDLjoKNjhLEsufrVqKxCjVAzNxpiGXHieqdgvwi
X-Gm-Gg: ASbGncsdhieHVzOmHImDbvoH6ZlfkNs9w8k9JepVLAmbM2qLORt5ovimgFOsQIolXhL
	2Nn1nc9WwjKZnpjXE+UVoL3SGOf85NGa7bksCwEP7wdps0/V3BlB3UkCO593ARhRUU8Y9FUn5z2
	MEyoaXlDLMh/1QlHU8YU2DpgrkywkCcsBby7MI6w0NzP14oXNwWeaA5miE8MuGaGV93778exC/u
	horasdrRO36QdRN+RAPpSJGUjpxFvQSxxLVg6TJvRsxzJNF
X-Google-Smtp-Source: AGHT+IECRErKOM6m79XzYC+ruvWhmWnsuYkaCEJpwGYlc9PTZxIHZiiB2OXmBhzZewr3wnNjs+adAA==
X-Received: by 2002:a17:906:9c2:b0:aa6:6e10:61f6 with SMTP id a640c23a62f3a-aa66e1062cemr624519766b.52.1733746183288;
        Mon, 09 Dec 2024 04:09:43 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:42 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:08 +0300
Subject: [PATCH v8 04/14] arm64: dts: qcom: sdm845-starqltechn: remove wifi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-4-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1185;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=2tinpZ9cO2Cfmec7WC+wgRZ+VOIH0877oqaFTz105/g=;
 b=QYeA3Im1uvPRASwBeOqf1G9AuakBjqt2vivQl3+bMYeb+9Y6ZTtX0r2cweHB9fyxGEXjBMxoC
 PFA0D9txKBSDqh86I9YNmee+7Tg7kV2L6+2wXGC6DKE4r9fZhjKe0Io
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 

-- 
2.39.5


