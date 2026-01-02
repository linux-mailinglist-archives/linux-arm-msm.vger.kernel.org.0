Return-Path: <linux-arm-msm+bounces-87245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A8CEEA33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836C830CE4E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F213195EC;
	Fri,  2 Jan 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7ZPQnui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNoh8XY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CA314D3C
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358216; cv=none; b=izIOXkZ0Le5r23x+L5l4Onyspf2lgQxh8AuT6D/k05/TTk5puk7Y6OBgNoUmYXMonTA3oLEwGiabD5nDfCnw2ILRcVv9qjzCHotVgFQ/KfXsVqwElz6ug2sHftYI1w0+p+iXdQT2mxK87YqQDp6LyoA/Nbw+vrWhbhBS0yd+GvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358216; c=relaxed/simple;
	bh=f0tamSSSQFETd/BZgOeOBR45ekM+X1VWM1B3+8zR7G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klbIfDRNoRNty1u8J9eJhVZVHPwxYplRTEkQ+/pXSyp8cXqShgTAliZ1xCUv/akuBA43wlicpqrlKCnPghEv5zH7T2mNtGjIe6lVanZKEOFI5RMpu4/C+YQ7ZVfQJ13gz1wuG2E080erBw4Gzcop1Ace0cNv/joAIC3ofjIOweI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7ZPQnui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNoh8XY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vx3a824311
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWK
	aeLwNCbY=; b=G7ZPQnuicD7TCrqX+36FFvKDSA1U0y0gZh8PDVrBhL3xj/yJhyh
	zNEveQq40Q0qXl+BMsePEER2txjQXHImPe7Gm9JqZDc1Sp2LAz18LlqrwVRt9fdE
	xFAuypL4FPALAt7forQPXjeYP1gCdCS+VUTGaTZpFiOdF15WHpqYOo+h8VFTBNOk
	Ryyea6PvnsgfdhvB0dqpwVEEMsO5djqZlSNOwhMQerQ78UryonDu93xPVihufoM6
	9TaFGIDaqJL9Fl6pgjOBO10BdEFSujvd9SxWkuNRfkRMJdOk+rTnA1DEMXyYesqO
	ar1OxCtc2rCCaxHF7P2ztwHchXjIikwm3Sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533c0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:50:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee16731ceaso237578781cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358209; x=1767963009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWKaeLwNCbY=;
        b=MNoh8XY33Ce6rBOBN3b5zVJKpGPnCII2RV6rC341zvQHi8+YVOXV9x9Vo2uMajN9lC
         Sn5/syY0bgvoQlP0MAsan8VDhWKXpjaf4dumtErrHnWNEjX9UMva+zdiKslWTQM0RJ3p
         cYdKaBwy97zwzKFHlA/9eKBijcbP6SMuvZ6WNgqrgjX3JtAOlBgOkxAPGR0PO4JmtSNf
         3Glz8GV93d4fkfqZQ3+ZoxF7UQv9zwEHoJ8WhAdHzg/wDTC+JEPT6pI+WXRfMVLtcpGs
         1nKBNNXFHDPRTZ/ZllUMGBZ57moe0RZX8UA5OOmgYtI2bs8bVMmvv2mGvDtFCrj7s2Kq
         OQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358209; x=1767963009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZfhIgqMaihcSk7F0bvXWQ7mJhxuzZv9ZWKaeLwNCbY=;
        b=XBaL1NhuhPZHq6q2LKxJiEmM9ma3TkV9RYP4cCc962+5GXbLmfBlLPTcEv/X1u6SHI
         62NWvehNS35v6bWkzYP169xbnm+3Ss7SXdKUI/UdOcOtGJJx35+mo8hCXHx+XitK2OWU
         4VS6Gf1uvGrq3K074my3fS2qEGFq6hBkswoL/42QZ/2wSstEGHsM8mzoS85rl4LQCwMJ
         Pn9bUix8PsbdbELy0Qz5Lsz8j1u7pEYS00rOggWwANmcqLbKtAs4Nwv0JCtk9uyUtCSI
         SblQjxUQt2GpyvTj4LxQjfEZFHFIKHOdGESruGM99MTiyxuYm8GXvDx+DhR6MfH5tZyT
         r6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWLsIVgnOgswARXPusL1jJv3DRusNqHyC09KFMyCfGj6e4YpzVmlpNlR18wRwQDpVIxdEQDfTq/EK1CE9dn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FaO92ZGZFwu2InD7uBrBhF0Kip1wlkxRqCLs72SPiZAHn95M
	3PU/2IbHw5ql9MD69T9EFV5smyuQqdGyhMnv2BvPyn1dvY9iULA5G6iBwLUpbe6yMZXkHG9hePp
	kDxYy0ee3hKyuEqE+5tFncItkuc7ANanINCUdZ1N2AGaG+RyIT2Pb5GQMATg1iPjJiMV1
X-Gm-Gg: AY/fxX7RHRZtPbx0oFkUStDlr3LK1+G4L5WOEeH0CWUJ7DkcLJS1h/Nb4x8i3N5CNNV
	Jj0sHtA9ViUmrPgKoHjTrAWgl5A1DN5xaXM+8HQbaTlt/ILo5jWNHeiUPdglItRg5uNajTZvfM7
	1SxjCaBiAQLL7pDX9j1jObb+KpmNvXJyEMuj3CfFhBte8XSIwYnIMOwbnT21YYMN4PrkaETfdi+
	sDNXBk1HBJILmWTByn0rzL5b7NV2NgLv2G0BxnowjKMpXbI83BUehBbawxCoX3bd8IDA73Agl82
	X1sFeJ+qUx8jMFA4S7+n2HNATADuqQW5wLMYux83RVqNpkhxV8M/ptzMxK4vnZQBFI7h6W9wnbg
	bjQry6ObmBb106QpOEsTXcVd0Og==
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr435981881cf.12.1767358208823;
        Fri, 02 Jan 2026 04:50:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaibJGKRcufVQsFtoFkkLusGl1EteIcRijgF1eum1S0BpyBUz176ZDnEeSiz3Y7Vi4Imr58w==
X-Received: by 2002:ac8:46c8:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-4f4c7c0c07bmr435981571cf.12.1767358208430;
        Fri, 02 Jan 2026 04:50:08 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3964226sm340423585e9.0.2026.01.02.04.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] iommu: arm-smmu: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:04 +0100
Message-ID: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f0tamSSSQFETd/BZgOeOBR45ekM+X1VWM1B3+8zR7G4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV777jI8tCOET4TbjC+HPZB2dgMi2DF44wcwnd
 7brPjPkQ0+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe++wAKCRDBN2bmhouD
 14dLD/9dX7/M267GN7byFB1WBkxv5LFfVDmSjqOu8wDOq/vbys5RDZBtmo7t46mLBieqJl4ivae
 j+2eaRVbXnSe//gLWSK12TcZ96tvCg5QVi3itFmmv7/acBweHB60ZQn2xje0chv70QcD5BbCAfJ
 zU/N9NWfFipg19oPKvJUB5jwbUDk8B5pc8rK8ay1Wv2SuoDsz8HRki+Y38RBiZjyotJ+wJRVqXZ
 n8AIApW0sJFoNNZ18SCw4LH9qZ+ZpjBBdVdrrOrKdqMDz+iZkvK2QZEQVr6q7SbL52N8Hd0Jxj4
 EPkUfezX2iSykBXPwLjA+CQZx4WmeMXZKzgTjfQj4QrD10fA189YWUriQ8D2llQFQO3Kw6RyZRc
 WaqU9VKpNglcQsSdb0NRzAhS2kPyHwnDhHQSxqHsdYuFPO/L0xhF30LV/lz1p17D71jwUWC4O5L
 lXSZDRw3YyWJc3mQ81kGEt+eTZccennc/rXx5fnoV8xqO4fbEjwXqzV0+I5OFiJjthjEGMNrUdB
 X+Om0XFx3BVsxiYBaIxkjJJ1YJDlgH94hbRz7z5x8Kxh0RiIV3isDQjU9pxsJkzpvfreP2mHeuB
 pxNuMg7fIBfqDLiY+4JEM/r8LPajA58BR27l0SpqoglqsnsnIPtQqa7JljTi2jwiZzQ7ioYFUgi sbGPVJLBsihEYiw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BU0-u5sBn0HKS3CPnIsA_my3Z3vdQKb5
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bf01 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DNxOUMVqX5WKlv-K9SsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: BU0-u5sBn0HKS3CPnIsA_my3Z3vdQKb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX0P4KV45I3Exb
 7JLz4dZTrBPP0wHPWakh3rX3mFRGqgyjERp2GPR7uM4pjJWaiZ2IUk+LsPgu2+aLdGpMeO3354J
 FbdrzMed+yXI4aOePRk+GrFAkHQ1ZSnzEBx8HQoQKFLWLlvbGGLb6P6EW7fEo9xiAD8jpAAnsQC
 c1cCre++4lUwzzZ57jvpHRXwx9pEU38TOGtWYQ8RT8o1cfoXTKdo8mR/fBkOc1mFWwfCel6PAaL
 ZZwvnbiw1S5frQB4rQeSaleK0T5YgwiK762HYHO7QpL5YSgRsT0BbSqa47wzJjX3Bhdp9FOP/pv
 nEVtgC9cEWWVB4ByEsp1o1ShfmGiFljz9Nux07mmcWuWQ1yWCKSlnEA38A0ulyG5Nm3ojQ4FBuh
 jh34ZdTrwX2RWygCsezmbzsklZLN5BXMSu9qHq08JFUN/x5wF9HSy6c9BPOg+ygv+LrACSxCoSF
 UEyUGwlqebdw3ZxEV0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020114

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index f69d9276dc55..c98bed38c58a 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -761,14 +761,10 @@ static struct platform_driver qcom_iommu_ctx_driver = {
 
 static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
 {
-	struct device_node *child;
-
-	for_each_child_of_node(qcom_iommu->dev->of_node, child) {
+	for_each_child_of_node_scoped(qcom_iommu->dev->of_node, child) {
 		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec") ||
-		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec")) {
-			of_node_put(child);
+		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec"))
 			return true;
-		}
 	}
 
 	return false;
-- 
2.51.0


