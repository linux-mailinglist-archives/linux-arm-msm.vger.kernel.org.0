Return-Path: <linux-arm-msm+bounces-104431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AStDlhJ62mWKgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE9845D4AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BA3C3070AE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B859338E5C4;
	Fri, 24 Apr 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH4+g7Vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsubuNYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF78D38F954
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026988; cv=none; b=HO/WjBshlsFFkJsvXnZnLDa/TrAmb3hA7E/7vSx4AWQOA87UUR/X05ufUIAbT6Sl8+rsDHe2jL4kebHl1vDRsZ/46XzZ5SzTUKPEl0xK3x0zfOBUhcDJKqHDt9oHwmYQKkpodJXaZYBRP28tSlv0+QDC1SyH0gZbui9c6wnF8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026988; c=relaxed/simple;
	bh=s1ZA/D83mONCPI3fvWRV+QKqAIgDXDqkKAjXtCiygsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcRRIPv//sfhtOpLXx6xFfkrx6HUNWtesHY31OSNDf39V8tsgKVi8PZxMHx/obXEfvgV9eEtzDYKnBaw4UYvjNwlsueKWxgQfROrNAgCMVkxcWIvHnkoldEFp2XxN4UJe6sebvco9ONZuDoLmgcHUebr5U4g5ytcmE5AeWA52y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH4+g7Vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsubuNYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O82Ua02291857
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRfvQoB42p1L+b22QAnoq2fK3TmD3MV9CgEN4SOZUIo=; b=dH4+g7Vx3Rn4ZMVX
	RCNZba8Rd6xE5sdOI2nLUYrNW+AGSIqzZPN+nZMV+XL24ppVgC2eLG/2QdhPlRqq
	8ONvh9hLUsMiQYWRK0AMZwOa4QNRaapoU0wJgfcfgffWpNhBmTCVmd+WySoT7mYT
	L/k3vCW5sEOPTNajqb0qFnWahUQJrf1TjOVjkO+jWXRdK2n1I3itnLVZrOuhD1GX
	P641q7AM3ZPxlm6aCbwg8+QYyzBsZl5oZbtj/2uTXW/9lCnz6eiZSL9lOyrJzEEZ
	0a0gL96xDmpRvpf6dVdqiABUVJfvh6qA8KDTUZTKt3PooXKzu7fwDZGp+cH3MxDn
	UP+uLQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbpa1a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:36:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2de07c12745so17855682eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026984; x=1777631784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRfvQoB42p1L+b22QAnoq2fK3TmD3MV9CgEN4SOZUIo=;
        b=bsubuNYC0Ywh0VjlRpuJCvDrkhzis8DEGzQDzejkZSxhcSwp6nhfhygBo6FOU8XwPR
         4W5fV+kPpU8dyGuvLioLaYOxz2rsCQwt9vckS0fa2Kc64Gyd2sxJFFQKjIg9uZl1NXGD
         3OJ7qG7IyGzsJeuhZZXp4rxlKleRfTAvGXmJN6BsV7xaIm3m/9IEzk0LUG2GEMhw0Gtz
         OEtqTrnzdjLUB45mPxeILGXJPVXEooatFxaT2kpueOe/UhPlMj8PuMfrjhzDANJ9U3Tf
         sQ39fxeUSgXXGfKB6h6lRiLHpp0KR2XuU9tSYEccO54UmN26WHFwZevODd6YhA7RyGj8
         COMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026984; x=1777631784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZRfvQoB42p1L+b22QAnoq2fK3TmD3MV9CgEN4SOZUIo=;
        b=LzFdVkQ06t0KNBSsA+dxvGFriofK+0EU4VnWf2Ucfm1WccszZDoLJ4hkXSyKVVfEQR
         GdW7uv96opOspZ6bDGwptvT3c94Dotv9RhsR9Svu4XPhDKyJaGHM7qjJuFYh2I2ukn4U
         h7jg9BBgNoqn0Fa6XUVmCXiqyh3vpTVCAcxD8t0hSXkqO81EMt8HJrtnen+5JzK5wz54
         mjBq+9OCrZgxOCz4yxDGV3rZ77HOilzip1q1e8CJD0U2bcoUAsNijaX3GDh/j8YYRMKz
         nC3xXmfbob940RDhjwaDs13fWMVyH22vIiyXDjp88BY0579Df3Pwg8jQb9xkvKEi9DV+
         qrHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DTPHob9JAMlwfqPfFvQZBVpGm6v4Q3IY1GlvmQfmR2mOpyftlFZk2N32bZgeSkoEfoqjxAj1c4IdlQlNH@vger.kernel.org
X-Gm-Message-State: AOJu0YwymTp4NJDxsxYU/hhNlCNUEsxv7VVlUz/xpL6Z4Bqf37aJ+aBc
	TtWJ61iD4UAuj0lBBUj+b1+21d/AW+GWFrDFv7c0IRWxidg+TrJ1ydh4pOsXjWb3dMkiS4qVOB5
	F2xTBqWLUUOdrjcaRJ6J0QZKummK0dgTUKm9GlcJf1ck5UxlCiROgHL0CU25/NomQnxeb
X-Gm-Gg: AeBDiesHowf+w2gJZHTLxl0f/e2I8Ju2ZGUhRz0aG243SoJn9/aOul9jTB2O5NHLGRk
	axMtH9OT7tRbwAk0loYWQ5p0zK7TyZ/KqYu63D/RMV7Jy64pqLkwHhv1MDwBD2eITd9t1buwc2P
	Foj+JO6s+m/fcDnO6FGJ86MTcY3ixTQJTdYOnglTSpII9/9TN+2q1to1rFjQ33Vzfz0r0d/FytC
	mSsd696IZ57I9Fzx33AbWOv4ihjpJ+SNoIMwERdHKlPe1FkpxHUYIl6wQ1+NP08H8WreHL6fRFV
	WKuafNfavBdjs4MrhDXuwNw1SYVVvgStp+/PY/A7yOQINhsKlqeq4VzTlD7e2MiGRzlSaebD7WO
	l1S0sY8Yj84xd1mvbEyEMZcp9p5R5u9oTqaSVhna6sM1riOoVl9LoGyzPgSwsHIgjwKO8himcDk
	ERPcsQnQ==
X-Received: by 2002:a05:7022:ef09:b0:119:e56b:9581 with SMTP id a92af1059eb24-12c73f6c410mr19454830c88.6.1777026984395;
        Fri, 24 Apr 2026 03:36:24 -0700 (PDT)
X-Received: by 2002:a05:7022:ef09:b0:119:e56b:9581 with SMTP id a92af1059eb24-12c73f6c410mr19454805c88.6.1777026983775;
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm9187846c88.15.2026.04.24.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 03:36:23 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 03:36:14 -0700
Subject: [PATCH v5 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur-imem-v5-2-18ede63cf063@oss.qualcomm.com>
References: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
In-Reply-To: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777026981; l=1116;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=s1ZA/D83mONCPI3fvWRV+QKqAIgDXDqkKAjXtCiygsk=;
 b=He1DNCiHSWNFmcRiEIA+MJNWwRnuU9TKfgvt08E2bwtN3qMRGP4klfvxanffqbuIMo0pXoiL1
 zvPDdvCV4QLD4l/P3OMHMMfjJ0uwVvbG3Z9Sx98r2j2kvV2jOfoUxWZ
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: -54iVWQUbqrEnLoKLi5OzC3JfgFFajH9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDEwMCBTYWx0ZWRfX/1Nbf2zychlN
 OCPmv10iHG7GMbFNfHQLRC7ETOBgnvVthIA5oAUzrrJp5j8GON7FcJmQB4FU6PXR8cwTw9NsWvM
 honQNVIIh9MW+rKFBRSBH0iY//devsHkUVzOzST0oS/FyUyKS82Rsx8E1kh/CknCsbC/tq9/xiS
 z+XxosKf3IPTsowPMj0UtnJviK9OCWDH7865YV15xUXLomKdqpNNU8RhJnq16gucTwDURTQOqQq
 1dP7Ipus9+FlV1JbiOJB9+Y0u/SIB2htdeeikOz2hoF+4w4LoKAogrvTC365HyxLdU9ZYc0PkpL
 +GdpW40c0hQN4wK+y2oqIDvj9PD12vi7VRfJD9XE5I3+nfGimoGgQKWdsaN9aXSn3ffyeAWhqis
 c4Sy48snx5NCalEXIxshruXxxuWx3cNy0hDpxsbbOdpXtIRcBNp4Kg0I1eW0X9mZKciM8Te4vRp
 LcWL+Zt07guUMR35AMA==
X-Proofpoint-ORIG-GUID: -54iVWQUbqrEnLoKLi5OzC3JfgFFajH9
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb47a9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NM_c3QKFEUqHB8hYJUIA:9 a=tIW79zcqoJXJ6Hta:21
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240100
X-Rspamd-Queue-Id: 8EE9845D4AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.228.225.192:email,94c:email,0.223.255.192:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104431-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Add an IMEM on glymur which falls back to mmio-sram and define the
PIL relocation info region as its child, for post mortem tools to
locate the loaded remoteprocs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..84a115993e7f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5501,6 +5501,22 @@ rx-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,glymur-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",

-- 
2.43.0


