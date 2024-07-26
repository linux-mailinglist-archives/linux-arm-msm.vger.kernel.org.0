Return-Path: <linux-arm-msm+bounces-27066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E881F93CE57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 08:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0517280D3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 06:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834CB176226;
	Fri, 26 Jul 2024 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygbbBDYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1918173355
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721976876; cv=none; b=KXyS19L7H8NtbIfp4YYDDYPn1arKn4+5+goVHZ5THBmtnssEkWneMIzu2O3ouoI57/3yI4Za9naDNu8Go8MyEHAUN4z0kBQbHWz4TuYBn5Kda1zBQkI2l4vhwAk4PEZPAbsM8Y7wPtkirci/B86QvIFeYt35/B0q1fZ/9nvFnjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721976876; c=relaxed/simple;
	bh=Qq4H0mLVvHzKi1FF3BapGpXq5XOG03c+lzd/i/KWfQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i1OnRCGz4XE69/VhOLDu4Ym9Y8JAAgQhcFB/R3m1pNYRbYGzXj0pukBX9jtXKHJa3/j+PH1KGhRlOTLkKo9/Isyco2/kjvtXGq3IrbbkCQ/UOEQLrRWAHYqGRAbeTXsc9FIB3CBm6Vg79+GU4dSvIikdilnsHTZI8PNtF9ZnfV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygbbBDYe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3684e8220f9so824338f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721976873; x=1722581673; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vosmNuXwDGa5uER4StfNppOhy6Nfa++wczEcYPAA5JM=;
        b=ygbbBDYe6kS3ljaXv78V4V4XnM+fbuWxVEXDDQtrrZ+sPkrKkQ7i+eKYcZNYFEbb/q
         ytnX+f2qFRkpOsaQb8R2sCuMbT4HatOR+h3nzMtBPblZ7sj4IjSse9PBfp3hz0BNJZGm
         7PR5PmQj/UZeN/2Idm8fr7eIotH4ADfGpimyBbBo39BElcDhZBJ+4A76anEwd0Hbfz8G
         189f/nj1fNrpL+oe1y5K28aZR+JlAsvz7ODBIdfc9MSwufhljBbN3mjZkLXFY1lh1+Bi
         CYUJc1JlUK6rB23/TVfE0TqZa2Qbjx0w1HkjVYTpBnj/gP/k2dhxnJjS1GeMeamB3PUR
         vsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721976873; x=1722581673;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vosmNuXwDGa5uER4StfNppOhy6Nfa++wczEcYPAA5JM=;
        b=cZq+tDJS+aqE9lqu9rWXCnKw6XbrHj/VXLg8QnLI6hmuKFyC1Avlc3CuZpDLrwYjXy
         wYruSOiy8yQUKgvVF5YIybszVVbS2A9VniPKOhle+hRQ+8qTcSL4+ZnTTeAuNvEz0bDd
         GtDDEkRa+6ZMSu+kjn0ZN3bkjiBpdgn0DZkMcp0tCrNc5XEQH/wyMEDOgVvSpYFaN9ew
         iQwypymLGElN/LNdyf+0eR0FiAkuKds/zUKslC7mfvNPUI48D1CnnVpiJGp/4WForCl9
         6+1nLcAuwx1JINkS9b+ePr0rIcjGCYQOSCpoJLMOSxAn1t1cWym4tMSrpgAq2fpr4BlB
         NoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxxDlibvbTKiSIIp4pRXi3mhihKmDt5/IFf/X2FpXY9XRJYL67KTS9b1ymGiaXJrYl7RMgDO6DKhFtKGG8TyKd7G87E01b1kYlO5hK2A==
X-Gm-Message-State: AOJu0YwObmjUcC/rQKzpCWKlMVad6qT3nDhGwKE+qLOq54ALHohbJTVV
	0pZE/I/AKHTjxs3uuLIRSpiJlSDFkv+/y7xJZ6D0pWtplyVqsIquasqUSfz3Uyg=
X-Google-Smtp-Source: AGHT+IFvqEGR3ueBBVAdfzzkJU7zbNLpl8jB61m6dIoGAuArudrlpfJeL8+53GdYQOV+g87EkJTQOg==
X-Received: by 2002:adf:fc02:0:b0:366:dee6:a9ea with SMTP id ffacd0b85a97d-369f6706b4fmr5308654f8f.26.1721976873080;
        Thu, 25 Jul 2024 23:54:33 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428054b9196sm63610475e9.0.2024.07.25.23.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 23:54:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 26 Jul 2024 09:54:13 +0300
Subject: [PATCH] PCI: qcom: Disable ASPM L0s on x1e801800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-x1e80100-pcie-disable-l0s-v1-1-8291e133a534@linaro.org>
X-B4-Tracking: v=1; b=H4sIABVIo2YC/x3MQQqDMBBG4avIrB2YpKaVXkVcxPinHRArGRBBv
 HuDy2/x3kmGojB6NycV7Gr6Wytc21D6xvUD1rmavPhOXj7w4dCLE+EtKXhWi9MCXsQ4dH30+eG
 eQKLabwVZj/s9jNf1B/gm59ZrAAAA
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Qq4H0mLVvHzKi1FF3BapGpXq5XOG03c+lzd/i/KWfQc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmo0gjBgI84I/NAlqP0KTWfjk+wlTkHrw4s5KRr
 81/OaSgx/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZqNIIwAKCRAbX0TJAJUV
 VgK5D/sEZkl/obkFuoacPvy4n/0gPEU1TQMaQAPh3wiuTZNcJmPfbNFXxLp1i3nS+Jx0qGkSdKQ
 cmIto2wHrgGLgvdCC96RWxD0k8sH2uyFwMOMOX73bEMlFCu4tj6fChPzEhrY8Pyh4ERv4hh70Oz
 7hACPde4bDhc2aPMnW4q52oub6Vq2d+pEvED+8FsCPS2wNN+fYzo0V4T+r/HeiYk7s30+Ik3KDA
 5bTC9lqka8cgNc1pFsMKZoRb248le3OL9xTUvUkUmLsVFnqm4IaBHWQ9TTi5b5sFXfjZPs9w5Tw
 /KwSf1uo+7ztTQJQWjS/sWP6LHZjfkXEp26PprRukg4dFwl/ofu3jT6FNyYmEnTQQdMgKWYJgWi
 LmPpQb/qLMtDEQaezVCAaL9uy/Mm3QRFFN0gmStBvrIeNqo3Iv/mGd0Ie0OkTYa8aYdbzAasK30
 EjFC14CBg7541ubZFEEWkdkcenHd+DfURpOMIFLE1VfP6C4/zJuTO1SgPELPCLIS8BGvMVm30kv
 uRjjdyM4bSfuFxxaM9+RC2yxWomxOZ9Am7A+xbxWciaXAPGtYVZRaHBVmhIP9c7Xx0m/72m0SLQ
 75GkNsLcfB6OH0j/lCwUpm1qqwp2QUwZ2MEKaSEK/fdo26HBdhp3F79WNWGG3Om75Vvcr5uaXTr
 aV8ZZ1eg7oiACrA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Confirmed by Qualcomm that the L0s should be disabled on this platform
as well. So use the sc8280xp config instead.

Fixes: 6d0c39324c5f ("PCI: qcom: Add X1E80100 PCIe support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 0180edf3310e..04fe624b49c1 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1739,7 +1739,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
-	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
 	{ }
 };
 

---
base-commit: 864b1099d16fc7e332c3ad7823058c65f890486c
change-id: 20240725-x1e80100-pcie-disable-l0s-548a2f316eec

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


