Return-Path: <linux-arm-msm+bounces-96254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NnpIu+6rmmxIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:19:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF55238B0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4219301E9A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E41376BEC;
	Mon,  9 Mar 2026 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iawTLr6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVALOoJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068833A782B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058789; cv=none; b=YkNbL4ha6aU00kO8RyfRB0FiZI43+b5NKT2+NSoVWatx9hCZbXmt+4fNVCVJGODvtl/7YEQjavK24sr+2ZCycYWvU2OpS5qM2wBDa1MDO2QAz/3R1c5/E4ELmrGrdgfwOrA1+Ab+EXqseK9XA2gSHluDNWUJkFpMH26UJYlz950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058789; c=relaxed/simple;
	bh=Gcqi/2MaS3XQT4/zJmN7kvMgclwCCecyrWkf1Z5mMCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxY0vIpGME2uxwpV1rn2elatMahjwFa4Dx0MsGUorATG+d/wersa+WtC8JdhZ44LJbAuM3kxnZVoiSXI+RmdXP4ROlyEA6p0sg1Frw/axAJWs2T2+QpDT7SuccsCc5ZQRg8lXqpiCj7iPQG31gDfGLIbpLTI9H/DVNDw0WCQPOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iawTLr6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVALOoJj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WENe3773310
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yvmoD/TCiAJ
	xVaC8AcUQDnwLM+aXe1XxGAJalKWaXdo=; b=iawTLr6zLDY0wv1SVmrO/ugMNUB
	BiEs81oWaknsDNKSIqhC4/lKJo+QrKMytOq1mT3eY8Rg98SWTuKNfd8DeM9ZXm31
	6CgkrgVgvEh3mdjrVjbElb372426M0nuxW9Cwi6nEh8EIknchQctDgLO91QNpisA
	ztB1ODJbwjDPfYna9QsmFzwbtDHws3nibwpCHvsYoGyNv2MJnD/iWrXlU7TBjumh
	G+bK4sY6bpJBnSBkC46RJ2v8YrQcQ3vjZ6OrHa3XOofpvhwtFhppTSA9yOUrbiP5
	rrk024ADCy4RbigpRtyQdw6WwvuKqPtDlyLjvQO+RUzV1F/6uHY/YxImY9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8seh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:19:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ab03332dadso50931675ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773058786; x=1773663586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvmoD/TCiAJxVaC8AcUQDnwLM+aXe1XxGAJalKWaXdo=;
        b=ZVALOoJjRqEnoPanMGBG8uxfRbw72DlP/A6X2o+sKAvfbwEqJZLMO5yCWbXGZ7g5n3
         uhjUoSNQJ8Mx0QlezBdlS+1MQPPfdQ/6TKSpjc7nCnbP29fMdAuGIlLIPpzxxfQugN+j
         lfkYVPO5Qs5QjnUFc4REk5DurdWqynB/5oJFZJVgVypPT6iC0KQyXwoH2c2yUI+e6EQi
         w3JiLfhc3vZ4E/zQ/kGCdz4wxCKU0hXCT/PqVkjeSn6vAxbJsviX6QXiGjQO5mzgnWsU
         mGoTfKkCSHrH7EWll+QcALaj87YnErMtJDY4ChzGg/Ph0hlujGXRPBullKe7j9mkkZh5
         0v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058786; x=1773663586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvmoD/TCiAJxVaC8AcUQDnwLM+aXe1XxGAJalKWaXdo=;
        b=ejgYVaomcfmS6rmNhfcs4HobI3d/pS7ROHt8+Dw6f9AFQPv0FrqI/DHVpIxdYMZMMw
         Ol/gGiEFfOEPzzRHBaiPjNy9mjk64abALhZCj5/IxeTkb+N3bot/2Sm55gZ+FGchWRaa
         B0Pp42nwQ5XoXzPGOBxqCDDJm28c8WPC6N7/AZJS2vrt3H25DPOGOjcWz7TOY5vUmr3I
         Mpo+quZ2duEmY0xCfrZqOablomxtQ46B4DsGi4LGuHybNe5VIQqFFGVtksH/JPGz58mV
         Lwr+sU/rCMDb5VFDirVgt84hClJFznClanOQXiHmmmiEtX2TRGhyJ5QkEs/KSNYlFnAf
         MAYw==
X-Gm-Message-State: AOJu0YxJH6AV4M4a/X1gq443kxOYkUQzxadJCVBOO1cxCwQqtybM0QBP
	aHIHyTkwNP5d3RtHbeZpt1Cjq8EB5hbmoQkV4tFFbEv7yuxO/LOLXZjAyuDlS/tlNBV5wNiU1KX
	NqqgKI4ByBU0lWI6qUTeZxD/qSatHONXyubOtGx5DiRqAGSkMcg0PA4PrpBD/umJzGNpw
X-Gm-Gg: ATEYQzxFxmb2Vf+d8lhYaYH3wrYWLUVuEKM5YyC3pu2s9uIESneeD89bP99xXWJQA8O
	BtGJOp82zECHf/TlCh2nD9MsWsWN8VEkynFos70CHHOr7WgjXR7ODrJJArho/W6XboarNd12D3L
	4qxeJK7bSHag/eaaj+N2J+xWMm1aJPjyYSqtFisqzT56k5b3NPxxFVEF7Xvp+zg9tIVvtqS8ln3
	wBKNnn4o7rrTRQPZUisJ1mzYzdQSArsZvG6HtIKYw822FXTKThkH0vpcdy7nX71pvn2bmM0lvpd
	2EAucInM/haAYtxSgIN8s4E6zkDzfMsf1jd3VznM+VaLmjy2+flLQdJkKTM0MexvA/a0l5mez4A
	tVU+XELG2ZaAB1iqEG2F8qswpniyaaQVJv7GpeMVHIAZ0EZCOTCs3
X-Received: by 2002:a17:903:906:b0:2ae:3b4f:e5b3 with SMTP id d9443c01a7336-2ae8248582fmr77924375ad.4.1773058786270;
        Mon, 09 Mar 2026 05:19:46 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2ae:3b4f:e5b3 with SMTP id d9443c01a7336-2ae8248582fmr77924105ad.4.1773058785654;
        Mon, 09 Mar 2026 05:19:45 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7429asm115762575ad.59.2026.03.09.05.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:19:45 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add model string
Date: Mon,  9 Mar 2026 17:49:36 +0530
Message-Id: <20260309121936.1289615-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NcpvNT5E76x-Q9_O-_tGFHFF0yOosm7W
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aebae3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-e78EVysecpqTJ-8J6AA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMyBTYWx0ZWRfX9Ws/OVOkhuaD
 L+ZHclhbi0FHJjkf1B6qWUPIQ56w6ZBA7d1p6G2zQYaV4Xo4njMWC4or9nfGMzRxJA3aA70IQBx
 x4OY6YkCLVsD7i7310uLubPSB+hzVDG7HVHA9avPsO+IV72Ky/SScIBUwTfPLR6fRO+MUpURrsa
 r3w71SaOfEAxv5efQYxwAUJJk+J6/snaC6NEdlYk5ipZvRN1sDQ/D/n0zo1Pifqayh7CrUi0pbg
 PoRtsGsOFLrfwV68BTCYQlPgtDfNgcQbj3edPky+C9QJItLvfbZloKcuhbDoECjaz34uAz/s5pM
 9jZ+paUIHoGNJ3iyUduhunw62YbG2mElDXxYYWXTjKNh9/BgdjStLbe//pLrqqTUT9Wt0V1FeLg
 9dT577eibgEq3Cc+XKrEI75nM8KbhyIBjAdjXU5HTUZW7wegDl/+OVYbjULJHsrR9LIjFZsiQg0
 gkyvZmtp+ftupNVkwVQ==
X-Proofpoint-ORIG-GUID: NcpvNT5E76x-Q9_O-_tGFHFF0yOosm7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090113
X-Rspamd-Queue-Id: 3DF55238B0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96254-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The RB3 Gen2 Vision mezzanine DT file lacks a "model" property,
resulting in the hardware always being reported as "Robotics RB3gen2".
This prevents applications and user-space tooling from distinguishing
the Vision mezzanine Kit from other RB3Gen2 variants.

To ensure consistent identification across all RB3 Gen2 mezzanines,
add the appropriate model string.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
index b9e4a5214f70..879d5d853bea 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -13,6 +13,10 @@
 #include <dt-bindings/clock/qcom,camcc-sc7280.h>
 #include <dt-bindings/gpio/gpio.h>

+&{/} {
+	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Vision Mezzanine";
+};
+
 &camss {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
--
2.34.1


