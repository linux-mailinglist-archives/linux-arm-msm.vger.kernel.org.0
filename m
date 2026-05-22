Return-Path: <linux-arm-msm+bounces-109416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EReFx23EGqFcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:05:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D65B9E38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7776230839F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D443859D2;
	Fri, 22 May 2026 19:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX9pJAfc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTUWfDAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76238331E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479708; cv=none; b=hSJ/ImULjul9FElqxlEKFCTDa7pyQFDXprlERa4y6Eo8365EUnruSzcfP2jdtVwezzol8o0edswh7yAoE26JJM1uVCloVupwot3537WQwJ77bhZpCIKfIXlEhRXkAiD69/AaBGWRleHGU663NVIlBJKlezS8GchQDA7wsQZZ3/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479708; c=relaxed/simple;
	bh=oUbYgtn1B5imIFwv4hQI7KX3V5yd8V3dM5McS+c9AMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jp0Cr8GpVPA3F6Ax24SlGYI9SNmlI/ma23KvXkk4hJlatJbiCPWeZ20Dqj2wh3Pgf8dFFFlajd+3JPcGhmCjtY2g5ajtbrp1LD6SRwDjbeqACLDS5P07YQvTzmIJ+RMqD0VjLVKZrX6RkSOSlAv+MabcZkoWRgDPZURKkHPRUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX9pJAfc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTUWfDAx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0fvb3477008
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z1NDharm0At
	7MrYM34BpBxzQ264HW+VcuEaUz1uKlho=; b=mX9pJAfc5AyO6OzBgeLbmaE+Qrw
	KQwSjTj5oHTRe94mm+FeZSBZSpwRYZLv580hrfhFtmlIYyF48m8ua6sDwbabciZS
	FKHHmAMaADR30JGOcTDVBwxnpqVAY4iz63cfsHcrJQAWklqvdMq8kuSuWGHJKn3I
	yBRd4cc0gNsoyfVRlKLMKFCS2vVXP0OpM6prPB/AV4fs4KllnfqROQ4CDg8xk0QB
	5rmeS+uBpzAfUOD0RS973RX6jlqalEyqZLc43c0b5fRdlu9l4m6cz2VLRFGHI3ll
	itqE1/qpDyACZhciTpljYJ4DGmEHkDNtsLve0R6GURRgtjrrGaIs9CrZgxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:55:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc6899bfb1so77655825ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479706; x=1780084506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1NDharm0At7MrYM34BpBxzQ264HW+VcuEaUz1uKlho=;
        b=dTUWfDAxOv1fU5cr9mYXvTBSy4c3A8RY39jgba9TrYNIdubHnHzMkU+gzoru8O2DCc
         7BRq8VyG7gDib2u+f66QvmPd8HxWGrZfP4Bly6e3gBPm3OEgGpxz5b0C6mAuXQQaquyr
         mMfu8QBGBFn3ehLNUeg4P5S5PwfUiGlA/57fP6V5cTFAEZOivk1/iOpZ9VgIS+Bp1Lft
         xWF1xeOhQR4XdGuUHCK5WyMtrgP1rHXV5wFT6wDHwFF9bT1gUOSFQ3KxlQ621yx37xxo
         W8Da4TExvTESUFA8DeUxXQ6Ywvnw7yUbN7++fVSUie9m5Bl7kQsuIZZm2aYMXWCAWEcF
         CZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479706; x=1780084506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z1NDharm0At7MrYM34BpBxzQ264HW+VcuEaUz1uKlho=;
        b=IXgqspiG6WWw2jCB42AlVvi6kdeFnPHvoqVLwNt+ppgoSyXXhKKdUiID430Zevsg8A
         91E1uR83WBP8HmQ07z6R58rriIFSio/A+d9HBzC8YoMi3bpGT1s8mi40qbsTRysTleuD
         HXksPuyfx5Xc0+skpBFU/Rolb3eqDq8gRiNRXIFJbcI3LgoNusGR2DpxcxLT21CN5dk6
         LB93r73Mc9MZd39M9yRImW6C3EEaHJpXAyalukj6CPnbd2kJDYVmPQrim8DujwXWIxP+
         YfkdYBkcVz5tERsy3h4vKji5rxVScaCyvTitVcYp0SzsHgu/U60kM1quocPRpMvI7aAH
         d1MA==
X-Forwarded-Encrypted: i=1; AFNElJ+BcvDLbmtk2f2+kSvs9XKj/bK0ElagSyIYGiFutVQ/yNMovvHqznA/p9hCXIYYn6w5C8v1Mklf+JZ7kBvS@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZnICi0PZGlyzGFkECG66pYuZ4Tz0whBCPZqy+atchu1soM2L
	f5AHqt7YFSFvFpLG5f51k6rCxnDPRe/vTLlypSEf3o8GWDgneQ+/b4XNSqQUsZhKFbrwnSZPFSv
	Y/8fs0DCCi5TXA0MVEr13ngzerCnbD2kWXAN6nuWQs7pN/gfU4x+SlnC4/wS1v4N3ENSm
X-Gm-Gg: Acq92OHyE6cg++iXXMl2BWj2mBMvVX6mnyeuttePgVKC7tVdEHgR/yZ1CjUr5qF19Ga
	DwG/8pk8PVgP99PZWPS335Y/HH2gkakEHrtwqxxaYNNZ4vyyck4uGf+sGmWdRSNWcNdzvhFoKoe
	t2i6ZZo0/iVceMWFMwoL5HAAC6tjgYrzlmQh0G0wEulAcNg97wwbS4ESqswxB4hVHzE/50EQU/b
	xhhvFAb+UEHu5kjgXnZ3GkQIoUipvo+OBsKZNSEnHBdpESybSgUUgt1W0tQJjPxoFdDDKkTJdUn
	8VNMsFnr2YI7dViYySEHXoZx2U1Q65uO44bqBMgRwAhGGYrGzC42tFtl0Yn97Vbp6+m+st6x6OE
	DkNbe6zVy8roWpNDho5NEK3ceFGu529GAKBUbxnRFoyWP/W99CXQlQjN6h5w=
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2beb034603cmr54750895ad.9.1779479706158;
        Fri, 22 May 2026 12:55:06 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2beb034603cmr54750545ad.9.1779479705675;
        Fri, 22 May 2026 12:55:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 16/18] arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:07 +0530
Message-ID: <20260522195009.2961022-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b49a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zy7ih2t7_jjbBwy-ByynXs_JaVWnzhdc
X-Proofpoint-GUID: zy7ih2t7_jjbBwy-ByynXs_JaVWnzhdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfXz9CnkmuVv2co
 sX+KKiP0um3tkD36RZR9CQW7neon89Ox9lIwc1oi2Xcxc/ZRs69iPgYHYmbIxvOVv37fNsRun5m
 dwk1uEpfkNfH8BjOY9lIA6qYOqEinG5Soswb6E7zIaflhhr81zloq8oCRI5QNweO2LP+iAugqwM
 jp5fP7E0mv7Hgq0GJ/9JLW6JC7B+PfwBw/XkqFNugt//p2lvNI/cgrF7uRqbWczYzZ2SouuhXyU
 ghLVxDT2An6DWyoIwQaNB8FFoe1O/Mzbmd2VHdFov1F2mVn1R9++m+tRibkJ+6hBRneGWPVs7OX
 jwZ5SNuz3zIPhUaoSy0gE8qKcHTzR7sPPjgT7RjldEyVGvSnV5slJNDXKUu8qkKQGdJScHfSqaX
 Fn8esXYKg2zcFlHc3cW52vJSDkjC/qr4YyUQXXx6pr9HnW836S+imkc11Pljg10Z3c+V52Tqj1s
 FNF5IiTJg2julyv6YyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109416-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[94c:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,c125000:email,qualcomm.com:email,qualcomm.com:dkim,1c:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD3D65B9E38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549..71a228597093 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -307,6 +307,7 @@ scm {
 			compatible = "qcom,scm-sm6375", "qcom,scm";
 			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
 			clock-names = "core";
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -1645,6 +1646,10 @@ sram@c125000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0


