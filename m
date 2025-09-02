Return-Path: <linux-arm-msm+bounces-71657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA9B40A3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2C13B0E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421C232A815;
	Tue,  2 Sep 2025 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyGN9vCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B1305078
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829555; cv=none; b=d5CXJGOyT6We3s+Gl8dIhzmbCY54Q0KC+rno8XqnxkV81Nz50kmTxpIXLNbbq3l5ygOidTrp82IELaPxXW9RYQS2fvI8iIffnontzUcunBfxGi46F4NmV8AwNIcNcVrXaZ1IC4mXSE2Fvdu4Joxah27PuYxD91mKB4dxFLsyRr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829555; c=relaxed/simple;
	bh=w0Kq4jOT9R/r/z54ndWpSHo728vt3p4ibQdpqzGd6k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cNnXqbvOV+A9svsOv+6Gr/JVd+zrd4ECOCHfFl3uP04CnWEXjLLa9IOiwGVjFHJz5mMmHsGEn/9OqHxZEayecvgixEkgvS6v6+yADHzzCSNXaqsubiTPqJDtY52dTvL1Ntv8+y2ALaE09ofLjhR6EN12s5/iWTOgjMaupT/U9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyGN9vCG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqEWh023514
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 16:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/9Uanp3j0KL9tdEjt1NNukFKdRWHcJUc2LH
	ujZNriNo=; b=IyGN9vCGtN6KjJbJQ0LwGeAHzp3TnKJRxE2Xx3k+uDFdPoayE9f
	LTFzQ92//XUXD1hW/F5Q+LJCfL2Lv6espDRt5uwoO2i9XeRWa1VOmMZbd5cMwVIe
	SiHXIeTJvDHWwkb8vipHsBOoK3i+gFg59frRdU1blUlLStcIrXlU8qs7jGrwouzm
	gLxRscI2tI3OEPx/4SX8Nrk2R7IYbnkbUEyT/Mjo3onuo9L3aLfCeK0u+uE5g+dD
	RIS5H3SnfYn7eGAwzbN2/c3gj6539JnwDuNLjgQvFw8iiKXJzAiHtW4BJT42TxN1
	SJ5mGQ/LnW1kEH0FEifOrfOXykiCi2Brykw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp8m9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 16:12:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5449c8c855cso3710462e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829550; x=1757434350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9Uanp3j0KL9tdEjt1NNukFKdRWHcJUc2LHujZNriNo=;
        b=UYjeoDT2msxFK2ZfPfxmL1j/Uph62bJ2AripXDDjvVhuDURxxQj+ZubzoPrHS6Sedo
         XdIb4srONNPPTsl0bvMduU/f7bRkKWfzZh4GfEMFrRidmDtf0iWksvexmQRDAhoY55+o
         cIQH77XDPnaK/Od8zqVOdUeIZuO+ZUb+McFjF2ZSSvQ2dXjOKQ0OMIV/jN2EJ8dh8Tna
         3V7/blWkora/qiCDMJ+JpCN3CtNiyc+KviwdD2QnQcYSxjqjh0BhdHpFo8n8eQkotBOf
         D6eMaRZ8mHJyHz4Y/6m7tRJJU9YKwDaJawfq8rJnuuHoSWzGjopkazcSSL1DC4KabY8i
         +Z9w==
X-Forwarded-Encrypted: i=1; AJvYcCXR7+nTvBOGEsUlzUA4xy7tAF6Rn3CoTBuIqzihli+3w1uNcF2RSi41pQERd0Y3Rg2ovER/6Pci1CsPcjv+@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMiwwlwXxkqX3CI7dUgd6xId0ZUNbcRJ7U1lAPNwMwJS3V7Ok
	PLZQBH3xXg+Eqni9bDeBBGKR+2AMk2s4fbTOv6YYok3ae18pai6PAu2HUapQ0oSyeKSMWZMx5W3
	xsIxRgpQ0WU/2PMTe+k3SoHFFe1oBBjmLeXsWedSEs4m0P3QWpR5cLpmSPCjD3FvDwWZL
X-Gm-Gg: ASbGncsBcyRnRi8wo9KE2Eny0D7CDx9o8ULMjHINp+v8QZDyNmUnQfzCGf4/j8jFnWV
	y1vIhSxag10BtWOssbGHz0ScjrU16OckZI2eIJNf46n+Z/YVJeEA/z0KgAf/I+OLRdNXSQrCGTt
	aEBgR+dgXTMIXwUVAf1kg8kaVf479RPwOFov/r0QjtgIyLr4MFLN4rYjqxgV9MTnu2waHLeNdlI
	IlmT7ZVAXJshCcpXGbXYzykqvDCPhcrxY+pKjiLc3DZbu32ydjpvNUK1omQ1N+Nfi2aTfCgcf0i
	86pbVKt3dNgEiaSpATg4HgcqjgbfCgv9YdCJh429Wm2GHcJyaHzpRw==
X-Received: by 2002:a05:6122:1350:b0:544:6eb7:d7c5 with SMTP id 71dfb90a1353d-544a0187a95mr3685737e0c.6.1756829550464;
        Tue, 02 Sep 2025 09:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM3vRwfPIV8V0hlmG1KA1rjX80E1m1clCk6mQUXwD0mRnXeSdFwzJVJAbKxGaDISecgb5Kbw==
X-Received: by 2002:a05:6122:1350:b0:544:6eb7:d7c5 with SMTP id 71dfb90a1353d-544a0187a95mr3685721e0c.6.1756829549919;
        Tue, 02 Sep 2025 09:12:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/7] soundwire: qcom: add support for v3.1.0 controller
Date: Tue,  2 Sep 2025 17:11:49 +0100
Message-ID: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UvMNv5EJf9-tKMaR81I7bXTglL1bBk1N
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b7176f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: UvMNv5EJf9-tKMaR81I7bXTglL1bBk1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6J87+b7htAxt
 UKec7ed9xCLFhetwYlkQazAyL/AamLjCTwsCS+nWfN/m6lb31VjPPGYH/0kC+4gnob55L0IILIz
 aZsCqAsv8HFGF+x8V5KzAQ8npTolDl4JoXaZI0GDTBIND7U/4BC0Hqdn7vgffK9RrCcU+uy5zhP
 uzBVogGP4xpgwb0E0uBXG5UeIcToDB/9e4ZvFtiWZ9HpAXc1IsiDeFnAmSjXY/sSbw4/7Bny7g/
 UXgh1toooajfoPfTOWxBp1AiwaO7ZXAArLG2hl5YKLjr/AceOz4Na8sTVC48d/EdVZZBhMvKGs3
 3oLG8FtpBAbsqunGSQ3WGeSRJfrVpjmrClnvt11/7eescuzOv+7xNMektE72+aXTid41jObkJan
 vvhYj+sI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on X14s and Glymur reference platform.

Thanks,
Srini

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


