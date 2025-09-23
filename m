Return-Path: <linux-arm-msm+bounces-74494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE450B9494D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 08:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6D354E2C94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 06:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8536630F943;
	Tue, 23 Sep 2025 06:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC039+jU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6130F921
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758609471; cv=none; b=P8REW2i6UfwFgmBoPSMwCcUa+jXALsWbvFRqOilobFCCok28K4HjAeCdnPIPZISJfJPVfK7XBPMf5AxwNrZKdSACevdNhy9MgtbOt+Oqetq2dcVN8uSLZ3FTl8CY30XXVA7wqdEo4GjoBRM21RjE3QcyNsg0VfEiMDe/7dVyS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758609471; c=relaxed/simple;
	bh=WsHsNEAaP1Ay90d3OaeZ9mfZsT/9dRhawMd+cuJPOiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WLoZoDE/7eYgieDP1DTOxtKkgyI+2DSzEyFDc91O77yoVN0bDC2AdmQ2L7sC665SLBqzNe3uI6SsGSMtTORPOYoFemotg8E9FORMDJzLipmbMJqJbvnMUF1Z2mAHOPoM+Qyiug9zXQMc7cZKuc1potLlT1qwN6CXV7E9lmUE4/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC039+jU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N6Zl2M015787
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9KX9WsCydJ4lMlqnCaggZS
	+sexUTsyHGZuNpnbcsMe8=; b=eC039+jULoPR7+BI9oB4VOnm/MaLjmcglCYdFQ
	qTG0vOVa4Dzt2TiitcJgQUAkVENCvQAaOnkWDLo23ngTfc7lllicJ5udJpPHPEfh
	oXuOuhV54q84PbHdjXfjaGqyuVAbr0nDbzcp7xYHaoE4QcGaABMSdx8137FEsgiM
	4+tnPD5cD8tnIh6ZdoTaRsP+ErRO1p6ctJY4M8kPPYJ+1JbVSjh75fxlXgMIeys9
	lq+kWwKQW+/rirgkm93NK78SDMO57uvjO+/mEbSx9MKxDRugJ0rUVV5bJl+idzlr
	8ApwWuja9xLy40v+MUO+iqu9wmqaXU/t5T6ta6oyofIXPtog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajesw22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:37:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25d21fddb85so90264075ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758609468; x=1759214268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KX9WsCydJ4lMlqnCaggZS+sexUTsyHGZuNpnbcsMe8=;
        b=WvKjAFXqI/WrHfXduMtPaM8suxBA0VXoxaqSvX4OkzInAFPkUDOuvnwBgaO4JBlrcw
         mx+5N7cQVRdKPRCky+XYJ7cNtE/UI5/EhfO9/YGs8MPnD1MsPN9anoXSoRl4p+zL8EWD
         xvMGPzRaeXQo8esckcquOCY2wWYMS7anh4nn/QZqUyIoAntAE7E08W9YC1q62FMBqNca
         KNn5yqvwp6w82lyVQyP9GB4aZxGiNidhhVPgcjXso1oiM0e0eTBJZR+wnSZM88VSXbe+
         z72qBE0E1lTaH6e3n11IL9V9cQKxgxQBe1GwEe6NS5ScFXI6i50WQcN26eFSFJb5EGMN
         Xrxg==
X-Forwarded-Encrypted: i=1; AJvYcCX8dFagDgdtFQe/qKrjuAArgRD+nr3N+RjuJ41kLQCKJXGYbAuRIhN79f5eqQq3pwH013kUDkTWSCHP6AKn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ENlG3DAt+vv1A4q6jouhGibkk2eYf+JV5OvnmKe6czRlosZ9
	P/QJ0Wn4PgUX9wysEQpa9aGZx72ynA8o3BuAySRGtC8b5UTV8UXeakfAMXSgDfvZciFw/85N4kI
	wtmCABA8uhczTIYl/xft9SwlOlUANGEjpdKjOxY43QYg9ds9tpISKSmd2njT44LijFWU8
X-Gm-Gg: ASbGncuyBFbjQ8C5w9wiATvBu97Q0PRzJEcb+ys7dv629qvsAzsrasnTCl2k+/mzTOg
	hs0msYOrWzap3Pi6SdEhuIM17fu+8V0hNAysn6xfYz2b2YxBLsgFiHvjco185Tf44nf52XJk8iT
	nBhuniiE38F5pJPA2zivXcpddbkDQQ4ifZvKOPcUCM8xrEQh7jFN7pJjgJ6WbOtESByvx0kjfmD
	VTrlQXSmlTvO/M3aUROHQKfreuNfkdx0tGLuC0T+uhUBDlnheYUsYThR2Iqh26z1N9+MZdUY68q
	gqLw8pNVgmray2erX65gjfIorbMInPJs/I36BZC/PlqGtK5kLFwkncd9F1Ori3F8zw==
X-Received: by 2002:a17:903:32c6:b0:24c:da3b:7379 with SMTP id d9443c01a7336-27cc34505e5mr21122815ad.16.1758609468092;
        Mon, 22 Sep 2025 23:37:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz25vtE1I8hZ6E5ev7b4T6BoE48G4Gniu63qvSpIxnPLRSRiiC6ei2Cl7HZdmTtNqdtx1i/w==
X-Received: by 2002:a17:903:32c6:b0:24c:da3b:7379 with SMTP id d9443c01a7336-27cc34505e5mr21122515ad.16.1758609467594;
        Mon, 22 Sep 2025 23:37:47 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551905bb4csm10792840a12.29.2025.09.22.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 23:37:47 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] bus: mhi: Add loopback driver for host & ep
Date: Tue, 23 Sep 2025 12:07:40 +0530
Message-Id: <20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRA0mgC/22M0Q6CIBhGX8VxHQ4QTLvqPZprBD/JEjEoV3O+e
 2jrotXNt51vO2dCEYKFiHbZhAKMNlrfJ6CbDKlW9mfAVidGjDBBalLgzvvhJNXl6FqLNYAQxhD
 NS4aSMgQw9rHmDk3i1sabD8+1PtLl/YT4d2ikmOCSa6UqXhlaiL2PMb/eZae8c3maJf92Kfvjq
 hLqKpkg5fbXbeZ5fgGgdcQJ6wAAAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758609464; l=1041;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=WsHsNEAaP1Ay90d3OaeZ9mfZsT/9dRhawMd+cuJPOiU=;
 b=T9EK5VAaQCj9LSIix1tOa2RAG5rWYnoEeCLwkoNiF1O+0Zrp2D0vSyNPq7mmLoYnJqjvwY3M/
 CrlDtI97n00BuL+ymdOMgyN3yVS16SdJ8LVALwOCvrlWJ9x0a2BjtcC
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: yHjomgFmhNeahBMSi8fnGxms_2bORjmv
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d2403d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Kxh_h3bSnmR7gis_oVoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXxmjES5x7kUhz
 VR3BhR1yOVRmx+PRvcGZvRsGeq2mePZ3QlZqBZ0FmHEKqSOOOdGvKy67IjwElJFb5dpQ6/f+WFS
 4MvZoRV8bV1XjYHeqIYwOVKIdVsTPbYO3TMW3HOLsY7JmOPzcBBAKRw/pi5maW5pk5kaGl1TyTv
 kkV5YX41Mn+8yAK0m3QSaH4uQqf67RBG0Nh1WHEDJvHcboOgAr5IIb8ZG2jGQ1zhCW5E8TFwT89
 ZWTx8iz8PuvVWSKS296b6Vz0D9sCzBtsfl7Qb/Fin0lEXnPTnoS4TKIJYCBTMXUrIyzclMEnzES
 XAiysBwvll9kOBAI/gBd+fvvAYvhIsUIjMjnldPzJjyyvC8mGQGG744Y4SXXE1hn/n/mp9nu2eh
 52mkdh7A
X-Proofpoint-ORIG-GUID: yHjomgFmhNeahBMSi8fnGxms_2bORjmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

This series add MHI loopback drivers to enable comprehensive testing and
validation of MHI data path functionality between host controllers and
endpoint devices. The drivers support configurable transfer sizes, TRE
chaining, and provide real-time status reporting for thorough testing.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (2):
      bus: mhi: host: Add loopback driver with sysfs interface
      bus: mhi: ep: Add loopback driver for data path testing

 drivers/bus/mhi/ep/Kconfig           |   8 +
 drivers/bus/mhi/ep/Makefile          |   1 +
 drivers/bus/mhi/ep/mhi_ep_loopback.c | 132 +++++++++++++
 drivers/bus/mhi/host/Kconfig         |   7 +
 drivers/bus/mhi/host/Makefile        |   1 +
 drivers/bus/mhi/host/mhi_loopback.c  | 348 +++++++++++++++++++++++++++++++++++
 6 files changed, 497 insertions(+)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


