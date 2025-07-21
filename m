Return-Path: <linux-arm-msm+bounces-65929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40FB0C8D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 18:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B319818919E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B11E2E092A;
	Mon, 21 Jul 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePn2qgyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0532E091D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115556; cv=none; b=RbewqBLIioHD/chCe94zENbFHiUh58m4LobEBl3pbtIBw01oCY3hMMWBATxPHK6K5KqqWQvzXYc+x9FPkLmO1rc7i34EHDO5srxHv9GRSaYfIzXr+jpVnLPO6PfC6oiXu8I2qXSb5S1UnB1xOyNiiCUZJlcmA7xrt44kQItXV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115556; c=relaxed/simple;
	bh=iyIzr+jC5KDjXspPRwBZrSh9tU6LfOxoBKt9zdZWbdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PvZXqDozuY7jUQOElAjtNSaDu9MXUp79SZKRRzpbajDg6CknKXlmJKmKdlmt4YmtBY2Sz2G4TO8mLs3KZqrjX2iyPwy+41zq6PzvpY2m5pfdeoewFD2M/d3qrjbBF61goMaBtXvz8JhBCUdRR53RGsBfshnuXinKJK3FiCs6yXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePn2qgyb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LG2aHT029347
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 16:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T4Klmseu2Mfh86rZxIp8QLkDs/hpniEhGQD
	JVIutbVc=; b=ePn2qgybduqreyyB2iatoTEJLk+Y5+qbVXVWb1lH8TqElslkGqK
	PGuIBlt/Z+2PeiO5IrPjxbITe6w2H6iFkZgpIPomx/uaxVp/f5IPbdbsiJXQhggy
	W6gIdK4smPLuBgv3gHHo2lE3sP//tD/E0AWJWNWqh/m7CzrTFs37WA2FiO94ig9g
	AInNEnPmktoTJwmGKYWbMkJAmM3z50m1Ercf7GEivxsWl2UU1zHUCCcC9OzBsEFX
	rTbJYbp434LGvKVQ7Rr97W1jb9oFxNjCrVtBo3Y4m4a/djNnzdPfDbvD9MblzGEF
	psXZE15Dw2U1N0D7pQlyqBPRpNZ2lblu7LA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048te68h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 16:32:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2382607509fso30811285ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 09:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115552; x=1753720352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4Klmseu2Mfh86rZxIp8QLkDs/hpniEhGQDJVIutbVc=;
        b=rw/V7Vn6nbsZg9E2N9BnOUhARzQxGJaTeUyhPXFDCd29wouUJb0HIJ1hi8GESeSTnj
         Uyn7NRDyM4jhRJPcVKq7awkj77YNgJHfSIu3IKFyTvfWBLw0Hty/Zi2n34Kei9lbUz1a
         hNhPVD/CSDQVqj3e/AcYUDZ2fMayrhL2RQ11Vl2mb0RAYolijDVtjuf5e0nVfzEEJxR4
         JiWrcQLsVd+5oOLHlykowI/x5L1xZlUrykvn7qjE1YOZwaymJKbOcB0ZmkFzgoLGqIe/
         3kNMApBLRbpitZL6qmgJ7fX/HpvF6TwIzweGEJ7BbNMd/E1dV7KVmB8zlPOy6vVqhtD7
         FFng==
X-Gm-Message-State: AOJu0YyNdimIcfnv8mImzSwi5NVlXtx/BZVl93guzl0qXP0FH/1aFLye
	gaGdQXMYOTE0xgZPXlK37hWi6lAXmvWCOeuygShYwefqbqXI2THmDuX6lsds5uE4qzJeGyMo200
	J2DKXOdPrW2HZ6RhYo5AAsqyNCTyAF6eNxgATK/0ilkYmTApKtgPAlddDT4PJP8JKKtyD
X-Gm-Gg: ASbGncv6OT1YryGA6RALgcBTy/vwIFkBIm2lIzMU7YCuWMrTlzbLkpw0hD2llFyRbpP
	MgQsd0x1kA2g5kNEJDo5dGRSNgyUlLp+69eoSUEry2buLefQHiLVPm3Idiy8jdrlD/18q4KM7ni
	YeMgcIoLLsH3Ck+crHSAPUfsEvB8wFBnBoZJXttIfEV9uV6gY4WtKnw9aXOmvQUWh7bAlcOQQDz
	m3XsXdFqYI8FbKePRPQes8nI8ewx+4EfMYtV78LjKhTT6s0n7tSdWdNsyHjV+TFpJ9WSwsrjghZ
	oLP46y9HH5a/cyFRyIYEhDS2POpLlGp59iASlNqtLeePIhG8KHQobxwD/M0KVQ4WHZwdCW9quzc
	IZMarb5dBBJqoPJxqvR1uL5/6P94SSEzVoDguWKXeg+zGHfDCEVN+9MO4cTxP
X-Received: by 2002:a17:903:b8d:b0:234:986c:66bf with SMTP id d9443c01a7336-23e24ec7396mr273613905ad.11.1753115552384;
        Mon, 21 Jul 2025 09:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0qoXvxpN+826ak4QR0pKSE6QgwEdRBv235JvB5HIj/InSR7Zq+Oi7gRegvz0g7tfqG2gRA==
X-Received: by 2002:a17:903:b8d:b0:234:986c:66bf with SMTP id d9443c01a7336-23e24ec7396mr273613485ad.11.1753115551964;
        Mon, 21 Jul 2025 09:32:31 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3c3b2c4esm59893255ad.189.2025.07.21.09.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:32:31 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Mon, 21 Jul 2025 22:02:19 +0530
Message-Id: <20250721163221.310746-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE0NiBTYWx0ZWRfX2+/FKKTdCb6N
 agfizQAFnsDLlbY55/xm8NLv3hel3/UbtJd/7D7WtJdPz2tpawJDNRdByiOxb8X/zsid2vllikd
 smrkvENkiQxpEH43EsqupW/D0QzlhwM0L159tWCzQVIu8kY9YqO3PIWsNKePJ3ljD28gyZuMAT/
 AE+fr6zsZ7jGq5iElz0lrTx8FRNbMJx14M6s00AtQQBO2JrXuBP4MpoK4TUMYUJvbnOSXwqYzFE
 mC0/IMfujS6e+R2s9y41kgAeEbSL2EFVvNgzI8awO+mdWdivGvdOvevUz7lYSbq/pRx/45yBZF+
 j+VL5c6mR9m+AoNDYijcRQhKBh8NCyuh0Yz1PEqaisbq0SLXA/KCHIg/0q3dDQZssmBeKVIiLdf
 UeNhlI76BBodtrBg9huEWdSyCio+QaHnihuEm7jRd8me7KCQuOPaYdugcH0nUuHNNXWFh+Ui
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e6ba1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=TVyXueylgh4vxAmsgxgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: igyBhQMFv23YmRso50ek3OqWcWi_IhoJ
X-Proofpoint-ORIG-GUID: igyBhQMFv23YmRso50ek3OqWcWi_IhoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=891 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210146

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.

Changes in v3:
Fixed indentation for example tlmm node in bindings file
Fixed s-o-b and review comments in the driver

Changes in v2:
Fixed dt-bindings error from example node's reg propery
Fixed gpio-line-name maxItems
Driver UFS_RESET macro updated
Removed obsolete comment for pingroups
Updated ngpio to include ufs_reset pin

Pankaj Patil (2):
  dt-bindings: pinctrl: qcom: Add Glymur pinctrl bindings
  pinctrl: qcom: Add glymur pinctrl driver

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


