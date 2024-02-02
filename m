Return-Path: <linux-arm-msm+bounces-9602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DCC84775F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 19:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564781F23748
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 18:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A4014D43E;
	Fri,  2 Feb 2024 18:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WXOAx2va"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A214A4E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706898426; cv=none; b=IBjjkWmSiQ6hbyTs6ghu0+hT5ksX4ULS/BQVcgUjYhIe/45QQ+uDCflGE/JQqi1PHwrZ74UcNmfwgh9gZIaWooUjuTQ9Tl52727pZlhFtp6bh0G1YDNEHlc5Tx/kZ4yMgVHymzvitfxmsZHC6HIWWnCindBsqzdCfso2qrET/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706898426; c=relaxed/simple;
	bh=jDeItHLswFfVYaTz4mPpmNIjXQHpjXOdBg+PanUZoVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WSO8opDfBrcp5hD1QkCJX7TqjkJ6i+4L82k9LA8fkJB1jT2qfDTvzxInO9PEqh4rWip+OPOSGyM/UUTLwLh/vijxSCFHzhL3lGae71YkMkjhO9VxA8XWIGadndc92VvvpVMrwCpiqgzpv6tSbpBw4XzHpifeVwRT7WoyBpSwUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WXOAx2va; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a359446b57dso308692466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706898423; x=1707503223; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDs+7UeVfLIgA+CvFSvddQ4bNiikPwF7cwN860qqazo=;
        b=WXOAx2vaMU0dUK4KFsjJflzCIvfCIA4oHWPM/nborZNxiIJmdFh/ophjcKuVYMtI10
         gm2jhuvSWdLKZT9H3dg3/qdGZi0rTQti06CLlJWXQCpLzbC5QS67+H87d0bHQ7rknvPB
         HKch5omxlAc4jCanAktVauSFrGaB3+l0nxvm3l0Jfhu9R2rqpd8DBDgaKGZ7N8v3GdLI
         7K2EPW74b9sV4wsXIBjweUQJNGhmsE/TgB5oTC3UIWoaX7m5lJ6FpLh71oHtlZrwwSlc
         ED5pK0hEEmT0TToYIVSoINHPrZwask3zSta3MoYcbbTZEI0F/7C4Ue4FwojRIpdPBXYH
         2IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706898423; x=1707503223;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDs+7UeVfLIgA+CvFSvddQ4bNiikPwF7cwN860qqazo=;
        b=b7wMF+EGcDuQ/R1pw3YgQ6CKcWDo6NVPM6/vQ/UVLR+H64cZhS+PkY7fGFHdt2klY9
         FvNons9AroRk5PQMEiHXlpCkNzS5j9ty5x4UUThsExuN3Yn0Lx7ar2b7ukXkueAat5zB
         lnmcY3UFnvt8HT/lvGDUJTPT24vynsNjyF2fd8EvGkriPNKVINX5nPNUwBRxCkF9ScVw
         Zdys4VdB4x6lbEarUStmxpp/wgAXmcFhXKZB3+PaB1MtoUqPs+ij0KiwcnyaFmwKWXkq
         0LtY0l4DR/PhhxcCs8plDlYIgETXPRnr2Q4S8HJQHxNQMUwcpqIUvF9/G5RSnn5dETal
         YQZg==
X-Gm-Message-State: AOJu0YxxKVUs8qIodWD1i9UVmO7MiwKQ2BJC9duxV5SA+ckoIOwE8RUO
	zBz1X7XzEPsn9yyH8dAWUi4EshyREVUYy/LIW3Knwzae6xkjzJB1vEZ4meZGAno=
X-Google-Smtp-Source: AGHT+IEBhxgMGr+BVlHUuPFNkF9V8gtrD4z54aPUbRG2f+25sAw90rPNGaKd0PtZ8F6ptbdDaHD75g==
X-Received: by 2002:a17:906:7fd7:b0:a35:668a:e9eb with SMTP id r23-20020a1709067fd700b00a35668ae9ebmr4677877ejs.31.1706898423388;
        Fri, 02 Feb 2024 10:27:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVfwjxjTeJHlNpNNFNxRBxGiN3AdwO540kDwYquiL/5j9YOJiSy00hxn5PmCpOu/zUO6dgeObSykKAxPKloVbdkvPbp3zx5HGQHI103VxGsL51D+Vcmv9x6CvJK9+N7WxhmbgCiKa5NZXjR+6sR25qfx5p/a9s5FNiN1CGGTDyeGWlV3UOvwuItxt9U8Q/vnqJ9H3DpiXarhfeWXKy9i7Dcw+GET8TvrQlTWLmxJV4M82Qa05LcU2jE6nNnERJ1+38AvRRSFurwKLP6HyawnOFlqb/ZkqMRGXetEtMzsbZoMoK78PdbbVYX0d2bXgAE95TKwj6HxLoAqeLuPN8Ih4ZlCE1OyOb7EXDjOwm+BX7re0lddLVRs2BK5yjFLKVXNQOELO38imAyr+BHn/NMgPuiC12jUL2C5wW5SA31uOYtlnnUT+1EbbOIpo+awD2vO7GB2PfqanaT+nzuTNAmXctd/9Gl5z++h7xM+MmPEoyDscbpFHwJicIMa3Ip+g==
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a370e130fc0sm791796ejc.59.2024.02.02.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:27:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/2] PCI: qcom: Add PCIe support for X1E80100
Date: Fri, 02 Feb 2024 20:26:52 +0200
Message-Id: <20240202-x1e80100-pci-v3-0-78258e9451e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwzvWUC/32NQQ6CMBBFr0K6dsxMoaW48h7GRQuDNCHFtEo0h
 LtbWOnG5fvJe38RiaPnJE7FIiLPPvkpZCgPhWgHG24MvsssJMqSJBK8iA0SItxbD1zariFlnJO
 VyIqzicFFG9ohS+E5jnm8R+79a/+4XDMPPj2m+N4vZ9rWrV4hyea3PhMQcN/1tTJNrRnPow82T
 scp3sRWmuU/WwKCrbTuCLVRTn/bh+KfpWpF1hlUlSl/Ptd1/QBDxkhSMgEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=jDeItHLswFfVYaTz4mPpmNIjXQHpjXOdBg+PanUZoVU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlvTPupO23nWjsVHH8gKWx4MdHpLFowk/stouF6
 irrQIIoqfiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZb0z7gAKCRAbX0TJAJUV
 VrbjEACq/KQv6KS4Lh76FFKI3IHa+j3nqShUsGB9tEacdwyFoAW57DD+bUmy6qM1LigAiXvU26y
 F7abU4etNBE6nxOD6kTUrNrd0OSP/zVmVdQ98yaljpbryXSjr+6VOg8XA1l64Og/G0BptnDbRqF
 iI6KUWqDWh03Tr86ARMJHfccLlKqK53tZh8n7x0qWE/L9j5BC/YirLM0NDuuoIvtGQE5XauG87O
 FSAxbDWsHpPe2GEIuvqd2Vc+DamnjLaEAFGPCruK43ENRyzzA5BpXlpaztiGAEFJTvwpapxR7D2
 XisxRkWndVZCb490vvZxki3nVw5fyDEIjBhvoli3jZ3m+Qeay+daKBEB1Z2ffpTvgH8Pdlug2GE
 M3Jslafxaw4cmsb+YQhbSqj9bwYpR1Nw/JAiTEewQkGV9uE4edvmkhRYPS1VheYpUuGwPugigpR
 /SXY5mVPUAEpPOztFVzURXtQbX2MAtUboxSr7RU7cRsGRVFh6LV/ZTovLkH5HEhpkLkI4uGeUFZ
 cYiaTOpapGArnHuStqwULXGycLJOcwDHlAJGi84JDAAzJ7RcshxhDLszQfpSvNPJBg9lYtu3zq0
 Q+0NwbbL3My1i/WFzTnHnnV5rC6LjL5hd90YiIyazOg5WIEaSoM7TOTIHDVOZGSrT1cQWR4G2ci
 esbZQRd78jtcwmg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add support for PCIe controllers found on X1E80100 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Added Krzysztof's Reviewed-by tag to the bindings patch
- Added Mani's Acked-by tag to the bindings patch
- Added Mani's Reviewed-by tag to the driver patch
- Re-worded the commit message of the driver patch to include
  things like the core version, the max link width and speeds.
- Link to v2: https://lore.kernel.org/r/20240129-x1e80100-pci-v2-0-5751ab805483@linaro.org

Changes in v2:
- Documented the compatible
- Link to v1: https://lore.kernel.org/r/20240129-x1e80100-pci-v1-1-efdf758976e0@linaro.org

---
Abel Vesa (2):
      dt-bindings: PCI: qcom: Document the X1E80100 PCIe Controller
      PCI: qcom: Add X1E80100 PCIe support

 .../devicetree/bindings/pci/qcom,pcie.yaml         | 29 ++++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  1 +
 2 files changed, 30 insertions(+)
---
base-commit: 076d56d74f17e625b3d63cf4743b3d7d02180379
change-id: 20231201-x1e80100-pci-e3ad9158bb24

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


