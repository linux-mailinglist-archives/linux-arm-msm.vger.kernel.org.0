Return-Path: <linux-arm-msm+bounces-35614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE089AD2D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 19:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1CED1F21978
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 17:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968641D47CB;
	Wed, 23 Oct 2024 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBveir08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52681CF7D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 17:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704294; cv=none; b=uzrnnnz6+NAkYZlcji2JIjGcmPdcZUleQI8a7U/bA2hFxv1Fpb/I+Tb+QsxjpXDnqiQrn5Qp1e9OytkPseg0eYaV58u4mVY9MAyYD/irDzz5FWcdFr8slN4Npu7G+gSZm65BvlmSfLiNAhuDmEA0Q8/YUiFOvgPx3TZgkpGDnOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704294; c=relaxed/simple;
	bh=U4v5Y/G7x8rAFbNJdXFka7Vj359od3X3yavnuk1vbiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sFNxc5UF1aNDGVgLtEtFj6X28Bx4ANKXZpKqv9K1/nyJkcceeIxaHxoDZ0V0o1dglMEcN0457I2CGZ+3i1v5itPpNAdBfXs75F18yhuKs3MRS3NGJa1RxHfbiPpi1maiVKMgsq/qnQF7gweI0xLGFt2xgce42gzqZH+DAEer4hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBveir08; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9hTVg027437
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 17:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mno9KrzQKJKTjIihjuqQ9Y
	ntwHWD60qm3mU9BGPN5nQ=; b=mBveir08nW2gZclb/wkWGvXsrtgfwsWGtlli2D
	LOBxp58qE3gnZU7GdJf7u/DTONPGemhxp+itYUqNLhid+ynNAYe1i3sYKagZlOrp
	7n5/7LyS1tmeP6EE6SF35n/MpseD2+z6xqxfs7OeVKnvSuO7XWshJpTp9L4MnfCZ
	lU7ya0nuNI6fHV8dgh1PPk11n9GZ/JozF3O9O5wF+DjP+2yYI3CcR6lTnH6T60c/
	PT+cKvEhTVm+SjNQw04Izm3d12LnNUEomv3Lt0tvgp5L0jCEzKpLg2JUHJ2lTZjN
	Mn2SCPnPCpE5x4R3EjIA3OV5EFidm6FECrrirFhzbG/pQghw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41txky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 17:24:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-20e5ab8e022so64432465ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 10:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704289; x=1730309089;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mno9KrzQKJKTjIihjuqQ9YntwHWD60qm3mU9BGPN5nQ=;
        b=rXJrDlc/sKeiJs9DVwRTditOEZMFrvkoHBd4X3fUbJM2SrMwTzAU1X2wvnvffIWlQ8
         5Vlf0+9is8JVDWrRb+13AakEHkGx460Pr8nFyaveuUEAvLv3ypdWiLmpPgwZqXJCD8c6
         BmRLxxzzGJ7T+2tc2xH90ITnPj5HRcKHYWGcrEofoyac5UMJF9syCksCF0koju22XvMZ
         RPUZIWg1uY5S3d40ETLQioxFgyTLdtBArK5TrCnRDB+5z3ksJOM8djfXGqGuDg141jv8
         qZcKmSoP7GaUWJMoMpJ1lFElM6x64hyeML/8BsuwomKAaf77p6eW5KpujbuzsA9UVOeU
         1ZjQ==
X-Gm-Message-State: AOJu0YwmOp4gme7itjSKZJTWgGqPDaRf3ogTD5Go44zhMXMcboiFcRKy
	rYMxP9HX/Kn7t1LpWWeJTZmMsFgGmn+NvPxIh3j+oh7q2G8d0YWd2w2XEh2OQIlimodbMt8HhDl
	WU+NC1/7DXintt96sTGSG7AHx528r+NNZaETfSFODLPWohsnP/yO5s8xts1rS0Dv9
X-Received: by 2002:a17:902:ebc6:b0:20c:bf43:938e with SMTP id d9443c01a7336-20fa9e48c13mr44517015ad.15.1729704289358;
        Wed, 23 Oct 2024 10:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOb7RH4mVCzd3hO5LGTdD/S5DYEO8ShwtyV7Pt4jYRt2MyKdq+jWfXwYzzIyvy187RIklQgw==
X-Received: by 2002:a17:902:ebc6:b0:20c:bf43:938e with SMTP id d9443c01a7336-20fa9e48c13mr44516785ad.15.1729704289051;
        Wed, 23 Oct 2024 10:24:49 -0700 (PDT)
Received: from ip-172-31-25-79.us-west-2.compute.internal (ec2-35-81-238-112.us-west-2.compute.amazonaws.com. [35.81.238.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f20aesm59525435ad.246.2024.10.23.10.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:24:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: pmic_glink: Resolve failures to bring up
 pmic_glink
Date: Wed, 23 Oct 2024 17:24:31 +0000
Message-Id: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8xGWcC/4WNQQ6CMBBFr0JmbUkpqNSV9zAsmmGAiaXFVomG9
 O5WLuDmJ+8n//0NIgWmCJdig0ArR/YugzoUgJNxIwnuM4OSqqmkUmKZGcVo2d0FoXFI1lIv+lZ
 ro9HI+thC3i6BBn7v3luXeeL49OGz36zVr/1nXCshhSZ1GvDckDT11cdYPl7Gop/nMgd0KaUvx
 zArfMEAAAA=
X-Change-ID: 20241022-pmic-glink-ecancelled-d899a9ca0358
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729704288; l=1360;
 i=bjorn.andersson@oss.qualcomm.com; s=20241022; h=from:subject:message-id;
 bh=U4v5Y/G7x8rAFbNJdXFka7Vj359od3X3yavnuk1vbiw=;
 b=GJDBjnlTINnOBoJT/HKq4YIR9JqusN4gChA8GeKG19LwHO2qPvjwTGdF670QW+HnZEBwge2DJ
 TJ+VDZ9ls94Asggf33Mr3OcvNXkSm4o7mVU3wMk9vzU4hR2l4b6NRJ9
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=SAhIzN2NcG7kdNPq3QMED+Agjgc2IyfGAldevLwbJnU=
X-Proofpoint-GUID: QQ-HLomy-yQtYPuLwnMZNkUBiP-pbrqw
X-Proofpoint-ORIG-GUID: QQ-HLomy-yQtYPuLwnMZNkUBiP-pbrqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230109

With the transition of pd-mapper into the kernel, the timing was altered
such that on some targets the initial rpmsg_send() requests from
pmic_glink clients would be attempted before the firmware had announced
intents, and the firmware reject intent requests.

Fix this

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Introduced "intents" and fixed a few spelling mistakes in the commit
  message of patch 1
- Cleaned up log snippet in commit message of patch 2, added battery
  manager log
- Changed the arbitrary 10 second timeout to 5... Ought to be enough for
  anybody.
- Added a small sleep in the send-loop in patch 2, and by that
  refactored the loop completely.
- Link to v1: https://lore.kernel.org/r/20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com

---
Bjorn Andersson (2):
      rpmsg: glink: Handle rejected intent request better
      soc: qcom: pmic_glink: Handle GLINK intent allocation rejections

 drivers/rpmsg/qcom_glink_native.c | 10 +++++++---
 drivers/soc/qcom/pmic_glink.c     | 25 ++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 6 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241022-pmic-glink-ecancelled-d899a9ca0358

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


