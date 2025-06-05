Return-Path: <linux-arm-msm+bounces-60316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B9ACF105
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 414561699BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 13:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC3025D8FC;
	Thu,  5 Jun 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIUsm2k1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B612405ED
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130998; cv=none; b=bX/6VWL0g6eXcXHXXgl8UXNkhXTMxu9ZSCkpXi7d2HJRux0fgioNdkvmLLq/4dUhgrqkmGBa+V2pCFtAZQLFkYKc0fS9GdQBOQnTj47ZgSM0yfgZsLoG8CmondzCZT1pv+h2bpDMoKv0POZyFpvGyh7DXXl5YbR0b9ttTVSCBGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130998; c=relaxed/simple;
	bh=VAZvVY4YvO4yZJam3Pqn64RyEqzAe5U0pqKB9Nl1xSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=op8ScG2QuzzMRpSKLUtAf5CHcoUnT/4KvW+GSm06mXs1m6MXztWUIJihpccCe9CEArzf5rPE0Va/5jziZw9+61g8x+rDf2oc1gPVYEjpFcrd8++kPqD8MzzVtrUg8ySz5xZ7HeglRtJwdXBbTcAeg7MEAYsQIXBwXoVsa8+4Jac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIUsm2k1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557DU9J006332
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 13:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4K1V7X0mjkkzCtjA8wOdUTAbcAITWxzAG6tod7BBZUY=; b=MIUsm2k1HDuWbw6f
	sj7bv4aDOBMkQ+Ez3x/M/tTYYfBEEbAT5bBFMO21tSQ7JhyhZ6iC5ecIW0AtissW
	z8JUiwtDgZmpbToEpPDpfLZ41NNNSWgwiUG4YJWWbaV1N0Ijp6nhoFpOuiuPMgDc
	KZpxTwiDSK9X2COW4bxzvpJiQU/B2n4LlhQjvFowmaWbORSkOds971IgwlsEwJw+
	wPJPINsuUCR204WNVntf+euhpOLjrOzZQS5+/eRAqOjgReQRbdSna9y1ZwEzEFAn
	1xexUOBZcISpREreDCUlu6KYY92MSzT83b72lxir0qeRL9KI03K6zWV4SPIyM+Gh
	oU/y/w==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1f52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 13:43:15 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-60d2dc0c4f8so1529826eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 06:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130994; x=1749735794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K1V7X0mjkkzCtjA8wOdUTAbcAITWxzAG6tod7BBZUY=;
        b=uFMGdWwKVyEvhO5KfuDjOJISMTimfphuqcB12DkF0UFTMQj2xlJ2LGFGkKdVsliM6F
         2BUnHN+SF7pX0hgtD6xDtCE6yIsDJi7K56cCIItvJhvR6g7Em9qCu03ymwmWh7uQslGx
         qAUztKuEg/sRTkcUNi0rdo5lALFZLyGR0oihkKl2GyiQ/CMFTONakruT2GsgKlFK692W
         EmHNeJyIi4OrWutL2CmYR62pgXU6AuDevf3RjC0e3DkeR+DA5L7TyYS9cgHC4/YREPCI
         asQgZmhITFLKzAQVtLXw5qAVKiiPf7nPfLB60SvC1KDIPmUpSqQCRnovcxr8kwd3QSPe
         cBJg==
X-Gm-Message-State: AOJu0YyfIWVdlBciMFUY2wkH4dVRId+LQ2kgWoaQodSZdzRoeOrpA9q1
	/wD1ikFVQQ/auVYP2EzDeY0WZhnhAA3N1PEMQdjMu86uHfJkAyidaQNWh+N3W5++WaP5lpUh9OJ
	3NsxEc6yaTsy0Ex+9VKwH7K42cnhi0UTcM+II4nWtZm9GnEh5ttko66JMGzw1XV145XX4
X-Gm-Gg: ASbGnct4X9yCkuuNXcWWmpZeM5H+eq9Qg5RwV5a1J4rzG+vfqLsg4534dExB1f7YENa
	1RdIXzS0HdDQoO2pEt0RC03YJ3w4+t3qd+q3pHh+ENAVWTKVE7BuksfdrFk4vXECdUW7U6CpROB
	qFlVHy9MDbxLkKdIFER7whalCwyHig7DsZIqkOES/E3gt3Oa+AOtgez6mw9i4iG8MgBrfDFpd3V
	O/FP1/e54stmt7DBM+IQYKoOTlYFItz5j08d4UH4DN1hVAcdLSBNdS86yTSzMf+53seb7mSqjrm
	Z8/ophrtyoUJwf5pk01G/sSsDLP6PNhg/i5oELbQyEwQS0jaApoHNIVEVD8hKM+ID1eegx8hWY6
	VXs64UEbRdbQ=
X-Received: by 2002:a05:6808:398c:b0:406:6875:3f0b with SMTP id 5614622812f47-408fab8b28cmr2811697b6e.7.1749130994483;
        Thu, 05 Jun 2025 06:43:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVO4JnGuwbYTanrmVGFuPGT0vXXaE6+r6I65XBXdCTONC7vN0Ig72qhyjwBB4WTSWBBcIaYw==
X-Received: by 2002:a05:6808:398c:b0:406:6875:3f0b with SMTP id 5614622812f47-408fab8b28cmr2811682b6e.7.1749130994131;
        Thu, 05 Jun 2025 06:43:14 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1eb719f8sm2691359eaf.28.2025.06.05.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:43:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 08:43:00 -0500
Subject: [PATCH 1/3] soc: qcom: mdt_loader: Ensure we don't read past the
 ELF header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-mdt-loader-validation-and-fixes-v1-1-29e22e7a82f4@oss.qualcomm.com>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2788;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=VAZvVY4YvO4yZJam3Pqn64RyEqzAe5U0pqKB9Nl1xSw=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoQZ7wAqUKHWx5c58KFtrNhi1WL9mDfy3fQItYg
 wVrzRnDtYiJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEGe8BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUXbBAAwnO6nb6pVq3Y8z20lFrjxXplNhoWbkPBK4mPuxS
 mBiFeoCsC1o5w0QkoFilM1m9PwsF7Q1rHWiuj8NtiGaCTMuCr2fCtjvbpBLKHOXmJFbkAMVCD7D
 nC3e12G080tmK1ytZ6YaUxLJ7KxSar5HOWZpgKwvl3etBpKuxBo9RE6fSnxDC9kCRSdPeFbfEVD
 NwUv3K2MLTNj2+GjpGlLR1CG/LMaPYvpS0D4l/AnpT1HDbk3HKHBN7aZ6iK4Iu/jZA+jSToqhe9
 pblCaTdLCAC8X055d7cOp1nLU9pNm/8TFwTi1LmudeICp5pGKYH4zJo6QEN2qf+8gNzfcOq+hL/
 wZamX32BWdgI02HDBboUgOkcZFbbI/2yN+wm5Lv2ruvxjVJPE6/56RoWTfrx+oMHwquibpuxI6k
 Zt4vH0tw3Bho12O71POPh8ct8pDn0pq2vIPMzWNpVQMt4/aM2oooRbi6JSDms5eHqwo1nSTLax8
 osnCuqfNfHfG0KOUTrOv2bV+89GjTV9jdAheC71M1OeyAwhm6qDHCw0bOICYD/EabT5k54HetG+
 22sQk1GgsfLmMWLtrhc+PDgBIEPQQo52IhFMZMtHUubaAVWlZWuhHcyFK8e4Pkyj6+LUl2lysav
 PCmHVzW0xXo2WLVV1FahABDuZnci9AEW5FbBxEhHY3qY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: rp5nSZiBex02q0L1d0Pt3FRM2bwHm-T8
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68419ef3 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=R2NP8FmM25b3pXeoK7YA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: rp5nSZiBex02q0L1d0Pt3FRM2bwHm-T8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDExNyBTYWx0ZWRfX7ETrYnH3AS1/
 SinSeTjDXONpamJ31c9tWJ4U/9qeCgT/Tzw5lK/YvJEL7WBHuUBuGQ38T0qr4hlT7sKbmIM4ZCm
 QWOPCaPTGYPPxluBPGYM0dDZbq9B+f2Lm1ByoWrfCtXKrnomLsvne7EwEiFbdr+1XQPJirDVwWo
 I+x3gKHeqwjHQIHEiSPDhbUlMvZKY/cazPAOYya2pu5LnY0+pmPCrJJ9STzzK1cDhz57iJKvjgV
 nivSKgHb45s6OV5IvX6QSo5fwvKaB3NZ2mR+2u33YuRNv5vc4kZbJWcqWoxGEED8XeRKn1nWSFY
 EotlP8tEdKtQPYMnbLZLgvwDJKVQub5a0+Lm154nJB+sfecp4BOlkot6PxZouFVVogHiWlejSY2
 bM+yHzpdDmJJZtO3Hb80XX8eQMVbbIbeUTZvjg0dfeTrIbwhdYjZDxtgK/wlB8TTAW01h46k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050117

When the MDT loader is used in remoteproc, the ELF header is sanitized
beforehand, but that's not necessary the case for other clients.

Validate the size of the firmware buffer to ensure that we don't read
past the end as we iterate over the header.

Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
Cc: <stable@vger.kernel.org>
Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..1da22b23d19d28678ec78cccdf8c328b50d3ffda 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -18,6 +18,31 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+static bool mdt_header_valid(const struct firmware *fw)
+{
+	const struct elf32_hdr *ehdr;
+	size_t phend;
+	size_t shend;
+
+	if (fw->size < sizeof(*ehdr))
+		return false;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+
+	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
+		return false;
+
+	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
+	if (phend > fw->size)
+		return false;
+
+	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
+	if (shend > fw->size)
+		return false;
+
+	return true;
+}
+
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
@@ -82,6 +107,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	phys_addr_t max_addr = 0;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -134,6 +162,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	ssize_t ret;
 	void *data;
 
+	if (!mdt_header_valid(fw))
+		return ERR_PTR(-EINVAL);
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -214,6 +245,9 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	int ret;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -310,6 +344,9 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!fw || !mem_region || !mem_phys || !mem_size)
 		return -EINVAL;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);

-- 
2.49.0


