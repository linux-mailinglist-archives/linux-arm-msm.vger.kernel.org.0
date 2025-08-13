Return-Path: <linux-arm-msm+bounces-68898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64819B24200
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 08:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6F75189A07D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 06:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9772737E6;
	Wed, 13 Aug 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxQbe5gb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772532BF3DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068144; cv=none; b=gTQuyBHH8RhSCZR9kM1LjwDjNyuiUoYOTN1GES53gs66Qv4w1Nt6ZXIF+sHLN9HmCzPsMLbGZLTye+sv4mzMTcCPjEtNVTMOl9w37trcx8HroVVGos5TpDcxmn8liivdKk202XvQiENFEokBmZTllaq5cClOB5tVFd0AGhXA+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068144; c=relaxed/simple;
	bh=NT3OXZ+6VFZb8CMe4L1nzdruLP5ekCY4F22ZMO9+lwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DNQyRq+Nay3HB7joVsT8bIMMVzIEBxlM3AYea+W5qB2Ef23BrTBLB8iZ4d4jBKZZ4y7kLyYQnEnu7WAfkDhX1Me92NhZtRPBdqduaAlJWts8SjxRGuKsmSle+yT0/GfkZd89uTFxd2uOfKQbdAesya8aLXJPnI0Up9ExFuIEngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxQbe5gb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mYuw019580
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v89RUCwFdyomRq93Seq/cCar3eyic7DgZed
	XTAI4uzg=; b=GxQbe5gbpLOK9bhiBmB5lyEEGQEQ7ItuzcZg167xiPgvg67eGwy
	1O+dSkpAak+F8DwahEiDpb/Qybc4Db8uRnWUcAvuQrcMZ/2OZKPvUhH42BT6sSRT
	6qCTP0N2KjJAHJskku51iFXTp9S+WA7H0hKwCaS2jw6TcPen6AU1T//u0Jq3riSi
	AIVQj21tsOLWyxxGd4e8Da3etLVjEnGw0t1WHbcKzk5pCPKWEjUYA+B3fnv2E4X2
	d7r4QQJPCbP43xdCAykfowvXRW/TUuHNLxqOb6yjMSVdGh71TjGTKyYRKfPu+dn5
	xy0D4psnMDm6VXneJsaIjXn5fTUXgfPnChg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6ppca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:55:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fe984fe57so97195525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 23:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068140; x=1755672940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v89RUCwFdyomRq93Seq/cCar3eyic7DgZedXTAI4uzg=;
        b=LVArbGS03cKbBEXzi7ry8+wCDNk1o6YEBGqfgGz0TA6FFfClHNavL/zI4KxZWIFkZu
         gsuExcx32Yo0StdsjJJwXBddT+0wmlAm4fFcgxzPcTqbjDleS2oi0ODl+zStjWTAm2N9
         grLZK0GMA61FpeNAxUQi9iUHxRN84JZy8dasimhbf8hHFPgXF7Q84E92oIztmhMgbzni
         rtI3xmZa9mVs9ZYgCKnPwAz7nplMJsUAVGl0cHIIvwU5fZEwv7pc1T7CPxwWQAWrojji
         iWdRZvPHwttZGOnA7zrVelmkhtUrClAkb2zscf2et7OBnKWUS0WZ2if7K+dv+Whh7h3j
         D9WQ==
X-Gm-Message-State: AOJu0YwHWA5bCf5iMSFI+6XBaisbK3N5Y7IdEEyq5foXrvlIw1bnuRNR
	TvnezecIADP/gdQxkTpZ7G9w7Om6F7I05Fj3m67z8H3eMcQqmjtRUIXPkkXGOmwYdsOnyVVg/p1
	8I4FJdwResNCNS4ahCj65MoXjO4i0OfJ5D77dRP3nHba5kYi6eU8Htz8e8Vtsi429uQwE
X-Gm-Gg: ASbGnctsEyHDHoYJxq+8KXUqYHGy3XKDNpJtDSs8IJxiv7BPQGFEeyrjYD7B44vhxs2
	YAOALPvjtiKoS/chLCa2EDIDIgvAGhTUwRSRsTaxRygx6t/hVDO5sPln7yHeqRy3aah2+wXu+4t
	bngQ0RGi3YaWnp8DEDRkK3smAvrMNdR3iYfa8cXK92SW2jCcHNmm940AWfD2rUCgQp6XCfbMFZq
	w51dM2/97dP7KuKMyJtTDnCJbjtSQgfIlTAt2b5+/Q2UVlHJnd59cIl4czcw9/Mx0kkr82Szx7N
	RV5JiDlHEKMCL2WdNGwzqQSrakL6gqDKlYj646sMgAgx7Q1enSmLJvLpuyP+Y6uI4r6etOQ4fCe
	q5DXBn7poheo9Z2pedyoTAoh8P9/5qctsonKCSBqpsl1/B8XhkxNau3REvX4W
X-Received: by 2002:a17:903:b8d:b0:242:9bbc:c773 with SMTP id d9443c01a7336-2430d21de4cmr30253735ad.54.1755068140540;
        Tue, 12 Aug 2025 23:55:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjoz7s/dXHcA7mFMizX3dudhJwmJQlObOlwhL9SP3pNoUbNrgFVCMigCH22Xet8aYtZ6XYew==
X-Received: by 2002:a17:903:b8d:b0:242:9bbc:c773 with SMTP id d9443c01a7336-2430d21de4cmr30253325ad.54.1755068140008;
        Tue, 12 Aug 2025 23:55:40 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899aa1asm315958875ad.122.2025.08.12.23.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:55:39 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] pinctrl: qcom: Introduce Pinctrl for Glymur
Date: Wed, 13 Aug 2025 12:25:31 +0530
Message-Id: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX59k3EfFQUviC
 9cS2ivGt8hG4yvyLBeKEjdsWc7zNme5c0zInSRScZfP5d09jS2kBTlJ+vJxaSuY+3TPVHfZiXDS
 CnwWY6LGKx5aIhViEVGCElxz5yaIQJdlVBJBGiNx0qiRXL5i8DZFdX5ojJQ76+DTcai4fRHprbz
 EavFYF8o//Hdki16kQKWirqPx3+2tuvWjAQ+fYumjQsJmuIGQOf5D1g4vrlUmJ3y/NyqNy7QWrC
 6gvZYl9nHW5MpfccZhwhQEo5Icly7bfYX0eqETWrdGJTq6RHqKvY6j//vsxHgiF5QaS0tSxtxR5
 msTNec7f/neOyRXGjNrHErAOpEkbNj3pCALzVlacOqz5FjjPy/STOo1bGGGOh+39gR8YDTOkJy3
 aWdi4LJj
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c36ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=ne6LWfaJPpk26Hbpmm8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: sjARmhw7kRD5YqlFs3y6WCaoThVST2r2
X-Proofpoint-ORIG-GUID: sjARmhw7kRD5YqlFs3y6WCaoThVST2r2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Introduce Top Level Mode Multiplexer dt-binding and driver for
Qualcomm's next gen compute SoC - Glymur.
Device tree changes aren't part of this series and will be posted separately after the official announcement of the Glymur SoC

Changes in v5:
Rebased on top of v6.17-rc1
RESOUT_GPIO_N changed to lowercase in bindings and driver

Changes in v4:
Updated bindings to column length of 80 char

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

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml    |  133 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-glymur.c         | 1777 +++++++++++++++++
 4 files changed, 1921 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-glymur.c

-- 
2.34.1


