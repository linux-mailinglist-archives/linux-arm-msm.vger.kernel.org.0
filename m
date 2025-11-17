Return-Path: <linux-arm-msm+bounces-82014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54AC62566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5E094E1A56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76882367BA;
	Mon, 17 Nov 2025 04:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1xyaI9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BD1D677/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A8265CA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355088; cv=none; b=MdY/5kgixYi/uDwqjpGTSxKzwJ+j7iI+KCJ9a/K30ROEQIDsjNMief5PVoyvUevmQRgKT7s5U/L3HStN8MS1l/tVXWTRUJh0L8aGhG5Vu7PPUw7H7bBCl042NO8SZoFxcb+jl8vZX2k/faWnFJu3aE2fmIpN+771iKCVzIvfXqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355088; c=relaxed/simple;
	bh=uRTzWh4VyKIBFHAMDH6XEqRD1s0MMZ+IqI+06Dn+cx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TCKpsn8tP2gWWMYoVtXGO7p8PTczfb9Zy8ejnCLQehQK3uT3U01WMNYb3RUQdKmmxMbbSbqIKv7taFT5v+JqP9dTqUJe/pn1E4Dv+cNnVven+tOt0idAU1UMkZ+oaqAabR/Si1gAIUPaXIqvEkGN8PLwZh/nxkHZs+uIp68SVmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1xyaI9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BD1D677/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4p6o73192130
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n9CUKQK/VxWxkVIJHBfoXQ
	zZGcjXJGaOakjMZc+JPCM=; b=k1xyaI9J0RhGGmiPw3uyulPUSSt80eqyJuH8fC
	9xJZuBcLMBb37pHWTrTBYlGwOLNsdc676WSsvNj1ZlrbVlmdBgGGSSFO1vpw+2Qs
	qKQscgFd/cdkSEXIFq4wpv2blDG4YDDzd6fwMWvSmMUNMlcYwAa+RGQ8PnCqsx39
	aAHl5Iqj8Wu8Sm5v+uA0yRUIOCrI+rCIm3m/9FBvLtm4/I0jQHYQM+gb6qg2VEgq
	yWvolQdpx/TqsbeUmVZvqXl75Z3Ja7pFRZFUjxgOBl7lfaYwYErpsehPE0voWZ0s
	fCeu6fMqnucUjAMxFIi0SLf+DP815jmGvK0FOLm7G0xOivfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkmbc93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29845b18d1aso61246725ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355085; x=1763959885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9CUKQK/VxWxkVIJHBfoXQzZGcjXJGaOakjMZc+JPCM=;
        b=BD1D677/RshVrgn7kFT8BmzSYFhpRfbTIVaWEexGEvYr9NCTlFyfQbU5E3SyDegHRN
         bOZ1GpD3PXczSraAFU8bZTbJeK5XQ2gJhNHFZlTngTRBSoMTIlYuPW7oLqUg35yDSYR+
         fXKqlyltdj4wIOHTLzfZ63ceIaHnLnl0F3l/olm8ciALUeJvuTsEA+KH5qDcygNjDDCO
         PKdQRG843o9Locgm3uvl7cEEm9kOgMjGX0LfP7+LMHMCBNRm9QgwM3jCsWc8JnTpWDND
         3/ZhAI4F9NoRudol2/xrzKQT7REkSKSvoLzR1L4N4QEusOrpaQhw79RtoMEazdx9u6km
         dfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355085; x=1763959885;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9CUKQK/VxWxkVIJHBfoXQzZGcjXJGaOakjMZc+JPCM=;
        b=HMTrwmHstZBF43aMzWPiFBdOxtscwxeZoKTY1gmojlj6tY+QrSNGj31PEH27XZsv1+
         QsJi+JRk10eD+3XGRdMRXkON8zsCM2EKWRw9gB2DF4DNkn6F935hoiOUTf31p6O6FY4F
         7eHo6skw9QwfmG7J6mJlK6tzTSVSTaUYJK2DlXltQgLeBfJHmampVPyUBsiYX1rLAK0K
         EdOX45xnPKBfLoGbFNucL/3K62tv6rqHIb8l5yIDEn4Ir5GigtWKHJ4aWGZusJE9rwn+
         wxhb+Eqomn+YcMqGarmx6WJ3riKZv7TKj9vVwHiR8d3s6gWORNSqxAeBG3RedFi+PZa2
         Kryg==
X-Gm-Message-State: AOJu0Yz5qdDqzgUa8gC4ZUePQcFRSW48cu1wKTCFc5s7iKIid2lfL28u
	SZ/op1Wb1+oTdD/WWSWQr3Uz1Qdaol/91G/le/k4AcOhKEGw5C4qfFT3qnbPXhn6ZScYkCFxeeX
	TgXmWRkxcPSnYZjnfrCtABK3L5aVd3tW3xf0UgA1a9J7279rX6//nE98ETvNZRfBpxhzo
X-Gm-Gg: ASbGncvVmGOCNxrZ44eIyKuvwoYruSA5VWnDC7vDEDbLUVCF87fek5o6Xjj3EXC5jAK
	HazCp0zhNocunqk3Xf4sfhhJfsOmd3o388ynzqGtz+E0+j/7DJKR3w1xOOiUZhN9+0VU5duRz8Y
	jisAXWSzwZHpeX6MKecOp7LY59hMzAJ0CktPALccuMkRCM6lzZJTlPCdGoPEFO+7EFDMK7xyPD/
	FpaT1QIRc2ny/DxUXIJT1A8EMMTAq8umQ75Z+XlIwx34u1Gfj4/h2UQt6ZaNrLzjtbDbMulTbkc
	yxOxlF7GPMsJxYiePaHmMHkTSQ3FTTuv/9ti54O4loc++DMGJbVoZle7jbIKO9vbrzsqe3mWTi7
	9Wesvl+U3cOTOQ4nZ2G/U2P2wd/A9+LrIfoMngZyFqZooLGw2PV4msTymPM07GGGpyqb8u1e77i
	CG4XvjQx8xGYjaOo08CIpBq1KwXpPoYZbvAjOdsH0MXTGV
X-Received: by 2002:a17:902:f70c:b0:298:3e3a:ae6 with SMTP id d9443c01a7336-2986a7420f6mr130051945ad.48.1763355084861;
        Sun, 16 Nov 2025 20:51:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM0Lzvar6zHQxFbYqouBd2+U1RduLlOAmGFXXihpWIKQekxNF51nGem81lDU7QnJF0j+9UJg==
X-Received: by 2002:a17:902:f70c:b0:298:3e3a:ae6 with SMTP id d9443c01a7336-2986a7420f6mr130051785ad.48.1763355084421;
        Sun, 16 Nov 2025 20:51:24 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:23 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 00/10] soc: qcom: Use __cleanup() for device_node pointers
Date: Mon, 17 Nov 2025 10:21:19 +0530
Message-Id: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMepGmkC/x3MQQqAIBBA0avErBOa1IiuEhGlUw2EiWYE0d2Tl
 m/x/wORAlOErngg0MWRD5eBZQFmm9xKgm021FWtEVEJs9Pkkh/dYWn06RSz1GikatpZS8iZD7T
 w/S/74X0/Ej3lKGIAAAA=
X-Change-ID: 20251114-cleanup_node_put-b351c3468b53
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1732;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=uRTzWh4VyKIBFHAMDH6XEqRD1s0MMZ+IqI+06Dn+cx0=;
 b=K90GTscTX2SUsbH9eCdYbq0Q64Itapy/cnZkb48iFCqErEGPUsd1IjbIRY5Rh6uycd47/wBnp
 icKLJyjYxQ+DYG9FsddD0ZszsshkOJDnSojHVUOItpR3VFu5aRuc4vt
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 9BCXfVwOswmt3LIdj0Ymt0hxPOOU40Jx
X-Authority-Analysis: v=2.4 cv=N6ok1m9B c=1 sm=1 tr=0 ts=691aa9cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rT7ipPLc49FcwTWuG9MA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfXy2JrkvJnAv0N
 PYpYlSDUkBJiqvkgXe7QU26BgdN0Htn0UyGLXbSpM3t2VeF2gwdvj7Ojsyugse5WQVJdOk+NyuH
 jdoWPUFBEgZaSZdgo2zFm6DM5ga/aiAlqh79FR4EcDFkBEY5Nlb5eraUduy4yWqYEFe8Xv63pcM
 YpFxTd4Jm8AfFgE3CkBoPXLh/iN65drtzRMxXBTuZ+Cqowki+2s+ED/zsvEO4JVuNPOz+V4ijXp
 kKWV1SmoxE9v4rK1hPi4p1Xb5n4So7MJmlYZLNP7mQ/6kkrIWrg9UK0EV0gytv136eWrZ6u6LoL
 AIx/fgxPTEChGewfSB+p5T6w6nQo3m0fxD603Ff77aV8ouACzJtTDAnAK7b2rxGIPdAKEUBQAA2
 /B7AYvT7Zq2gtsu7I6tuZB6bItzBPg==
X-Proofpoint-GUID: 9BCXfVwOswmt3LIdj0Ymt0hxPOOU40Jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

This trivial series replaces remaining explicit of_node_put() calls by
using the __cleanup() attribute on device_node pointers to simplify the
code and make it consistent throughout drivers/soc/qcom/.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (10):
      soc: qcom: aoss: Use __cleanup() for device_node pointers
      soc: qcom: gsbi: Use __cleanup() for device_node pointers
      soc: qcom: pd-mapper: Use __cleanup() for device_node pointers
      soc: qcom: rpm-proc: Use __cleanup() for device_node pointers
      soc: qcom: rpm_master_stats: Use __cleanup() for device_node pointers
      soc: qcom: smem: Use __cleanup() for device_node pointers
      soc: qcom: smp2p: Use __cleanup() for device_node pointers
      soc: qcom: smsm: Use __cleanup() for device_node pointers
      soc: qcom: spm: Use __cleanup() for device_node pointers
      soc: qcom: ubwc: Use __cleanup() for device_node pointers

 drivers/soc/qcom/qcom_aoss.c        |  3 +--
 drivers/soc/qcom/qcom_gsbi.c        |  3 +--
 drivers/soc/qcom/qcom_pd_mapper.c   |  3 +--
 drivers/soc/qcom/rpm-proc.c         |  3 +--
 drivers/soc/qcom/rpm_master_stats.c |  3 +--
 drivers/soc/qcom/smem.c             |  3 +--
 drivers/soc/qcom/smp2p.c            |  3 +--
 drivers/soc/qcom/smsm.c             | 10 +++-------
 drivers/soc/qcom/spm.c              |  5 ++---
 drivers/soc/qcom/ubwc_config.c      |  3 +--
 10 files changed, 13 insertions(+), 26 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251114-cleanup_node_put-b351c3468b53

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


