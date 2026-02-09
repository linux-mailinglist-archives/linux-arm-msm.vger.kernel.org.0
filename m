Return-Path: <linux-arm-msm+bounces-92215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LghJRqQiWlz+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:43:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5A10C902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42DAB304C053
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0026331A77;
	Mon,  9 Feb 2026 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9NNUZvn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZb6m7Zo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3B330B22
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622773; cv=none; b=uUy0gG9mCx1Yy8iISf3AVKO5UXqQ/1uDLBcyj+tv9HGnkXoWMe4X7jm3vXRNr8vlZo4I+jBKRKe3E0K/FZ8rEf+zZnx+LVW2P0M4E9wkQo2Q7DHr6bUbZYmz6ooo+JnMauC+1+HeUVTckAGfNpwfXtarjOIbm6m+DWDfaqTWzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622773; c=relaxed/simple;
	bh=u7Q09FoIZmpBmo7M2pTpw1RIgnALAxpSQSxtH/jdbjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtCnnLJf42ib2oBqU31OlYCuFPEJjreW0UKxJzvVok0NsWhur6bUaeGAwCnnrQFrctm1P/5oNnA5YamGfIn67kjtW8P3uMqfmGDswhYtWiB3SmcTNxMYRwI7/Sx61kaHz7hGE6lhdpKLWylUoIiazxzFsegPJo9llwOTGXth+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9NNUZvn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZb6m7Zo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194St2G2599406
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 07:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3msSDjqrv2SZb7F4aJnhKq3at15ayITUulZXR371zE=; b=a9NNUZvn1Fw1zewY
	xBS7B5GeCSUub9CDhNqPLYHr9hGMAsD/87huLnSQLb8fpcLSdVAbcqWCVe14vaJS
	lhzeU2FChjaxG5KuvLmZTeqHiRluNVY4l5FQTPfcV+I7Jy7x0/KXy9S6ziv+PkIc
	RzVev2okZJoXcjiRY5DdWX2Hkv0GoaSrDjka7JDlKIIy3vKG6WYPcQ3QqNjJ3ON5
	BHyIq1o/6Yp5RBZhx4v+BbCuXgpNsjBzrcULxZQ8E+XXjfOhHxvruXcfrdLye+3H
	dJVAD5CFSEv+IreOL1EuPwBgNV0Ff5yJGTR2ZRTHQlgP6W7Et1yQPCq26nPMADsY
	sjTBoQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78kh0k52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:39:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7a98ba326so48287105ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 23:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770622771; x=1771227571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3msSDjqrv2SZb7F4aJnhKq3at15ayITUulZXR371zE=;
        b=UZb6m7Zoj2L7JYdQFV9bJY5HgK/hSDSBsZJVbnnjID1GtXMZk7+YI+Xt0Ky1/w5EYd
         6ogYXRetCcjRVmXzlllTqFVf+wHT4DXAudhmpbcQRi4K5A3XA1BbLsV3WhcvbSHrIUz0
         FEB+l07eVglhx2ug4/QPA2yKi5Jpi0cNO+Y1dOE8Wfm+YcLD9uMJhriZEv8rxJyOiN/m
         2yCK8eR7Sor2m7/0ahzz874S2dCagTGj2JIqVFeF6J8/2DmwfBuny6ixp1n6KZAPYvhT
         xYQnD15VU/4wZBTjs0w+aZIPkaVvMaHIo7j1fYLr/i7gVz0Cm+vzUNfV9skOgbYX2Ng/
         EP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622771; x=1771227571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3msSDjqrv2SZb7F4aJnhKq3at15ayITUulZXR371zE=;
        b=YiJIglTYEiUszcDXuI/d0FaMCbvARRDr1zZEwWy5a0tpdPTayI/c1S/+OtsbdSS/ZI
         59UFm7PYjsWhlzfcBSYlAwR2MZZp4i0XdD6YfZo3oag/pxi05y5RaXKfYFZNO/mT4rFN
         iGhAcJVPjRA7ye8MBxJX8CM/ZDsq463A8DxvvAurQvaYeJxwhzx3nSAArClvrOcnQPEo
         kSfNHO6FPpsNRU8hlVb4zHmyyv3rVbZ1Mx/gxrnhiUxTl+If5hgdmkateAt5XgYYUOki
         tB/ElYIvNify/COH4DQS/wFkA6i527RIFk3io7+pPzKpM7NER21gQebBQHje8QRs/Em6
         6nVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwhcHe0ku3jQ+Pg0DVrCjCWN8qSQro26O1TmhQG3g8H8y+gjwOkTX4V1QNEx6KAO7y6C5c0kfEi+ek14ar@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu9pAG3nSX6tuvEX6U1eLVjQKnKowGy0vq2bh4LZ+NmVXkDyty
	LT04NiJtwOg4j+ysnT0c90Ex3ijhjXVkYVALF4EvfhwH6u0Hqsw8IfjE0tbpPWJ1W8fCLorv6zD
	Iy+2E4M2c4gmu2+F6PlBtEMLSXHkhcoPZl3b7Xr//MD5DjhfrutfrdlLd2NVxYeIPCzlR
X-Gm-Gg: AZuq6aLPzpfezrLuWCy2Cy1np96ahXADEF4ohJzWFogV1Bq2wAVrX2H3I/uE2c8vpTs
	d2ZGqbkYTRWUn1M3gGnYzdxXF+309Fx6y+HJrHaXm/eA9AHkrylJ7Nm/mCYDE3fxaYYIKJR1pc+
	kUP7c7kTWv9VRxC1rHpeS4m/AR0FaB/CIqrC4u8Pv/Hm1YRex51Z8iIznNC6P73ABE1oIqfyVVE
	+SuEdc2D6o5h4VfptU2Es4R5BmurL04qV4UxrZhjODx+LA1IWgOZ/VodkmSiiciCHAuSnKyajth
	X9eRdsSaqo5G22OhfuM/HKErpDbGUh6GstwgS3KZlN5RwZ0cXp07Q0CiEtuaAHxMXfBYKrjnAhf
	ZGXNh+AQwzKVmDyvqIYQJMhbiEFj5JRp74RGvu//k8jCiDH9O9uLC6MbshILViUO02MWj79/t3R
	w6khvn+vEu
X-Received: by 2002:a17:903:1ca:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2a94105298cmr148197545ad.3.1770622771435;
        Sun, 08 Feb 2026 23:39:31 -0800 (PST)
X-Received: by 2002:a17:903:1ca:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2a94105298cmr148197155ad.3.1770622770942;
        Sun, 08 Feb 2026 23:39:30 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9746esm99023545ad.39.2026.02.08.23.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:39:30 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:39:07 +0800
Subject: [PATCH 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-enable_iris_on_purwa-v1-5-537c410f604f@oss.qualcomm.com>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770622746; l=736;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=u7Q09FoIZmpBmo7M2pTpw1RIgnALAxpSQSxtH/jdbjE=;
 b=fJqjTGdWL+qMTdp2HNRKc02HqVO8XTkraPeCrela7ZLw69U0vYX5RwaPsLh5sTeI+CKmeEQTu
 T8pjVNFqIymA/rKqeYKcgtkb2rEujMZecLfHVBUgy04G6Cz89cTi2wZ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=69898f34 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=7aFPd-yBq2EfGddswiUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfXygyx7yDc4eJZ
 hF86QfJ5I+HD+vUPqa4L3cD6IggItqO6OLwYBAWKI5ef0UmoKizoyFuwkxf46vdhCFDERjJVFaW
 tnJ2tBIizn5zRs5qFnJIi9BVSZRk6TZ7NvVaX3tYQ/I2htvrqLqLb2MGFSh1OiqCq0+bHaqm6YM
 7fonmapSGE0bFFpfMgbpICSd+7ZsuoOi6tKirCzW+XzQzyhdMcO8CCpCMmGSqo18sdp/vT5eKyF
 MqNln9sAp0YLBOTKPyV2NkWWp2FuTsarn9XQ1Y7unGwVB99PYeJuEjM5IvscIwZLKBJ/JYL2tge
 zZalSp+x5R9NoeWBv5XclucsxbsinPbPH25NFFD7rnHuCidxUnLvhzx+33QiLLJ6mJFpN8VGiDM
 Hz9fwMlUWqU7eBHz3QiTFIrsfCIc5VWWL8HoGLrOo75WgdQyxHE5R7jn0mJ8CueYGaYRvOgtZu6
 nBJPIQomg/J2YWpg7eQ==
X-Proofpoint-GUID: qn0fE_Q_f85bbOcJEe_csLra7_A1Se50
X-Proofpoint-ORIG-GUID: qn0fE_Q_f85bbOcJEe_csLra7_A1Se50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-92215-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADD5A10C902
X-Rspamd-Action: no action

Enable video nodes on the purwa-iot-som board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index fb90beb1096f665dab834737b6f4115f56c72977..549fbfa3273270d287bb447b45a7d2f58fa15a47 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


