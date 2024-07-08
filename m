Return-Path: <linux-arm-msm+bounces-25513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCF92A8A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A3A1C211EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A9514B083;
	Mon,  8 Jul 2024 18:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HimCvSTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5655148FFC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720461951; cv=none; b=nJRa4uMuQluJyEKs4xoES9xm/9jYiNPofMDiKXJeFhuxTndGKGu+Fxpwo5XdUQD6t3PBHOtOUBSwSleFHkoyReKdNaQNRpCmOcJUVQxzAuZAEAFdsU3Xab0YJsA9LuwXfk1kekFqByEM6zTtLS7Rs2R7MjzPhuSzXWvP19RgCAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720461951; c=relaxed/simple;
	bh=8RLjAkvbd9deEwBz/GOWHSJSSqFw/q5XUI9esz1VxSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDTmt4AyKskJVZls7Vj/MO5Gz5ptPZuVxxzPXRx5+FfrZw8sdocSDNkLTOEdH+bq4CyUQnu/oj1yGT5kbJYj1/fZ+/i7oThs+ZUSg7gXVYlig2PkPsyLTrPtlM0ftSxERicd7a7LysOZat9SWQ4qShn7YacVxs2pWfMIkdZDef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HimCvSTo; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c9cc681ee4so2388128b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720461948; x=1721066748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxcirFeeuu0bt0rjz0tmui1G8RYDC+/JunVt8zPPRlg=;
        b=HimCvSToBRd0wyTWybX3iK/ljx9N7x5Kf6z/EztaEn00F9+Rc/ww6NWSERNxX9I4Dq
         u+UtQxi3iXxQNkDgvdHx1UcsqntPliN62vvsQ/GpcQJ4E0ypmkDJXAOVxHxd6mlNy6dc
         MOICnrtX6KhNXfaca8UTv6HI554B4n+jJx1IDSv4xX9gJeaJZsWWfunwwb1hcmouE2YD
         iqs1oXW97dkfpIPtsOx6NQSWjGMcvUbOxSUqfi+dLduw0+Nc6ghLHJvkcSnMMnX55gsI
         aQsIJitQOMgWfJpL9DFN3ZhRmfzZGNEIPU3akNE9B06+1casa95QtMuz3eJfAtGvIH6X
         Y7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720461948; x=1721066748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxcirFeeuu0bt0rjz0tmui1G8RYDC+/JunVt8zPPRlg=;
        b=wWSv2JQApLlPp7JYfzjSzHxtgEKc+vR56BHUO/81yr2ftRMEj39X0RFaIlKE83EFlS
         +ZIPyyv9pshRCwme2rjoMUG5NtgwfGD9GGVGL6QOPXaRLN7kNlpcB0UruczRYzMw389T
         Ry2LQxSxiOiNkNIKEApkENQrffckQr6Hp/yESf1qqfLSW5bXxphwIiDvN17v047uoYaY
         UE/AEsUcE7f1phqiGS3RHCbs6PNklShOHOBLIY3n0eoNXIwtnQdXABeFhWOLpii4+GJr
         E4/3m2SiSkXvFF8oGabsjXeL7J+y0igmkda0RCJ7yFUUpGIYm0QLbmfIJ5LQhW6fUBBN
         RGig==
X-Forwarded-Encrypted: i=1; AJvYcCUMW6z2GyLjzaxBKs02BWZD2FpBC909T4gM0juNvBvFnSfGZHRx0OiDAr+HgGzDYld1Dh6cAAU17OxsJRKR3s0mNsIkCLDRg+4hUO/ZYQ==
X-Gm-Message-State: AOJu0Yxn8WrYgJ+ZGVOtJ5LfHq7zCa/5yxPWxhwE6VGRLMkcxzp059DN
	pQo7sKLZQqNPnU2/sy3GtNnkW1EjF0dlsbKhWiFwfXs1YR2RZxokD0kQ4kt/jZA=
X-Google-Smtp-Source: AGHT+IG8otGIAka26ozpbixMx1Ghd9XSCzhxkO203rOwzFDNLcLqz5bFlnD1pgUMtGdNE1fgcqq6yA==
X-Received: by 2002:a05:6808:10d5:b0:3d9:3802:3855 with SMTP id 5614622812f47-3d93c02038bmr176901b6e.23.1720461947976;
        Mon, 08 Jul 2024 11:05:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:cdd0:d497:b7b2:fe])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d93acff184sm76287b6e.10.2024.07.08.11.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:05:47 -0700 (PDT)
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
Subject: [PATCH 2/3] PCI: qcom: Prevent potential error pointer dereference
Date: Mon,  8 Jul 2024 13:05:37 -0500
Message-ID: <20240708180539.1447307-3-dan.carpenter@linaro.org>
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

Only call dev_pm_opp_put() if dev_pm_opp_find_freq_exact() succeeds.
Otherwise it leads to an error pointer dereference.

Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 1d36311f9adb..e06c4ad3a72a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1443,8 +1443,8 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 			if (ret)
 				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
 					freq_kbps * width, ret);
+			dev_pm_opp_put(opp);
 		}
-		dev_pm_opp_put(opp);
 	}
 }
 
-- 
2.43.0


