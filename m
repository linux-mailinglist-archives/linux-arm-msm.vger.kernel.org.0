Return-Path: <linux-arm-msm+bounces-90740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDA0Nh6leGmGrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:44:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9493CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D109300516B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0014134B195;
	Tue, 27 Jan 2026 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ze+E/7uC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuG1BKUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EA234B185
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514259; cv=none; b=r3NzL5XVarCZ0Nl4XvQauax1FoL74Rl5ZpJTuwmBovIWFsdZ24l6NP+GFxVUEV8NJyhN2HLrfb6p0Cf5YhWpJG3KQ4QGTvahovvs67YGWQwzhqTsDhbd6fb8AYvDATpd7dz8Hto2QS1DxQny2sD7iuieNPh+t5KnZcG5XpA7050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514259; c=relaxed/simple;
	bh=zEbCJHYnifh2iMGDoTyM/ZQBliTMuai9RojnJyK5lTY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NDRHTaryYgyL0rJtM+5vkhxJpaorPtIkssVhYcNrsPy3wWgPSMc8w3+cj5vO1Ud4uGw2g+ipVd5ybFO7nOjZFV2HspDG1juIxMGnSo8okN14QWGDifiidvemYBfyCFFnHBXPlAZgss+QdVvXkFOBwrVOilkH/2RjEkdMOAVloSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ze+E/7uC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuG1BKUm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86v1Q621206
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ANLJGY/PXLAuh1XIWKAt1m
	U1h139CnaYFkml9edSEf8=; b=Ze+E/7uCHaBaNizUG/chzN9l+ZNMYvQn//7vJd
	lnrdG7dwNAH7U+ZfQhBc4TVeRtb8uUlEk/gaMNPQq/LWALbBZ6UhZMs2abB/JCWL
	yoQ+aqmbxjp8jlocmkaZ4CinpXb1zjMygH0Y1HWje+Cv753RUufY9EpHB4I+oztt
	NiHkCL2wWnoS9Am5un/9HXGZLdy0SgKPAiCNzAVuXjqF0yevcCd7qBm8YwGgzlX1
	W3u5/Z0L2GZ5FsrQWdCto8A5WOKHbb9qWK5I7NxsAUjvzAs/Z7bDkqmtgI7Y7Tmo
	/iycLsgN8aNkOnlSIRfl+QFeu8+CZ6vxdzNKRn0CTJj8LW9A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegpmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352c79abf36so4665870a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514256; x=1770119056; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANLJGY/PXLAuh1XIWKAt1mU1h139CnaYFkml9edSEf8=;
        b=UuG1BKUmEdV7Feq8IKoHm48bNHTPy6+OfXpFw6ToULo/+XmHr0Hhl5GqANAbxBu9sY
         7FWusCrxByJgpl8EkqcS2X3hp31wsirvfBZqHA6fEUcWCb/QMSQhKHFfY1ewyDqVmDRC
         iwuO27cLZhA5xF28nR1rV+ZS1uDD+MEKX+XjOCJBP4+O9Qcumo3Z4bXz44ZwyWqCx0pa
         USJer9MhZyXiWVM1V/IgtZcZHGMkJiyJCREmMNwxaMbNiesujprKrtzXLo3rmXw7XZN7
         RIe/l9f2XlttrfOGIXZPpArgXG8FPtlkJdrXaqMDdtf/KnRlIb28HYWEMhIMhaTJzoyN
         SNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514256; x=1770119056;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANLJGY/PXLAuh1XIWKAt1mU1h139CnaYFkml9edSEf8=;
        b=faLAn1e6Pn9I9Xwycxe2iXo+5gh9JdjJTBvn+m7JkojE6q55+uKd9IrEkvAH9pVmH9
         aBPwgx7wIyFvlqu1mYEL97DpP4AqlQ/2LVOM/tYQWCok8E0jmOLuyz34ovNIJJ+KIOI+
         W+28byVaUDFVLGifgWvW5VZef/fK2NAIiWzUz5Fz8qvfoZIMVmxZG6jMKhQADTwi9sYx
         im2vGRzAFNqBELLSrPxPDXH8fQaimX4nCk4KPeewtNqwttGLgVv/nbADvgJTSYddqZED
         XE+uCeWsge6iWSS7Co2h1Tt8X0cL6Sg4BDyQ4PYuojT/CF9k3epVmaYVgYThjgA5kIrc
         lLAw==
X-Gm-Message-State: AOJu0YxlvyEf6W95w11/DXAEo7rn8Xo1ORWloXZLWXxrqZwlLaxftjpV
	6LXYdinDYL0y2Dy/6nEhSS097+mU0n8lVfDE7otOZTv7aTYPWpuvt/V7I3HGlPFXqRWD/YLCmK4
	TQbkxnOLl6Ljp8VUtukVUuIvKDt+7T2sOyqMedtvHgKEUAxZO4xYmCa9vDhxXpZg8ic34wqPVpm
	3o
X-Gm-Gg: AZuq6aKr2oI8eVFS6EMDxbs+jC1CwN7yzqz7jxHMswRgzwalT0YkBr51QZEOhtg7z4f
	asaExmrTLq8tn2mtCEYY4vDqVM/Q05Qr3ioulJMNYsviT4E0m0PUTO8Z9/kQVaLc4rs/+vF9keW
	w6HZuJJKDFcYgRaCpwUXD5VsbNXCaRDvQBMQLiRchR3fSMJ6ZmJZSjVOxGBebhZe4mL9QSIksp0
	qNALWOhao+xtlscLmj3BNau6h4gHxXojUhmo7PmsfHCzvwwBqtE34MCntHVjBiHJw9J5WXXlgBP
	wMoxr/ohNfn+SEnkMtU/W8O9WF/DaCkw1VUV3GEE22W8cDdIZscIqAPJrp7r2sPSFaLF5KaQdIC
	OUAB/757lQOvCQOyzLEhbs86CwdodTfEZH7c8
X-Received: by 2002:a17:90b:50c8:b0:340:54a1:d703 with SMTP id 98e67ed59e1d1-353feda27c7mr1513036a91.35.1769514256071;
        Tue, 27 Jan 2026 03:44:16 -0800 (PST)
X-Received: by 2002:a17:90b:50c8:b0:340:54a1:d703 with SMTP id 98e67ed59e1d1-353feda27c7mr1513012a91.35.1769514255291;
        Tue, 27 Jan 2026 03:44:15 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6230d5dsm2392301a91.17.2026.01.27.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:44:15 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add EL2 overlay support
Date: Tue, 27 Jan 2026 17:13:47 +0530
Message-Id: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOkeGkC/0WNwQqDMBBEf0X23IVk0yTVXxEPUbdtIERNrLSI/
 95QDz0Nb2De7JA5ec7QVDsk3nz2UyxAlwqGp4sPRj8WBhJkhCSLqwtTRg6E08YpuA8q42ytnDV
 Kaii7OfHdv3/Otjs58fIq6vUs/+ZyJEhLITUuQzYl8uwjEvJ41b0Yua/rW7NZ6I7jC6jQv8KrA
 AAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769514252; l=1717;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=zEbCJHYnifh2iMGDoTyM/ZQBliTMuai9RojnJyK5lTY=;
 b=V5etih+kUAL3UiHoyZFw51ERba8Ka3ZGGoq/phaYArBYerWNUas5t46Licv5cxQ/l28oygqxo
 Yv7Qiel+OwJCb5TZHepcbPZpGMVQ7K1ZK7ztAV1HvntHvkQTJR8PjBt
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX4pW5ITSUeUn6
 148f9r+wKIqF9Nlym2TUlU2YOXelX672Wmyx5fyXhl2q9A1JA7fFDt0OWOHjDyBxwTUqKYNfLZS
 KOaoiK4F40JfGhBihIOoMpOlH8eIFMNkHQ3Vd8PTqecDY0I+9OkzZvhlRKlHh6QfT8cKRVA3M4Q
 RRRiql5iARtY9NagTOYPMGh9GTwTWlK3X3JnMFj99/qB8tIKUdPlXe18eevOHm35Ip3518ribSR
 72eh8RGpeBebUD8SO5y3n15t7d/6hXpGdZx5mUH0w/WuPbuBAfCluYLT9vj23EiY1Fp6I8hyOcw
 kzqsLwX1gCDifV7giUKD8BVL6GlIMOyXU9t6YKmySr2osI2KBBk0xwVopKXxdZKYHGi+8KhYSfl
 T08v5tlHL3x4/eZOHDjxCUY+DCukovupTimHeTFxczujegx9UVNBnol8J/286xizEA6blX9dIVz
 f0WRNaNM3fHCSccW0bA==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978a511 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=T80VVIUPpn7IXxhHd2wA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: BQxlAn_9W2HGMdoA3eu52Uy2gR7BnD0d
X-Proofpoint-GUID: BQxlAn_9W2HGMdoA3eu52Uy2gR7BnD0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90740-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40A9493CFF
X-Rspamd-Action: no action

We have recently added initial EL2 overlay support for Lemans and there
it was not disabling zap-shader as GPU changes were not available. Lets
disables the zap-shader there. And in the similar lines add support for
Monaco and Talos SoC variants as well which support EL2 configuration.

Talos GPU changes are not merged so its overlay file has dependency
on https://lore.kernel.org/lkml/20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com/#t

Changes in v2:
 - Added patch to disable zap-shader for Lemans -El2 configuration.
 - Address comments on V1 about comments placement and sorting the
   labels.
 - Added dependency.
 - Link to v1: https://lore.kernel.org/lkml/20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com/

---
Mukesh Ojha (3):
      arm64: dts: qcom: lemans: disable zap-shader for EL2 configuration
      arm64: dts: qcom: monaco: Add EL2 overlay
      arm64: dts: qcom: talos: Add EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/lemans-el2.dtso |  4 ++++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 29 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-el2.dtso  | 25 +++++++++++++++++++++++++
 4 files changed, 70 insertions(+)
---
base-commit: 8cf69ccde007c307a9e1f95bacf222c9e24aaa31
change-id: 20260127-talos-el2-overlay-36a793a76315
prerequisite-change-id: 20251015-qcs615-spin-2-ed45b0deb998:v7
prerequisite-patch-id: 7bd38514e695fab411815ae1e16c36f56d8f5c68
prerequisite-patch-id: cc5925cec2a27d3655f68f1c1bc1f56dbc38c132
prerequisite-patch-id: dc825427a872ecfb3615c0bc4d11d0cf75df0068
prerequisite-patch-id: b2298e5a32a81928a73e68b2254ae4427abdef82

Best regards,
-- 
-Mukesh Ojha


