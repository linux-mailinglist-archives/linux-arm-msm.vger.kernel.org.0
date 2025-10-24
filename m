Return-Path: <linux-arm-msm+bounces-78741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F90C06D22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7211AA10D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CBA1A83F8;
	Fri, 24 Oct 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfE/7FXN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90327238D22
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761317837; cv=none; b=MkHj1KQPyfdz/f0uaTwNS5lfjIY2XXF6UZY/JLRy0YbcITlA88U8Kw3cxlupBirZNPSX7Rm92ZQxuApGKpAMALx6z2aEUFTGXyWy/GA4tG8L5gLWZeYe/PCoHBe2yc8t+5nrEAIuk4FIHxki/Jlj8HQSvhd+Z2jTJ9LapCWyeaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761317837; c=relaxed/simple;
	bh=1gylyZmwNHyN2C9jDd9SKYKbQ5zm1ooRwXpqxab04r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pUZkOThwWRsvdqnk8HP1MFaa2X2Zp0ljrw/eX0jW1tzXZYJ5X1r2j1dTLh6ztbskRW9eD9eV1ZrQ0/Fu956Wcn8oYoHI4SHD3kfLM7CDbaMJd7UuquXWD5gCGMn/1rCn99z9OuZ4X3HAwm+MeL6OrT20P2LmUafDPjUoAZO+5c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfE/7FXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCDqno016081
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=60sB8Wuf9kTa2rtyBom7E3
	5OMwjLtVwCZLKP46MCeGQ=; b=FfE/7FXN/lbKuAWCh0Ln0vnyufCffscLn+hLvp
	imRcO/oQWFF0pLuLN6lZ5+mSzinrRhhVA0HLprolG6iuNQBB77sUPMXqGgDlxqRl
	13TOsqejJqR9Qc2aMWxc+gazN4BVggsrRa/G1i0/DwWsWatpS317LD0S4c4GyGS5
	rPS4qL4ks5/K33jmDimBMON+MGLLtPSEWYZa1I1bFHs8QJCuZh7SMgHv9/gERUhO
	5eYLLP1x0AtsCPPmoMuZmBF9idAyBb5D7YwnFxGwqXGgJD56ZjeXijd5/CwVMOO2
	qKqVYpB9ThiQarTbuzf88XQ1+u/FU+Fb81IuVLO6obhqIVOg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpshyhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:57:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a27ade1e73so1373236b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317834; x=1761922634;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60sB8Wuf9kTa2rtyBom7E35OMwjLtVwCZLKP46MCeGQ=;
        b=DNGD2nGPZV3No2SyS+tsT/DT9mkLwkLayRE+dYICQ0wx1mEr0pu2BKYyVwPaSMBi9A
         KzWfyi5pqaQwPCT0lrfwfQ2eBhqaPLdx7rUw1zoUjZTpQVBuZvBvOg5f4OF9Ua7q8Xgx
         EN3vKTxhif1YyA2fauMJ+BxYtsDLadiqxVR+KunsBfcCBkRSjDTzRWMWBV6I8cAIWKxc
         1pnM73JSG58MQWhG6KT5Yz5nD8DhC3ygSYV8GxHNSfBw1NDe1RoRqPfeBycrcwvzcibC
         EPm3iUxocoPimw1TfPpK6uddzxfInG3ynVgjM7qPMHS99Xvtp+jURqgFINC7LMFChQVH
         tlnA==
X-Forwarded-Encrypted: i=1; AJvYcCW1VlEmcoLt9MLpJvNWSu0rMCVoDFh+U8Ue0HyeUsc8Pl+/2HP4/jcMbM/B3DNwHJN64Moll1V8vARyvjzb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywha3RMofliH+AFNTzAoUgC5NB3zoy36fccwOSrRwW02H8wnN1j
	D52l1zgb2D6kApAvxILebcvsRQ6BggDpeRIwQjuO7LqBgWA96BDlZLd2vUedxxPn1VCu8UE9shv
	raO7dXDFNnJxmxnSnpHdrMiZBhfqSJU8oxomK6ZTIHzTi9LeN7oUMXCkUJK5fo6nnHv/K
X-Gm-Gg: ASbGncs/miegKOKFvKpXTWPwXB7yFYNb1H/b+3csTAfpBlK8pvM7KQwDyW9H/Me0nrY
	iE/SJPMopF8Rw8DIJflE8ps97ioKDosigXY28+H3xWbpMaUKQZac20sOqBVq1EOMh9dwEHOSfXX
	UxVY6I/zxVPY6u9scAOb307CZgA+sHiJU38rur91X6J7l7HqkICPTZNiFPzcGZE/JA3R4lsqVW7
	PPPO4qiuYdI5I8DZHD9W9bP8RMs3tUtx0UJ/ITyQt+uJgJSI5z/SxwwgDCjLi7KT4QifBr1M08v
	45KFI3WiydpsiJI/bDySx38MlCMsOBgVnCm+gScgjtCp3+7BO1d0oXsNkoyzCc07/d4oq8p8G9N
	NwNdh92NgwmZiKty/hpiQWW8=
X-Received: by 2002:a05:6a20:6a20:b0:2cd:a43f:78fb with SMTP id adf61e73a8af0-33deb36eb42mr3243596637.48.1761317833811;
        Fri, 24 Oct 2025 07:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoCzabHI6k75TFLxJXPCs3EzFvxfhcUQKHHRumUBapOaZLUKiSau/3jarrJCmQTq99vTz3iQ==
X-Received: by 2002:a05:6a20:6a20:b0:2cd:a43f:78fb with SMTP id adf61e73a8af0-33deb36eb42mr3243559637.48.1761317833320;
        Fri, 24 Oct 2025 07:57:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e326c9sm5282228a12.34.2025.10.24.07.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:57:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 20:26:41 +0530
Subject: [PATCH] MAINTAINERS: Remove Jessica from drm-msm reviewers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-remove-jessica-v1-1-f1bb2dfc2e18@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKiT+2gC/yXMywqDMBCF4VeRWTeQu9ZXKS5mkrFNQW0TKwXx3
 Rvq8jtw/h0K58QF+maHzFsqaZkr1KWB8MD5ziLFatBSOyW1FZmnZWPx5FJSQKGQovEGrbct1NM
 r85i+/+BtOJ35/and9RyBsLAIyzSltW/8iGQ0kXeyQyLqqCUVnL12bO0og9FGS44OhuP4AexUH
 R2sAAAA
X-Change-ID: 20251024-remove-jessica-1abd363a4647
To: Rob Clark <rob.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761317830; l=1017;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1gylyZmwNHyN2C9jDd9SKYKbQ5zm1ooRwXpqxab04r4=;
 b=pdd+LTwZ020zxaFl6Wy5zG3KXzhkz84usSUTeXn1QGl2mVqqs8x4yLz5fcQNOxh5I2lu0NXM9
 o8xsd1jvA5LD7aQyht28013ZYK0iWWNDL+yyHlDXvN92sR6M/wy2b6X
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXwzYoHmUCj8dZ
 C4oGCIQYLbGpvudyK2d/4PjP7Oz0/ore8oW8BLtvAnXjaul2oq9povDlp7mjFJkGw3QHOzDlG36
 W3qdJqhM6816V1IAlnT57g6VfOei2MNrqM4YPWlG479mp4/VlqN0mRfOWjaPxSXNDgDD32oLjKC
 2ucQkt0LqnLz01gdh2i3VOAhq6qvslp0KP/je6asY603kUfSa+Lg9Kwc7yxlYBQlpg5+DENz3If
 fWGadjAwEltpyeMZfqdiq2km4RJXdQjm2//pTfk1aFQZjAhMm/WX8P9MoDcavuppqs3czcszwuC
 Cb24Xnxoe8U/fUUKvcPdDCHTwqoXiOMwmwT0qLcRRW3V/Mv1dWvCHMhoPQKIAbdAJzGwn3Cndku
 mIH/4ZSJU73IvHgXcMxibtAwQ8b8lA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fb93ca cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=oH-qu8LnP-yuNCiDOAsA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: 2G4KTiQH4ZXFiCLOxQx6sJE8ynHrx8fm
X-Proofpoint-ORIG-GUID: 2G4KTiQH4ZXFiCLOxQx6sJE8ynHrx8fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Jessica has left Qualcomm and her Qualcomm email address is bouncing.
So remove Jessica from the reviewer list of drm-msm display driver for now.

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5889df9de210..064aecda38cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7889,7 +7889,6 @@ DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org

---
base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
change-id: 20251024-remove-jessica-1abd363a4647

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


