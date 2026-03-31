Return-Path: <linux-arm-msm+bounces-101067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMCpKknVy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:08:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E82536AB0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 728DB30D3E6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B41361FCE;
	Tue, 31 Mar 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ9l9Qh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpKZ/eo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902713F6610
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965782; cv=none; b=C0pKEJIzQ7/3lH4xrIwlc1UXGoaHaf3Dlml/4RF7XZqAXRcnYGOEFmDdrVcX8vnACeSRmEQKChupjTerMjBVmXez0eEwRSuv9DvWox4nMmoDzgr92GPYjz/LEMK5iZc68WCtse9DOvkSNDLVLeSwJavSQdCwjAoz9WnvpiMzidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965782; c=relaxed/simple;
	bh=IgGU2Qi4nWwMJY5v3HXriJsfiYRY0AiF9DVkDeg8kHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=spBxRQUkHSKC9QGCq/XsJkQ9cjFIGvEzc6awSLgoWOCLjibtiKq7CP67x7RLGsgFSgqDnqaG+27GvEn4O1hj6S1MngY8ckN9FYJt+m5VFV+UrB1QCzPNuoA19VCuPGHrOWv/Ip30dau25tsgw9MIdgJ3y+PSfxkJ+4/biI7NACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ9l9Qh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpKZ/eo7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvKa81305644
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6c+MDxLwjH6fqBjujNa5uF
	kT/1gDt81aZlpAv9an2SA=; b=BJ9l9Qh99pZXvNG2R0hF6FUvBBFgvr4ouuMmHv
	+EJIJSywI1kRcdLly2p23TyPfw5CTSd1J5r5xXkrubhEpq4cfAdDO8eqC5obrnnT
	Kv0lXn19vjzagtjNPrkIm8eKc+a0XINZA7qAvovv38nfnew5QUiYPCe7Edrmd8+h
	pJrCA8xbahvxuGctLBjVJ6lt83JR3hNRLzUal3zvrJ8UO2vloY3mVm6hqjnfPNbl
	XjILtFyA5XJy4XYaR/HTn4j8vTIm7N8d45Q/VacpbjiEJDdC2mbaka6e7p6HiQq/
	FCgVA2d6CO2ouLEL7JAYCFIm+AAuDu1h59crF6OslbH4XpgA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ8d0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:02:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-951b086a5e6so2056104241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965778; x=1775570578; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6c+MDxLwjH6fqBjujNa5uFkT/1gDt81aZlpAv9an2SA=;
        b=GpKZ/eo7bVrWa+DkTHjqTb1KQIc4d4We9cfhu27Si7B/Y3dd22y9+rfKfzGMacFphE
         n21aVtJN2qDvA0lQJjAxyhRLP1eAN+NPIY0zqydrhoL+I3ei9yZPargV20wcnUmtGqc9
         LYLmjaDJmPq71M2UXCIp0PVotsvFgMj3y3E9yEawz5qCGjDMt0tUmKhXEN7xLjKYXuXR
         q781IsKcl5PRz85rfoT1S1w4fq5/lNs5KG93mRJGDGTFGZH/p1EXPW8/k/oE2HMIzVuP
         vyDoVP4iXKPtf6iFhUeyh2lPwGmpukstI2l7UeBrPehffZBL5dy8ATlS5G5qWCsGhg5v
         EkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965778; x=1775570578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c+MDxLwjH6fqBjujNa5uFkT/1gDt81aZlpAv9an2SA=;
        b=M+dkN1/7sIY6g81dL/vnpzxNiShpve+o1lLL3ff7RnyeGWTAu7v7EKB4ioDZIXdYT3
         Bs37XUaE0KRnjQxPvjbzyMa57BpO1mG4QOD4QZTtvkP56Y8N+eHygnu1z5aDk782bv7U
         p1H59eXl4VQQsVq+x2uiwKXtMPpPZuQsBiOKtbGJzRY7CGUitCtysZft3Yv41fdKDGG9
         KRzQw/W3dUh+bwO7T1J336t7ARXbNkbkHDrzVuM5l4D7JNqSYYfq1/uOtz81esIBhNx2
         fSWAtS4Wyu/+h59xzP02yTWdfb2TY5kccqPO+VKEGadaTCZzTeKLrbfJzHjQt+DO/2ux
         M7bQ==
X-Gm-Message-State: AOJu0Yw4O9l1Al4qzaCISiKE+dZk0gBdoFV7EnSCJaYvSSH+qwZYZRyn
	OYaqZsi2hhmZRy2bFh+R2lXHCBu29Q5/bylowgwjBWb1Z7y3gZdhtLZFMA/WZGaVjMmXhJ67s44
	ITYlOFKJmmAxkxRvr+sI/RVICsXkocuw67HFnZzB/mRy5hzzxD2yMrOhGj2X1qmdF61UA
X-Gm-Gg: ATEYQzyj+gtoUrR2SEGkiv0Tedw2hGgi+SF8FXCyY/Kc01xrFJz1ozbbkH8mTq/lnlK
	QHoZTMNUnlVjr9+gHaLVj6k7KXaacA5ddFSmcMPhqWJM95GrCQPm3I3mShLAWdUYO2I6F/6EPl1
	DRG48pSnyKOn5WtBJaBxl97GcA2W3xEkwVn3IjuIUBl/fV62uUEe/YQ70aDP/ExJuCd3DUE4kv/
	H98t7TVwRr4c+iVg1Z435Avc/+7WXKO2Mk+qTxPAIJ/gYDCQf8diRCwRYh2mnRoUU5LedOeLegz
	AdzoAAy7RC/lxUBO/NCzw3eKD2vbR2CDRWRpTfB8Q2ZPogmYrR0VFUjQainhkFJwX0J4mw0+ffy
	2qdbNyNquX607XGHBdHDeOVhL52lAeXE9xs7/52VYEPeZ
X-Received: by 2002:a05:6102:cd3:b0:604:e18a:ab41 with SMTP id ada2fe7eead31-604f9101b23mr5641091137.14.1774965777723;
        Tue, 31 Mar 2026 07:02:57 -0700 (PDT)
X-Received: by 2002:a05:6102:cd3:b0:604:e18a:ab41 with SMTP id ada2fe7eead31-604f9101b23mr5641027137.14.1774965777176;
        Tue, 31 Mar 2026 07:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm36610895e9.13.2026.03.31.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:02:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
Date: Tue, 31 Mar 2026 16:02:48 +0200
Message-Id: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjUy2kC/z2OzW7CMBCEXyXac1fy2o1xckXqA/RacfDPunXFT
 8gmqAXx7hiIuKw0q5n55gLCY2GBvrnAyKci5bCvgt4aiD9+/81YUtWglbbK6BWmSfAYDzvkbTl
 7TEWGrf9H+57YxBydbxXU8DByLn+P4i/4/FjD5vmUOfxynO6Vi23k41yx0+J9UfvmyTRqQfkkA
 84S0HHWgYLKkUx/ontP8MJYV+3KVMdn65zpfL3ZkmaVIjnTtp1PuSNLmdoUdLeCzfV6AwPOiQE
 BAQAA
X-Change-ID: 20260327-dts-qcom-eliza-display-64de3cfc8a50
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IgGU2Qi4nWwMJY5v3HXriJsfiYRY0AiF9DVkDeg8kHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy9QKHOOaaee2RRE1qO/JO29kNJR2y2izRb++J
 pjc7khaSj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacvUCgAKCRDBN2bmhouD
 13uED/9YLytl+GlMoU1XT8lizljkfUjwb3d9e+grYJRYbrx6tAdzwN3WrVdCZjM/5+lNel6nXg4
 DYncGi9n9XxfMM6lbUXsBy0eONp0RBDnzfSRnGqPqVNwx/3fFs8XsCpkfa6CwRNTwiyocuqy+Ws
 i+s2wl8Bf3ee4qEGvFSDMhGwqeNFFqoeSZh0DKucJ8Xi1ET8YI3Z9IUBoDUWFICelwc0Zm9mAsQ
 rA6C6haiGVdJkCtBnDPaxHZpcYw3W9tgFCSityR2CphPirEfdF2l0cjrzfnRlYZJep5JvFwjoD1
 Qww+COWTKSfETvnwmRAkjZHJZaAhtQ/7K9vqkGmVdVYPtmIFHlYXhldmvWo9uCYxiTzzEW8md6Z
 lVYm1t32BEmC/KcuuX2+V5A5EhXykKctrhnmd4WZmuetFm/xHFkBGX49ZLWr1CzThTaX3+5yDzZ
 oVch8FaZI3EVMJY/U4XP97r93rNHChTYa4+CwcAeMh6O2zq+euZ747qsFe5lnaPvN9FDm5lUWJC
 /PuE87+ZsIh0hQIWZAG3GNk4xytofOgkmfqgaSx+yNO6PMK950H8wtnkgmG4u8jhlO7DtU3uo+s
 qgRq+gwvBQi41OH0fpclzLJg1fQoYhpjg4nBJC8S/nGdXloz9jqh3bGjfozxTtjc9fva8YD5cwR
 xitn2fDqMNhJrug==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNiBTYWx0ZWRfXzdy0/r303ms9
 2wWhw+8LkdII7xz25H+voyuQG8R5BZhFkcGjHLwCdOBrPeMFEDn1mXnID5oSnZq6QmDG7NPQ4p8
 02j8hEWKTe+eAuAUMo+JVUvup8ycrHz8U6+JvwH8sf9xDVhIyoIDzKIh+8h3bbUUrZaafbRx7w+
 5aOv1xKBjqoSFFEVUD7cIlxLY+XGYIC+2djd/fL57wAIbLT2zR/py5GnEy0CbzvXjPFhtdM0ggG
 /5pT9Yd9oqquw9MdVVZmsP6N7YymRrN2cFdMbNOhYY7fb2rQA87xxsD0UCx1aK6M6K9wbaxv+C0
 TI7jMFkcwiLRiOtd4aempTRdUBnqvBE4fZdpVyQDDW/77PsNivSQ4pBdSvD6NfhuYk3K1adG2qy
 AwRlNoOcnHuBCdMoewlwIB2NSRLt4PfMlttCdKblLghH4Y0+/CEK/bAh8OVreOzz+ukrZOox0r+
 XbDchQ7bzKAyqNqpEbw==
X-Proofpoint-GUID: ieoVOlS-XpDnbADRbEYa9VKux7IphjXJ
X-Proofpoint-ORIG-GUID: ieoVOlS-XpDnbADRbEYa9VKux7IphjXJ
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbd413 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CeEFVkMbncPIoWIB1aUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101067-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E82536AB0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dependency
==========
Depends on USB patches, which are being reviewed, therefore marking it
as RFC as it cannot be applied.
https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/

Unmerged bindings used here
===========================
dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
(DRM MDSS bindings were applied)

Description
===========
I did not enable DisplayPort because it does not work on my board and I
don't know why. I double checked QMP combo phy and other bits, and
everything is looking fine, but still no USB display, so maybe I miss
some other dependencies as this is early upstream.

DSI panel works fine.

HDMI is not yet ready, because of lack of hardware with HDMI.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel

 arch/arm64/boot/dts/qcom/eliza-mtp.dts |  63 +++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 433 +++++++++++++++++++++++++++++++++
 2 files changed, 496 insertions(+)
---
base-commit: 1f68839a688f612e0dc183559adf9161f15db297
change-id: 20260327-dts-qcom-eliza-display-64de3cfc8a50
prerequisite-change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13:v1
prerequisite-patch-id: e0744310fa58e080587218e62aa6686ed841689f
prerequisite-patch-id: 1b4e40eb33adf28c8b6105f25f6636f82239a962
prerequisite-patch-id: 4671af784a83f9ce69cc2c502912698476ee7719

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


