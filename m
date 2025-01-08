Return-Path: <linux-arm-msm+bounces-44360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AEA05AE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F800161B28
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7611F8F1C;
	Wed,  8 Jan 2025 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrED4+/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F31F76C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337749; cv=none; b=eiEAjg5dDXbu4KeJBtk2iACYQP8Rr55vq4FE3TI4zoMqt0ZIFUpA2sP84xDG3vIrlaZ3+ArpsjPI2ukG4bOKwwhvOL9Jv2C7oPbqqPa/HW5fTUJMjq50kjMX8t8UEMtBVAT+fM4dey3wCW2E5D0Q7qv3sdnuKqbO/iIoMk1tv/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337749; c=relaxed/simple;
	bh=piZ8Qx7Zly2LRu7vla4X/tFQmM9QLWzUUZoYM5vZihY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8wqBNRH5Gy9KjvvrtJweCFgNoKM6CpZvyiJlkRP/ewSki9puPI1BySPu2L+7n7QyX13plHH9wlIlAJpFhxI6wYS9+Nm55a4Xx7v1UW3AXub5k92HJrR0EUeFh9UBJZPacnul+01schh1MNDu/otj5zKsCM5lbBln12wC/mmCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrED4+/S; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa69599b4b0so255595166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 04:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736337745; x=1736942545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=xrED4+/SZ1gSIU20P+rL3SIfg5TBM9Xb1B8dE1HPEZDia+Bgw86PJAIh99RN8CsPiT
         hFDEXCEPBkXFurZeyx55BfXvQpBwHTOh+TXSAKMFNPNCTRGHHovUjcgFRql7DsOO5sd6
         9w/d+u6ypDsG2CawUScmt+EWdaM8+5aYO47taPvPphBthO+tPxljI0wnQ8k4j6oNgvuH
         46GjhnWnRB3lf+3ub37KoD7YIywhe8+Hl2ATs5DYUHjTQK8JveF36bIgvMBZEc9D3shd
         7rOBK2a6zCP8hRHCTCzHXX3JumuRHpB3kSGBPJiSHS1NnWnzQSLU2pdfmWbtZ4RcUh+1
         S/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337745; x=1736942545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=hmt1tn0whDyniQrUUUO5RgSYvGJ+U66zMDA3r66UjFglnkw0hw1aiRXkNjZAxXR6y4
         OTJ5iaF/CW/5KKu6TemDRhsTenljS9DivqvY+nRdlhkWSVuO8uZSYR49jROyMzv362bT
         h1gkfWRXWz0odJCLMgRqBDEdLQt6f2VMG8U3GFSbHweRT/l1TaPGNCJ+JszOJEPHHcI+
         Pn6n70nKdNPWATtUuUCCPZZ/4uB14nC85KB2KbTzsp1qxkKehW/UfhQRXuebgKlkxoFZ
         +pAfnRNEQNZcq3DWllygZpxto/eUbGjLYmMCSXU2hhU2K0pAg3ZHEKz7PyboFfnh7z5O
         ac9g==
X-Forwarded-Encrypted: i=1; AJvYcCUYMMSB5WJTAx22IvePDQXq/Nx7rh3IggvHv/OlEbwo8BJg8tml6ZfquoXzifkqlbMtdtcEW1vM8L1xgsOQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VdUOWYo4RGWoIITEIfgA55IAQAn5r/WJ2xK7AYlcULCCnAEv
	M6HkX+zvPgINd6xP2/Djw0/RF+esPIMdVGOvQ+XKKrp2ztzmgGeOKmzyM7wWxXU=
X-Gm-Gg: ASbGnct3B0q1Uur0tK8xHUSjtipqtH4Rpsu88+6guj7dADXCYuuXyS1NEaSMSG9KYEd
	R9uIMEmQEkSOEMoouRE1X5pDG1JpkFe7DddpL+tbdXvSRoZAifaYRt2ba/rDOSbefNnltmVD0aa
	EuvXUFw5g1LZ5RpspqpsPcEJDvsZ04gUmfb6n7Hsh8tcVVdWTvSyGlEL/6JZueWRSMNkxRqZNm6
	SI9YsKaizZwn6n8VuRYI8UqmqH2J44Byt5U246ENYjMwkjk07N7HFD0zYKJyqXDHDSS9BM=
X-Google-Smtp-Source: AGHT+IG14SO4FyYH5nxT6SXtwZsRRGbviya4C+apjniEiW8sCLRoGXllxv2memRQQkt69l6yOVo/tA==
X-Received: by 2002:a17:907:2ce5:b0:aa6:6e2e:b7f with SMTP id a640c23a62f3a-ab2aaaa1b60mr80725166b.0.1736337744865;
        Wed, 08 Jan 2025 04:02:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f828sm2482031666b.19.2025.01.08.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:02:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm6115-pas: Use recommended MBN firmware format in DTS example
Date: Wed,  8 Jan 2025 13:02:21 +0100
Message-ID: <20250108120221.156131-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
instead of split MDT.  No functional changes, just correct the DTS
example so people will not rely on unaccepted files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 059cb87b4d6c..eeb6a8aafeb9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -127,7 +127,7 @@ examples:
         clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
         clock-names = "xo";
 
-        firmware-name = "qcom/sm6115/adsp.mdt";
+        firmware-name = "qcom/sm6115/adsp.mbn";
 
         interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
                               <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-- 
2.43.0


