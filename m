Return-Path: <linux-arm-msm+bounces-103665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPiCKMXE5WkGoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:16:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD5427166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 369073059313
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043A02C3266;
	Mon, 20 Apr 2026 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GngyPDcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAACeGyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1C3822A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665612; cv=none; b=FI9gveRuIxzYIWhBoGScpql744mCLtNT0EM5d5Rb0xvxWXFidY/9IDuLJkfTMgvmtTo2AYgi716nljFbsm474MMCEMKd/JSqWpjSee6rT/xQdd2gCiVDvyF6flvfgVog/pEDWPsILYMIGsx12FlgRf+mDJXzet7a/dVohFi4rCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665612; c=relaxed/simple;
	bh=nX6Y82zzESPqhrrlbQlA1NTD5phO4pdq0SzAisS/ebs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DdW2aMXuiTE8Mrowob0luzSKaQLjpHx/FqfKacvdw+Aowd1lKDWd5H9mPlinasE9j+D9IkXUnm4+qA1Ygulz7VTfwUKhSq/9+RAm3R2rvmr4+O+mCTr8mvB47gmPXwr1nGL/Qj7kbPBrS74R2jA19t9X3SxAxfcuosq5aJwti5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GngyPDcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAACeGyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JKwtuV300691
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=; b=GngyPDcq1Xlv0Z+M
	7i81LMUSUSpiI1gDp/sbGVZcv0j1cXNv2LV8QZeWhhM1Byz/L6Jg10yQDVhhIfMb
	zBHFsJsYYih1GwTBHa3JL1XxVTfZDhoV7Wja7WGosFeLeoiIIw6h4m0yRSQpV4U9
	QzQhcFMdrqJ8h69Vo256BxgpxlLtv5CJOMF7b9Z0VBgu/Hs+hRsy/WMEgHDcdE/h
	/Jg+G0MC85K/twJWOAXgxkvNn2mYRbTU6STKlFWdPaesLQ8C1pegTTrW0iwTv9Bu
	A90C61Yk9aps2fNTvkUDW7pSTlZmUWBWS8RddEgxtwcenbgWiiI8kJZhKTqi0vqa
	GtxbNA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261vawp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:13:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f504f6b75so1454153b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665609; x=1777270409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=;
        b=iAACeGyW6OU3h1OVZqJSPg/QBr2ytPZOfO19b8NDxSCEF6FafHoVDg4BtqhxJxWFOu
         gihX9IbkhawCAD13mLh7YSk3OB1n21hRJGpK7jAiZLCyRrvrCiS59vdKUbrI6EFapA5/
         acoruPXqHHBlNrxR4rXObXNpZ4C+mfWI2EDbQDJjersHthZIao963fgUvuk4Gv0kjdtG
         NLm3KuUk1jth7R5bGJ88ZQyfjFgGcf+kb0UGNICCV3YGewt1mz9kcRkFD4Y1BFdapU7P
         RDkAhHgENGh1aGYwKtsrw3HfF45KvtnxxWVTY7lm3sz8NHcM0mBcHNndfCvCKU2a6LQY
         DoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665609; x=1777270409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CecqJt+jxHeudMX3AkxTxuPao/HPi6jAXtF14dccZk=;
        b=KOLE5XAzYDzW5axmqfMPMeWYAYod592e9D4/oDdPwhUQ+Ut1nRLbzz8t6+6u37Q3Ga
         R/5APIhYuaRAnJgbAOnZFOX8J24mg5NNiaOj0dW/Kk9eQhq6B1enUN3vSTmMJ6F+ntxL
         cdegM9Ixq1HbtNrQ2EldQPPnQtVMiugyYR1MZI0zCwNSepcsW4sZGPItLVbMJO5KNU/A
         +IEunRKGEvCgjZFiVI5CpX9uvjQUrszGkom91ZzjPjj0v3iw4bEt1uK5jl9QH2qtLPLp
         o5YK8qRilJM297p09ufssBQ/rkJO7hvctSJ/OTtK5w+kYy7qcBT00O3ES5oIA7TCS5Uz
         /sgQ==
X-Gm-Message-State: AOJu0Yw2H23ougiSmi0Pa436V7XnxuzNVi6o7aHi5RCMKjVpPmprFKOY
	/rMea97mqOngK2UhWzw79m7FhnnpFMDhelbiHQsE19+V3TD2/DSHQ8CW2fAKCLVUy6+sXlbBXJ2
	V7CgZ25VuGfOaIlrOcKZm9DjG7JYKMzQKd9TwWJkRSKqFkY1mPd5kP3/BXCgA+br9pTvK
X-Gm-Gg: AeBDievc61MYYFbnARpVkt+9SL4mF9oPpXyOlX6AIxJbCzXOIXLFDkR+khSua6f5Pvk
	xFU2/8bz1TN6uz105nqQijJ20bUTqdj+ULOC1x4VndN0GcAhYlIsMpAz9IXnIkZf1sCKt2X56KX
	B2JJy7z98nvRSOHevJ3dCI0IWOxnVjQv6QdyHUF9j2iqXO9AjVue7G9Kvq4OemTBqsfvX254Mey
	EHVKznsUqXbhFWE7g5m0r+7ngO5It8eOwPVjmdjaVU4RPwOfiIIiWr+SI3KcNOCHSAVTBrn8m1y
	ywqySRmOXbrAuIo4ZDMOQPNW/fCiS7cLo0QcuNS5A6cuadPZa9puF6jQQJT98xH00W8SuR7mYcU
	Q0mWEkM11qpCvNaPfravLRukrAYVK6C61lV99GKBjCK4B+nwzS12owg5IyZZ1WyDmyxv4
X-Received: by 2002:a05:6a00:27a1:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-82f8c82e219mr12829917b3a.20.1776665609551;
        Sun, 19 Apr 2026 23:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a1:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-82f8c82e219mr12829883b3a.20.1776665609062;
        Sun, 19 Apr 2026 23:13:29 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:28 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:52 +0530
Subject: [PATCH v3 5/7] arm64: dts: qcom: qcs615-ride: enable QSPI and NOR
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-5-7de325a29010@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=1047;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=nX6Y82zzESPqhrrlbQlA1NTD5phO4pdq0SzAisS/ebs=;
 b=+Pf5sKpqS+UB+n3HfhmUCJlJHmLgfUeqMoJK3bbIQ07qCTG6SuEdv8fLwUbm0A1NwbRiFjc8z
 qfUWuQvE63NCquTcg7w+m0EiDhz7caXTOFw/ERSpAY0ofEc5thkT+t0
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX3q8SdNOej0f9
 KrOQlwp47TKLdW9RfQxoyCGoW0I8794x3ewTwdBaHDYMjp8zl46ijDqoDz+b/9lGUudOCmAxhhc
 1th6GMAX2qj4O9snUfL0+wB9SvgZthuPPSblpEgjFdVPTlIud/bwbFtmR6qz3YabbeQtmMLGBHq
 6qBKp3NqLGm8eCsti50mfd2pBfAVgLqOmAA/m4FjhVUHTsbFr3BC2tApHWkrK+L0TmmiGW8HBqr
 +QMyZ9LJ4w97tgaoRzV/gtewN1LayOGXphERyMAkooKF8IrXuj//290RPSSuMmSG73mdIUmU7LT
 Y7vKHb6tA+gvjaOBzyXhYo0e7WpR4+ZD2gDHrL4lae0ufvgF20r5WJTeLcJ3zCVvQwTGFq9G8KF
 n3fhqPsohTrbj3DbMvJYWMmDwEjok86z9Iio6Oyxgbyx7MQ988jsahxc01NyGgbLaDSUqaTBd+h
 RiSC2RwvRrcAO+sCfXg==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e5c40a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eijpJye3pRbVNivL--0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 0LkI6KVrLiUwsyWJ7tL3h9Lh7YJdU2HV
X-Proofpoint-GUID: 0LkI6KVrLiUwsyWJ7tL3h9Lh7YJdU2HV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-103665-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.914];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06FD5427166
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
node to allow the system to access it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..b096d96ab220 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -516,6 +516,18 @@ &pon_resin {
 	status = "okay";
 };
 
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


