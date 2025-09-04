Return-Path: <linux-arm-msm+bounces-72026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2729B43953
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64FBF177626
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA0C2FAC10;
	Thu,  4 Sep 2025 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHxejNhQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032B2EE294
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983407; cv=none; b=LFh+urtWSMzGxQCfdbAbrydLWCXi5NRkY/+H5ppLLm8BKwGk9NpvZjmzjiU6nvDPMO3rZzNhYGbfQUg5V9gh4AXjWS86dKP4swcMiPaL0MYMmD42SBBriboHjiZlYQacPRYPiRJOf//kzl1VsraUkqP0gJqaVaAMtp9wgkq0jKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983407; c=relaxed/simple;
	bh=ZJI+yu3kb9pKBhFXII4xHvYnh1LrQ0VBRlmlVCuUT2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=souGpOZtmsJE4jzqq9hM6deDjWd1oYaqIE9xKOfujVCslMxHj3T9QFmkxBebUSYpIgiOfSvtZx1ivlRxD6IcrDPp9m2b4CjzywkKTtBZfIu+T6N6Bhabem/9h5dRNgSoC3HWcLvx/aOXrnw6m8BgrCV2FHAUjhTvvpDV9pp++vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHxejNhQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XBcM013631
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JrOHsVLgG7Xc8r3NOkyT0zafNDJIi5as62e
	4i26U5Ok=; b=cHxejNhQD786Sn2xrL0HtH+k1/yWMLzFZqVWafuUHPWLe5P1dG0
	IzqGnJEteqyT9fzzHFYrKG68E5v7QSH4/aGV0nKj9mQXHpioOMYtE2VAW4okJQht
	7kN7RqSHex9RAwKe8SH4CHjnJRvkkJFDg9zqbfRxN5elX4Ndz+EK9C+LVqpjMlYz
	iyUhw5F9q/u8oNBpp37CWB7KAmoIQMWqVNSSpS2zp1sgb5QYarCUI4DZmcTdbnqz
	bdZoISna4ssldB+0DSi72FtUjlB876gPjL4PvUi5S3DREchPZmpXFe8I4Uxzlcl1
	Jjn6mIbpQPcpnNzUSisCuaAGHs3lgDBUTYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyb46x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:56:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-725d32eaa99so19685546d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983404; x=1757588204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrOHsVLgG7Xc8r3NOkyT0zafNDJIi5as62e4i26U5Ok=;
        b=k8SITMYI9JIg4edfg49012hb6P86HShd/o9nHzXa1kh0LlfU1E3GkisMcvl0AlhkPy
         MtdIl6PLtGZZtlLhPfQjl+AhQ6dIk27zqb0I31WzGwio7Qs8wmjy+9+CVsJhOsqxZk9s
         WBe10pgFAtotf8Q2pzt2YgbJTZ5i3RD19odMy5nKcJNCooUD2Z0FMp/86Dr6l6USsRGb
         G+l6IdyttrGLZm3gyRR4EhaxIbbNaFnSdpTAxZQq2b5S9GrEGNebQth7YppWNXjcfSkQ
         VZ8jbSSB2DqN/XzUjOVqQZczatDmFMV7vjy5kVVRT4CJS9ojWiWk5Ig2Fo9br2lN5emP
         oiRw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/VQ4InROweaBhgbeLE4/zQCIammy3GIRDAZklW5Kr42y6figlozcy0wAVLMf9KrXOb/vy3hNqHAQOjuV@vger.kernel.org
X-Gm-Message-State: AOJu0YzQE6FXOoaLoXjbTZ+4VB0g3+rZS1mUIHluTypdsYWPmRSUq7iq
	GbFopuVA1C5gdW8K9CFpGBqxupx6BjbMcTcaUa394LHlqmSd0ceb445HJnOeR5FT5qGT0xmUbon
	Jg4RzprFXKJkLuvX7UKclWDcNBluYwRKXkpwQND7nrNAvysgbND4rH2m2OZ1DyuJwV7HO
X-Gm-Gg: ASbGncvypkkSvPCf8CAq4z5C5KqgvYXVJoklhSD7ByXFWl+cqj+ZEYer97d0TmogmL9
	GXQKyrK4w8dY3/ZqgXvaO07oP1mNmiqmDu1QV7FbTDF1QH7VsYcKIhpkus9J3HBbcPgsPHQStoI
	yOD+9ouwX8hgqR6AC70wUEjTKQLWx//54kkAGPDKezQqPmhdIWgc14i6+doJ/wXkq4BPqHEoblb
	be2XNMKXHRKTJSFuKzPT4Afc0Pe7He5LnaGGozFTJx0t1Jr/KB97WpmN+DcWoTM5ydfKQfVwJnj
	gTzZN8rY5yZKU2uMWrW7728wmta8SPHdrSZEDBOjednUOkeGTo30wA==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id 6a1803df08f44-716856c0613mr178623966d6.43.1756983404187;
        Thu, 04 Sep 2025 03:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEETHs6hBI1fqkOKuJVgfies5p/ujrhSYMuRzN1b+j0JOrWTlVQdXIxWN3WRoiEoZZ1+Lc2hQ==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id 6a1803df08f44-716856c0613mr178618556d6.43.1756983392680;
        Thu, 04 Sep 2025 03:56:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/7] soundwire: qcom: add support for v3.1.0
Date: Thu,  4 Sep 2025 11:56:09 +0100
Message-ID: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9706d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ZgzH3z7kRrSCrO-wlN5WSFxDQ0liAyQb
X-Proofpoint-ORIG-GUID: ZgzH3z7kRrSCrO-wlN5WSFxDQ0liAyQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX/UiGO5HFxd83
 vReksTB+AFprjL5hP9THcVSWVMn+930ofFkR7sPsv2i5ttt2IYaTGfz2+r2sRahwxXG5UYg7kye
 s8bXW11mFhgN8oRF4O9nK7RvHVe/CfidNxwxwK4qwn4ApufThLTk5D8ZPh1AR0GOhsZnxg6qBqY
 BqfxZarTvBPwz25hO25pOuPZhF9U7LbcTOdrQ8iy662UL5GBAAE8dDNSX/R44cIpNOqF3PExjFT
 JIjNY+KVot8hccXqKU92hCu+Nz143PVLnqCDG46YeIwNlndi0sYS7LvuAwrZ/nlI1A0jeC5kPsV
 snkQPL/6zVgOgG3JqNnKt240PZBnfF/I8bXH69Vno8KFU2PnE9zDWbZjFTi1fyQRiNug9yxZYsu
 eSKp11ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on X14s and Glymur reference platform.

Merge strategy:

I think the patches can go via soundwire tree given that Rob has
provided Reviewed-by on the of_property patch.
Vinod are you okay with this?


Thanks,
Srini

Changes since v2:
	- updated of_property_read_u8_index to use index of u8 array
	  instead of pointer as suggested by Rob H.
Changes since v1:
	- fixed typo in non OF config of of_property_read_u8_index
	- adjusted scoped-based cleanup initalization.
	- remove unused macros.

Srinivas Kandagatla (7):
  of: base: Add of_property_read_u8_index
  soundwire: qcom: remove unused rd_fifo_depth
  dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: prepare for v3.x
  dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
  soundwire: qcom: adding support for v3.1.0

 .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
 drivers/of/property.c                         |  33 +++
 drivers/soundwire/qcom.c                      | 249 ++++++++++--------
 include/linux/of.h                            |   9 +
 4 files changed, 185 insertions(+), 114 deletions(-)

-- 
2.50.0


