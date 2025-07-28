Return-Path: <linux-arm-msm+bounces-66841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E02B13A5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42AB189CA0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E8F26462E;
	Mon, 28 Jul 2025 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IulGPGOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD6263F30
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753705111; cv=none; b=kO/ubLaXal0ICs6Qy7c1N/dH71zRXdk+dxesB8xp72fSM9SE39d5Z8Y9P+yYYEP24XTL5pOUGpX7VFqagvXPdnSumHxYsRWzY3ZNIKqloolKU0hay7JqoO2BhpT7ub/k1309oU1g39ugbPso8N2jbIbvI8h9grT9KbhVAvNRE4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753705111; c=relaxed/simple;
	bh=ZhwhKLAtYMZqTw9nmo62hQRgpAsB4vx7PKceU/8QYqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfjtsFASXFk947ppZ3oTmyXYcZyjov0XgU1HpHEE2k/Jjt3QCOi6xjEMIPJeH/q2KFKmfVViJdxp6V+V1+2tIo/Mvwj1XIiEXhpGy9OholzxlnbEA6LlKT3qwzNRJDMlk6475+gq5vuq0SgK0QbWm98ezC589YqqNHXdJTfHIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IulGPGOM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlLem027698
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73vUzY4qHLFFO0Y15w5GNl6DVd2I2wvbjzyXYScYf4k=; b=IulGPGOMR+2Tnqyh
	KOy+D3In0+96p1D7+y5L1JdbpOboR5IDHeor35TFENcFbuPYHWHz4iAqaFMJ+HLC
	TxIwbe9Xe2RQWmBQszIlJud3HHcz30XRNnQd2uTpYljxsdLlh6PVLnUXrQ51kzok
	7VkAx1Xm04Mw/P+jD5nw2nL4E3v2W4eXj43SmvHjQR6oGuy11lfBxEnLSKs9aIKJ
	6UiezxdbmLHQwJrfyb0noJcaSIbMop1bOLEi+FIqqIXD2LMMRmmfR5wz7+F8wQhp
	0QITn7iyAvBdC1SpNpv6pKV2QMex0j1IbcK0qMBa5ZC2OmvJXi/i6FFuqmGZe3Dl
	LG23Lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ensqtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 12:18:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab99d1a223so96134281cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753705108; x=1754309908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73vUzY4qHLFFO0Y15w5GNl6DVd2I2wvbjzyXYScYf4k=;
        b=B/KlEBmK127HIFuoc7jxzMYZpJ8LZKCwnTd+ZSyJhlztCQ5yg3n8JMoOnNiJk1xo3a
         AGrnTeDOnbdL8n/9hPD+Kd2gD/5UpEOwtyhjQe+oA4ZZYEpYOVcT6VgomjTq0N657Vkp
         hWT3moxjVklnf5V4MFnljwkw1mO8RbFKYVYtef5N4NIVOB/SK4xu789JtQG2xPCEaFxa
         nZUav14+0z+Rj/UlMPyWW5QNNuDfdFMnFtJzk6sSD3eoo9FQ68V+CxyyEuhUBseksLIu
         msFbIrdYTyHf7RimcVSGaIFJCk/c5474RH0MWACBTdALNPpsPrKuAE9H3tYX5v0IzIm1
         QWpQ==
X-Gm-Message-State: AOJu0YyDFKPPJkH9aIxYYs0397xczvvP8LSwOoh0TR5qxNzXUo346eEN
	yyg/WPm0BDIx7WStUSK6l/XlYkMuhItQXwVSe/s5utrgqVHkEnyfBflVVvkIxoUTeozNtIh/cBd
	xPnUCMs4wa57sBQZe7WJQnjRZ1rDH5y+n3r47Z9YFsjoLolEOxzfdT9FtYRmjUlOwc/be
X-Gm-Gg: ASbGncsPvTDlvs+OUgUciRluIbqQugjFEq4YYF0YOjRckBqbqgKzQyDqsqUpLQCPBiD
	XrFnSQD/DCljHhWMF3ktTKe4uDzs/ItrbL8IVkp+de01OAnXzXTxAro0z4pVk0QGlE9W2S9wOcK
	KOz1yfi80WZ7mFav4TvfHL0c+1SFqUbGEZODvhn7q/7fw2DBahf9na+RDWtcOMABZwdJbgKceD+
	tVPiVB5O0V4ZFCTEYYjOBC3Jq0CWiMKdbJix8Jz5TdeA0IjTyLVe3WrdwR8/jWITJGwPpOiKuab
	SQM2px1m/iM0VfR5+SupDPCKFSFRRJ5J7SfiSPTvLPLdo9gon5T/QR0gscO+An+ZzUjInUGvMzl
	V/2ou2AXlBNiWd+x1VVCmnSr2nRX5yriprX5WBvMDmYh+FxMRwrdm
X-Received: by 2002:a05:6214:460a:b0:707:3829:d491 with SMTP id 6a1803df08f44-7073829d6aamr89286056d6.0.1753705107948;
        Mon, 28 Jul 2025 05:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHhEapzZAPzbqM8Bb0XK1MiLkiJuUco8jHXvQ5a/36dp9k3W7CHx8FOFpiIGIfD4IOk3xS6Q==
X-Received: by 2002:a05:6214:460a:b0:707:3829:d491 with SMTP id 6a1803df08f44-7073829d6aamr89285586d6.0.1753705107335;
        Mon, 28 Jul 2025 05:18:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b633b9d7dsm1241315e87.209.2025.07.28.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 05:18:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 15:18:23 +0300
Subject: [PATCH v2 1/2] thermal: qcom: make LMH select QCOM_SCM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-lmh-scm-v2-1-33bc58388ca5@oss.qualcomm.com>
References: <20250728-lmh-scm-v2-0-33bc58388ca5@oss.qualcomm.com>
In-Reply-To: <20250728-lmh-scm-v2-0-33bc58388ca5@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jackie Liu <liuyun01@kylinos.cn>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZhwhKLAtYMZqTw9nmo62hQRgpAsB4vx7PKceU/8QYqI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoh2qQ58wCL/wOE5Ao7BI61Fvf3f9Tt8RHq2IIO
 u1PLCws0SqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIdqkAAKCRCLPIo+Aiko
 1UtRB/44Ti8ej97m1vf8x5inMO3n+xf9thaNELG9BP5X8Q2ThCWmSptIRgNKF3ck3X6C8Fcsrlt
 AiEfMP2WEnwPwyBo1ZBibw2FbWbUdXyI10j1G9bbSfeIbwOABfXRF9sBmqN/GaJvY9wYa3ZslVu
 HOHgTgi0CuIrYZ/g1ef1VO0fj6z6B8mwFpiBdUfov5OvpRGe7RGgNmdaTUVUACiu63hMoPv3n1C
 xGrUbux/Ow+IgydJ2AKXi82zXFUbMH4NaS+USSpsXUjBm6DJU/wBdf9+Yg7i2S+Tmu5CCzFjTfT
 VEzMxw+krAio/zFC1YB3L8QgGMgXXyKeB2H1PAM3gNwrTD9H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1sdn_jrAIp1uKw2C_pnUlMq2sQcSgpeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA5MCBTYWx0ZWRfXyW0oYkGKVJvU
 nbyIMiyW2U2bI0nUVOPvv0PSpU7Aofimp/j1iLOrSu7KPB34CLxVO09nNwxHDB4f3nr1+Zwa5uf
 a60xOHjQs8u0YiB8DiAs7b8FZJM4u+GL9SNWp4d/j/Rq87uy+rq3NSQWq42VraIFSUSnRJ9TNQp
 qiY6b17PaDJR8f04Hzfjxz1l1fP6dNBH2vb8gBknK9NRQoZiyh8xLqieobZ/t0HDNnGheZdyyV3
 NZ4PacwO4Aqo0H5yraZTkq6bceEp0WTrW2VlhqvvAWLNS4PptNomLULqzNxhOdol10wNOgSFI5P
 RCPiHLwr4vTRFmtPyB85bRDB0YP7YnVUpXXAYC/tWBp6sXieK2BNvqVKIsXeV1dsce+qBMbjLzo
 30tXSTosKsxA9Ohy4Xz9NERdzlmqR/kGJVSzA86CZgQJeR4zGEQcMWkSuw5KEHHAdCNSb0Gd
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=68876a95 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=_a-utCDu36pnI6q6VeAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1sdn_jrAIp1uKw2C_pnUlMq2sQcSgpeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=961
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280090

The QCOM_SCM symbol is not user-visible, so it makes little sense to
depend on it. Make LMH driver select QCOM_SCM as all other drivers do
and, as the dependecy is now correctly handled, enable || COMPILE_TEST
in order to include the driver into broader set of build tests.

Fixes: 9e5a4fb84230 ("thermal/drivers/qcom/lmh: make QCOM_LMH depends on QCOM_SCM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/thermal/qcom/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
index 2c7f3f9a26ebbba41b89c8aa5d310048e8d6c792..a6bb01082ec6978afb5df32464cf591e4670549e 100644
--- a/drivers/thermal/qcom/Kconfig
+++ b/drivers/thermal/qcom/Kconfig
@@ -34,7 +34,8 @@ config QCOM_SPMI_TEMP_ALARM
 
 config QCOM_LMH
 	tristate "Qualcomm Limits Management Hardware"
-	depends on ARCH_QCOM && QCOM_SCM
+	depends on ARCH_QCOM || COMPILE_TEST
+	select QCOM_SCM
 	help
 	  This enables initialization of Qualcomm limits management
 	  hardware(LMh). LMh allows for hardware-enforced mitigation for cpus based on

-- 
2.39.5


