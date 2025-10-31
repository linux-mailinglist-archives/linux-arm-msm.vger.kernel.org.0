Return-Path: <linux-arm-msm+bounces-79800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C610C234E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 06:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7F004219E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 05:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88262DF136;
	Fri, 31 Oct 2025 05:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSFCqaHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnwbh9ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB82DAFCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761889878; cv=none; b=lyBChZh/Jkn92b8YnON2hQmD3ZJNHupqScYXx1Rkg32xp5oYQUWFAAw4Nkq0pWSw3QC4mG61cIsi4YCQu+lk5UL9VHGdZ7C8/NfDD3Lrc1Zw86Wiqz0ZaybJziRZ4l+f9BFjtNJ1d6OHEYMvDiVQ8GWWOj/zi9xHAEeUvY8Jud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761889878; c=relaxed/simple;
	bh=b99hxm0K8aEvQGGN04F/CI3oHI55EQTr7gbA3JLHNLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS4mwmMTN7Mp8if0PY6pVISpTmEkzg5AsHe8vkPuTAAOTTFnXo2gg4Tl01O9FvAzj3XFFn4/KGTNSq3pdDd20p9bpb8vWKkLZsQbNpbCMzNGI7rk5aU9ILXLLkJNLKJrmXLyo5w3UbCT3fs+ACGUmkyxifMsPji6PDow7Yu43zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSFCqaHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnwbh9ez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKsOFv832760
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhX1fANQ//aeLg3x/czLaJ62VaWa655a2JxKWCPU6hY=; b=nSFCqaHkwC4WbzAf
	UGqXKo/xqW/WDxcd3Da72JH3Il1ZLtrq7rSJhCqwGExnNy0DI4ya8zBbBnIwZ/su
	/GxJl5I4ErYvOaUNhQWsY4L03LlynpR4+EOxhAgeWIkasHsIGpzXsaxE+eaiMv8I
	vJ9u6V70DJ6QjnpYhhtEGgt4fp5dE8dpqO4hV/gm1vf6xuKr/jCWGwuq9t1nLjPN
	NszQb01Oe00AsGxOxvaDfL/ezFWofrh7S8QUldEhmf80eswjRMxm0nbekKw+nfPV
	dXOcnVNOHd33CzOeiENPEjss6Yp029MbsiuzmjlBfN/tY2ax+ZzYYqnEn48KpBWz
	kDzroQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb13ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:51:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3407734d9a2so1001923a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 22:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761889875; x=1762494675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhX1fANQ//aeLg3x/czLaJ62VaWa655a2JxKWCPU6hY=;
        b=dnwbh9ezJLmdeP5e1BoSEjeoD9GHPnuANcHpY0gtQd5sQj59ho/9wug7BJJdOiGvxw
         Ih4ib6jkL1BOthuYteMb+FOU3SfwIOkXX2MN4I4LI13x/RCySwzhDcRn0MwX0QsZt5Lc
         UScOjHRDWTfteAuE+0EnBp3/SghxB1edC2G9fV+o6FRQ+2xQ7XH0e+WYRJwrbkAMXZip
         amY7cA5GNQJRCS77E5InGu1K0lWMMaUONDZaJPT1f5UuTvl/uWvqXF0WcmTPxEpMn4ef
         FYqxxH49gHR1DAlMqv5MDXh89VIRH1SAt9ptb0eRqwNROZXsLTUz+RBiWXAllkO9lpRy
         U6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761889875; x=1762494675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhX1fANQ//aeLg3x/czLaJ62VaWa655a2JxKWCPU6hY=;
        b=wuzj0D55/RbBqUActt6hn/RrRBuyvQ+2rZIKdbEpub4dDbI37TvL6UC6EJx8g/mJcK
         JutiYbQXPF3LjHL/zSGaADyV0D0cyX3GGO7jVBJhIn+xuMQ9ojZyyTloN0D4bUYp5NlI
         5R23hJ+6qVALW5zGmkW+YUWNd9QmGRU0To+uJijm6KNKN4OcmTpiOwzstxYA8x19B8Sn
         O92K258hFVUZkPjL36+WA6tWrhRdC+wvwhEH4rGoVjG23u6NM3aIn5cEKftTBib1CWZ3
         8pZqYEmUhaCYb6KU8auq8VixBIKfsXPG/9C3ES3P2uPsgYmo7ADxCMaTVl4z3nlbzK+A
         14WA==
X-Gm-Message-State: AOJu0YyduBzNBG+ZyRMsUR/igmJT1ofqzuOhxLblXpNFgsdgXDlCZwY4
	P+MO9MYTQZSTvI7ZJHjhwXRy5ickzVYFksgiEyOPAMj0kJATNtcKzT27+djEYgfxvNhqRzgu/Xn
	TO51vgsQpY2utNcwgyphiKeskt9sSOSNalGa3j6TmrxSpdtNa6HA4Ieo5/lhy44WhIke1
X-Gm-Gg: ASbGncs22u6Zqy6AIMBTYdoW7+0crAMCprCAp8rFNgnCnI1G2bqsadEcHtHRKm0bxFY
	zxeWVbsJ+wtGrcjLOARhKi1gSj2J8YUGELNsZbrAjzQwpmVIX7+qNh3NXoU3eq4pLUPGJspbYid
	cGfzok0PeyK2dbgFhXQNKl05LWy0ZQ61T5kVjmv28dAJsKVAPIr7bXKyhMDsHGfTEYOrzlFghlj
	eupU/DwOST+QLDINeQPgQRKnFD4a/pV8ht0AS5lW8MKMHI/W5D6m9mMcwV3b/EfQgf8E/GSwTjK
	iiu1QluMhVN7mwgQpwI0TZv62zYKpZeseQdhBbsegmtUUHjNGwn8LtiwK//rk48AX/DozpY9DoE
	E3YVTqEi1dwazJLWE7xpg2q5oLgU1lc5FFzU4v3F5CpWEesv2++T9pa185Jvr8Zk4e4+rDCJwNX
	tOCPECR2RLKT/2x16hP+LzhXVyMYW4GGEZYg==
X-Received: by 2002:a17:90a:e70b:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-34082f0e3ccmr2980064a91.0.1761889875268;
        Thu, 30 Oct 2025 22:51:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnkeBp2MDrs6qBVRTgCwnV/SI40TqwC/O8/wg7qj36YynfgXRoHkB6O0pkQOs4+TQF+dG0gw==
X-Received: by 2002:a17:90a:e70b:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-34082f0e3ccmr2980026a91.0.1761889874775;
        Thu, 30 Oct 2025 22:51:14 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050992f92sm4646049a91.6.2025.10.30.22.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:51:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 11:21:02 +0530
Subject: [PATCH v2 2/2] soc: qcom: socinfo: add support to extract more
 than 32 image versions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-image-crm-part2-v2-2-c224c45c381a@oss.qualcomm.com>
References: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
In-Reply-To: <20251031-image-crm-part2-v2-0-c224c45c381a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761889866; l=4141;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=b99hxm0K8aEvQGGN04F/CI3oHI55EQTr7gbA3JLHNLc=;
 b=PVqHr8Unm5DS8Vrtb9xyZPOPPVjPpBeJzljZUyo1NFVlV9sxj1ixtsM5lSLGsT4yKmvQzQsid
 wSTigGCn5cIDRWvs4u53MHca0dFEC0ncv5SOkKhPrWZUnLqh9YPWDEs
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: dbVRtaC8PU5F8ExTo6mqXQgIT327M3aQ
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=69044e54 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZFAbIWG072RaKbRf4xEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dbVRtaC8PU5F8ExTo6mqXQgIT327M3aQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA1MCBTYWx0ZWRfX90CUGTfVVwk5
 j4bsPmn1ab4m+Z4LdMHpmtv3ToA7Zy1NP8MAw45zfW9Z6LWeldUNaizOLucCecE76YonidZfnnn
 0tH+YbXJ5xXgF3mjg4Sss0QbIlnFFzSkzcJuds9TTDYY3dcVXkOeEl3CvtKWThaoJb/L6VwLmOE
 NHpjPtkU+m9QLiOZOUVEhSD0PUesLp4e5K3kwX1PrF1e4vVl26H+yyfTUu756ZDJszWydPKTaf3
 Q+FmJdnSTcPxbONmB6eNx4sxm2OWxRk/PsWTsm2bEk+oy+Vim36DQjjpOLGPmsw5R01hp4zPp6w
 M4HQA5r/o+EGs08EFFlPPqzAHxGTnH+bfmTdTz3hhSGoKlPq6eegruCeU/6Eotf05HnwE2LepbM
 L+r7iwYICNsEmBlvPCTqeMZnkF18+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310050

SMEM_IMAGE_VERSION_TABLE contains the version of the first 32 images.
Add images beyond that and read these from SMEM_IMAGE_VERSION_TABLE_2.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 45 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 4fd09e2bfd021424b9489cd29eec29dc7c7a16d3..a73224669a389a6cc4f74d5759935683cefb9084 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -67,7 +67,17 @@
 #define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
 #define SMEM_IMAGE_TABLE_UEFI_INDEX	30
 #define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
+#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX	32
+#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX	33
+#define SMEM_IMAGE_TABLE_DCP_INDEX	34
+#define SMEM_IMAGE_TABLE_OOBS_INDEX	35
+#define SMEM_IMAGE_TABLE_OOBNS_INDEX	36
+#define SMEM_IMAGE_TABLE_DEVCFG_INDEX	37
+#define SMEM_IMAGE_TABLE_BTPD_INDEX	38
+#define SMEM_IMAGE_TABLE_QECP_INDEX	39
+
 #define SMEM_IMAGE_VERSION_TABLE       469
+#define SMEM_IMAGE_VERSION_TABLE_2	667
 
 /*
  * SMEM Image table names
@@ -79,13 +89,18 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
 	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
 	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
+	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX] = "audiopd_adsp1",
+	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX] = "audiopd_adsp2",
 	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
+	[SMEM_IMAGE_TABLE_BTPD_INDEX] = "btpd",
 	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
 	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
 	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
 	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
 	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
 	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
+	[SMEM_IMAGE_TABLE_DCP_INDEX] = "dcp",
+	[SMEM_IMAGE_TABLE_DEVCFG_INDEX] = "devcfg",
 	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
 	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
 	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
@@ -95,6 +110,9 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
 	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
 	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
+	[SMEM_IMAGE_TABLE_OOBNS_INDEX] = "oobns",
+	[SMEM_IMAGE_TABLE_OOBS_INDEX] = "oobs",
+	[SMEM_IMAGE_TABLE_QECP_INDEX] = "qecp",
 	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
 	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
 	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
@@ -644,7 +662,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 	struct smem_image_version *versions;
 	struct dentry *dentry;
 	size_t size;
-	int i;
+	int i, j;
 	unsigned int num_pmics;
 	unsigned int pmic_array_offset;
 
@@ -788,20 +806,31 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		break;
 	}
 
-	versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
-				 &size);
-
-	for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
+	for (i = 0, j = 0; i < ARRAY_SIZE(socinfo_image_names); i++, j++) {
 		if (!socinfo_image_names[i])
 			continue;
 
+		if (i == 0) {
+			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+						 SMEM_IMAGE_VERSION_TABLE,
+						 &size);
+		} else if (i == 32) {
+			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
+						 SMEM_IMAGE_VERSION_TABLE_2,
+						 &size);
+			if (IS_ERR(versions))
+				break;
+
+			j = 0;
+		}
+
 		dentry = debugfs_create_dir(socinfo_image_names[i],
 					    qcom_socinfo->dbg_root);
-		debugfs_create_file("name", 0444, dentry, &versions[i],
+		debugfs_create_file("name", 0444, dentry, &versions[j],
 				    &qcom_image_name_ops);
-		debugfs_create_file("variant", 0444, dentry, &versions[i],
+		debugfs_create_file("variant", 0444, dentry, &versions[j],
 				    &qcom_image_variant_ops);
-		debugfs_create_file("oem", 0444, dentry, &versions[i],
+		debugfs_create_file("oem", 0444, dentry, &versions[j],
 				    &qcom_image_oem_ops);
 	}
 }

-- 
2.34.1


