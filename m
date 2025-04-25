Return-Path: <linux-arm-msm+bounces-55650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE7A9CAFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0364C9E5212
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11F5256C8D;
	Fri, 25 Apr 2025 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6YH9B08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC7256C64
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589625; cv=none; b=ESJWpXibYmv+ZgqJEMHG7SQzux97KZVqI4wkatAWMnuaIAEsKWK1F9yUuLb3YzwYMfC+IFYY8C/NwZ/1AJ1lECEzOnHNUSPSh1uGiHTqzFn+6sDYik3CJF1H3/Zv5/Y8bittVisml+n7PV3sOb6BAtst66cYKZGvhaUM+6JgFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589625; c=relaxed/simple;
	bh=5MFwbZndW/3CCDlkJDKALnMkGV0Rc4IC08W7tOBbf4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WDpnZvDJpJiy8EXYyIEq2/c1OSbOr3ncGZh5KhiM9FKQrQVJl8Q9kkBRwcTHRrYst3ljD/RzrXsMvu5bncZ8tdu4k52ukXQCIckVSQruiX7qz3F4d/EfYNrpwjK97fho77v2+0vcKsXzpI1PWf2rW3qCWGyMK+8hYuqwmoVdaFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6YH9B08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TASR023873
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lZ7Ppv9foYm
	9vXF3GOtDCITIngSjuhVT5D3uFuR78Nw=; b=d6YH9B08uGbJAZY5ErT+GFZDiCS
	Lst9F6QybF47xE8UjZPSQdjK4SygcOrleqRyaL/zt5AUMvpsI9qkyoxWa5/Ntuvw
	XBmAKrEhaBrr6duHrdkCTQP+CRmLvNrnpbyJb9UAhVIDI7MvywWOPthQVWLMUWDm
	RSPZquuTXz3B1cauEIuOLz+6K3ZJ4JjAKXE/HEKsK2n0Q3qaqhj1HZ/88de3dnYH
	OZKn7T2qpvffX4kzL23omCbyJXGFYs3X8IpvePlozI0HUdHxUcRIASx5vdqWxBKH
	B4bM4nFXSI4CrYmCIt+e1oopkcyZWpdP9oHMZBnJcVGXtdpPoytI29ueeZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1s842-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:00:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1843809a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589623; x=1746194423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ7Ppv9foYm9vXF3GOtDCITIngSjuhVT5D3uFuR78Nw=;
        b=HeCt6NtCJwF/7jJFTMZXIRpqbZ/bbbkEK04W++J28CA3z89q4JOTMRCSfoKpyLJ1nT
         v9+fy3jgLi/zdy8rlct5mYevkVjjcdlenp2qGtdcb9IEPR2/irx0gdDuqBnGYDDFn3Yz
         VE5knr24FFlApe39t0F+6JuN8Y9rO6rGSkvbzyzx6D0kdgKam7E5xwYyJkVPj2v3y4+n
         Jd0P9lOG/qvHF5mydzX2JvddbE2kAB9b9D3j+/AVOw3ClMLepaae+U+F2sp3GA+8BahT
         10xRHCXi8ObkIJKBpPAiQWHtuZcHWy0VeBw962zCBHgQh1mR8a6WfDQvUgRHMiRrl8gA
         /FIQ==
X-Gm-Message-State: AOJu0YzOKtoJuz1ZnHSaGKhr0mxIYJP06pX0azRMEk4Ehfmbfs6Qhyd6
	Gbu+faDdkixXKz5V+rryWhB921itt5XtHc99Er40J5ePUQHpdn+H1VcbyIXSSaYnT6awZ0C/5ZV
	G5q8/+X/UGatkb0gau9kArHUeVwvGjkEZ4HwxAmI/SfpgaS0IqflLTp24k3XpZ373
X-Gm-Gg: ASbGncsUTPB6i8fpFoea30EMS0ekO5iMSmgl4PQa02jCTDEOb8wv3WRdgyJcngJ4XgI
	xLfB2cJAzeViFBDtIhdlfEKVJvtc/ti4Swvgp/hFtrkdVOFApDZa3yKcaCi0RgvIUY5vVEjHdSe
	YYuNK/ALIn+0DH+tJ+a5EbQZcMSnVxT67uMQu65G4YaITgJIvRYqOlG3RuP4jDzZkCm90PgfhXr
	qQ8k4pjz/oDKq+ukSk8dqMTZ13BoIp19Z/I/z+ZiPXR+i0o3taLHSQtyrktTraJNCsQxEoCHa+4
	O52p+YP7tQ/qMRk2Sy9axQPxJhJ9/+rkSWMdhvY=
X-Received: by 2002:a17:90b:55c5:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-309f7da69abmr4185402a91.13.1745589622388;
        Fri, 25 Apr 2025 07:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJdjsH5eGSWRC5CHHXI8KUgu9tmYVHFcrW/ZP2Qz/WipHz/oCCqZtGhc5G5NEObNdIm+8QZg==
X-Received: by 2002:a17:90b:55c5:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-309f7da69abmr4185324a91.13.1745589621668;
        Fri, 25 Apr 2025 07:00:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03ca86sm3470432a91.3.2025.04.25.07.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:00:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/3] soc: qcom: socinfo: Add support for new fields in revision 22
Date: Fri, 25 Apr 2025 19:29:46 +0530
Message-Id: <20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YCwwNOfyprbWRNPIjDuGQYcLCUqUmNPv
X-Proofpoint-ORIG-GUID: YCwwNOfyprbWRNPIjDuGQYcLCUqUmNPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA5OSBTYWx0ZWRfX6Z/KYZ/TSjB+ fXx3ImDYkz0WyvYs46SfNSBciNgNjElLZNm35rr5IdLL8qfiSeLDtn/Ge0zpOfb+Tawovz431q6 EMmF2UaUZt1xUA+gyYfPakZ7Q9/4Uh7ERjjLKzfTRk9UfSSs+sCZXE82XHJg3h5a9QjgGXtUXO0
 NSeUxq0if7hFkKCOyhfJHOQHSVPavT9sEVAhmmmUSqxGtmh/2uNtK+iMs2MpQf8tjY0YYyJV0s+ n04pd+xlkGQCSGAO8DPDlyihEZEYtZK4ZOmS/m66U1N1hlHVWsFBYY7gZSdMWO/6MCxACelQc1a G0xbDOu5VHihXTNOADOefnjs2G/qdtTptj7dE/DmUFcSbtGX2f9NNAbPXOOQJ2Ua9N0rvGMbuaB
 IdtQOmG9ujAFRhl8xM06a+kSoGVuKDa2XWBxvOzAaBKaLujXC2s9WmdDjPYO0QmOXUgW5ks4
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b9577 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KzwQcsJEF2YzTSYNgzkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250099

Add the ncluster_cores_array_offset field with socinfo structure
revision 22 which specifies no of cores present in each cluster.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added debugfs entry.

 drivers/soc/qcom/socinfo.c       | 6 ++++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index bac1485f1b27..13cf73744bd9 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -155,6 +155,7 @@ struct socinfo_params {
 	u32 boot_core;
 	u32 raw_package_type;
 	u32 nsubpart_feat_array_offset;
+	u32 ncluster_cores_array_offset;
 };
 
 struct smem_image_version {
@@ -609,6 +610,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 22):
+		qcom_socinfo->info.ncluster_cores_array_offset =
+				   __le32_to_cpu(info->ncluster_cores_array_offset);
+		debugfs_create_u32("ncluster_cores_array_offset", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.ncluster_cores_array_offset);
 	case SOCINFO_VERSION(0, 21):
 		qcom_socinfo->info.nsubpart_feat_array_offset =
 				   __le32_to_cpu(info->nsubpart_feat_array_offset);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 3666870b7988..0c12090311aa 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -86,6 +86,8 @@ struct socinfo {
 	__le32 raw_package_type;
 	/* Version 21 */
 	__le32 nsubpart_feat_array_offset;
+	/* Version 22 */
+	__le32 ncluster_cores_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1


