Return-Path: <linux-arm-msm+bounces-116312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W00YB4WsR2pMdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:35:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A45702671
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mCiXXfj6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=joRIQ7Q0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116312-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116312-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90B5C3061DC0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9965A3D4129;
	Fri,  3 Jul 2026 12:31:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448473D3D0C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:31:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081907; cv=none; b=p6Qsl/viTy/mXMbVBxwMvC+LCK4xaOk1I5dkKgAdiFJg5aa7RxgfugNFYO0F9pQOO9sfVK/ANb6MiDLB+Ldtjtrv8vx4wb1cN11YHsAdsn/BZcF12oQRZ0v6jeYsSjufwaRE3q7yW8WADw4bms+0x+LQHxt8ICFpH8MMvn4uXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081907; c=relaxed/simple;
	bh=K630DEUTV191Dc2qesPz0mTnQpvjdlnARO12sy8EzHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYdmHdURMIM3EaZhh+mplappR6PpTYqm1PAwVINX0iBB2gLicsBZgAms8HIl824HfoKnnSykjUq3qOEOEYYMdcCgvlC11QfNrrmGJhX0Nu/e/l7rBsjSK6ZU6mNuKUA/bPLyyTlGHw8cS9jRGsRjywJg0bE/k2pAHZvphi9evqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCiXXfj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joRIQ7Q0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BZFVe3135222
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=; b=mCiXXfj6s/wbPan2
	IsFCSR91R+q2R1ow2ZiLIilUCKeYpzzT7kE5xOlqZELuOlKyDvukSkClL3YJ6XXT
	dGLkx2Yy3XFTxwBb0/GVOmnQsgzaFTeFH2KgPasHhZu8FW1QT6bwzZ4mYArYNXbL
	9p79xZZFFcV6j173jW7RDx76u+XerlP++9oN2JEzfXMph0fI5jwR6JTgnJ/ysm8W
	nJ0xwMCJhHgpsqrupWkB4YkP5sqvtlA1Wq8pmxtCq8Tu90QTT+tjsSdUhdcUIdTc
	DukVJ0nXg624yiqfzpytdPCrPJLor40ia8ohnuNPU/oXi1rCiP/LUQqdROqXNtQi
	QYOGcw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcj391-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:31:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so1201280a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081900; x=1783686700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=;
        b=joRIQ7Q07GiE7AVugw2AuuCQQGJYeuF0TVdZ82H5fnn9Zr8AehO9utDuh31hAB6e1S
         QjtiddDSOlmZap0BKev3sScikKqm6rwpDZmt9bF/N5pTXfH3Al5H3I+e571aUUK5loip
         bt9cRAacY7/xWzyPYG+o+eet5gcETgFd2XFRFPJZfLgUyya/lObjyU4BgxUnpzaDT2GP
         xCIMghuDQJOgkrOPzxsXeY/8IrljP0xsecy25S9WS+R7jrE3+yGj3lUnE+uJfdYdwY9N
         6Fp/OIYOVxx7QTg8kyqCqEj7recyBDQcYLmkWE5mTagEFFaNycsNohBGxk1s8AfAxSQF
         DydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081900; x=1783686700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=;
        b=CoA7Y52+GDFYElovAaGfEKmycxHcq1xDtucP4zAbJxn4Ckc7MjNaK3wQr5+Gv2z85k
         iZ9sHvzGc0EqRbBeVevLb97f/yp1f2+OGDEyV0ZFVDPlqUYhw70s1mFCMbGtlxPCgBrf
         y3nW/ji+F09mbzojrHp9WZxsG9HxPxRHe7mtWLZ65RjjiXxu3RVAN1U81nsAbZZG2Ydz
         t9cyIYRQp5+P2qnt7Ifw8PVEHhxkCHovEou3XZS2J6OgKFF5a5w8qCZJTO/QzCuVseib
         MFfMZlnQs+jYYh9AaBS8hUSmmoWGFHft6qaEktLauVaRWyeBnRZ20d1aZIT15bENNyFA
         qzEQ==
X-Gm-Message-State: AOJu0Yz4mCm3Cjst6ts2FYU4bnLe8byn5izi2C5D3EK/DT2CVsCWat89
	jpXPJDAAjOuyU1fzVkTNr/ilrms5QuGgMdXjBdY8+2zUlUrwq7aQ4h17qnJQcpFf5vCSV/TRN7z
	KurMCw0daNeK5cYi+9UDdWRj9ZmCyaUlZpj/Syu6iHbWUdhD2cFq1p9KQAI+J+jegRpF1
X-Gm-Gg: AfdE7cmYTReUP4FPYvTIdi8CHkHSR5Kq8VRU7vJB8NfqKGWa7hy0jNkfRd9DBK6NpXw
	kaV69yXAcxyLWSKUslHMGoUt5CP2fhbYRsPAL2TyMlxcsUr9Y8Phqtv8Te6OT6s+E8wyvQkgh4M
	ynj4SUAgrgztnkCZ5URrH3ttKZRjWa8kKOhy/YPZ2FCdmFvFxFCZhhM3znIoGLW/6iF/WCnozeA
	oh4US8anJLDn0U5gI9SKP+XL9vfgGy8a3AGCK8EPIf7BYXLh6/IBciu5zCNjzB5ecKdHmQklod6
	XHPEsojzxWCiglcwQW+nurPKmjsVmgWIVW15ZhX6049Rzx/WNo9mrsYQhgI2kdnp+fUSy+t/Gq+
	LtsVTbsxVxvMClQ4EbphWyXrCdfc4pr5UltrykYQikBVafXUloIU4MzEjFtDC
X-Received: by 2002:a17:90b:1c06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-380aa09a404mr10133012a91.9.1783081900187;
        Fri, 03 Jul 2026 05:31:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1c06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-380aa09a404mr10132973a91.9.1783081899548;
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:13 -0700
Subject: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=2909;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=p4NFAc7UYqZOf2Vhd5hWCbhRVXgxqVSfX1RnoN8Hnjo=;
 b=5zpjbDkcSFTosziGt9rFJPCWbhZl6r+iXwOm63BXvLpO1Y1Z2MdtGb+rEVk6uNcR4rSl5N+yq
 fywu2wKWdylCOkNzu4iNRrpoaGMb/k/cL3JehcDPOW4156SzxByY2pI
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-GUID: dB2VeN1ZXu1VBinr4HuiozEMKDhkXHGy
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47abad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9f4fzsQZ2b4kEiPl2jAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dB2VeN1ZXu1VBinr4HuiozEMKDhkXHGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX4ta4kHeuMyYr
 iW6zBxTPdp1DF686/H84ECJwGjMtJtMvd28ghk0x7xj5oFcJfT3nNV4K6+s49Jayq53rIH0aLvY
 4y+Qy/0ivjtlSIcvdywOiJnyDUJvlrXhUJQjdluTTvX900DXOAxJx6HqdkVghpca72P79tUpJ1m
 arP5gzGnFqvN9kjCqTYHI+qQp/ZskcyDrhE21BnHs3RS6S8C89Q7pB8HJ37ZEhwq19bSDAkrs1m
 A902OU+Jeb+g4RzbFFseeDF1B9z02pKIyqEtdIfyTo8mHfebW7FoSYdisaNA+Dsxv2TE2B22WWj
 hn/t5FmYO14g4i8ipakned0//G5h/VfqafKVgD70oaB/0XDElxEFGENoh8+vB2UMurTB4tdsmiY
 VNK+WKpderf5TZ1RqjnI9iNqMsR6dH53acv/YqkvQTQ4NZYnDJhJ1cpNQUFLJwH4rvs5E2HIoIh
 eOKsq9Ofti7jsxH3gqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX+tNLbg9eO8V4
 yCo25Q3bWyf6r2cOfDRfQnSX8n6MdfvQ+fCdBfk0WVn4yDuSogqii3xvCPa/J2JNItso/Xqz2ye
 tJnXEV35Kbcy6qwCyJ+yUFUgnZ0Xt7Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116312-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:ananthu.cv@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73A45702671

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add PAS loader for SoCCP on Glymur DT.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..328eb513140f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,13 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 5f44f68efde2..bc259dfbaf0e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

-- 
2.43.0


