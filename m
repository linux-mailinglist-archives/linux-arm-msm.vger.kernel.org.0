Return-Path: <linux-arm-msm+bounces-103728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IDfHjH55WlHpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:00:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77A429232
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E1CC300B465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD63939C1;
	Mon, 20 Apr 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvB/g/OJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYYXkMt8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C830EF95
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679214; cv=none; b=tOD3Z1lJqRITQ6AxkNJcnkETVwol0XphLyh/5oizP63lZA8SKZt7OVHgXpCoZSl95wFLMXctyjLkjV38FXzYmErll0KCSPuG7sur4LrBnGgtjmDcIhLhZZjseusFaYrAOQR43mysMTGQpWthFDb7k0MTP1KZjqKjyvwA8Yid534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679214; c=relaxed/simple;
	bh=z+XFP8VU/s8RpK4cKc6S+33FrfDvNI9C1bAlc8BIEhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cN8LwY0RDKpriS0xd/btUccUUYi/+8VrhJOxMtZejgaA8zQHJNZNncLI7b+Wu9pTscLH+PyBLuVGhm8VJcFTTdAZ3k8aWRzsvTe57fg5JzcU+SQzIumFtV/Xbjv/uYA2LRGBSrjfSnPBT8PCrowS1elcBYY/a4lIk0ZrHLeiGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvB/g/OJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYYXkMt8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7W9X51475377
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DV9tE1nTvXX5aKnH76eHZJ
	ssipCTp2o/CH4u2VTShK4=; b=XvB/g/OJF8KXzX9fk1mcF/WipujUMl6n2FhOxw
	qlr1sqHmy5dfYptcnmsmoXsvWdnmYffwY/e/CgFh+iztcQUbaofFrLPEZGA5bRg5
	iJalaPgIik2n99J5XUSgbWIn2vK0hVHDHnDBnEF7NziJizPOGytVILFQLwhJHGlD
	urUUNzjhg2JdseAvqgQTeCn/Lrecwe4N6UycAcnE/XBS1vGR6/YnY14cpgb+Qlzp
	kclbgReW1KE11jfVDRKObdk8lKAInlQa1j50YvQprEv1vfVRyALSGoMZohcmWS7r
	mBKK32jD6E9kcsWsebkRHUFMPcbp3d08zvVuoLu3iKKo/Vig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr5nvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:00:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so1762116b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679211; x=1777284011; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DV9tE1nTvXX5aKnH76eHZJssipCTp2o/CH4u2VTShK4=;
        b=LYYXkMt8bN7qucPIhasfBZGnxsEHmZ+eL7Aemrk4n4cZmNNlQ5XvXLbk5jF5JIH5Ny
         gp+LGkST+2oigH1ABU5I17UmXm1myg+LLeC5s2R2FKJPyKLw7skLOS6J16/4deEMOj3V
         wirJyki8mc2I3GmxAn6sv8OjAwGXdW9dR+TSzX10PRyFFBXy8lbs+645NmKWPv8UXPOg
         lyE+2bUoXR6klwjFvIim7gVsFatV0bXpEto5ZFUurTLFG0l2EOiawQk51ClaaejREKpr
         pfKSNOIS/d8TVsHj15QQisuZPCln+fDngZD8UDAiffa+psqNXW73vZL0cFdO5T8nj/Nr
         6OCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679211; x=1777284011;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV9tE1nTvXX5aKnH76eHZJssipCTp2o/CH4u2VTShK4=;
        b=cxSuC3MuxBQ5jAjWN5nj56+gE/fmr9OaNEO0rB5bq88eVd6ULXluuE90v1R6HXKZdq
         YCwSsBks2RBtehBpNA2j2lAfw4G/EmPT4K438oRyPi0rtkmdRol8pRX1TlKCkZ7Nbyct
         Vc9viw8G1stQoCD2jjFXDKMdkYuTESdd/r3M2N2R5zrJHyi3EJ2TZ2g5VKlOss+CPuhz
         eis8UMdjVy+ndNM1aAWfib4jWWLvzXtOf2H0xZyPooSTJRYe8kcxWxlIHtMu8EPioQnC
         P4ubaBBg2htBzDpxuCjnUC61rNe98rjEU+R42r0zI85a8fcOTznOI1DSbvofcy9wPjBF
         3Q9A==
X-Gm-Message-State: AOJu0YzzQ+K3aKnpw8vHTBc8UGvwdcfCoLdvSbefKXp3PTIGNNpFe8/F
	Tst8IxUKmjGxD0O2Xp91wssBBxTr2ApEej14WVul6wfVGf798PsigL7AZW9HNnVF4O5cnmNjFkY
	abCknl+7ZAfpucxhJCnyGbuoCLL+KOphWvbugpNfUBeboUUjSxAudt/rI7qjmToEGXFKe+gCrHZ
	Ra
X-Gm-Gg: AeBDiesvXgD2PAZsOwCRdzymKfhEAtf8UmegylbZeseW711rFQ50+vWovfu84IWWBZa
	/IWtc5HvqyZxsT6o3t6pqbHQVuqlrYnxOZR2sT1mri5Fdl7qGkf8XxBHRnKrnGIjE1f4r5m1k00
	85iZHsY9WYz6U0iSIVClSmgohCBCdLeY/s0xG3NxLguK298SAgcPpi0iZS0bLP2oolGGDLbqurj
	BqdnYE0biSkl7maHpJ59hmVrCFjaz0vaEXRN1r65U7ivHVm0eTjl0EMQXy4hVRAdxvrXxQbHuqW
	6Agx1l7ILx26sM1Ybl+8PxOOeUKxYBwZJHMYO3OmtOGbMyagd96tGhYytTQcTT2F1eQ7GdsjgLp
	6TeQ7rH1w8HBExBdwkJoXIraIsDykWZbamIKgnfTOktsRSBezxopw6HZJ1Go=
X-Received: by 2002:a05:6a00:440d:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-82f8c887013mr13085326b3a.14.1776679211423;
        Mon, 20 Apr 2026 03:00:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:440d:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-82f8c887013mr13085280b3a.14.1776679210920;
        Mon, 20 Apr 2026 03:00:10 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm12474403b3a.38.2026.04.20.03.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:00:10 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 15:30:02 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACH55WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3ez8lMzE7HiTbF0LS8PUNCMjI8NUkyQloPqCotS0zAqwWdGxtbU
 AyUoBnFsAAAA=
X-Change-ID: 20260417-kodiak_4k-891ef2221e4b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776679207; l=1221;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=z+XFP8VU/s8RpK4cKc6S+33FrfDvNI9C1bAlc8BIEhQ=;
 b=tXrj3i8MVneAK7B7ni5x/J4rOF5GzCr34PV8FqIyxy3xcKSTGWVb1Vg9WpdXq/QRcGdSWjVlq
 xcNjbEKAiz/D18C5UoBP8xQbi/mJ0CBNhvETtgPs8zXzsPY9OViEZM9
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NiBTYWx0ZWRfX7FNv+zQCVRhl
 Jg2nAXt2k+sI1q2gtidwSjO76WxU/vgSxUR/De4pPrqEYlTLZXIwEtVrO6Ca5G2bx9/fe46ILNH
 IvV+7mVGrp+iikS1C85mVbJtNTABIt881ivg/UL4Z2v9YNJZSlZJRHPGlwJsZqNwCl2a63QZ/fL
 xQxjfE4DK6MktXmpWSSkggmGV6knmxAG+mPOKEq/FJt/2hmEUsn6EiVsGcKiqRKuMZ7Xx3zmdq1
 IsSoRH/qI2xGGetfztuRC8IW3zJL63LmPUsbnnAG/qLLRYIcN/QTaFf8IG9KsLIIyhTEv3u/57N
 SKCtin8mKzE8HZSVnFxibt+jbEa3FGgjSW008T7wluuYBC3sE0GpGIvQb8ijcv5DDSbUk427ef5
 bTdRX90Hb0LwSpa8mZ0jbwxv/6xqoIxEaorLCTYR4Zn8Z/tb0hB/1Ect4xgG0iDIJY/E2AaB94s
 THqMws7LmicMQf53Rxg==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5f92c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oHh1IH6ihIS6pQ7lcwAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: UK6SXRClsabG2ufyHJpCHXiG-G7Vt_rm
X-Proofpoint-GUID: UK6SXRClsabG2ufyHJpCHXiG-G7Vt_rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103728-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B77A429232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the mode-switch property to the QMP combo PHY so that mode-switch
events are routed to it, allowing the PHY to enter DisplayPort Alternate
Mode. Expand the DP data-lanes assignment from two to four lanes to make
use of the full link bandwidth available in this configuration.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..0c180e49816f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,7 +789,7 @@ &mdss_dp {
 };
 
 &mdss_dp_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
@@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p912>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

---
base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
change-id: 20260417-kodiak_4k-891ef2221e4b

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


