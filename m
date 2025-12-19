Return-Path: <linux-arm-msm+bounces-85930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C890CD0F5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582703008FB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 16:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2540E34D930;
	Fri, 19 Dec 2025 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EAuzqlZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038A28CF7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162485; cv=none; b=YooNDVN6tN255xMU5dcSHNCV4WaETTLUY0YxAzTLhhLfVu0Xe+ATWpkHnD21xWL1yz4OBJ2kYE6v/YlVxN7zLN6hqqvXGRpohOt/bYVw6gZQMnKWUbCnNxjO9wim/7zZ/+r619IYIWL0jKhVZO1dcaB/zpl7vApI1XguEZiEQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162485; c=relaxed/simple;
	bh=t5HFnNXhnxSLu0HbcMB5zyaLqy0cPi/BThYL9zb/2sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6lc5GNvla1N1OSaLy2AuQFz9S2uAdm101RshtKfVLd5OtkW5bTqBbn6pbvMRWqeu96fC3pv+bqIzgIlFXIOEpUDoU9OjrCSQ84alKx/Sd+UgwN0HM5HPCD71g1Eg11Ekd7kd+7Yd7UcDDTUaBvgTn86i664g8B/9MIB1EkEIGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EAuzqlZv; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so1039801a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162479; x=1766767279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
        b=EAuzqlZvGEuA4Dns0/pGJOnoH4TOeuXnSflTgprotvvtjilsboHqjLctUdDyEI6bER
         d5/+QVzMuzMVzlM0vemey8EHzlC0GeUCD9lTvk9pKqDX0MWkOfg0rM63coyzRRRkt6BL
         xuDdYy48+oy5ZPbe/eaVQuHdgoSPA83dlETnVz1zTQV0uJQ1xIa9TOgHJh48DK6b36iv
         ZFQn9JO/QaFq4BjjQI40yTvighVrSsg+x+HVYOIudIOZHdaJzEQS5lFx2XSzaGbfop0P
         3Sbws0tEZixigMIMtjJokRogT6YH/1aSsjytJxgvMrO1Amf2Ls4EFEIrdOcAP6iohKvM
         gCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162479; x=1766767279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
        b=iejQmr4x+B6u0atQrvdTaoow+IojrgTzOhXjxxi+U1osl1zBnLoSlr5Jz1rsBL607U
         CrAUNbmHCfV61RG2TdP10mQa8RvkETfEQCdTD2VzTt7v6V/61AU1csegvoFu4oALDXvl
         ZNaQrekXw54HjhOgMjBffWyf5a+p1TCsBlrbtQZylweKIcMG5PiogIs78ceHkXgux6Z/
         TbpUEY5vZSvlcB91hEu5bici28JEu2VNjBcXDTCuVw2CjG8x5ExZQei/DCrTFXrecPkT
         UiDuO4yy5spl6+Ap1qsDBm0bE+tF1zAyIG/J9l5e+pFsLs1Fm6sDIjV490gCpnXl2T6c
         NS5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/LJR3bZ5YEYmjylVqdD0IdQDcYNPXcqDMKs3nmrw/Gzvv/TZpCnEsT6K8hb45V5acKl7A/fAalYv50s+m@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0DvPQrZggHifqpDoHPh94DgKx/MKT3ngHFzpZwgIS3l3/23q
	0KlhWVtM73Ka6pFUTrYh8r35ZSMOp+9GwfVQ4z1/KG2hTalaTQisEt9ExNugidJRZ0WYRcQBRVM
	vCqEzIetakOIN
X-Gm-Gg: AY/fxX7bySb3lE+HvbXwMt10lx0RQJVcluEJTxEbEjkm5fDJJDsyU3MaXKTF3gpnPKP
	JwzCbywm1fNdqZhod23q9Ap1KC4dlduBj3PpPnupLFN+6SfGZLsZdD5e3Au4nj7lz3kvPat23Ze
	ArFmnGyiXaG+e2CFSNo1m9O6ZU+TU+DNyU7ht50etRra8+J6TSwKvY7nZMb1c90XeAkZ9qpXETW
	JljwwHCBs6lE3qxQdwk0K6+6Qef6F2ecP647pPDnApm0AWZFl/wb3Z0G0qc42d6UaQk/Ppyg96n
	xlvg+7qaN0MOAxmY5zqmealCs1cUSP4FSP62dl36iiLuXwvd7cFkSOZBrXbTZcejZk25qhz5iRW
	2FjYD+J2wf8wbL7GlQOfVs9k12SNAcAWLuajuWnxf31a24/o8iNZTNtnINZWDAOw9n02qxbbrL1
	YwRvDatvOwt/oMmvV8GKHgwolVFWZGKypBbJBZXErAw/78qvezvVEIcF4f0e+xJ8po8CZGaWpRt
	lCYULV5Cl1jqDMrs/gHu42FqsJcKX8UzmA=
X-Google-Smtp-Source: AGHT+IG5xQQDju37djeKp8Zgcj7rgGU7z6CWHlLL/w7AfRHVUi9V/ccXZ3Gb0icbkIvDeWOUnP8NhQ==
X-Received: by 2002:a17:907:1c1d:b0:b7c:f77c:42e7 with SMTP id a640c23a62f3a-b80371d37b9mr396657766b.43.1766162479431;
        Fri, 19 Dec 2025 08:41:19 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:07 +0100
Subject: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1527;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=t5HFnNXhnxSLu0HbcMB5zyaLqy0cPi/BThYL9zb/2sc=;
 b=EoGcG/sMLsZ+n/tQW2JV/CykTnYFk5wscZuExCSdKs6oC1UTb3wWbgCcx7IrWQcQSUcMonII5
 z2uIyuCf5hSD4AWSUC+TFtP5nwTgjA9IkL9CUto62zfEZhNtEBAZwyD
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231..790e67c7db3e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,17 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -223,6 +234,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.52.0


