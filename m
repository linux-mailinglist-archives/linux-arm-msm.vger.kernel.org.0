Return-Path: <linux-arm-msm+bounces-60895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA49AD4909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 04:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C012E189A689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 02:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA010225A39;
	Wed, 11 Jun 2025 02:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcbO4tcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0E0225416
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610722; cv=none; b=pSLjcuYr/PAh8GJaT0TkdbyHUbkCPyeF3ebsFG1b125JHLu0FXlXvlbdsRI/JZIEiGE6B2ENDIIywGbcyYVImz8PxpQOytJ9h/Z2sZd2ncHXnvwSWcd+opBdC/UhNN8IrR0KcJcTWV54OGcdFQYROR22eh7WN/bGu8+h1ma26vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610722; c=relaxed/simple;
	bh=DJn9NYHqZgqnTw4yMsPNWysi1jIuh/SNHNWMy4qhxPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ds6YnI/svlldqfX74PjMEUfFQW9UgwK33JWWUxhTvj+4HZT4uGtD/N5Aqom+R2keKaIKx7isZ/2fgnBbmQaq8r1H2q7J7kYOkV2jfWO7ENbGjjM8mqtwcafM6GSGHY0kvh3CVawFpbX/P7zqT06Sb0xvk3D12l+w5MzFX7685bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcbO4tcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AKjV5I011519
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHqKWedYyr0OY6wJ10igxBdQqHVIA6btUlkeWEdA34E=; b=mcbO4tcQ5e+IxFIi
	2gII1o93SHjYQi4LJQzxEWpyqyQqWH0nUZfaUZYYSSmhw5pNopJeC4GAFF+a/PWj
	fi57u1GCEUYhHAu0APylj2TrK9iX3f2WbzLhnzmUShBCzxU5+WHzNC1bmGK12qcv
	eE+q+I4cUIvPdlZzcsojVtU2RdCw/E5jfj60ZR9mybF5RT0dt54e+Qf5EHEbgZe7
	1HizZJ4AiZki5rWTPN64Gi5gleUFv7qhxdRW+BjTN+Lmo06MDFVs8OdIrJR+5gnb
	1kZepFjQds2c2/C8lb/xwjm4/dUtMMk0tB4hzJawohpIbHMniQabmyV7EkmlrRxI
	pZi67A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6bf52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e9339232ecso1391087fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610719; x=1750215519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHqKWedYyr0OY6wJ10igxBdQqHVIA6btUlkeWEdA34E=;
        b=o/8EEF0hpErwF0KLGl97Q/5Or/NF99u6/nxym4bJKLdbiupl1qvdakfrXOXzq7M0Il
         oyC6zcIXyNHC2oT4WX6x58O7Qw+orFVplzufzYjBtpgz+M3p3n7tih4qiZmzpvTqfXBG
         ZJDSStSBQaLaYxPhzSoemm/EEdGGbleIa8k6vh6Nl4SdWHLgBOPc5xSP7K6TB1L1sSeh
         bW3321awBGMrBnK3nhQTVCl7VlZZ4DPymZmzUwJb7JMwYIsZTtiV5nod/j/jsu201kQZ
         FNU0wSMHK87xLmwu1OXmKanQnvXw8gIsADK19gaDXOc4s7BU6oFUqKkX5Rs8jNvBpQTu
         +1tA==
X-Gm-Message-State: AOJu0YxQ5cLIqbKzHxEE3QHHq550DAV5AmGiKmzgx03W63y4akqsZI6/
	UfKXGDRLRu2DR9ihZwXdClKdpbJ6eLNLPjs2q+q/N0U9CmXv+NhYLfTn4i9LS1RU0ZAXMESnZ1T
	6Nt7Fpa1AtArenIlOFeUlMVJRoXZglE8H++h8hUZ8fWLs2ZNGfX2jCBK1E92G0VKpp0aM
X-Gm-Gg: ASbGncsJMTcWhoZrhnT7bSAj0D82Bhjo6QtlbCJBG2aHSJfqivdiWvElp7qRQ94rzP6
	lwUO0EC4Vaah1jxq4smaTwhvVMG1alpK9Gtppl9GbIbM379cgs2WhqjVT/pzjUfOE/eLDKKG1HW
	QGsOxLmWghz3SGMYBeoeatg/F9dTfCCz/K2EtMMKM08xGqNWCpTrq86T2EbvCicKRhakUYVEbBM
	V/E8UgSAXw4bksUkiNPZKPDc0rcDk7G/iCeqTSL70D9xX8ZJwWjj1Rm3PL1aJPEZNaMR4sMQZG9
	xRLnPV3aBOLGYRvCS0qqxyXoHAOnqHEOGt1eUebbcJuqlZ8KKUWHuc7BC9Ana6dJjHgCVyE3LUv
	QKkXc/gJ4X6gGap28n2qIXQ==
X-Received: by 2002:a05:6871:230d:b0:2d6:6633:463a with SMTP id 586e51a60fabf-2ea99630c12mr729393fac.8.1749610718961;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLQcilCJwRVztlhp6Tq1XQRDSfon5wVImIcFPTKlDGIIDnxnp7kRLq0y9C6AdKmJ0vdJFaQ==
X-Received: by 2002:a05:6871:230d:b0:2d6:6633:463a with SMTP id 586e51a60fabf-2ea99630c12mr729379fac.8.1749610718647;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:28 -0500
Subject: [PATCH v2 1/3] soc: qcom: mdt_loader: Ensure we don't read past
 the ELF header
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=DJn9NYHqZgqnTw4yMsPNWysi1jIuh/SNHNWMy4qhxPQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDcWMhl8PNhEUSpN0/Q5gk8VSK6rZb/VYHEr
 OGbXJKHVbmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXRow//XIVlajDg/QB4/Ejz8xnsC13HZRwJw6RFbDmviPK
 9+M9T+oSd0oJELF+cVbPGfvsPyDgHgQuWQbnHIi4N4rMhtY0Lvfcm5NJelfBet4oJfwckF8fiyR
 LX9ez77SqzOHBBrWoSOMxQBz/IrB4b/30n0oV3Fkf2GnsgFnbaMU/PImMJirh7hMkfAhxo0pRJx
 7bzA4D2iwOpO3+d7cB8WP7rwyU7QaMngZ2YSElK/cKD2c4kfZav+1KeSwQJRi1sHncuE9+qQXpw
 YuU44pAk4BDRZOPktAt0+vkSdaYRijoE2Dw+JaBj4az0ZZPgbmkgJu5wviMEdlI/gi2J7PLeeJM
 CerjSJEmHdAJii3IvdU953ABtk70tL0FYrgGL5jIUpGDV4+9msLY6NyZdXUmJD5QIDQtQb/wMSg
 nOk1VsbsqPyd1Ud9u8cmB8T29tqTbaCn3L4XUu2yg2LVs/n4xKpdn44cgjrVYYNpqo0GrytATQL
 lX9ROm5A4TopngVk6nT/5257bw7RpMNNZGly1r/J1Bv1TCAYWc4JujZ+c4P72wSDmSgkyKn37gI
 QJU+aJ1k29rR7q8ACOmDdk+t8bTSyf77YA1/g5bNlYXBDD64Lcn1RzVd0yWOY/i3R+zVRzc08lE
 4aEzqmNwJtZ2ftWHoX5/8+FYqiUpTmJJPKe4eS87JI+M=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX7vJ0GxV/Q8fm
 bmbfFctGBVnBqNWXmTt0Ek5PFHC7rcxT1saOzG89B+lEw4bi5EpXP9vfsklGO8E1uoz5kB0sCBL
 cHrca0/3EyUVY5nWQuvXoNIaTLoTcK1CGv+xxELqs15V9wdGIsHo5J6wcxgqPk35L5bUxUpl1Ca
 NIl0Ji+PUE4Ghmhkifk4WRjwjeY0/ZE/hlJb60OBKjN1dm3lglKKXZHpbipFaVoS2O7bsFsyJf8
 Y4o4U5UKb+24RPyA90ySZPnCLEVzn9+wCpZG1OsGQavECxNKwaXP3f4dAOKlrwKLS73w0z1Frxa
 Nui4ePntO6e48mWI0VOYkB5IQlzwe56cwyGTweEPpFPYC5frsri/TuHk8KVkN4oXx9kcCdYxg2s
 DynGO8tbbbeN8j0GKCz2o0nEemVvnY6p3hKBl7Sixg7OBfiCucLUCp9FAe55TZAqKWEDegdZ
X-Proofpoint-GUID: G4J91coFbbC04KtyxgFD-n991S8DTiUO
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6848f0e0 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=R2NP8FmM25b3pXeoK7YA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: G4J91coFbbC04KtyxgFD-n991S8DTiUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

When the MDT loader is used in remoteproc, the ELF header is sanitized
beforehand, but that's not necessary the case for other clients.

Validate the size of the firmware buffer to ensure that we don't read
past the end as we iterate over the header. e_phentsize and e_shentsize
are validated as well, to ensure that the assumptions about step size in
the traversal are valid.

Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
Cc: <stable@vger.kernel.org>
Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..b2c9731b6f2afacf4acafe555dd36ca0657444a6 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -18,6 +18,37 @@
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
+	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
+		return -EINVAL;
+
+	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
+	if (phend > fw->size)
+		return false;
+
+	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+		return -EINVAL;
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
@@ -82,6 +113,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	phys_addr_t max_addr = 0;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -134,6 +168,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	ssize_t ret;
 	void *data;
 
+	if (!mdt_header_valid(fw))
+		return ERR_PTR(-EINVAL);
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -214,6 +251,9 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	int ret;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -310,6 +350,9 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
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


