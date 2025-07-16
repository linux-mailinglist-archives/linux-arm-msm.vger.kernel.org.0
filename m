Return-Path: <linux-arm-msm+bounces-65295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E131B079D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F794173CF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B939B2F5323;
	Wed, 16 Jul 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaQb4VGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355722F50B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679703; cv=none; b=i5sSBOrCKb4Ylc20LeKGyyaogXQdVZWHxYxX+JFpmxGwahXHUYHsYukFeCFo+sd2vN9AeORsG6puVgGrkt4ttciacfjLba3udPaY8faa8NF3318Qg/koexWG69IgcOx9UWotvguUrFtUaGkdi++BfKjA5RoTw+FEajTXJOCUId0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679703; c=relaxed/simple;
	bh=d5TNHXJqe35TYW0XGOrPx+PAjPxH5xNWzgZ20VJX48A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hfMbgHh6JMU0n6f2yg3TajW1KkiNbiPX/6ML5XsZbu4n51uh7o8Vn2qz+PyGDqFaanR8NmP00OXu6wf5+/rM4STIEiA/5b9011sWjRLgKA8wD5Us1sTFqEy5N9W7gFBJV6lwwJmygBhqbqL3KAsuDOZhUeQ4hoqfme4bpS+Jyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaQb4VGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GC7jGn018978
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vVo7g4SuoBA
	YE2Kpf8pE4sBdUNQNHKc2NlVal4lHsUo=; b=FaQb4VGbYFWjx+AGOQxR42GdVD1
	BS/SNsaLf7hKd9FMQ+xLCCfKls8cu1IWD8fBWdYy10hcz3T4hz6y1CRdNaeEi7/b
	+3znubwO2Kl7yX8PoL7wj1KQmoS4YFLj9KqC2r1td53O990ozMiHOqc1/f892W7f
	KEEQzTUv4tVDfQc5WgG3Eh5uFflWOJF8CTuvqx/Z8ugGMAzz4RmjCZv3SsB8y6kD
	JVAzF8AYhGf3POU+6tC/asocjHJ/YrY70h9xLoh0DTD0goo3cF11Rh6G3HhY9dAY
	thfkKf1ueY3RmUR8RcCkWYvK9TYovtN/kJAiSOWHj57hOZiPORRq5R/Ak4w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8pja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:28:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso36761a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679699; x=1753284499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVo7g4SuoBAYE2Kpf8pE4sBdUNQNHKc2NlVal4lHsUo=;
        b=Ak63DE050QlWO+ZWb3pyBPE3/OOFWtSgAgZrxpGyudIC2DuGnVQ8kn4auSKQxSHHie
         A4b3KItCkMniI2bCfUo9mHDaiRBQmxac6Ho1YIeCtOrM7FQMninHy/7/SDd0YxMKdGwE
         UtDnc7aoxFjO+irO2Km/RHlAYatChuMMGbD8Z8fLy2Y0Qarm7BG33oWUlpqI0yJ9rL5N
         PVH/vPJrMfdTvGMvsLB+TbFAw/aGPzmQ3DJY6bzXY5ZtgHT/JIhT/b/0DgCP+O8PkF0g
         Ob0RsDxLm/G5/4yXwgWTRH9+Al9udxCOszguqZLV0z2bTDAFBHUgkGbATd+F7eZCMaLP
         iU8g==
X-Forwarded-Encrypted: i=1; AJvYcCUW+/ZTX+vtIKtDKNZk0FcnwOAUNVsGxo2MaNYumppphbOFcGI1eSXaaa4fDszEd7cWp26vw4J6SYtM2LpB@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMhWVTjyn+Lb156lIYF+W4tAzXfX2W4GIAjITjxPm1KJMm6TR
	5ojhsXj3l4plDAwlnfXmQPX9rEbWwLoLb29McZY//SQRmFCYUdmJc5hM4K1Z01iIyMtPJPXeR/X
	/tXyktsF/vM1iVLAxkdd2/WKLJX4nm/nR+K4pJk1WBrPDh+tEi1vNkPW+5ivwDxLwSYdD
X-Gm-Gg: ASbGncvu5fQSGIuvPTL3iknmFDx5ZW2noHd65FUDTFytt746Yx7zddt+f0WFeDFtR5x
	vYqtkQyj7GQHhCW/ol67rarL6wH5vg+R/GSZVg8Nd0fk3iHphYMu3mapVyAj51AaA0opm/Om8UT
	uVvZt9Jv40/kXpsPmJNN6V3hXN83fvumcuMjmdKL2aZuv90RBFtKdfm0+dpAhgKpY3diWax3gmf
	lLKTdgKrE7IfZowzQCQGi9dP6iVQ83LGB4199G/T3YZPIWyCptYAV0VqqLAn3Qi7wtYe2wHDze4
	H8l65WdOrkcx4uAprlXD/vefNkGzhj+e83eA4nSN6n5qeRSK0cCfJ/rF//YLa44Z+QH9hLTvAx5
	tNLBvnzC2V2SRpb+RprqSrNY2nUke3EKPNKRdMOHNM/3od/fAkpP0Voi9CI6v
X-Received: by 2002:a17:90b:2685:b0:311:df4b:4b7a with SMTP id 98e67ed59e1d1-31c9f4b50d3mr4106094a91.29.1752679699498;
        Wed, 16 Jul 2025 08:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeI5v7kP521ZDrKFwcG9h//NS6CzCzK54hgX/qI46bD76bO/lyp3vx7QSU98+WYi8yyBAb9A==
X-Received: by 2002:a17:90b:2685:b0:311:df4b:4b7a with SMTP id 98e67ed59e1d1-31c9f4b50d3mr4106027a91.29.1752679698969;
        Wed, 16 Jul 2025 08:28:18 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f20e87bsm1688563a91.35.2025.07.16.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:28:18 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: robh@kernel.org, lumag@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, konrad.dybcio@oss.qualcomm.com,
        quic_tingguoc@quicinc.com, quic_rjendra@quicinc.com,
        kamal.wadhwa@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains
Date: Wed, 16 Jul 2025 20:57:58 +0530
Message-Id: <20250716152758.4079467-3-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152758.4079467-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877c514 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=o1i6smXM0GLUooxP6f0A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Vg_o7KMB_jt2LLv-yYdnSjLwza0zTWHw
X-Proofpoint-GUID: Vg_o7KMB_jt2LLv-yYdnSjLwza0zTWHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOSBTYWx0ZWRfX0TG6SPGm2k20
 k9oiOzoa4gVsnR5QdWtPKYbL2KRWZ9dqnLZOIQExUp2so/W/F7draD1P5NnPFsrIccDeraqL+wG
 fJqlz1HsoA+PweTBXKmhzYX0KmDaj7fgH5pkAiwjlW7glGPYJuOLZ/8y1zRBuhxQU/XFat+ba//
 sZW61ZAtmVFgRhTIRMWfN6NbNjbYnu+Q6ki4sFWZTM4J/eKRVn+gkCtMC9r6aVtmA/4mpu5dJqM
 8bdNBJAkji2KU8/vA3ZGQD+349cvlN3y26zYS8ukNvx6+yyJIiUFRcIwLWnCd4661JCilhO0ej8
 OTTKabFr31BCzN3K9bwQDhDnTPeym1GOcFe5V1qCgLKUNBurY3mEKvK+QlJK8qXNsZKr3nIMXBq
 W3SFH8yOy5sh9qrvan/vuSSYOsVmFVsCIzdx6O0tdZLIuK1XIQtpUeGrw3G8PS+NIxLY/G0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160139

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add RPMh Power Domains support for the Glymur platform.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 4a8e2047a50b..4faa8a256186 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -684,6 +684,31 @@ static const struct rpmhpd_desc sc8280xp_desc = {
 	.num_pds = ARRAY_SIZE(sc8280xp_rpmhpds),
 };
 
+/* Glymur RPMH powerdomains */
+static struct rpmhpd *glymur_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+	[RPMHPD_GMXC] = &gmxc,
+};
+
+static const struct rpmhpd_desc glymur_desc = {
+	.rpmhpds = glymur_rpmhpds,
+	.num_pds = ARRAY_SIZE(glymur_rpmhpds),
+};
+
 /* X1E80100 RPMH powerdomains */
 static struct rpmhpd *x1e80100_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -741,6 +766,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 };
 
 static const struct of_device_id rpmhpd_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
 	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },
-- 
2.34.1


