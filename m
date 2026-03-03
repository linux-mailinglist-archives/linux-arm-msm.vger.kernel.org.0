Return-Path: <linux-arm-msm+bounces-95109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FjzM5C7pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:44:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADF1ECE50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47796301F5C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B4C39EF3E;
	Tue,  3 Mar 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYBsiiNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWUzYEE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C1382F19
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534666; cv=none; b=K2qe5TLgsalhvvOJxHFyU041i2pnYOU4hX9VCVrrFP9Mm58WGkTLUL9+PPGXIPNWtYaST9aNdHJsrdNXGvWEu1cBLT2zqkMyefeZgVVts9IPfwRidSGrjzMBwS/bmUg2oSVkKStZS4ykmF4tVi8iHLh5gkGLFTBHCwuKBsQQyR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534666; c=relaxed/simple;
	bh=T+Vo306r7VkyoSZ/FY2SiN8mai4An8ESlUW0TaW0c4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2bY5QQ7tiE/4kfURx/nVyEGZqYwXXTwDguNRwJqQGU5DWJ2Cm60H6h8bprgt1fvu/atPeEY+UstNfpZ0bAft0vrESUcNz9TzKWad0XrrifFh/SjuUtt6WUnoYahLD3qK7+sp3jv0wsoydwmRO3e9K0VFKb7fjPvMq38AWNsV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYBsiiNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWUzYEE/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nJ7D323924
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHfpwUSlMeg7aGs/zHFvK1V9+PqsMLFU7RbluKk2XbI=; b=KYBsiiNoZqtS6qIl
	VsTh9EBg6qMNO5loHiNqfwmsmkii6ZMHb2frcO5w78uU3v7s+d5qyYVqmIugsQPr
	PZF3kXHHMFYsS2aMwAsh4XZKANt3vk8IPBDjI4ooJf89ObY+DAdFYl9RKaTh5sF3
	JPIwmY1e+teF6SJFET93PAg5zqWyvE2K8i2gkNcHc9yt16NgY/9dSZ6o9pU2nZHo
	C7MN9jbjoXNz9sgCicv4Qstc9XdWYaDcV6kh714smd/NepVf/7geFMY6Ct5KhzlN
	F0GAz4otkfx7IJev9RoQupMX0Mp+qDpW2zGFZfDOMl3y0M6JJn+6Q4NHArcgcinG
	mJZmow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfurvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:44:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so4356406985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534660; x=1773139460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHfpwUSlMeg7aGs/zHFvK1V9+PqsMLFU7RbluKk2XbI=;
        b=PWUzYEE/jmLSLZAF01lPmYAfL11hmE4yyCWf9g41ab13Z7w7i2IHcQhRVchrvmvBDR
         xKxIiDz5Za8B4vFXeIeKuSusG8LBDoPBz19pgzXjRKTtU5wj8QfITWfTdjFwKl3iQifz
         UvslyazvlKhWrDzWb4XEUlyC00qObGw10plwlVYwao673mYzC4p6nm3kD0BuTByPBJ3/
         Q9orUcMjElj/fuNxmYztU2tNy4ZH5CGmJfTcOysWeh5M5pu4ziDDgnGOzLPUctXBgHWG
         Bi7wyywpqZw4EXSDsY0HdGTIpXlTGnhGfcOQWVU8+hZDlchA+2L/umaOD7vopFi1WLzm
         7aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534660; x=1773139460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wHfpwUSlMeg7aGs/zHFvK1V9+PqsMLFU7RbluKk2XbI=;
        b=O+UfXemj3+GceX7bYdZQvX7K45d1A145D7hbpPQBpBf3M7sSQyqGAQP12OoxMf9HbA
         zEZ+6XQEA3pisdPgThiMvKzvrXr6kR9ipyZA8YBKtFYU9MypUl/ys8B9jh+Vn4/oHOls
         E6/6P+chHrMw432RuqDEfjtFHN6Y1zGTzDw4WFdrjsCuYfs5E66QVn5b/7cAf0bMG1sH
         gmceHK8ouEcWQM4/kIZ9nWN+SdBDg2eHhkQK+IBoLMLaXWH6IR7IyRUiaY6kXyo7oISw
         P4LcfYT82bCCv2qdJcO7wGYuP+gPqm5//GvkBbDAGq2lXLsXz/U+sTQlxURHp/aRJjRy
         GTbw==
X-Forwarded-Encrypted: i=1; AJvYcCUF0RPJUZ0V9u7MXwplX0X0BPvoSM+c9IxMgp6qK2kwPfvXZbAP9xEX75Ta4pKRv0a3/GzTuj6roZWNdr8i@vger.kernel.org
X-Gm-Message-State: AOJu0YwGupzlVW+AFqdzDE/3CukpqRkKe+fgKB+g5QwkE9RNB+SD6yMj
	PwyDPsc8zyj+kC20anvtYPx2Jg1r0ynNLEqxusmOs81mTQkz/clWUUe0CeaU47TnBo9W8ZIT+9y
	Gz2eX2f//rBAHPIZEKedlF1KRBcUapRvDtKq6kJMXUTFZ+fa5gC+zJ2Z/toItVc6PCbCG
X-Gm-Gg: ATEYQzxrkUuvVc3V3VJkre7AWh4KvP1QdWf1UleiO7N14CxXiKF9Tc3/flsbEr9NIdP
	xTJzrD6+jn2PZKdi/ulihki6e27ZZafW0fmUiE4aXwYfirIgrAgjNqfTaOQt480d2Ul7kV0kS6T
	7mODOGK594KtMHJ9Da/GCZA9DIcC8PCDTFSWWmhbDzzguzIySHuPYlgALLma1Lrs258U98jHqLZ
	t3JcAl2rXW+qw35iNyDVptz7Pl0nkWUEndhaGsabxRcFQtmhIEmcnJcH42A94TFu4+InbYD1vyg
	5UKJd11lnXMnF6Mf73SgVJ+tvvskHswgcFRBPEUCl5eG2svuWWOMdRz1w8vLVW6yL7rYRqgM5ij
	yiREApZQG8XqPMYluQAPHPSk0Ga0Q0Q==
X-Received: by 2002:a05:620a:2989:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8cbc8d6711dmr1773057585a.16.1772534659985;
        Tue, 03 Mar 2026 02:44:19 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8cbc8d6711dmr1773055085a.16.1772534659287;
        Tue, 03 Mar 2026 02:44:19 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm365722485e9.9.2026.03.03.02.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:44:18 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 12:44:08 +0200
Subject: [PATCH RFT v3 1/2] arm64: dts: qcom: glymur: Describe display
 related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-dts-qcom-glymur-crd-add-edp-v3-1-4d1ffcb1d9f6@oss.qualcomm.com>
References: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
In-Reply-To: <20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=14307;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SmjcEDVcMY7jezt6aFge7t1rHYa1dfP6lW0t3CF+UQo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpprt92KWGVOsEiTJxDN9ka9n2ZsXMjmUjLszHS
 w6gP7nbwj+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaa7fQAKCRAbX0TJAJUV
 VqWEEACttYijZITI6i7IZKLoQweOVARUZGrvet/xniI4W39UePDeid0eCJb5QCyeVggxR2P7W3N
 rIg8bLQrilLBCSlkOv0oiFYVU8sFwECMonVp4eb++h+ylzXvTyQYqY2aHcW+W7th+sNXa0jUuCt
 eGQyYzCbezaCgUsg38wjq8WU4dBeqdtuLK2jgpB5DrbhP3TIlyO/0D6gsVfM2zdOzEuPZWGTY7+
 n514fxl0lzkIiLV5L/Zs4vRfS2o1wqzRChsIKorPzUD0NxUytVhH+Wf4ZWP/yuDRZx82c20k9UK
 19kj1s9lAgJCKHeplMnXXkVxN6pBQdM8U/nvCcfRF7IApCAZoWGIRbaOACqpO51XqPp80adYqIR
 PfeXuiOChfeO6BJkbLc4ZS4WVNbCbruWSOYmLRJgeM+zOIbczqvTQ3xfvHLZV5AXQlKbVkF7Hzp
 em76dG2Q2amjx1rj3zKTNFszNLQRAcYUE4WJKgDrq0x9hBIbQN5h4BdKYy7e/5OnILsh5td1JuB
 eirv62PdoKW67eLnHTEHcKpJexNTRP+iOTyny+waanaV9yoI5qtFggsX9dn1eEEcB/ZTjJjw7g1
 BGkqlCOkVdBNZ0hQoC0xhVJD+3vgfdXuYSa3J5uCs3Livkz3D0KBR0cjDRTFjSvaKU7LvaVm3jp
 v/JCvm0q/DPx19Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6bb85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nt3j2eaCHLMPKZ4rhccA:9
 a=WVK06ob88Sdqzod8:21 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X4hpnMrOoUsBLyiODpsAvkmQ--St3SpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MSBTYWx0ZWRfX1+oWeAGDiGzK
 LvCSg/U2rHAjICJBwGESvbeumpTfWP7sTVSABHx817I4UZJ4tB/PK0LQD7mtCe2oZqowCyUhQM9
 OWhKhL7IS1J//23s3Phyb/mWSS+l6aRSSOvY6SKob5vnNIwU4D14oLm849BEPoW4ITXw2occDmE
 Dj6k8p8k0gK2b8fLbFnmNRgzvZXquBr8nk/3DgPq9wktxSfxtXc58tx16IzMzDtC8SI4q1pebC9
 q0sM4DFLrPKT7Y51Sfj4psQ2YAcPSSzyf0IQ2wdt4dWUx953A7lFs/emRKdhMbR2zneb4NRLdcD
 jaZ4zqZbQerhIJhYGLmNejjIGR6wwBy+BjZO1/6zxuFQPYUf7JFMzx9AIhnCIYZwoU4Yby6vWnO
 geGIDxVW/W5mLvBQbaoDNhskZq9i/PNNMoosYuW2dGHVcYVGtQvQNDXEpQrw/e8PSqPmi6jbN0c
 mq0tRDTJ+g3AbpRth6g==
X-Proofpoint-GUID: X4hpnMrOoUsBLyiODpsAvkmQ--St3SpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030081
X-Rspamd-Queue-Id: C8ADF1ECE50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95109-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Abel Vesa <abel.vesa@linaro.org>

The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
controllers. Describe them along with display controller and the eDP
PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
clock controller and link up the PHYs and DP endpoints in the graph.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 471 ++++++++++++++++++++++++++++++++++-
 1 file changed, 463 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 2aa9af8c96ce..bab67f6bdea1 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2367,6 +2367,28 @@ usb_mp_qmpphy1: phy@fa5000 {
 			status = "disabled";
 		};
 
+		mdss_dp3_phy: phy@faac00 {
+			compatible = "qcom,glymur-dp-phy";
+			reg = <0x0 0x00faac00 0x0 0x1d0>,
+			      <0x0 0x00faa400 0x0 0x128>,
+			      <0x0 0x00faa800 0x0 0x128>,
+			      <0x0 0x00faa000 0x0 0x358>;
+
+			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref";
+
+			power-domains = <&rpmhpd RPMHPD_MX>;
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@fd3000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -2434,6 +2456,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -2507,6 +2530,7 @@ port@2 {
 					reg = <2>;
 
 					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp1_out>;
 					};
 				};
 			};
@@ -3683,6 +3707,7 @@ port@2 {
 					reg = <2>;
 
 					usb_2_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp2_out>;
 					};
 				};
 			};
@@ -4047,20 +4072,450 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,glymur-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1de0 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,glymur-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x93000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+
+					port@4 {
+						reg = <4>;
+
+						mdss_intf4_out: endpoint {
+							remote-endpoint = <&mdss_dp1_in>;
+						};
+					};
+
+					port@5 {
+						reg = <5>;
+
+						mdss_intf5_out: endpoint {
+							remote-endpoint = <&mdss_dp3_in>;
+						};
+					};
+
+					port@6 {
+						reg = <6>;
+
+						mdss_intf6_out: endpoint {
+							remote-endpoint = <&mdss_dp2_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-156000000 {
+						opp-hz = /bits/ 64 <156000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-205000000 {
+						opp-hz = /bits/ 64 <205000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-337000000 {
+						opp-hz = /bits/ 64 <337000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+
+					opp-660000000 {
+						opp-hz = /bits/ 64 <660000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-717000000 {
+						opp-hz = /bits/ 64 <717000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0xaf54000 0x0 0x200>,
+				      <0x0 0xaf54200 0x0 0x200>,
+				      <0x0 0xaf55000 0x0 0xc00>,
+				      <0x0 0xaf56000 0x0 0x400>,
+				      <0x0 0xaf57000 0x0 0x400>,
+				      <0x0 0xaf58000 0x0 0x400>,
+				      <0x0 0xaf59000 0x0 0x400>,
+				      <0x0 0xaf5a000 0x0 0x600>,
+				      <0x0 0xaf5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_0_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+
+				mdss_dp0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-675000000 {
+						opp-hz = /bits/ 64 <675000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0xaf5c000 0x0 0x200>,
+				      <0x0 0xaf5c200 0x0 0x200>,
+				      <0x0 0xaf5d000 0x0 0xc00>,
+				      <0x0 0xaf5e000 0x0 0x400>,
+				      <0x0 0xaf5f000 0x0 0x400>,
+				      <0x0 0xaf60000 0x0 0x400>,
+				      <0x0 0xaf61000 0x0 0x400>,
+				      <0x0 0xaf62000 0x0 0x600>,
+				      <0x0 0xaf63000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 13>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp1_in: endpoint {
+							remote-endpoint = <&mdss_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp1_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dp2: displayport-controller@af64000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0x0af64000 0x0 0x200>,
+				      <0x0 0x0af64200 0x0 0x200>,
+				      <0x0 0x0af65000 0x0 0xc00>,
+				      <0x0 0x0af66000 0x0 0x400>,
+				      <0x0 0x0af67000 0x0 0x400>,
+				      <0x0 0x0af68000 0x0 0x400>,
+				      <0x0 0x0af69000 0x0 0x400>,
+				      <0x0 0x0af6a000 0x0 0x600>,
+				      <0x0 0x0af6b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 14>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&usb_2_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dp2_in: endpoint {
+							remote-endpoint = <&mdss_intf6_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp2_out: endpoint {
+							remote-endpoint = <&usb_2_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dp3: displayport-controller@af6c000 {
+				compatible = "qcom,glymur-dp";
+				reg = <0x0 0x0af6c000 0x0 0x200>,
+				      <0x0 0x0af6c200 0x0 0x200>,
+				      <0x0 0x0af6d000 0x0 0xc00>,
+				      <0x0 0x0af6e000 0x0 0x400>,
+				      <0x0 0x0af6f000 0x0 0x400>,
+				      <0x0 0x0af70000 0x0 0x400>,
+				      <0x0 0x0af71000 0x0 0x400>,
+				      <0x0 0x0af72000 0x0 0x600>,
+				      <0x0 0x0af73000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 15>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dp3_phy 0>,
+							 <&mdss_dp3_phy 1>;
+
+				operating-points-v2 = <&mdss_dp0_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dp3_phy>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp3_in: endpoint {
+							remote-endpoint = <&mdss_intf5_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp3_out: endpoint {
+						};
+					};
+				};
+			};
+		};
 
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
-				 <0>, /* dp0 */
-				 <0>,
-				 <0>, /* dp1 */
-				 <0>,
-				 <0>, /* dp2 */
-				 <0>,
-				 <0>, /* dp3 */
-				 <0>,
+				 <&usb_0_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp0 */
+				 <&usb_0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp1 */
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&usb_2_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp2 */
+				 <&usb_2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <&mdss_dp3_phy 0>, /* dp3 */
+				 <&mdss_dp3_phy 1>,
 				 <0>, /* dsi0 */
 				 <0>,
 				 <0>, /* dsi1 */

-- 
2.48.1


