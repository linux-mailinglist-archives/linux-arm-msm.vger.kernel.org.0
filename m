Return-Path: <linux-arm-msm+bounces-110798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULQ0F4uoHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:55:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889C62BF78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10BA33045E6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271B73D6498;
	Tue,  2 Jun 2026 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWNhX8mF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx860eqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960173D45F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393713; cv=none; b=q6ac6Wmgmryf5Qf2VXuCEKsAGSQvdOt6kJyTs3hsRrN9AK4w43Txp6YSUxTEHJLS8a7ROdLqarepTgFM3nSDlpynIUqox05xSZlspoqOK0A16wvjkH5GZeB6/l1xFghwFdD3ez+BqbGvqCiXDpGE9bzrwX4jOyrxP2eMDOq7Wgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393713; c=relaxed/simple;
	bh=/EKYeoql4uz7qFU2ossGbNSvCMyd/2sUqURgb/Ehhn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JxksAGiJ/DWugyi+xiBFFhqmqdw6hM0uEaW6GIYyJoCj9CnUh+rBSkdboSOfGDls9RgLoxgAI9LgLrvFHOAiSMogL/UKwiU3JAfW/5HabMl2MGmF11PASsox6IhET4P9S5GEPmU+TEjaDZt54SnY6d+/Z9b8iVmL13aV23ebEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWNhX8mF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx860eqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527gTD83302632
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQk8jqGT7pq34AKhFLCcMW
	XkDtE8VQOTCmbH/hEYdyc=; b=bWNhX8mFuMRl9p9/BtxSfUOYhKRQ7LHIClFX+W
	GDdkWoAUhh8xFks7VL9UVTudxE04GjvQH4iE5a9W7EXY8xI4zUp1E1KL4/ALekVt
	JYuN12w9PlAZvt8NJ3DfTVzDYx0eqLIvRXIuUSeaqYEvMDvjiIrkuMfIzqF9bDpw
	36tDdZ57YjNrMo58OksLLNxMn1Xc4DxhKNgg+qkopGmY1tZbXxzMsX/XYy6NMmyg
	YUHOLoiKHsgML/9QBStS5MnIbtbImdAou8ccNtw7aWMmWMhpahTWpAO7dd8yphri
	nTls/AIEHcKMH2d7M9eWLy/57bhmsbrUYXaI8776ivXkFChw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18gh7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:48:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f2083280so685122c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780393708; x=1780998508; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQk8jqGT7pq34AKhFLCcMWXkDtE8VQOTCmbH/hEYdyc=;
        b=Vx860eqdSPKX8y99P8rrN1GSEl4scvyG2WRUEQwV6vgVCHBoivrn++jjmAVAzlnjsO
         2HnWypAWSoNQhwsG/vuHdTuKggIf4vHiW9dpvIWRuZCm/pjn2hJECGtvYn7GDMWr3U1N
         dy4UepUWhkTNtYsZQ/8nM1twqDDkZoc4iLPHXiATj9vETUAJ9ASyeTj3WbCcedMsz3qq
         ZpFshULVZKaEgJuciYgUUv1Cnn/xm03gN3WBAH4An/9DkBlb1FcjNpj3IccMspZiEQGv
         2TdscIQBP+Qyr0uGIrHnevGTcklQnkeoWgcuhhsq/scDnQBx4Cnm2ypW+/pR0mAxdi/p
         0QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393708; x=1780998508;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQk8jqGT7pq34AKhFLCcMWXkDtE8VQOTCmbH/hEYdyc=;
        b=CGd1rjHIySmpn1F4aTd6GCZKxXSZmLpb7HH73Du+Wn3qm1OIXKUMQk2AS+JlvlCDoW
         co8Qw4qWZU7Pl2TeZhIhhuu4clk0TtwKA97StB0Cl9erKyTfB9p95orSOY/ujVfEAjCi
         sxTwt8afD3yLjZx3mYXuvCg1GWClT+fXqiX57E3Tzch9lG8R2HZUNIWtbQvI5Hl1CD9e
         whBMlORCvNOnnZ4WihQO/PGCHTHYxdClTo0ZddWnsoEpL3nR8K1YQ5/LqqSsP4OSQs4V
         FCga9caW8npTkUqF0q6GF5A3spYr6aH89e2Z2AsqAsXzTy3LQdeK8JWKubZyhMi7WBBc
         zhFA==
X-Forwarded-Encrypted: i=1; AFNElJ855hLD0nGoXVk3X5Eg41MDeOdkraLjwy1PpRiIoF7a8p5+OaNP0AKWMCDUvKJXXwOpVvY1eTPUZ0nC+PoQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+9Mrx/ldm+yIBM+88vMDK88sOicMqJk0L9zERSzLMFXRzXYb
	j6zYtNOSdM5a+yaE8JA2IZBTXasqLyUjk8Q+ma+vYNlj/1Gz8IbYZE2CoUp53Q9RIV3AyjSxOdb
	Z1qrheMKeT1xPk2OzbqWfSnjSZ24vjkR17hnlBt9n6ssfBr71KDrzai4+1tpmHUC3aZj8hBvh1O
	FkXUk=
X-Gm-Gg: Acq92OEHNzRVD05294nQniltuUd6s/pLisUwn9d6a9TYX4MmsrwfCdMc7uOl7MwugpF
	ncHfNbOOThjzjQlrbyPDZp0actw8q9pu5VpFsnyTaMsjW1WmBt62O8GqpuOjLDfakvww8R9Nlp5
	X/WvDqc9KbHYMN6XvDv/T1NNbAeBjL/+Pjk1Pvl4mdSYzqTq12pIqVIffbW8vRMygo/eB3z3f0h
	FZrSXk1i5qFrcmu4P0Us9SoK9IwIw2yPR0He//qsfE2m/JiKXH2xzVi3NAbNoKfJNzIhT8kOurm
	dKELRE0RkHnEJeKF+iyGIX58wfuLi/sTzcAF9pgFEE+hgoN6DFEPCoHCmERWMfKdxE9olzK9YIu
	QfwKmSXYVoeW6mRTH3krxSvAUk3nJrKTKIBGmwcdfBCOOWDKqA9u7RFjxZQj5yzIxb6Pr5urR2Y
	KcjMh/IdLwX3jyvSe95Ukl
X-Received: by 2002:a05:7022:607:b0:133:3c47:932e with SMTP id a92af1059eb24-137d4251effmr7110704c88.28.1780393708456;
        Tue, 02 Jun 2026 02:48:28 -0700 (PDT)
X-Received: by 2002:a05:7022:607:b0:133:3c47:932e with SMTP id a92af1059eb24-137d4251effmr7110675c88.28.1780393707910;
        Tue, 02 Jun 2026 02:48:27 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137dc179940sm7091758c88.5.2026.06.02.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:48:27 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 02:48:20 -0700
Subject: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOOmHmoC/5WNQQ6DIBBFr9Kw7higarCr3qNxgTjoJCIU1LQx3
 r3UG3Tzk/cX7+0sYSRM7H7ZWcSNEvk5g7xemBn1PCBQn5lJLmteyRocxnz2a5jI6AUhuJELLmA
 I5BPMvkeoJGrbNFaVqmJZFCJaep+RZ5t5pLT4+Dmbm/i9f+k3AQJMqbuyUTerOnz4lIrXqifjn
 SvysPY4ji/PigBd2wAAAA==
X-Change-ID: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780393706; l=1840;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=/EKYeoql4uz7qFU2ossGbNSvCMyd/2sUqURgb/Ehhn4=;
 b=xU3boV6WV/veBQWKXZN9rS1v8cVHNiujN7Kpa6TNvY4aWY5oo7A6H0CPxseaWMpw9BmvOHN4j
 L/OEd9qFOhtBptMuiL56WmB/5UFPw5xPg65KX+E5U720P0D6JRXbD5O
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1ea6ed cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GPmNVz9IxACOmcSOMuAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MiBTYWx0ZWRfX1Be7gAyXzjr3
 aK/hq6CC1uQdilK5tkdehB8k+fBhym/1Y0nVrCvmiT4GKmRFPn7nYRwa6QA7fufR/ROWm++Jh5K
 DOLd3hPkz83x96GFND1mNPuKf5bhOhuP9xMhs3H/Xh72adG61/9xRo6xN/LWFCKd0M/49wN4UE4
 tlhhRowUg8QaN/TMbF3Gfw1ki24HLsq96EGpR8DPZ58KlRXXOEVfqkHDtQmW7bpstTqmGKvcjNg
 PyW7jZFy6LY0u6JM8IBwVE8aPZ4KzwhpbISkrHgSqEEa2We9gNJXJNb5zLUOzYqGCbi0ZydyVUB
 ZpJ4ARTxcPF9NxP4Z0diJGAT1I9fv2PQdb/3ab5vWW8HeU0rCnOIfqboFKDDLZCfsY6+E+nmieM
 FvilhJdUCyeHRxt+Jkz60W8/BQkn2jZKlqKRhi8EP1pp7uwk41YECYLdOzlJXvU8nc6gAsAmRCc
 JEEXw7QDqEBL/nc67kw==
X-Proofpoint-GUID: 80I8lCM8Zhvwiir6eLd8dNgBVZq2JSdU
X-Proofpoint-ORIG-GUID: 80I8lCM8Zhvwiir6eLd8dNgBVZq2JSdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020092
X-Rspamd-Queue-Id: 1889C62BF78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110798-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
extension defines the nvme_reg_en pinctrl state for the NVMe regulator
enable GPIO (gpio14), and the second adds key_vol_up_default for the
volume-up key (gpio6).

Merge both pinctrl states into a single &pmh0101_gpios block to avoid
the duplicate node extension.

No functional change intended.

Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- Reorder nodes in alphabetical order
- Link to v1: https://lore.kernel.org/r/20260526-merge-duplicate-pmh0101-gpios-node-v1-1-c4ab4983f8be@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..782578a2c5ff 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -538,6 +538,13 @@ &pcie6_port0 {
 };
 
 &pmh0101_gpios {
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-disable;
+		bias-pull-up;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio14";
 		function = "normal";
@@ -553,15 +560,6 @@ nvme_sec_reg_en: nvme-reg-en-state {
 	};
 };
 
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-};
-
 &pmk8850_rtc {
 	qcom,no-alarm;
 };

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


