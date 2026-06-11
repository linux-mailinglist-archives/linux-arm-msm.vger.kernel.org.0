Return-Path: <linux-arm-msm+bounces-112611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o9GFEGFEKmrMlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:15:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B066E72F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:15:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qdsvu00M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jGS7bTW0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8988302E0EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081F13998BA;
	Thu, 11 Jun 2026 05:01:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BD2394798
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154081; cv=none; b=i7sygUGcGbrP4ol4JemkIds+G4BVGDeBtCdm0W+9bxku3PEqQOeOYYpiVYkwoYMij2bm/qpoM8Ao6WnXp/f037oS8jxezmlU19+3OFrCdyA9tf0RX2DjCNpDF8SvNQaggrTUwcHu3oJbv5Ji/lydD5lYBiDYotBQJ9aW6vM4Zno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154081; c=relaxed/simple;
	bh=e53PVnIsiLOc09/gmq/7tWbCF/q53MrOPjxF7RcAI5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwl5axMX5Lrioe2Rb6R6TWDH2imFUcdvGfewB+HSEYpV9yL2NgnYP3BqzDu0i/+rr5FULQQ2l9x+GPaQ57KByOwci/dQ6XQLQKVKLgu1ZpL+3HXy1PAcekHI1FH5dlMo9o//VYQn7ianxt9vY9t2K4bOupJ2DivDuzUQHJw5cIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qdsvu00M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGS7bTW0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NRhd3184198
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdHF5BK87mzrb2oL7IcQNCyKVDi9pCfEGddXm+4/bts=; b=Qdsvu00Mu5NhgT0T
	8xOmeDa5Vko5EQCJJicLalN0vOe+SofEYGLaPQ8G0gWeebtNiPl4EV6XFEkAq/tG
	dL112RavU5fbBVDJiICOC9Z9x1s/rZBZMjyEzVSxSGj7+1b1BCXvFZroUM+e+AZ7
	CvfqgOMRvQKMKqQNI5uNypmA8NNx3bJbtz2grbfuV/SdGicBjz8FHFgQLttGzJ/5
	BJ1zmIfOj5lyzW28Zd7A2NN65c+LIi8DPq//wzWUNxMADzJzowEyYRjJYRND8lLX
	jKVDahV5YWnj8OPA9ncW+eObDW4pPmGOcQYyaLD9MkCZ10njTJO9WW9vgnRH8tp5
	3i5j9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6usnw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf004bf8beso86684175ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154069; x=1781758869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdHF5BK87mzrb2oL7IcQNCyKVDi9pCfEGddXm+4/bts=;
        b=jGS7bTW0xBQpNz4CCre1DQX0UaOuWNEukClVzSH6XLjMY3G1IF4te68QurY8m1I7YL
         aR+s8JHCzkvRqAARwJE18BH1iOVAW5NE/TC1ggWRMxhxXvigrTDMTgDZehF2JsWK9Q68
         IWev63Ffr0ziGXy6ZEcNGEbNGftrKSOh0m6VNTuJFkBMHSrKG3Ic1/DAFS8C7vbhunQ1
         BJUkty0D8bEflZFWx+Ze8b6QUykxagCni5BjAXJuuPfzUvef4WsKi8laZ1+CtcYyXcTm
         uDeaKgVr+8LDIjyEXxbHWm8H/iSGWlEe7EB9nzYfCO4PiSx6JDndo8U4Gr2xDEIA0n+Z
         Q4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154069; x=1781758869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LdHF5BK87mzrb2oL7IcQNCyKVDi9pCfEGddXm+4/bts=;
        b=SX1zDzwxsmUQ4o3YhnxyLfc+IVYntpEuE/iOb7hlDKL1pBB2OPZTyxFi+Wk3ag9o4s
         RX+8MVe2JfV8/pePRWpEEqD1zidmaBnBBrOeS+DLOoEcRQ36t+vVy2/xXXJ7ZSHiae4k
         ppc63TKJaXE2/nf/sx6oB6KB/Buiy8j4utftH+hpicohKatcjlN192k7l/LELkI72whV
         USxZHROXPlA4NpuqlhxdrYgR5vns7jE6+6idHP+YRidHus0OTLa6tkqh1vCi6UG/cPqB
         1U/ZFKVUkIwu0cnvFnlS+tAf0byn0dXjvgAmYTBwF9/9F/izFvatDb9aXRaQT6sDt5ia
         JDgA==
X-Gm-Message-State: AOJu0YxzvuXR5/l2/6X1p4H3peM1cmChCkOhoL4J9sEojVq1GsintjfE
	5C1cMuApf8AqRYavUQk3Xm3Gw9IY2OSUxdQsLCNYdOy0HPUeVJJVomD/9RPE/5FHy+dLS0jo4NS
	FU8/BAvHMdv49+uBTaYYv07JRXveIjCI6J6sOTZIDsOr60uUaQNQ0kyAToLdkVRD015rel/6BQQ
	/L
X-Gm-Gg: Acq92OH0c9snCwo0gvE7ZcQlH9D8N3aXdoPMCKxVGoU4DAlJ6jYLM2a0SIc8CPkUQsH
	hpiSfuLHvKrAIlT195ArP3WJ3+IBgJFr4dF/doWSpwX2WHs0EE98DnaM0YJEFHOTcivUM4xjBuu
	6LrJNEBgbgM9eZYVZOLjJUxKRVzBore5/62V2RG/Mz/tZ7Zbe0OfDv8zMoGx9zjLjdxyyZmM1T5
	zd/Vyr4FwRe/NwnIopkYoohcUvzA7CmtpOxxsJxo+KqBgmNaziIkyGJGAVsHbWW8MKjITbql26Y
	PZtQZN8nouYYLCxIKMaKjdl2T/HCoU6QtE9GWXXFaW1D7dHWCuQpvFtjywgtU7JcCfyF8KuyU6Z
	wQTUr0e3yLw50kRk/WFyh/MzZM+UQZJEs6T8y3D2wPgRZXYynG9Ak8JNNcuhL+WBdV0s=
X-Received: by 2002:a17:903:124d:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c2f278fbe0mr12309705ad.12.1781154069094;
        Wed, 10 Jun 2026 22:01:09 -0700 (PDT)
X-Received: by 2002:a17:903:124d:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c2f278fbe0mr12309295ad.12.1781154068589;
        Wed, 10 Jun 2026 22:01:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:10 +0530
Subject: [PATCH v2 34/37] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-34-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=2736;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=e53PVnIsiLOc09/gmq/7tWbCF/q53MrOPjxF7RcAI5Q=;
 b=HcP5OU2IGal8udyJP/M16TVSaEBeKILqIqLf1hLmIihpKWyDvw8+s5TNbad+VRlY6WjwtgB73
 bnjjWBeKFQ4AuuZdRrxSMtoD8HWK7gbEDxY19IqzWcKdbIiEGbFE8ht
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a4115 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3l4MCJL4z0cw
 dTIrUuo5jvErwWZypyXI9XWnxcqp9bZ9aa3f+Y4eVjM1Gh91ojPVxLYIloAtKO2p+fzngMkeILl
 nwiiuYAUBAWI+aSR0zsYcuxiXYqBmj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX2Mg/8NsbFS7I
 fjuoKlD20OxSHQ2UxbTUpNF0qgRmzQ/UTbQ9UM06rfgxWg0sIBmUhHSjTihBRF0yot1y3uR1/Uk
 m7QCddf+2GgIPuU9wxz3lx+Vn+tI7Hv39LTBomMXx4U+E0ZIYi1ni2VMk5eFsS0J4lbAIpztMjr
 wLJcVGXzpI0oOGuR1d3IOEz/Pc+Qy4O6dCiMd+F6KG6TKHZfV6KOgwy4RtWMtbYxy0YCAJK50PR
 vUnzozFF3UWSxQMtMJnwrTuq+VwCnZxaB+bBNlK035ygsrtA7grJ3pFFiFVcb3xDyQXjxHpqAl0
 n/Oa9YCAU/a6Yp3jf4emg9Q6Sk0bBt7XxpcEtx0DbrXDSA3uM8rrcQRSOS1OCFWGdzTA2FYNXtn
 vKRI+Lu7YBEYc1GO2JLJQgYj6RUae11zgBwdwvnz0gGCbLWLaAJFooAxobKidv578eLOYmilgl2
 YX+AY3aooF9Zx0Rmimg==
X-Proofpoint-GUID: ixqCz0JGOXNnVzbUidzIQT3E9eP1Vomb
X-Proofpoint-ORIG-GUID: ixqCz0JGOXNnVzbUidzIQT3E9eP1Vomb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A62B066E72F

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie_port0, and
move perst-gpios/wake-gpios from the &pcie controller overrides to the
&pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 8 +++++---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 8 +++++---
 arch/arm64/boot/dts/qcom/talos.dtsi         | 5 ++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index d89548a2a3f1..94a6849566f8 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -444,15 +444,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 6eca3791e2b9..619880b0ddc6 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -358,15 +358,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..6f5f468ca4d6 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			max-link-speed = <2>;
 
 			operating-points-v2 = <&pcie_opp_table>;
@@ -1371,6 +1368,8 @@ pcie_port0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				bus-range = <0x01 0xff>;
+
+				phys = <&pcie_phy>;
 			};
 		};
 

-- 
2.34.1


