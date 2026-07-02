Return-Path: <linux-arm-msm+bounces-115849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CHqbKkoWRmpZJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 263676F44AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ebcFGPX2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yhvn4piC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115849-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115849-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BB2B30BCFBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0193932C3;
	Thu,  2 Jul 2026 07:34:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F53932D5
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:34:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977663; cv=none; b=Ev39ObtwJ/9+r6bwBXCUF8OGtsRycGzRu464J1n8y6UQ5KUxKvEeJIGYUfMyjyLxRiNcNd0RZdzcQkhrp+R1DTqflH3XhoL9+qVYbAPOyqZEUK2DELBcSV0SWUKEDZF2CMAn4aJPrrOmaWg35rnu9Lznf63B9Lr6/m6q6JqEvz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977663; c=relaxed/simple;
	bh=wAT1T3fnjrOVEasLUZ6kLgMLRxNhI2fWS9D7tT5i3Xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K8020haIkG5BLoRi2Xx8CWbyEFofzZO3L+o9p/rTSrDUm/2Ke4xrcblKr9aFiDyIW2rnuYV8aGAAlN/WMmklkjRd0yeUFmcJ8MDW1PiHJ67wDUaxR+VWPQG+7WrWJt3B9VF93Yr7UgCCShjlB8NXyUaqLJqBsmFtpGFF4qF269M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebcFGPX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yhvn4piC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621Kefl2958128
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sIJYBVb2Xk1
	IN+E6IOH2B3aiN5MM890hUqbaJ5dnjXo=; b=ebcFGPX2LBNY3H3x6JkDZp+pa2B
	KWmm347s49RJN2n7s3wI8bbJPFPXNoLhovOzHXcYCLlGPouC2IZu00zGYsyRGyBJ
	ZOD4qtiG97wybVAttT0AMbV9ZfIeH07q2s66Gw1BabUZUgh2ZSIjf8n4UPetBPVh
	d+WoqEnD2Rkwzgjv1+rISMZ77WrzVoZIJLQUUgQmUwrH+gwHdF3Y2F6CERhbtoID
	TPQip2sRkkYlu4gAZrS3c6Tfeo4WaVp7FiEpCFrlLH9iHG/JvewJHfgXY4l1/jIb
	MJ2ckLBa+SCWf5qasvEQ8uvLwy4JU7ZStmrJknkDgjop82bBUzYQ61gM9aA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630b1gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:34:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9ed5caa3bso3471965ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977660; x=1783582460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIJYBVb2Xk1IN+E6IOH2B3aiN5MM890hUqbaJ5dnjXo=;
        b=Yhvn4piCXeQPnH3KWjMeMjPmUw2CCr98y18SZ2kaXUakx295KLdWvAvlH+ZnnTQb0v
         bhu8Eit4xTOzr8AOwFqI7Zdij1BbpsRk3HaE4ltdlip5rjeYb9Cmr6C5aZB3xL/fVrSN
         2pWC3qiOUbSV43YRd/n7gQYRr33J/+vLd96wYxxXEoZvSM55+mEpKTtVcstbwj20mMcO
         WPChO627uDAYDd+MkuqYS5M5Pab05ZABLyvXsqXblsom/xrKA9a88NsR7gu0Gscxtv3w
         wShevXqlVytORqe3OF/y81sbXImL0KIgcwK+xXDeWXbTJ9qZaUwvqLK6HGC0xOXjtx79
         f7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977660; x=1783582460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sIJYBVb2Xk1IN+E6IOH2B3aiN5MM890hUqbaJ5dnjXo=;
        b=Lwf3xR7Gc31v9chhRpIWpaf0qAuEJ4DGzVZa7P4kq9o00Pyok5tRYlKzk2OL8r5uNh
         YE0uQqAVaaFM0LeYJjYnlZwi9PrvYQI3akBdTDVT2S7/IggHF4wN+rZn7ZrGAjlAJ+SY
         szFfcPi6ZdHU/MpYQtoauGqAGSVAST3iKvO7G+SJjdPqikSJd+oqMEbYxKZKkR5EBVho
         o4sot4iMYcoJbyBk1mtI0TEAlOzGxuBEC8dthAGRGB7qVmdCgEOGFnBXGb9O6IrRrYpo
         h3tyC8VTOKV0xcnhuIBQCoRP9VeyyC7MqZXzWlMD+fA772HtdB1zXPUbMc7aNmeflhjv
         /ekw==
X-Gm-Message-State: AOJu0Ywv/b/+9ayS36ycAKrw7I5GRMr72iB31F2qx7JG+KNxovXVkPq4
	atQZx5wt5kv6So+fG9P0AmNAwKKJP3B/E6LWxmVXj9BTIYr0WAYOblW5PPzJ4Efzr3F40U/A1T7
	0Pd52arnhNhWEFsMzRbT2MAG7GDqPO44vCZM9hjY2lVQxWCJk6OWfdcvXoxQqC7BwaKA0
X-Gm-Gg: AfdE7clbLLXsXCqJ4hCw1+sXAjJ8yJpOWv6yV/6074bKo6TeUNrDF5qC0SBJ55+qPU6
	hQTexDb1ZogC6U1kn81H5LcPjdk9CNy12ZdIulmNFIeD0USIp1lq9bumSp4wNqfPvrz+KlzfcOH
	sC2dxHX88tb4uE8ogg0KUo/YNaClIGGW3UxgijCyLKN9Ldvc1613XRv8OOEFpf1IdgfpCBGzDDe
	v5plWJoTmeudOP98JEj+76CbWON3n7DKE85Rb4T4wM0dPZHcoF9WR60KhZxlgCKeD3NGfODNvbF
	IYiDSvaXnZb/9aRxIUNoorUQeJdMTQc9WV9nhyPZQZW/q7OoISNYRTmeolz+Zka16P9rKhtIUPY
	e53Wg4YXwpdUa3t50U7gebmQdX7vHpva9CW2j4wvl0mbAkg==
X-Received: by 2002:a17:90b:4a0b:b0:36d:c138:e0a0 with SMTP id 98e67ed59e1d1-380aa07d617mr4242208a91.2.1782977660342;
        Thu, 02 Jul 2026 00:34:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0b:b0:36d:c138:e0a0 with SMTP id 98e67ed59e1d1-380aa07d617mr4242174a91.2.1782977659724;
        Thu, 02 Jul 2026 00:34:19 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e163211asm587380a91.3.2026.07.02.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:19 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V3 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Thu,  2 Jul 2026 13:03:54 +0530
Message-Id: <20260702073354.3641966-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a46147d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xck8KZ0arIIkwrKT9kkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX9yZYfjVibm9T
 +BdMR/MEIKkbcRC+4nsebQfk6M85S0kwaQduWf5LcT/xzgs3rf7OIKGHkJymYAmFL9JEZAoNy6/
 cTuwNkwCFhDT1bFw148BcF8i+wxMGuM=
X-Proofpoint-ORIG-GUID: fovKFKDquP4KAxsk7JwA0WstgHJo36nL
X-Proofpoint-GUID: fovKFKDquP4KAxsk7JwA0WstgHJo36nL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX44Bzhoea17iR
 hSACxDckHs/XVSCitkBKvASyzV44zUlOi6LVqPdbhHd5oTE03F409CechpVfWN2xQU99wwzGmb4
 fTmMFOy2Xm7ZyT8rDCLYPTmywettrGBL6KrCGZHFY3VZNjUgZfKaD8oW1jZ3zLXyZb8H9Y40hPt
 3OH6oKzhdaNXN9SM8wWLq/GZ4kwjggO43TPK+25dKeUNVVgbsdMtil5R471VgyXuNG2Kn/UMtuj
 E/qGm30fsdAvFk1LVAP7p+xUfiaXkKf1YFlCvrg1lRCYxYPIyAthAluxfjlnYjGyFT5GxVHx+PW
 3Olz5+FbHoXPJxLdpIx9Qook3JghXoGYvvwJu2AHG1teJM+Ymm1pV0reUQaC7yICkva2CLwnPCe
 ebcNsE2zWqhWbDGQx3/s2mYjoJkQqzUc621EjPYel41oYlb1itp7Fj3iXcgPEEcPO5woEUEcEI9
 /UjdeUqHrRgh9cjgcjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-115849-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 263676F44AB

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  9 +++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  9 +++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  9 +++++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..d4a7d31fb111 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..a83e9fa98797 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 5411f22426b7..a9a5a6c99313 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -9,6 +9,17 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	no-sdio;
+	no-mmc;
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 	sw_ctrl_default: sw-ctrl-default-state {
 		pins = "gpio88";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..0fca5d0ac66e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -103,6 +105,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
-- 
2.34.1


