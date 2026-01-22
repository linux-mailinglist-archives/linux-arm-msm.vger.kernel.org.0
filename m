Return-Path: <linux-arm-msm+bounces-90172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GH6LgcEcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:03:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F665AD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D72618638DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D67237F0EF;
	Thu, 22 Jan 2026 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0QEvOtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok5tPoav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CBC429835
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078508; cv=none; b=GuPxuJb7BuJQuQ8nX1DJwi7dpfh4Xcd8K1j12I4rSRDcu3cFrrKTTFcemXFMWoXE1z89eImncGyCdoyyPDMWzBMMNJvdWFZQWQw5TrmbWIDuL8WW3+idX+sVo5yB9M22OrXtMCNCqD1CKyYTwwsLhHhgkLZRczsaHD8AYiORE6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078508; c=relaxed/simple;
	bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cixu0IayVJF/B4e3yJzeRVZPTeMEi42UND7LPTNqk/K2wxjmnLj4iEMFOruEo0LhFW+hYaTjBvw0I1VLZUXa7lJJxO7rGOvb+ouq42tov1vIiw8Vc5RidMunP7xFjJz7TQd5PxukuLI+3i8Pljms9+URT/qaLRNk57XgT0Jxrmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0QEvOtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok5tPoav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7cJPU108523
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=; b=m0QEvOtzDYFZji+V
	YmKfUTj2q1Otp1mzrvY1xBBwnc5brRdiH4A35CJ6lRGECohlj+C2tciAkwyWYYk6
	hO6hxZrQMwFO/gVx6S7IPp+nX1vulSSGfU7KLSest8L6svN9gAD2QcvEWBhx4uGA
	6FI1bmpeix+nDNZM/Ijfl0rb5/vM6W9YBb4mgJX2hrk54ZAHKq7c6OE2RWwi5j/d
	fxtpqcmqRDE1QWD5h2jtoezT02vJUJypah/VjXJ9R6/Q7IR+d0EH9k5zlH2uEW1v
	sU+Z7XfpVhuBaa02pSGpu2Qjtun50eBheFJlClPawnrfzzayxDWladmTUfT31BtV
	ysIxZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgt49m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6deddd7f7so52381685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078504; x=1769683304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=Ok5tPoavwEkfkq2rUrDONh07DYJUf49/7kTxguSVRPw9eZvEvc9+TlcExQSrOxOip4
         3oIdTrCn82NsStSghtMWsgU03h/vMRZcj6BuneD+FxX5jz9fdTSRGy+9xLqplXVJ0Wrt
         +7ol/MNrSAfT8ltF/OQWYv9C+KimLJ3rLpLUgTf0ebbEANTSgbRyBBdzerXNk8N4nctI
         LrBvFGgwW/M4kynXFjAz1ROUe54iLBP75X8Be+xk9yNPmUKTE2GTL1jsEDMH7HuHeM7+
         wVChoh5ExLZo20Gp8M9QHtNv80YrkEUNQV9uXuSZkUZILxGONroUklpq+nVmhhOOhL8z
         z7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078504; x=1769683304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgRWl7dvcHPI/iM3lLLq/fDWsyOLgllUFc6gqOMV6G8=;
        b=ESC0JKIofHwM9M33RQh7pz6rxgzeqdWhDEbhR4VDWcTsPxSoqg3XrTnNCWhBBLLnTU
         3XGGsjA8HpE4+Ux1C8UWhwWOq+SJAqgNLpeCpx8IUaAj/2iren3Zqro0QElznGDUtQMc
         soyQUYsa6QCs9+jxD/H8xchrZ252wYTU4q/dGxUCyh+Y0kW/eqShHeohQA2m7BjChHOp
         spFfw12uFt/gt2T9eqhuLmMoeG5/mmyvyTqu6hKdjIoQfWBOVimDw+5Cat4rjWx78tsz
         VDPn8ODlHiHty2FdJ8m6YEUuH8EY8QxMcHhtADz6mudBFxxlO43r2Rkj/2gY93s+Jim0
         3Sag==
X-Forwarded-Encrypted: i=1; AJvYcCXFzsGGPspAhmTbg3wmEQbq9hnmwnbdPg5Dr77OXK2ODpxFfML/7inq4MKSW85/I2m6puDpViAkZvhWXsax@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2MAp/HS+KvLk/yC5rHifVa38ehm9v0TRW+RJsPK74ppW03rQE
	4mxTecnTIjrIbBJC3tTNsS1nyU1j8QqvzafWcvpB7ZxU62R27NmTsXDMmqd36TTZIR/KM1J3+KO
	jibU2/sM493aJf09UWXcVJIXtgGGAtkR9qUyhq4pJjjzOYKsM7KIkQmnLYaFAYjZvdpSk
X-Gm-Gg: AZuq6aIN/YFNhg+ycaFFMR7/gaQcRAnxR2I28ix3Zdi6FtZyP+NNfH7OpJV29bsVWsH
	lC6Dr5ObfAjTSPrIEEhcL/X9NSFvnksZ/PvAG3OlKKv1DcIz3xJugy3ev4E8YMllFfhD3XZJe1x
	iVltyuYp3fQknD6BrpAGtygr7nRLoE/O6SFVj/nDqDu1zL9ACHpNO6A/JdFhBH+4ErSmNsv1Rv1
	3y1W40TCA20QLTqCHv8BW0c+1UOU199bx2WuQXOIjf5T+cd2C8UL9Oz0VNZygzvG7NQNpCBhW9t
	IV+r+iDFw7Z7PwVEyo4p7vOVp7bs/C3Q/rBR89UtG92BQBQeKhstBqka+C+2HvBUHizfLeP2tI+
	Y4E1lZSAMW3PVnW69PA2EejO5MbsMhAKY3njqeRieWyHFPQ316+ljZYf31E9JIKf4D4dFlMowWT
	hw
X-Received: by 2002:a05:620a:3910:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c6a67a411emr2605788285a.82.1769078503733;
        Thu, 22 Jan 2026 02:41:43 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:38f2:810e with SMTP id af79cd13be357-8c6a67a411emr2605785685a.82.1769078503284;
        Thu, 22 Jan 2026 02:41:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:50 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-5-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=3019;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=t5OG46p4ljnSn6Ugt7/7Wx2T2LZF7712SOUc7lxrUEc=;
 b=n986DyQp3CsKwqwcFIuFzEWA3NaquONuV/voJTXw9fQ2RNi8BCnuw6M5vTv6vfYrct4IBiw01
 XcK3Aznm7QFBudn4AHwfEtODiasgAacyDuP/OgV5lAl0gYRNYY+fCyR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX1/bBr/QkRRrJ
 k0ZVkm60VoaGqcn34tUM6GEsmSGWeluE/CL+RXDMpCMEh6qU0Zdxhq5vy5O1/Lc4D+/EqkASTEv
 zwDq5EeOOCi3ZfSyKWGlCnIC44R2uT29wf/J8PRrVHbPeBzHmRv6/S08rxwvA/PCFdMizItez7R
 g9Vi1Hs8OIo/aiR5LINPnB7fwYH6UAJ2fq3/0c+iAYE1i6xlZmDfbgHz9LVL9iqq23k2K8EU2ZW
 TasZyUwOIMxhOi7UK3CRe0wiPR4P9WZ9/xczi2A690jevj0NiL74LML395HT49wdiuezPlOztuG
 lncETpvoHJR4iOgp/ClN6Hm2U2ic3Rne+oc9Dml5H5o83qUKnJMImn6l9hSIFkziEIy9ZU0fJ9i
 cSxcUGMmLAC2w2vR+XFsDIA3lFb6l5PL8YktZq3bPMT0XAoGe5DHQ3inzCS0mXfJqaKpmgJFnpm
 sg5OdFTtsh/kLWDFJZA==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6971fee8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5RPoKDYpsqj7oBEIzsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rMQZ9KC8cKqVtA22c9J__8lDS7iW_NC3
X-Proofpoint-GUID: rMQZ9KC8cKqVtA22c9J__8lDS7iW_NC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.1:email,1a:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 439F665AD1
X-Rspamd-Action: no action

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


