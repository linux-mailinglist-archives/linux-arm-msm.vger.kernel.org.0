Return-Path: <linux-arm-msm+bounces-41110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4929E98D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF26C1882520
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7291BEF9F;
	Mon,  9 Dec 2024 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUiVqrU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BE1BEF85
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754494; cv=none; b=mD8CNnOBMNb/mwFy5yE1GxYA8tFScFOVtXC5rLLDlDx8Wo01Sx/O4VtN2VssGanWVikioRR2K8nl7pcrUD/yaqfmHK10WFj3GjIy0aVTILKPmFfQfFFRBgHAtZcZNoW9PLuhJMl94p24yQF5eRV5s+Gc4sWas0hepHeXcf4Zubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754494; c=relaxed/simple;
	bh=+bL1C3+EqmoCZ+3NSkbD7ohn35NupzZbKWkMvdBYXvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R08NCPLlvP1RY+tdIFzErHbGFYVL7HDZ5/oMIyrG4IqRSUor+mepiRdn4Ie39XK8skn96Wkke7X0IbDP8l3YJdkZ8psL1vKufnuUHI8HaiiuQsZALin7RhzRLnzY0teMjNWSe6Q7MhXZnX3JyDWe8R3IjjhPcIa0myfZ/C5Avc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUiVqrU5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68f1bso308158a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733754490; x=1734359290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGnb+IQjlD24kYzbmGgtXKwZCCe15sEsS5u15TpXOMs=;
        b=bUiVqrU5gcg/8WCYYP0oNHDZU/5gu71ixXr6JNkvi+p4fhIIzNl9Mr0u+utsvGw6DA
         EqR/KoP4kSe1h5alEBPbKoF6p6DxfVj0ChsAErMWH6nCj85k4Ozu3nYHYT8lNsXfxLlO
         Ja+lu7xKkWTY0rdxJPaaqxGyVZJlNX6WoAltjrME8+btX72qcC1D2g2BnXCIWihfZHc0
         lvhxorLnMi1GqDkzqiYcPCtgJV7MDDQ2AcZnlC81ii+zVPjtnW1PXT7rYLzZ/YX6RtS1
         banTNtauRWNYirQBAGtWgLwTmDKPjgepxx5hQ02NdH1qmRGXONuc+CMzHiCa2gjFb2Ww
         mp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754490; x=1734359290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGnb+IQjlD24kYzbmGgtXKwZCCe15sEsS5u15TpXOMs=;
        b=uLynbiJO5WL8ZNa3qaRf/GVMTHNFdNQiCdRvrG+7HIVBtGc8McfYbmJJsHcQAEby4b
         4jbgvPEXNHXuxH9J4d1QJZc+gxo9oIRr7cdem9K7n/Y7s0h42bkeiSAqiJ1nuScRuofz
         InGQoJ67BF7DfAJxCx2E8CBaxUOFQoW7WAJolds8BZ9HTpfMC758gCi5rYwcNWNs1TvN
         O+Wf1cPDM4c8lkZm9cKnZlgzTweT3r1Cx0k/RYPxiMVO6uk4O4pWgSjKTkoUyWQbaM06
         QljIZ2lIkD4K8YB7kdpGjgE8I7PiIeMu+lV/P1OGGBjBq416EIS38WHu9VZlptATDIAb
         8Z2A==
X-Gm-Message-State: AOJu0YxLH5CBcp+yhwQwyvF2EDWuo7FG9RdjbE5hx2xBYgKbtFLQ/5Cb
	FUB5g0JgWvq4c9Mak5mUHJQ5IM98mTJLSaQqy+GaqxReY/HaSKbYpfuiXYkbiOKZk0Js6eZGX4s
	X
X-Gm-Gg: ASbGncvwO4NQmXbwXOmPn1w2aGtz3X7jnkJ0D3sG67XRZ8EV9bKLWTMAaRxYH6hdBHM
	B+oPeAxAmooTJVzsyBHKSbMzNtMiDwBziDdAYTPz0N6qbgG7HeS97YaNzjZU9vglgZ4Ke0XSAuJ
	GcaC5J6IZF7hfV1Z+P4hS6TPKwT4ic40YyCkJnHcGKlqdTDzGC089A1T7yn1RM6URLWzaZsEcLa
	tLmlNP+g6/GSAhRB4gykHWj8UUJlDNR9lxXDoqP8tmFBZG6UEfzgWu/q8DsWAepjA==
X-Google-Smtp-Source: AGHT+IHgFy5jwj3ZZsfJHP5oyOrDc5Q3gesJdagWrryrrmWchcTc/iUsAE5cQ2IUAPj3AnV8JRqIyg==
X-Received: by 2002:a05:6402:5106:b0:5cf:6635:858f with SMTP id 4fb4d7f45d1cf-5d3be6d6a3dmr4807719a12.3.1733754490094;
        Mon, 09 Dec 2024 06:28:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm2887141a12.42.2024.12.09.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:28:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 15:27:56 +0100
Subject: [PATCH v2 3/6] firmware: qcom: scm: Handle various probe ordering
 for qcom_scm_assign_mem()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-3-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+bL1C3+EqmoCZ+3NSkbD7ohn35NupzZbKWkMvdBYXvo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVv5vnIllq8kxBhdiVODsdx6QNBhfih1LR0aj8
 VDXAx3dVzKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1b+bwAKCRDBN2bmhouD
 1znTD/0TcLa8dg9E1O5wu1+l5cUms9pve6al9nhGVpkYOhyLhPq9JcQWfzIpgXuz/Lo62Objr/r
 o1MygFPFO9/rb2mRDJL+TGbgbVwj9rGCsAayUHwZ42hScMdmCJ3POaoImDTZujfMJ/Ltddmka9I
 w7/79sQfl2GR2WKrHrg2iEL6sLS2P682FaQBQGYfftUwT+N+3IHaUoCJ7a1iR3L59gI5FsII7j4
 8qJC0BJB/RvHTTd9Dp+kpqya71zI1s2f/d5/NFgANUFclRgjJ0CEfPy7hZqOx//5X9AiD0b8zLn
 QElijFsE5TKRmGT/b7MRaU32VMgdE9T8ET4xk3KgieELnmN8L3ij4ZaqMX2vCAt/Awv+Gdh0sNT
 Pch1/EOIIP9ZT86pFeETnskutIFCdqLGgZ57dcX1CynZJdAi0YqrpQ70tQp2WNF10CQryvCynZp
 ifldt7g+9zTNY6rwkdl9yUXw7lUhQ7E2e4z5X7nYxE+zTVmBZdO7W2fsw6WWTnWNzAogZKlzwWx
 YoMG+RBvvtc+f/UulqSNpD0sGUajEUf6nvi/l99CTBEdXBCNBGnp6Klg3xGpysy5ehIEQ4Po13k
 mypwIBSLQAuVbmMso4x9qpGHyy94fC+LbUcq+bdig7t7ngR9LpAZNp36V0PcXr2utfmLWOB6pW/
 pYio2vbG8wn48qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The SCM driver can defer or fail probe, or just load a bit later so
callers of qcom_scm_assign_mem() should defer if the device is not ready.

This fixes theoretical NULL pointer exception, triggered via introducing
probe deferral in SCM driver with call trace:

  qcom_tzmem_alloc+0x70/0x1ac (P)
  qcom_tzmem_alloc+0x64/0x1ac (L)
  qcom_scm_assign_mem+0x78/0x194
  qcom_rmtfs_mem_probe+0x2d4/0x38c
  platform_probe+0x68/0xc8

Fixes: d82bd359972a ("firmware: scm: Add new SCM call API for switching memory ownership")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I am not sure about commit introducing it (Fixes tag) thus not Cc-ing
stable.
---
 drivers/firmware/qcom/qcom_scm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5d91b8e22844608f35432f1ba9c08d477d4ff762..93212c8f20ad65ecc44804b00f4b93e3eaaf8d95 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1075,6 +1075,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	int ret, i, b;
 	u64 srcvm_bits = *srcvm;
 
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
 	src_sz = hweight64(srcvm_bits) * sizeof(*src);
 	mem_to_map_sz = sizeof(*mem_to_map);
 	dest_sz = dest_cnt * sizeof(*destvm);

-- 
2.43.0


