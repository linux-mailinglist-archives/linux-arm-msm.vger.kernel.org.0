Return-Path: <linux-arm-msm+bounces-25512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6D392A8A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE0981C20FE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752A7149C79;
	Mon,  8 Jul 2024 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jVHsQXU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B431859
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 18:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720461949; cv=none; b=c6hMAB3an8HgtvdDtnGeLIG3xH+Rr0PNCzWXfnSYVax6OBvXODIB4hJ9vjcmEBLl9WF3X77vhKyiVXGIWhU2V1XBGtoCNJyFt83PmWLqU0cfL894tX1rdeLXcef4srB1D76WyU59On/5LxVld3D1LaJQ3mGfznnnx2cXBaXYBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720461949; c=relaxed/simple;
	bh=yLqftm4eDdgCnmitUT4t5kah4QCFH64IK/TUdDeuyNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVnzSMoED7phkadf5QOJeHC4OuBQ+Bi0zSaBB4WYfVm+yNeU67iMvQtSZfRe4G+3+9zxQdOMzFzmDiJxFhzFuWBux9JzjAYTIzwqIvJ6kuKVaTbqFFR6/5swWgGsyddEEJUDAloqSxgOYJEQEba9aJV6B3OXp4rXXwh6r2lQNyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jVHsQXU9; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7036b87752dso738241a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720461946; x=1721066746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8GBy9t4kA52JVUKSemxpegpyHotiScJSh7xoSVGv88=;
        b=jVHsQXU9Mug/h9c0O0FY32G4mTl8z/1Lyf7xfobYxKOcO2gFZtRsQ+/H1iiKyohsMG
         kSr2G2UwiwKsZ/y6vVUOoHdyqAI/3PCP9ZcH7RUDOt8WwujRgSfku9G05mCy6+hfemL7
         Ffb34QhSBDoviYbnj4mOpR1Y65JUmlXAGYj/oYaMaqYBq/zLpuT5AyzW4t/Mnms07+2O
         non1GCRMBxCUkN/jclGz1UVu9w4pG/mJYkjT4mvXrtqECJcGq4yuJnE6GmxGyDgUfOXJ
         Sq3fKMObJDu6DZaAu45T6P7dtziV0dZ3XKSFjNqhyxBauS9ul7Y7OqmexJXSP7YOeBjT
         KCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720461946; x=1721066746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8GBy9t4kA52JVUKSemxpegpyHotiScJSh7xoSVGv88=;
        b=r2XTzZW3HLkiar4cL0Po7kerDB6f5FvY+pQZD7o6wHxUDwG6qBtKAjyxoGeoVFBxjM
         YtzMnwIJdBPAQ9oE1eDJ7Zp6CYyjmOodcbF1HoIbGfRe0Xxk2Pl03Vdi+sffrd2WxYCK
         7+3yuLlAFczrJzNx0Othm7ye4I97ve/OTD1hOsBSQ0HrN9oh8V56VUJpB6YnrJD1cjDw
         fNaFoR/A2b0gDY9KGQ7/f0xrvmF9TGoAVfCe9YrDXWvbyYTqyYtgN2xZ45AMlu2nSsFh
         Fl7Ko6T+jRyxmKeXu+Tni4zfE3A2sIYZRYplZ8/oMqemfeR3GUtUwDxbP30fQvMGKZKu
         anqg==
X-Forwarded-Encrypted: i=1; AJvYcCWwa7ymQ7lKmA1/VcYXz47sIgPFa+1gD5RBkbb1UaH/UYcI/skGVp1/WWHt/+JqATJr2VNEUD2N/YA6nDNX/YE6FyiZGJdsRo5nQCXxpg==
X-Gm-Message-State: AOJu0YxBI+YNlYypuuDWF/9kKJLlhYOFjEpZ2yEQSGQwjK2qBdiYY3RF
	5gn026VBlyliddnN9a48UHaY+4JE+hFnlSusuxvHnFrWZ+PEKKdh3AAanL/WVLE=
X-Google-Smtp-Source: AGHT+IEu8XliCo52vyhpWrUqRkTeJslYmHDaL2dF8EVixnxKwbUnuulSL3pyI37N0oH7c5c426yr6g==
X-Received: by 2002:a05:6808:179e:b0:3d9:2986:5a3b with SMTP id 5614622812f47-3d93c085bb7mr114237b6e.37.1720461946251;
        Mon, 08 Jul 2024 11:05:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:cdd0:d497:b7b2:fe])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d93ada73fcsm73010b6e.52.2024.07.08.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:05:45 -0700 (PDT)
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] PCI: qcom: Fix missing error code in qcom_pcie_probe()
Date: Mon,  8 Jul 2024 13:05:36 -0500
Message-ID: <20240708180539.1447307-2-dan.carpenter@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708180539.1447307-1-dan.carpenter@linaro.org>
References: <20240708180539.1447307-1-dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return a negative error code if dev_pm_opp_find_freq_floor() fails.
Don't return success.

Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 26405fcfa499..1d36311f9adb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1574,7 +1574,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	if (!ret) {
 		opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 		if (IS_ERR(opp)) {
-			dev_err_probe(pci->dev, PTR_ERR(opp),
+			ret = PTR_ERR(opp);
+			dev_err_probe(pci->dev, ret,
 				      "Unable to find max freq OPP\n");
 			goto err_pm_runtime_put;
 		} else {
-- 
2.43.0


