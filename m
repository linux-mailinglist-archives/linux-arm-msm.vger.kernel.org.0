Return-Path: <linux-arm-msm+bounces-103666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GFBE/bE5WkGoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:17:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F34271B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 576F0302E78F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE883822B1;
	Mon, 20 Apr 2026 06:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yrap/BSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acKUDeqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01538228E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665618; cv=none; b=AGhf/tnIxXfpiAi3zpAEr/s+hoCDs+5DHGQrIL4IClaIrl/oEAVv1L3tewOiHC/cYxf5F9BbEaCqYRg096r3OvE20jGBmq4MmJ69kSh5McXf8EUXeGkxLAfZfHVFL86JjxTqPJFv25icv2jh1hkdxDUX0s15h3aWoG2dN9ImlIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665618; c=relaxed/simple;
	bh=WaNBJJv+6oSOPyDrHj7H5U/mPHlAb+zThv04RVsrfDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fipy58goNs9/KK8vmq2AqDUvEdzbKPkA1j3g1aZdd4i//uZwN6VnMAaKQGYgGPkkFddakmO1WjvwOa23sEFkTEINlm+wDp4XrQdqCJ2Jcj1wbmTbaxlDY8GMAl9UMd1S7vWW8QBs8pSk4VQHQIV0fjHYsGZ2Nn1UAy0LkUHypyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yrap/BSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acKUDeqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K4QKLm2703900
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVVQaFx6O4r01adoydXe8nktqRl4sT+iMmmpPIdWQYw=; b=Yrap/BSZl0h6O+Zw
	W7B3mr7zSD7bd2XJsQQ58IOCaqSn/iZUDKPU6qvF8vACf2ENPdKABSk1Ay6Ph01+
	Fdx1WotmmXMzJWj92/SSrY7gAOo6i2l2mgoyt2P9DeUazJ5nd0QwdzYiWdCGq2YQ
	nXBBzV8Ra8FcVH1ZmCN5RjqEhkFmSNPwFer5DgZGhOusBx5w5hW+anldlPSCzCg8
	UAvPXeuZG4vbjXH9ZAqRGhPcF413YA/8O3/0DJiF2zjBoQJp1do+41zw4CO/bSKA
	uEFgvZcxMwo9rJIYdWXLNSMLYeZRhZGnJsn3g3ljQlBCrf5BAlfZB58nN22MjRSG
	KJSKJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261vax5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so2558753b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665616; x=1777270416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVVQaFx6O4r01adoydXe8nktqRl4sT+iMmmpPIdWQYw=;
        b=acKUDeqZvGmCWXQm7g5ygkTGuz0nqZOvIgFmYECVyYciKTOnn4r+PIPWLMcO9CGWbb
         m09cnu1T5prBnFcY654Q8RUSVYwS4sOv4q8DqLJpldB14zU7k3SH8ybLgjCEqRhZtwAj
         44AlmfJPF7kaahDoHn4fmz+fp5/LwDX000BKl3hc2bHksKd9gFy83KeAlCtzaOrh7q/o
         MwX2GTXx6wFtUmkS7pjWEMgh0APpTr9i62MulDuiOksJ0OC8Uj8GxYE7iWw6jptMTeOc
         BiD2h89Ai+hsDRorYGzO3r/ov1NsrfPQrDJSYU12HmL9BMprkGYMjyrRZ0o6XZjsfSTn
         N2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665616; x=1777270416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VVVQaFx6O4r01adoydXe8nktqRl4sT+iMmmpPIdWQYw=;
        b=VVeVGNNZpVl56qLhF+eE9Ow/IC1hp59reT2ILb2fjD1heIjOtck6mrFK0B2QC/ETKx
         xioFBr0Dqo7vfvxjAgUSiOPbhNHq8U5ENGzVlcc4FFcDRhGA59tzH0uwm/Fd4K7w5FTg
         pkmExvfgNdX7i+pU8zeTG6Ky0iYbfIskHzrbobL5I4OYvmkZjCwg7Dj39PmPk8RDAYUf
         heypNiPlSK+ETf8a4nEnVj0gEZmqO8+RsQtE0sYWNkQZ+2BiEZIjt44XWFizj5EPOMOU
         f7+/XtvaS+s+qbZEIyePRCgIXW0QyBAuAeGJ1eU0GVp7NKd0k9naPt9EeYPMrXUN0DkB
         H9YQ==
X-Gm-Message-State: AOJu0Yx+W0y9bHMQB0qTHWGLSKrKuJGCmvljayru5Kd9jEEMPLAGl6tR
	jIcQ3FXd771A1P73OLivNmMA3uVCsh/35XoeSSAgyM0brQK8tLNgpRNe48iYL0dgulcrCArAQzp
	oLZ1hmM3alTQo9ticyprZRYC9NxFn51pEDes8pLmgaexd/zBv4WEGOBy8/ORfaqrr0p8LbJGa/p
	oi
X-Gm-Gg: AeBDieuwGMHV8ADM0Wjpja4rhPvA0OC0mQWxW1axiTGvkJ67ZxeAbMEx7+PxuKAEy9B
	M0mnUXzKeUWuakErmCTfGEtu1jVDbbgIiQ3GAe6CO4JEC0BGtiXCa2cabRKUgRrVYxWWcBVKTj2
	5uZe7MpfsIJBnDYM0vpLmdO2i7cj3W9q5odceuCo+9sq29bmjNF/3XL3Lqs4ekc3jtAF0g5W0dC
	+RU1YsxnHF5AGKb8SVAxe7dKBg7+o6CWF4C32fcYz5mSt6/W2SpAxXqY5x5yECA4ydrmFn8cIXI
	/JewmBfJuODhou7bWlZh24nS1NS3gkVZ5q64s9TNuh+nn1fSHNpmh5mKy0SQlc7GmzMr2mDpAce
	fJxD236ZKkJWTCAYhyfd9smm2HVHQk9J/65cHN+oqJSEOXxXpAIZNaiRNrLv/5nwaBV0Y
X-Received: by 2002:a05:6a00:2988:b0:82f:66e8:4257 with SMTP id d2e1a72fcca58-82f8b565509mr10317128b3a.32.1776665615550;
        Sun, 19 Apr 2026 23:13:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:2988:b0:82f:66e8:4257 with SMTP id d2e1a72fcca58-82f8b565509mr10317002b3a.32.1776665613218;
        Sun, 19 Apr 2026 23:13:33 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:32 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:53 +0530
Subject: [PATCH v3 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-6-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=1316;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=WaNBJJv+6oSOPyDrHj7H5U/mPHlAb+zThv04RVsrfDQ=;
 b=YjQE9TtlyTOLdtjF74fv4xRCrvlKlwM0C7iDsTGbqAn4OMBL9tb1wjyaBd1jk2NFfeTg76P6R
 9zfUwHSASnQB9cb5FZR/Hvpph+K90I/ZvPwIuEF2aXwB8VXB+IJIr9V
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfXxdtb/NyaByOp
 k3uBJvDdYTLBsdu85Z3FTnnOqyJv58oQeCGusLOSnztId/vglurUiG5AB5DA1V3JIKZPE8tHmkH
 v4QcMdFqaGQMpI3QxIEhhcxeLW69t2+bO8RuhrvprbbSpsWlKORmk2kLC+FBhZUH6Kw4aZbhVyJ
 L24fETOgPunfwAMFE8lx8nfVwT7FuITQanzJkU6/CgfdLfLKNK3RjRNDWwp97QTV76EeFw0l27x
 qbuXQAOWTH4SWI0TuUOb+YfOVu8FYEA/c8dWYhtXiHuL175buaKe2XaaT8kR/DnGITNC8pvcGw/
 xJkZN/Dja1pUwkjrzoT8UNMTuBCaRFMIuWHDzmR+8zvpDTPrhxwTN4nkRnepPgmihvghmUW2JXB
 /06tRGl3J8hyvwUy7wFY8Ymgqx5MOWAJhSF1vVVBDh+itALcKSy6YqfPVCD0u2+7Gfu9gwQPWer
 Sgbt0RU5F9GWyCqrHCw==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e5c410 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: PdEhXiX7-XyHDNby0c3iQpuRrm3ANRX5
X-Proofpoint-GUID: PdEhXiX7-XyHDNby0c3iQpuRrm3ANRX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103666-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E8F34271B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..01e35e34ef51 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4312,9 +4312,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


