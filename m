Return-Path: <linux-arm-msm+bounces-102677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HbKOSLd2GnHjAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8033D6156
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED88030065FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1448539B955;
	Fri, 10 Apr 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="enNkEy4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4339A06E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820065; cv=none; b=u5QzIWw5vuFKKkBQBn0ZkRCmuKrhI2Fzsg63U5JcWCgSsUnPqvw/pWc4Qf43OcD/sreg3n6FMcYOupdLishZOI4r6EpYYaY1rvqgilZJ41zD0dPqZs/CjW7gv8V/Y6qROXbmZTdA6GUK8Kj+2rYJRaS03AK5Wl7lFAfKnF5dz88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820065; c=relaxed/simple;
	bh=kyT5j2zdyFQnT18BnfO1ADSsOaPUsr5vljDvg37+0bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzHi2y+RSwGey1nTFR4X0hmBY/NUEkNEpNP/seB3JVPrK27Wu7Qk7vERxKcIbQzZZNp0rv6hWHT6IDk3+cBtDs8kkPe6KcHx5oNQFUqbKZaQDLiyc8i39oyv3hVUZxBJEYu/hUY3Ov3Ui5v4Dw0z2/YTdJ6jrhEbZREEDwE2yqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=enNkEy4D; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8tWQm1652784;
	Fri, 10 Apr 2026 11:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=zwZKyIDlmCYAqIPSz8Ve7PUxMbAGJ
	2nRrQPzzlqez9c=; b=enNkEy4DDpo81IwZUm0NFQpT7OPg1sj1WJIrQDip1lJpg
	xIKy/VXWTHk2xOcBHrusQ5AgzuWvvTgGmENpASCNw04gHCy99s+y3JFn4n7+VIUY
	nX9WG+sNf6JgIYAhEMVyt1kQfbWAkl+SpQ/UKaIYNUEnwDJaibXWXeskly1O+xZQ
	I48vobJObVzFG5l5rXHVIo+DtzsI82Ix10I7J9rhovxq9ZkTHH3veQVUnvnEzBKV
	6h8cFumPgom5SoihSJDIO/sOyU7qzhdab+d8d97KPX4r6RcaxgmnPCSv4HRu99WV
	c5+m4KCD+C+C0p0zOAX8x7EUhnfChSoNHG2rxjgcA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dcmqa1bty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 11:20:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 63AAC06Q005304;
	Fri, 10 Apr 2026 11:20:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ddgxt2dbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 11:20:55 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 63ABKspm035529;
	Fri, 10 Apr 2026 11:20:54 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ddgxt2db5-1;
	Fri, 10 Apr 2026 11:20:54 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: maciej.falkowski@linux.intel.com, jacek.lawrynowicz@linux.intel.com,
        quic_thanson@quicinc.com, jeff.hugo@oss.qualcomm.com,
        carl.vanderlip@oss.qualcomm.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] accel/qaic: fix incorrect counter check in RAS message decode
Date: Fri, 10 Apr 2026 04:20:12 -0700
Message-ID: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2604010000 definitions=main-2604100105
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwNSBTYWx0ZWRfXzDibhzpcgZRN
 fjjLDQziVdKaguAVutGACtsZzBQFoIQJ2Xq2fjCJ4s/oOBtDD9RUjBl5kQbVgn4Gz+SQ/QKK1QP
 dYZ4XvHMzeeYJv0EX9F70MN+vRp/vopeNUKfs4eMH+R38bUtpEqW/pL+Ixf9sDIj6MrAyZ9ZtVX
 nIpqjM9wJhM77Mbx7dBuX+3BwlIP7ONb+ZxCyfpTI6kUutOQeRmk2cURcRS/o5grGKYLDtGKWeS
 9EOUXlOwPBc8dqFKirTwPXc2O8+MWBlzM0Mq60uZIpwMqUfmAMaD0seXR6Vp9aVvqOnXn1Ygxyz
 eRGr2ZDlerSdrr5hJcFc9H7ZXxvAnIFqPNwAYb/20CHh7J6tQKiyphof0fS8uLpu/agBwNEDyYA
 zavoUP0G5UDhDnkE1PvKmwDqmzvhVo5nP8Sw2M/nOsAy03FGFJQmSjQ8wkG9SGCFMwo49xehRd7
 iY6Jw8TSvC4d3CgcYLA==
X-Proofpoint-ORIG-GUID: SW_1tgM43IlsRxM3yy9AIXRVfov5J4cU
X-Authority-Analysis: v=2.4 cv=MaJcfZ/f c=1 sm=1 tr=0 ts=69d8dd18 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=9Lnulk2YIXN_pJ_BdG4A:9
X-Proofpoint-GUID: SW_1tgM43IlsRxM3yy9AIXRVfov5J4cU
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alok.a.tiwari@oracle.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-102677-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:dkim,oracle.com:email,oracle.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[oracle.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8D8033D6156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UE and UE_NF cases check ce_count against UINT_MAX before incrementing
their respective counters. This is logically incorrect and prevents
ue_count and ue_nf_count from incrementing when ce_count reaches UINT_MAX.

Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/accel/qaic/qaic_ras.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index cc0b75461e1a..6791af366cba 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -497,11 +497,11 @@ static void decode_ras_msg(struct qaic_device *qdev, struct ras_data *msg)
 			qdev->ce_count++;
 		break;
 	case UE:
-		if (qdev->ce_count != UINT_MAX)
+		if (qdev->ue_count != UINT_MAX)
 			qdev->ue_count++;
 		break;
 	case UE_NF:
-		if (qdev->ce_count != UINT_MAX)
+		if (qdev->ue_nf_count != UINT_MAX)
 			qdev->ue_nf_count++;
 		break;
 	default:
-- 
2.50.1


