Return-Path: <linux-arm-msm+bounces-105261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHooCnA68mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:05:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 48508497F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2631302C85F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8383410D1D;
	Wed, 29 Apr 2026 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqJy3wrq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HncX/jsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBEC410D2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482131; cv=none; b=osp1UkkvOQJOyTOChfGx5KLbY3vgF12xbPqDispK62v59mvgKRJA05JRWoZSO+uX32/hGq6EKfhJhQ0KgrarmCBXSymuTScZGzxlJrr425VMy8mMbsBzSXgcNz2Yj9dQLfOqra67i/VOpdxo9AMdv0cS059Tq8WOaGRHEzW2HSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482131; c=relaxed/simple;
	bh=zM5H7x1nhNKHbvHQlqVkDFr5Jseh8BFRxY3VO73Fg8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOwx/hWsTJk7CDEIRdwuh1kz3uGSezTmO4/IOSQ4BEvXmakTZisRjuprV/3JZg59z1F+Na5OJf0stDw/mibOpR8CdAyBKEO3Dv9dapYev67LO6aExuLycExu6iHl5ezOLBFxqM6tDNZvi+wnNSCuu6PsZ5ccvbKliHnsGsB6FxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqJy3wrq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HncX/jsd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF2Wpr3752640
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuAkd5HB8v47fIX0UR5Y9goEpziAitcg3uHmsmwCTGQ=; b=KqJy3wrqZF/HOZ7f
	73IJBc9LVDIJ+Fv5dvzCufNNIgYBEvqQmxd/V/Iorb57uDQTJ8HcH4ryk9Lk9Er5
	R5RHfMEvBxBAeGV/vA0iegLtMLd0UbDLeC9MWXFAIvUw6vpLJ1QDvyJ24+u/zyx7
	5ZsuJTspFRSfIAeTKw/zRhGWrI5GuKnFw/49Ta9DlEx+lWdESiq6OwHUDjxnZIBG
	jy9SQT65eCIDA79fVXSczTeO2v0ERA+xcsloQRFIA1TIWk8mXGN6mze/m5F3Dz2Q
	zCm/u0JFnj+THncH43/1CSRa5PfT0j6Vkl5NCMEaFDfTd583Gbynfkr6ott8qZr0
	qNUakQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1jn4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso57395ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482128; x=1778086928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuAkd5HB8v47fIX0UR5Y9goEpziAitcg3uHmsmwCTGQ=;
        b=HncX/jsd0+OWXszSvgssUZ8KzPdQxOClLKQr+IROgNjBrIb0dD6gFHtWoldktSyvef
         UQcn9n/j0TSLNAiiM6hE17n/rcPVngin3B4oZyzTPbV+kWIW54j5hpz16OvWKFLHYidm
         GZBMg34Sr6tAlSHUowPCelIGaCtnMAdffGGFOScIxZyFqtqJU1/CneXtfFfr4HLR5ET1
         Vh67/2iKqys0T4iYWZ3f3HAerDyrgci5+EzMVAiZqn7iNsXw3HlXwoHoOgqthVTTnVYB
         iAlwLBmbSO1BC9lyO2gRsV2kMWtmHonCrMkdUFCzFzN9kDYbk1P8TRqoj+9HGNUyeDq/
         GxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482128; x=1778086928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SuAkd5HB8v47fIX0UR5Y9goEpziAitcg3uHmsmwCTGQ=;
        b=ITPgfEd0qWAtSAd3FAhkS8Fzeej0mrrlSQz7cXJ5LXD64AIgMr1SFcBvMhhBSDyjlg
         O4OZvg8q/oCZPgL9vbR7geP2aM+pvcIC/OPErZckS9JBU8j4YIPRDG5Anwng6hFER0JE
         FlyfCeLFM7izVxMHgaLJcodvjlwlJgIqrjY9C/nVCF/+Zq6ct58EilbTp0q0K/s50HpN
         MAWI/jy+5Ec17hmkQvPwe4CCPsz6XhuGBdcBtONRZ9aKqFku/anpy/DqBGRYk8l8bSqs
         EGM9yg8dqwAm5gVfGAeF/IsrWrr0tCGU5rNcg1jpFq/wORXcY9Xaz+1Kn9xiMWiWrEp9
         8J0Q==
X-Gm-Message-State: AOJu0YyWTRVwfWOcIGy4UMEy/7PuZX5jS/ECXHUxLV+e94hNk+ZIbsq0
	/3Vp8+HvjZTNVuFL24X/1Ahm3PS3q75D7SDuKBJuckswc3Dp9rHvdbKye5WJp9UxaXO9O4d/h7H
	KS+NMMvHjMCc6ct2FpR26dyR+WnteWl86HCbjgQQO52n5W8r0YwHVZyoFp0D02rAv+ezp
X-Gm-Gg: AeBDiesDeAUcdqcbSmf111CzPBDi5yPBeaXkcxzvVHnikrxjvZcOt2nTxPyemn9yoxZ
	hmb9gTU5M2W5yh2Q9cacqVkSACKZpTNLXyhVR8mo+hutaeVUYeeUimKIun+54yPsSIVCGlmC9Mm
	2zewsWH5O5c+cKJBk2L5KPqutH+smYLQ7Kx8CWPURXKqttRCjebSpdrTFn+ZGBM5loLXDGBelIt
	O1IuPkblQ15bAaVrJkip+CVka/rtbT7xXPr99mqbccg12j7mc5Lt9MpU25YQaKC6VzQEsHJ5I+G
	asJabKvPP3jdPKfCorU6hwvCf7+urV2uqn7WmZwHKMUtyQWY8kjHi7r/KlUrRZshkzafkS9wtTh
	DzfaOB4S9GvsMkwsiHnJBoPCaQD6xpUECk4Jhnt+XIIdRr72h0H9oC6nqRXrOwiQb16ol
X-Received: by 2002:a17:903:4512:b0:2b7:beb5:3002 with SMTP id d9443c01a7336-2b987332915mr32350845ad.12.1777482128485;
        Wed, 29 Apr 2026 10:02:08 -0700 (PDT)
X-Received: by 2002:a17:903:4512:b0:2b7:beb5:3002 with SMTP id d9443c01a7336-2b987332915mr32350455ad.12.1777482127939;
        Wed, 29 Apr 2026 10:02:07 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:02:07 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:40 +0530
Subject: [PATCH v5 5/7] arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-5-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=1047;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=zM5H7x1nhNKHbvHQlqVkDFr5Jseh8BFRxY3VO73Fg8w=;
 b=otVlZ6Kfxfk/TW0HeMZ5y7/NzfCzzzE2y/vrPPTeGgL/+dO+8//RJ612OZi0WFOXyaSqP6+oo
 M7S9Em7HTSWAGStUfzEfLS8ZbgJnci0rbssXQQBBaywzxungU3qzld1
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f23991 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eijpJye3pRbVNivL--0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX9CV1Z6I6Tw8G
 zraWiwTn1QQbwTuMhOwW6qtHeuoDYFa/lkjq6IYjn4Gj1DNheazP6pVM30IA2evwKrTR1op7i8N
 8Qk7L/WYbPLffdu9WCYbT9NUcD9KjgzR1+F9yhKTRgckGPlwa3R4AHHBxBSLo2/khgJXXPd03+7
 1z/Yj7qmTbL59Bk+kMB/OCQpNOjeYXj061a5toe1616JikkFdLiNGLs+gbqfjV+Q1DPN2mlqWTy
 peZj9gguONbrfTciXI03TJ+Rcd91DozXS/Jdi8x0X28HKcmwD2I9XhPTDC/t6EDSM9gW0pQiTVa
 ljP8AXHsvUJ2fXoNVBT1XHNQe8Rrbelf8Zj07p4CN7CVxZsi/h9JzbbFEhH1BDSTCyJ53UxOpwp
 0Ww/F7YW5ttsJjhpopzv3SRQXbNoC+6SiZncCVHGSkCtkCb+C/GM1wKYtNerXEKq9NIBBETRygU
 SJu64mgVjO20KaU80ww==
X-Proofpoint-GUID: x88oJxQSjG3zlGKFJ_CTrV0_vdrY9UN4
X-Proofpoint-ORIG-GUID: x88oJxQSjG3zlGKFJ_CTrV0_vdrY9UN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290171
X-Rspamd-Queue-Id: 48508497F6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.914];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	RCVD_COUNT_SEVEN(0.00)[7]

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
index 7e05f873194a..59252d127322 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,18 @@ &pon_resin {
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


