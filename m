Return-Path: <linux-arm-msm+bounces-9478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE584688C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 07:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CD6E1F26075
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 06:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7B18839;
	Fri,  2 Feb 2024 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgsfUMmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879A1774C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706856867; cv=none; b=qk4EAP5F7kpZ6eKoBZc9yNuJwruyXzR6PsgUjZvSQHPm53ZcEKAuwGCT2Z1RsKBLalPr6GR6B4wX8iWAiJDDfa4mp6C78Jw6qHfrI1/Mml6hCBJAq6ZO8b8aI5vEEGd8i0u0VKgpf3MVf02lK+fP/YvkPkviHPTJypEmvMHgUjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706856867; c=relaxed/simple;
	bh=/Z6Gfxk6zv/UTEFpsRc8yXJK7I0IYouR/YQWcbNG2D8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c1eRbahD1bE4w7JEOEuLHoc9qfHQzIvqcmKeXVQnK9HjVDCCdRGKa8yNWe7oSeOFWzbxGnxj0ntnaZJ9e8rtgB1+HuSZkIJU8guq0bnNIdSzNM34TX6Glcn/4zwcG2WiannoNxDNkN/XpbVV/mbsSFwoNzgNshig/WwbU8IDwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgsfUMmw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-295bbf1a691so1437582a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 22:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706856865; x=1707461665; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXc5N7jLjVVYRrxW0fl54GMYDq7C5q264hyj4PfnayY=;
        b=rgsfUMmwYZVicPNPswp6oU5K8lfpxSFasUDIHkTMzNo2Bzmf8XmnclQdRgL5XN28dX
         QkGXmnNOmTRgn9EZiyasex1YnR3ZrwRqPOPq29VwEQ7c1iQGtKXfthraI3w0sQaZxxRg
         tA8S6a4UzAeqqkTUoS45A41z7lulQtI1t9olXe4j37eveaO93RL9geObS6OPphpsp5br
         gFMkudvxy3Kh0ppL/MitgYdG1KwQ3OzbcA3HR3ZumrIxc5lTr8qqXGeU+OQdy7fGpO8m
         WUV1lLsFIayjbCu7W39YwzmVDpQOyYkcyxUfsQQPI5aLnDpBznttQtH9qGnJBXuVEWQr
         ggmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706856865; x=1707461665;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXc5N7jLjVVYRrxW0fl54GMYDq7C5q264hyj4PfnayY=;
        b=Syzr+hh2+h959MO70y+CJt39gX+xCYAYGrvTSbBGSCDvtWTUTLHCxwpe9p11wQrldY
         tCipY4b3C51VjOx04WmKVRrkJAc4dss1j/jLk21+2T2RE/HLxPvYnIvPIJN5JC2g8G84
         VT6CREoEoKd9eFr+BdMFY+62huSuGaJU0XohXHbvA0xmFub9NE2MjIAZlnUrV7cME9jx
         3/sPviHjAIHips8U3y8DBbngOSPmRtUyt2KH1CPrbzefSdRnxM1VP/Xi4PROgKxWc/YO
         Q56S2n//w9yyoJcLhQ3yI+n45HoWTqIV/8U5mg9YChjZIJB2K+JEcbwU7NzHlccCSIJp
         4cnw==
X-Gm-Message-State: AOJu0YwRgk5P/QDwx5YOBgugLYsuJTHSHHoXjyFdLge7J8r9Ie1v2r/j
	4N84jnFGqdtKco6Hvx9zC76lcvMqSdyR4+f9PLswml/9ai4+5swaq+Dn0h0opg==
X-Google-Smtp-Source: AGHT+IGJktvTyc45ZlwjQWsv2W7NeP0PXBRa5IyqGb+84B0iVw3F6Sq+NfyvbRv8TPuwoDLtx+M8EQ==
X-Received: by 2002:a17:90a:db02:b0:296:3edf:d48a with SMTP id g2-20020a17090adb0200b002963edfd48amr852874pjv.3.1706856865524;
        Thu, 01 Feb 2024 22:54:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWQFGzgZGcTnk1Hu0xZ9QsoxFHwRKZbfQovetoT/jCtHCn0v8630g8MlZTKoi3Lrmeg9vL1owgtc7ygpWvhGao6TNdIgrqYBdEqTPf4sCWWgMdihtiZawlfOutVliShLICbA5bvgBzZpU+btHmC/DujBKYUKWa9/e6fQvcWmdH1OziIDxTXBuViGa91yPOrgpuaoOXFht57Hbs+Qdi1frf2M5fFRO34pnIhQTOhhp6yrXhG6hFayDStZMjlw1O5m1+Zj7aoo5+jJfyp7+TKdMhetXrSN/ADmr/OSfENnSLnM2qL9XliCkdkhVw7fBwmQAuEM2PiJyEQwmfiCvrT+GPszKH6B1YsGF/RV9cZ1MLRY9kCMHoxFO6GcV2FINuPdbW2IH5RUUq9g7Zq4YQ9dddnbHCDzO+iRlqgdPJ/JEiQEvBF4F68jMLY7w==
Received: from [127.0.1.1] ([120.56.198.122])
        by smtp.gmail.com with ESMTPSA id r16-20020a17090ad41000b00295f900f38fsm984763pju.11.2024.02.01.22.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:54:25 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Enable D3 support for Qualcomm bridges
Date: Fri, 02 Feb 2024 12:24:16 +0530
Message-Id: <20240202-pcie-qcom-bridge-v1-0-46d7789836c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJiRvGUC/22NwQ6CMBBEf4Xs2ZptUSuc/A/DoYUFNlGKW0M0p
 P9uxavHN5N5s0IkYYpQFysILRw5TBn0roB2dNNAirvMYNAcUJdazS2TerThrrxwl3t/OqNxlbX
 oSsizWajn16a8NplHjs8g7+1h0d/0JzP4R7ZohaonspX1vT+ivdx4chL2QQZoUkofsq8LgrEAA
 AA=
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, quic_krichai@quicinc.com, 
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=/Z6Gfxk6zv/UTEFpsRc8yXJK7I0IYouR/YQWcbNG2D8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlvJGb0tBz1I/mHFmY8tdYtl2wYfhikEj3G+83z
 07lIROBk7SJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbyRmwAKCRBVnxHm/pHO
 9X4lCACBuF53Tik6iD9RvygIXPGClNBC7CQbSrc3HtQ5YHe7wnGGJGOaRV154AiytpamAKuL4Sc
 wstH1Q0mHhaZE96CrvOT9Dhw6W/D1lZCg5B4KknxhHpzP8kolOw6FMatzzY4QFxBnLEWYlaNdXr
 Qqyl5S0d06pfAvVNtnrB6WQjEtGD7dnLltdBoVah2fcVdlkfXgMsbm1khVNzPGlS7fBxRcupc6F
 mbqVkLsqSjU//Y/KCfsfu24NLm2Xd2Gzuo/TRdlc+by8vjht32nQ0IlED+4YxzkdDKsqESmWoWl
 akVYfcvS6y4e5l/8YyRyjZW7QpH12SskBbcsBndK8uJV4d5e
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hello,

This series enables D3 support for PCI bridges found in Qcom SoCs. Currently,
PCI core will enable D3 support for PCI bridges only when the following
conditions are met:

1. Platform is ACPI based
2. Thunderbolt controller is used
3. pcie_port_pm=force passed in cmdline

While options 1 and 2 do not apply to Qcom SoCs, option 3 will make the life
harder for distro maintainers. Due to this, runtime PM is also not getting
enabled for the bridges.

Ideally, D3 support should be enabled by default for the recent PCI bridges,
but we do not have a sane way to detect them. So this series adds a new flag
"bridge_d3_capable" to "struct pci_dev" which could be set by the bridge drivers
for capable devices. This will allow the PCI core to enable D3 support for the
bridges during enumeration.

In the Qcom controller driver, this flag is only set for recent bridges with PID
(0x0110).

Testing
=======

This series is tested on SM8450 based development board.

- Mani

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

---
Manivannan Sadhasivam (2):
      PCI: Add a flag to enable D3 support for PCI bridges
      PCI: qcom: Enable D3 support for the recent PCI bridges

 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
 drivers/pci/pci.c                      | 3 +++
 include/linux/pci.h                    | 1 +
 3 files changed, 10 insertions(+)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240131-pcie-qcom-bridge-b6802a9770a3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


