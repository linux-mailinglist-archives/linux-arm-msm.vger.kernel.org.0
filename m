Return-Path: <linux-arm-msm+bounces-8781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FA83FF55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 08:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C6F3B2324D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 07:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA77A537ED;
	Mon, 29 Jan 2024 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4lsAjBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4452F83
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706514757; cv=none; b=Q2TVIrA7DbI+LOVwGkskNHOoQpfIdnxFb/5lByqJbF5QUStW+8IDbZ6yHLauWC3qdkW6mot68ZT4RUGi9KJy0X4NIGEtnMANgKuUBW0wZxhK4CugW6UMKEDbxdEfLXQ7Jizmg0+qPYUFmLRFIX6ATb5ZuwnclffL9zjw4SyCxNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706514757; c=relaxed/simple;
	bh=b4SvtNNZZGQQZdkuWZ0Rfu0VJ9qiw++F96jBPPIZhZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TY1Jm6x7QG5VCStTU2oPUEKZTfPAtGybcSCXAJDGl/VwTKY6mb8p35rk4I1Zbx871MWY3coebaX09RYBtZi/6R0BP+jWQt0WEBLyUpxuX3rjIQFNZ30HiU4xGdMAf9RzQFJjDgWJYPXsPO01FncL/MMGTZ6x3HwWov1WloBShbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4lsAjBx; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6de0f53f8e8so943651b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 23:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706514755; x=1707119555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ye389EYHKjCvOugxyWLCxfbNKt/VTFay9WwnmjxJvTs=;
        b=W4lsAjBxHQm7QXmyNb+3hWsn9nobuZ7MjYsar9oe+qBd9cqKtW6fWp/R5RgQActyoC
         4/aAsg2YErI1c3wRU+JwRCZMtOs1r2eZU8JTQ8SgXSF8KpiWvLobsC6CQ3fIw8KeZszn
         Ll3zls6VBVYGDAwxxZAwtvnz/gfe4CmRIjNe4gu5knhfRs7oAVjCv8ipygo5TidJFKx/
         Ai5Ox3Sjnqk35Z3fgvS+r69gUA7KJ4ikxhZ2Hy6zjRwt4hd3o5OTZcpKS+unzZ1S9nQc
         k4Z9/ySlzcMlYw//QCX/52SlbY/majXBBb1rOiUPtGsf1XfjnWBNsbxXOxV9fPcwQGgb
         3Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706514755; x=1707119555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye389EYHKjCvOugxyWLCxfbNKt/VTFay9WwnmjxJvTs=;
        b=ZOjsjXKfUygP0LEVfWHbPOfc49hBsUB2/cgTiZyJ4RzV37m9XeqYBwSy4R59icjIMx
         kb1YlQW0N2byd/6GJabD8/NyDUpmNPzH6LJSn7kol+VvNQBtR8noDWpfd7le+gFSuXoY
         SM5EC9fd94wS8DmO6JsXFSpeI0PmpJr9QDD+dsEthtUREA3Gsk2t2ZZwdx+DERQeE8HX
         S9mYck4Jb+Uup2wyLKSqNHLgBpkyzs1Tp5B9yK0rUTGbuhtaVshWXyjhPqfhjZ9ZqBXf
         hD9N+hVobNo3fzKRqXX7ObsZnA7bjpuS9hewJjVfwI+BMsPbvKr99kKPk4PszUCgc5o5
         PyVw==
X-Gm-Message-State: AOJu0YzfO92oGgTVZXUpGpYWjAn73iOrOQJT0hetpUZJ9f+lq+Arrsnj
	2uazVpihUFyZi/J+MN5ZHlXa2UvQ1DZnSpDr751I3GEwMfdRJAZwsUBd1fkH0w==
X-Google-Smtp-Source: AGHT+IGMW4acCOBEdcGx3tBpKvP++zu0zoTSI8NbWDb0gPVWT12Ornuhd09cfb+ORmRXMqyRCfh++A==
X-Received: by 2002:a05:6a20:9587:b0:19c:8673:77 with SMTP id iu7-20020a056a20958700b0019c86730077mr5208625pzb.2.1706514755444;
        Sun, 28 Jan 2024 23:52:35 -0800 (PST)
Received: from [127.0.1.1] ([117.193.214.109])
        by smtp.gmail.com with ESMTPSA id t19-20020a62d153000000b006dddd685bbesm5467329pfl.122.2024.01.28.23.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 23:52:35 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 29 Jan 2024 13:22:05 +0530
Subject: [PATCH 2/3] scsi: ufs: qcom: Clarify the comment of core_reset
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-ufs-core-reset-fix-v1-2-7ac628aa735f@linaro.org>
References: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org>
In-Reply-To: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Andy Gross <andy.gross@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=b4SvtNNZZGQQZdkuWZ0Rfu0VJ9qiw++F96jBPPIZhZs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlt1kv1hrO9+0MMLmC+cLokw5vh0sPSCLyGClUL
 iO40O5pPy6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbdZLwAKCRBVnxHm/pHO
 9bh0CACPfxmuj/KcHNlhnpH/G/Dg1ykQ5lhbNfrrhMDXVU0Jb0xfTcfNLuTqFkKYX4PZl95a4c/
 CrFfQg8SWnAAu5DVuUOFenyIsOTbRjHVABF0ZeAHR4KlxAkfRHTiVAoI2PoQWy/8q9tepAsPeuo
 WbNTSDwdyvBRt3pYy9XkVtENiGT7McWlnrEKDF5iffiPSIP6u8xj//GzK8JlcJhUftRsL+INDKw
 46d15Qj3cfgBVAHOd4Q2XCxHptMHOUBxEUfCqT3RBvu3ATGSJ5KUzD1QnE1re6PjR2JhRMSqpxE
 QDgq9N7F57ExO8JINPdbH7NRyrMjvaEyarMjUH3s5Ndgaqup
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

core_reset is not an optional property for the platforms supported in
upstream. Only for the non-upstreamed legacy platforms it is optional.
But somehow a few of the upstreamed platforms do not pass this property
by mistake.

So clarify the comment to make it clear that even though core_reset is
required, it is kept as optional to support the DTs that do not pass this
property.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 39eef470f8fa..32760506dfeb 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1027,7 +1027,11 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
-	/* Setup the optional reset control of HCI */
+	/*
+	 * Even though core_reset is required on all platforms, some DTs never
+	 * passed this property. So we have to keep it optional for supporting
+	 * them.
+	 */
 	host->core_reset = devm_reset_control_get_optional(hba->dev, "rst");
 	if (IS_ERR(host->core_reset)) {
 		err = dev_err_probe(dev, PTR_ERR(host->core_reset),

-- 
2.25.1


