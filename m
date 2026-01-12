Return-Path: <linux-arm-msm+bounces-88518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B9D1205F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B16E5311D973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1B933F8D4;
	Mon, 12 Jan 2026 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VspeZzG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOuAEypx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD11322755
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214863; cv=none; b=ZmfgZYvfub4rV5HFBoC1nLe/U7NCgOwpA4d9+oGY3XUH2ILrTSLYWA2Os+H+Wo8WTNlM4PUjWOzeSttsABrmBEOC1PQ8exu/7LxFh1+mxK2Apzhbx2yPcB5USpG1u/WDqiofU5+8XkiN7XTqnSunXV/0wukOdUpoB9d39e+u9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214863; c=relaxed/simple;
	bh=Eck/D6KmwOrBysTJIIaZmSoFBAq/RlW1moTUSu+Xl3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQJiDpRhOV2YWRhzYniEnrbGp4ezbvnFJG3v94wmppLJ9bfChqKtLH2Nz+lVsfLtahkKTVQqvrfXWYN5Hxh974n3y9anzgaiwrTCsnJ3HdcrBOSWzs5rMbdauhoUnBUpkDOL1kvdaYPB5M0KH08znNkTkblUG8DWRnWhiH/nOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VspeZzG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOuAEypx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8vWQ9113520
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnpiwG0d//X
	/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=; b=VspeZzG1QNj+jHWhyOS7+P1dKmW
	TLj3Dn5Sri2LWtrNEQnmB6XdXfBQ2KGSbZKF22sUaUBieuYbYAjQ9vz0wiq3jCjA
	kAOkxQlkI1nSH/0bvGZFo8hw/DuTd6jHRTxy7OcyayA9uhoFAgBgjpdx6xvUdDbz
	qg3j/rcXn6U1TUPCOIAiWIGSiB5pmDz1AzYd5m+Yfw2xTalrsce7bw9J/f5EL/Cv
	cicd9Tv0t9yXv9u+CdAvLrldXLtgLzAKLW/5nz+PVQyjCtePO3OVZIqvQJhMIMVS
	VJDK9J2Xm3hecc5kVZa2OpRMwKgxrrjXS0SOx5am5vvD490Bm+s1APKKjbg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhe4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f3fb8c8caso3133875b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214860; x=1768819660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=HOuAEypxzOp50jgnV/AhUUthISA1HGy8iZ0pWccz2TA7swqE04BJK2LmpK1dBSe1Ph
         axDYMQLUvbJDI1WaDKd0gyQI9cxlbyg2nd9zs5ydVN2FG5LHh0z3TwgfoNOyJppLeUA+
         47Xj9eTJRiVqabbGvOFTRhT8OcoFCm7+SvmFRwmIp7yX9WLY1Vi2Xstf4u18bdXlSZj7
         v+teLMm1YQMQOqJuc61E1FxH7SRKE4PvplerZGGhiNUa9tmEIutAqdpwgn7NJwkSy2ia
         4ReJUpHWOwvBJ9J1jHzRaf5mKxF5IFHUof8fI3I1uCsh3op2ckySpoYHgf+rJWMvu1/K
         sjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214860; x=1768819660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=XLQcfu5xyGKve4/s81JP/nMcO0xiqZeq3GJgHl1TjVxq6GTqN2JyA9we9y9VywMyAR
         ShXhVkls3M64Ce9AcwB008ib80W0GGtZH8MeztOOrD08sYU4OUeVCqiUKNuKh0g00jtw
         GvGt0ZJm5bn5HCh6md+U/rBL5HTW/i5qAEZAZKBmsud6ZgLCGaTDFfOZT7paE2tEff/s
         yf3+4s1ZAiTWroQags36hPwiA+WczLmkg1/xAr97ObHHMo9EBjLHVn24l9PgpaHcq8yc
         KAGbVATodU2/bPh9Q4xDu/U05ZOdWZ9hoBlpHL4EB86fB2+h3v4Cve9PvkzMSdjAJVqn
         ASXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwrpHnFk4EySbaSrJjn+Xvh52BGalWMYDXvv1dBDA1IxkVStZAhXApDsudwmY/5aYLkyiBwiqWfJad4kUI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2diSG7zEeJKAlfLJDXL4XauGTb0j8ZTouCC+kOK+PaAHgSpfI
	nP051MXu/a0eyVhVWOucaq1Gt2t20BneygubHbMk6K3B5C85BnAyfXFePMITcVjBEb+3f2eoHEf
	5QlSEoixb2aiiHaPt1jiWvJ02OnGPZ8EJjQTzkV5mIrSG5GlhB07h/mJtm8zHDJsfPaPY
X-Gm-Gg: AY/fxX58HDqFxHUUEhu+VjqZV51UdCiuwyeaUzDQjYB78GLSkxGQjjNB/BCuKT3iZrn
	rMh+KKN0QycAB6HT2F57LUGAnRgHvKW8GsreDjFnhumHfChtFPOiEl+zNoBeg64ApedVBPNYdnq
	pxbMZhtuSmbfmOfOwDWvDcYGACQ5nPvTiRPts1lCN1wnaxmKbzpWoMvujTpOa65JGKZL+bOMelK
	dL4tRvwevjWqzT2u8us+PmnrcCTd6alFnI6pXIYfu1HVwB2oiR8qtrohoubygjPi+ucKDSHf0rN
	deF+2GCJOUGyvlFIkMdJBhJEHugT8frAiYbjjCGnErHjicxYY0YAjl6qHLxVFW+inMvR/tXW2VN
	LrJ4Fz1hFAZ6rI+HHjQ/CwcozqFf3nXFnMwYdV238df0=
X-Received: by 2002:a05:6a00:bc91:b0:81e:5d52:53c3 with SMTP id d2e1a72fcca58-81e5d52567amr8230822b3a.18.1768214859863;
        Mon, 12 Jan 2026 02:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3ldgLP/Xx+f0G+ZCY7b1fwuj/2H7N1WZN6H9rB33UYGPFQpyBaw1Rf885x63RbmMWxbdSzQ==
X-Received: by 2002:a05:6a00:bc91:b0:81e:5d52:53c3 with SMTP id d2e1a72fcca58-81e5d52567amr8230789b3a.18.1768214859256;
        Mon, 12 Jan 2026 02:47:39 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:38 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
Date: Mon, 12 Jan 2026 16:17:11 +0530
Message-Id: <20260112104722.591521-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXy5hXSZIpwpfO
 P7Wte0NjR0KdDab1ClIWqH1E+vaUPv9QdqLxM6jzRIR5suTnwoEUqCHnvPz92AO5m18z9khB3LT
 EbG9fUb+u+jGC+G0/rkfVa0bylFllPApoK6tFVUzgzLCpVfDIQT9n0F3PPu5/TOnjmqtO6kWwxj
 fU5t04d2iiZXd4KsGQ06+LdiHsuJatiupyH/rwRxJeOGQrABtZuVTTvAWW2+xyqhrGI5ysdZF+K
 9PHWoNOif8wB5IcOs5nKYdppwF1S6Xic3QYi6NASrzYzF0cJQN8vFqqRn9kjgJ8HmpQFCp+c5ry
 m3D5gfptN9tDxoEckYVyifU9b51NgtjHhfxa2++Yfzo5L3aGWMYNexSejfaU+k+bvFkgJhsN9T9
 S+OWTa3F4lPtGtnfH/HQL9N32ldUkc5Ab+w2PMXwgt2Swa1uaQdt9ejVuNjN6CyMuWedwQJ+aiK
 6d4hFLPARjN1i2Urd5A==
X-Proofpoint-ORIG-GUID: jyT7AO8nGCiWCNiSrH_gWBLEIJ3YQ-xz
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964d14c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wptve8LSCQjy2B8HgooA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: jyT7AO8nGCiWCNiSrH_gWBLEIJ3YQ-xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

The "qup-memory" interconnect path is optional and may not be defined
in all device trees. Unroll the loop-based ICC path initialization to
allow specific error handling for each path type.

The "qup-core" and "qup-config" paths remain mandatory and will fail
probe if missing, while "qup-memory" is now handled as optional and
skipped when not present in the device tree.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
- Used local variable for more readable.
---
 drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..b6167b968ef6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
 int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 {
-	int i, err;
-	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+	struct geni_icc_path *icc_paths = se->icc_paths;
 
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
-		if (!icc_names[i])
-			continue;
-
-		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
+				     "Failed to get 'qup-core' ICC path\n");
+
+	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
+				     "Failed to get 'qup-config' ICC path\n");
+
+	/* The DDR path is optional, depending on protocol and hw capabilities */
+	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
+		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
+			icc_paths[GENI_TO_DDR].path = NULL;
+		else
+			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
+					     "Failed to get 'qup-memory' ICC path\n");
 	}
 
 	return 0;
-
-err:
-	err = PTR_ERR(se->icc_paths[i].path);
-	if (err != -EPROBE_DEFER)
-		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
-					icc_names[i], err);
-	return err;
-
 }
 EXPORT_SYMBOL_GPL(geni_icc_get);
 
-- 
2.34.1


