Return-Path: <linux-arm-msm+bounces-62107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA3CAE4B3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A13C9174FFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D202701D0;
	Mon, 23 Jun 2025 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGlv40rA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB72279DCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697036; cv=none; b=gDnKB3GMTk9Ek+PZxv3GHcCtPKFmgWoDSeCuZ/B48cK9Veoxj6hTlKFWFBMYwrTuwuXi5z9yUTLiP4HHRPRmud4w3DDy2+TCOIQLXIgLSGHpi32lfrqmIcrOOvtYFWFtIpjXPmyYhzj5q2GrH8l4rK0ZSRx1tTyeAfsGsAy+0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697036; c=relaxed/simple;
	bh=+xh7iWI1XaIIwG71AgAWrgrmqQs6ohZttUREPGQvZt0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iqr4b1hAF0Mmy3AYGyljqWpcX63c3WrvaWOoj6x44sSbYXukx6oXeWHWBBFXOElpfL8WIrlFY5dv2T82rOyuc1vko/vgf9MMcqnDCt4aSxm1WKTyUevBd2/Wn9LfQaGAXogTYxzGyDIhQ/jPpez8LXUYAH84m6RS+4cWBPUZMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGlv40rA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9ZeSW019573
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bWyrqJlmlGwMCYw5gBZfWx
	7GFNIpY5/L3zNzJU4uklw=; b=FGlv40rA4/DllP2Ja7sWGrY3xon1+mrVQow9bU
	ZG9E1MJygKTOjbH1ojIFHyNnil0m8P3oJo/r23fWUvRB0rogKe/gF1CJM5H0JODR
	B3+8+/GRkp12o28F4Rp8nGJ0/z9VTf9aLBfnjXFEjrzXTKfnnDkx77upjnD0Y7CU
	LjoKetxktHVM6Qf2KE+oemPUyX1nf8f4qQxq8SDVI2wZyVgmDAn14qAyilyBclMj
	ZyQFe+Ib3bCC2uU8H85Lum203DKspY6HpM/6jgBRvTxKogdtDzdehDLExEmCvtBl
	WLw8LGQMONPIxW51VchI8fnvLoahWZYzWM880Ob4JZyu1d4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4jncg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313f8835f29so6448549a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697032; x=1751301832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWyrqJlmlGwMCYw5gBZfWx7GFNIpY5/L3zNzJU4uklw=;
        b=H0DjFAcjr66oc7Tm9QJe23nYd3u7D3ycIzqIvFSwcPBPpqmfIjxFD7DgbImakrtXmE
         MwQ/d4V6aLI4xBHyIF3w6ebVo79OEdL3XMKrt8Yqj2UPWnLEdBDSt3h6bFN77O5QBnzN
         W1jVGIrD2f28PRG9y8+x4uNuhwBqPZqtHcpU1yZD2rKMknN1+4urm9b31lVY1gQk+RLv
         53KyWoRcVgm9yxRNALVISnnqft1rcOD9vLXBY+WPtkHjcweaOr7mUzrMmBGRVtMdvCVT
         zepdV47W935a9voUgV84C2NS0IauLFJBC1lPY+TLrzxMY6VTvolN++rQk7JEW70Cnro6
         VkSQ==
X-Gm-Message-State: AOJu0Yw6oL6Kj8orMNCpMG0v0BiGR5EoBHb/H8UNSL9Gm7CeMeuBli56
	SpizJcrJygNIg6F0Xs5B7Mw7x9dTGf6tkswT6u6IUFxj9t80A5hBAT+FW0B99ziZKzYtluR0Orx
	s69nJMMwCKkR3Sa3RL35TZ2Wfv1ah6rxhbAB8pkCbK4FWM23E6pYaDSXtYsK6hdVsbiULzzoPts
	pF
X-Gm-Gg: ASbGnct6RSLZ670plJHdAXi+5mFFhR58CqBYG9K4ZntnFEixLh7KUJfDoKDOkYnjfvx
	8t5S7VXKAMj6HVcNeX6kkCb1CQ4c/DUJ0Pt7W98stXhOs1Y8N4iMDOQrHtpCaJY6vGB+EgtqDyp
	AFv7m/ENTQnmU43jCUePpr5EKBuxLWx4+w10zG8ziN5dUU9rH6P1Y5fjqWzPM6Lgfds643r99NE
	/8086cEVziBmRbOQnXaUn6h3X+e0ptaonRuCpRLrgRG4HIQTDgWkksyL1sRQxlOf6NngOSw054o
	mgN7a8irvIsW/Q3MpNy7kGfoHGuh17uuubYjWvwqo9O8FnzNXgGS
X-Received: by 2002:a17:90b:2808:b0:313:f83a:e473 with SMTP id 98e67ed59e1d1-3159d67bbd3mr19290506a91.15.1750697032192;
        Mon, 23 Jun 2025 09:43:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNE3QbHOKDKgzhaZfq32KMG5TznfGz7my+Rpt+vl1t/WKa2yZmTq/7E3S6hmoL0wuHPAhT4A==
X-Received: by 2002:a17:90b:2808:b0:313:f83a:e473 with SMTP id 98e67ed59e1d1-3159d67bbd3mr19290472a91.15.1750697031788;
        Mon, 23 Jun 2025 09:43:51 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e048346sm9271254a91.26.2025.06.23.09.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:43:51 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support to read RPMH regulator settings
Date: Mon, 23 Jun 2025 22:13:39 +0530
Message-Id: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADuEWWgC/x3MMQqAMAxA0atIZgM1RSleRRxKGzWDWlIVQby7x
 fEN/z+QWYUz9NUDypdk2beCpq4gLH6bGSUWAxlqTUcWfYyoaV1Q2UfMZ0q7HmjJucnZEMh4KG1
 SnuT+v8P4vh9llP7xZwAAAA==
X-Change-ID: 20250623-add-rpmh-read-support-3288f83cc20a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750697028; l=1925;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=+xh7iWI1XaIIwG71AgAWrgrmqQs6ohZttUREPGQvZt0=;
 b=lyhAsnly9G2lCiSKkMKmJ2nvZRO4QdkeMGrdps0A1jaINvH/xnrdcuxcBXrwMGpjRTfQeIdiW
 PW/CHxzE2YSB+raDa2wrWt3HdseeBhKRVFFNGBUQuX3AUM8dXmydv7T
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=68598449 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vB4h2DdS89cme5NDu5IA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dRJnjse6QhGLbEH3yFVxnrjKaSYaCJhB
X-Proofpoint-ORIG-GUID: dRJnjse6QhGLbEH3yFVxnrjKaSYaCJhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMSBTYWx0ZWRfXzIANykTXnAbr
 ekNYM9vX189ONWWX8mt/u+LyUGI6k666zSwdN+ogAZCNlzN4gvVavxWwIKY73hhg44ZGasz4ZIa
 Zp9WRzMF+KB9//BQyIL2FYIJ+t+XD6jizYQf2HfAmQwtuXNPFMo+G/hWJ60frAnxNuAAJzqbch/
 T0e8fONxdo5Y8nmyvzIiS4vDQingXy+47bNdjeSt3IW4o6d0mOCO6R1roMUdGfYTkCFDOBv9VrU
 hcEjWPp3MnGqgRX8Jm9EH7brFLXIJ5aU0FyOqsALfMCRgQlszObj9C/Si3O2nm6mDK5fXnNK1qv
 W/rymZJrNuGKLZTslS9zdfqOQ6IE7k1pqgT75+sMkTlgLAlUDIGli8FM3VYA8HWvm+GQqI32ftV
 W0bFUb5CcxPDXWkF0fiL/26xhODnF9mXNdiUnTOyLr3mBXK4MF4QqQket9yEDKX/jGN8y55+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=810
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230101

This patch series adds a new `rpmh_read()` API to allow reading RPMH
addresses. Also, using this new API, enhances the RPMH regulator driver
get_regulator* APIs like `get_regulator_sel()`, `get_mode()` and
`is_enabled()` to allow reading voltage/mode/enable setting from H/W.

This is needed because current design has a limitation - regulator
framework can only get the cached values from the last voltage set
operation. Because of this right after bootup a `get_voltage_sel()`
from regulator framework will return -ENOTRECOVERABLE error, causing
regulator framework to trigger an unnecessary `set_voltage_sel()` call
with the `min_uV` value specified in the regulator's device tree
settings, which can cause issues for consumers like the display and
UFS that require a consistent voltage setting from the bootloader
state until their drivers are probed.

With this change regulator framework will get the regulator voltage
and other settings, as configured during bootloader stage, avoiding
unnecessary voltage adjustments and maintaining consistent power
settings across the transition from bootloader to kernel.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Kamal Wadhwa (1):
      regulator: qcom-rpmh: Add support to read regulator settings

Maulik Shah (1):
      soc: qcom: rpmh: Add support to read back resource settings

 drivers/regulator/qcom-rpmh-regulator.c | 71 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh-rsc.c             | 12 +++++-
 drivers/soc/qcom/rpmh.c                 | 54 +++++++++++++++++++++++--
 include/soc/qcom/rpmh.h                 |  7 ++++
 include/soc/qcom/tcs.h                  |  2 +
 5 files changed, 140 insertions(+), 6 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250623-add-rpmh-read-support-3288f83cc20a

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


