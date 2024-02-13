Return-Path: <linux-arm-msm+bounces-10868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF53852F31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A012DB27354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30B95466E;
	Tue, 13 Feb 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGt2WLwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D018936AEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823344; cv=none; b=YMK0jX/wwU3heMAztxiqrXOgyZZ3YJasBLDOuRQrmr0gTbutVZQZbIPvdFqFMDwqE1aHway64vol15CfhSzKbBDdYMSDag7Do+MTzt0M3zw1NhT/uH7nJIM9eSj6FOag5m0giBc5mcoJ6Z2yo6ibgLZp3noCYp5NuBvD5bERFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823344; c=relaxed/simple;
	bh=mW0FO82P9i9mtiqyO3ysE5mu6PqL/zVStjt8u6ip+SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwZI9x+gXWdk9q2j0VaKBR7PD5u6z5W13Pk2WECeDftZiQqOwmZgtHWRCVWdqFnhXJgmtUxVATRBEZB/5S43LnpAKAbKMKsQucAbdqkXhJ5GB8iORMZWp1FiGMcz/xYTWEb/tyEmf4PSF1M6JkkpX3GPjkdryyKs4jy41TFYD0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGt2WLwe; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d0a4e1789cso50090931fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823341; x=1708428141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUhw0fXqWYm6AJa50u2f6M8FfdtLFLkbchGqKyb/+zQ=;
        b=PGt2WLweJct3/dvEWqpucMv9QT9eIqRKLg+pU5jVv5jOWukIXb9SHF4yFTe21C5LP5
         gTCBMoS+BltTbqsHbTrolR75zbBOo2vF3NjGc/9OUi4rJKWOJ7w1xaC1xgs3IxbqZGni
         5yEVgkqWzE/kpWXEXaGZQc+xuoCNLSPkRRWV+xqiV/GL2/h0cBwZyvgQrylzcavCyTPm
         7ICVXy/9OvU7Q2Rrvv1zP7ZCNCKam4d/IQdhzBZpEjJRdPELtfaO6SH4YtFPLrtTQIgi
         0YMqVw7lMr3sSzTY6cC8C2K6J42q/+Xu9z57dLqJ95Il4IQlxLKIlGtsW2hVLIInY7sL
         kx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823341; x=1708428141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUhw0fXqWYm6AJa50u2f6M8FfdtLFLkbchGqKyb/+zQ=;
        b=DduqgTKJeuBTNaVv+NypJl/0x93f/UA4tbmBxqdXTUFbJEttSi+irsqvHxb6DY4L7E
         +AdItrP2AvbyMNMUKUgOd/kwgI231cNxJGpThMltJy0iurtgVTOpyvVh5cHdS9Ie5s3g
         CNPTs9lcZniYc7YsUViV/nWdw620f4ruJ7YOF899HecrYni/SWixJWdD4Dgc3p3G0o9h
         QUu8wJejmUNgUYf9tsGGKFtPR80JDwsbVh4UdAR5yEtmakzhorHYoKsxbwkHA0ik9qSO
         TMPCf20bnk5985BMjHlM5rqHZXjmS2XbeZFr1jAkwj6P/iPux+a/x/ceEes2eD6oTwwd
         JIBQ==
X-Gm-Message-State: AOJu0Yz1C7F/ySNGqHa6n7/mxZCPMw657SYBYcQptdCvHH5ML7idbZc1
	ZQEjsvoPDgr+LtQUQxyWZYQQqZRsDnH5YP2wsm0dW+ppLGQBjLwx1vDXDUVGJlI=
X-Google-Smtp-Source: AGHT+IE8AuCgpRLHWZ2iYdfN3vNMO5ordtk2vDV4M37etNxB11pYbJX1B/o8vxfU/Xe+ZSVyXEOnsA==
X-Received: by 2002:a2e:a544:0:b0:2d0:f6cd:8abc with SMTP id e4-20020a2ea544000000b002d0f6cd8abcmr4913031ljn.12.1707823340911;
        Tue, 13 Feb 2024 03:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJpUL1LzuIPb7m8BkJ/RCGCB7rdrwViMugqRRIO0OdHRVd5XxnsmeBnv9vJe82PpeNHYaItZUm3KpDq4pRbmh+a7IgFP/RC6s7h4tRlL8ezgaes451qXGOrqhqVNkJmZtMY21ZSNO5Z20PRYlaiL3dgsjSMzn4yFvoSOW+5QjdV3hS4m0/tSBr0HPtM3U3xXla6oH1VzyqwKlPRerk9kCJ0aMteEl1Y83Owl/jLJ0OksZrjIhQlVWTQndxUKvubrzP/uCYn04U9DMCIGXN/szxDWa15o2j4xa50ycj7DuJ8CxOF5yaTJaootQQiFI0Qi6lqA+CNIQXIQ4fwaoxKn31pAUH2H+RUz8XH0MPxZGqEkYYQHdTnpIT6gpLN3nw/WbuC1azLUXHswBygSiryHidyCbvyjO0RpsihahS8f8I/OQFIp18JhywFrh4EES8WFrsPTvn9Gg6U8MT7ei1vUpeJi3lmHTBvzC7twvO3Q1tSirCj3B91J8WnTjvFmZMksDb1IzDrsSKynzC8sFOSTOYGpb7kdWhmIIpxBTR5sQDDGcSMSxEVV3piyPmpuypevxQ
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020a2e964b000000b002ce04e9d944sm451107ljh.69.2024.02.13.03.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:22:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:22:17 +0200
Subject: [PATCH v2 1/6] scsi: ufs: qcom: provide default cycles_in_1us
 value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-msm8996-fix-ufs-v2-1-650758c26458@linaro.org>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
In-Reply-To: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mW0FO82P9i9mtiqyO3ysE5mu6PqL/zVStjt8u6ip+SM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBly1DqCMaalBck7dNtUqL5D/MI74MhqWXnmNzCw
 g91Dns3Mt6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZctQ6gAKCRCLPIo+Aiko
 1co9CACmqrWuSOIobvzElflz90Jq2rTpGNE0+MoWeF5EHPUVGMRDMXZ57vgldw1EvyBE7bebVY7
 bfDbH3zSLreYNY16T2FhSqwcvWITVlEt0y2tNoTJJVBFQsV8OqfC9QzNFhrd07VysxbZZHC0Bb8
 QG4oyZ0hV3GqCCwCx8c3LCzDHPV70hL0EXUfPIgy6t1H4fwKox0AZhiE8q5lnUjUEORb4LqN41K
 QFVRvtetMggD0PFIJYhDl+D7/3+t7PbEdP7skeXESpaLWsh6S1wOyIfW4qRfFF540oxexqTNVK6
 ji4rGKyriEEWiwVWSMHBy3NS4wq7F1G2n6R6kGfp2zhjUUZd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8996 DT doesn't provide frequency limits for the core_clk_unipro
clock, which results in miscalculation of the cycles_in_1us value.
Provide the backwards-compatible default to support existing MSM8996
DT files.

Fixes: b4e13e1ae95e ("scsi: ufs: qcom: Add multiple frequency support for MAX_CORE_CLK_1US_CYCLES")
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 0aeaee1c564c..79f8cb377710 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1210,8 +1210,10 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 
 	list_for_each_entry(clki, head, list) {
 		if (!IS_ERR_OR_NULL(clki->clk) &&
-			!strcmp(clki->name, "core_clk_unipro")) {
-			if (is_scale_up)
+		    !strcmp(clki->name, "core_clk_unipro")) {
+			if (!clki->max_freq)
+				cycles_in_1us = 150; /* default for backwards compatibility */
+			else if (is_scale_up)
 				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
 			else
 				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));

-- 
2.39.2


