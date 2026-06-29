Return-Path: <linux-arm-msm+bounces-114981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCmtL9tLQmol4QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:41:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 136C46D9018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:41:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CDab6gCi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fXw3W99o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68955300442F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F4C3BAD92;
	Mon, 29 Jun 2026 10:40:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A893B9DBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729637; cv=none; b=mHnFFDvG5C/9SphmA9vYyaC+UyyNR3zsELPvsUZEu6ofh2Lfzi87qlrbGjHUZHYDUrKk+EmDqnQO2qX+DoOEHUFgQ7zs0FnhAKWtQnAsThD0k35c9iIGVTHnKnF/IBtFdYxOg0DDDqJxw/1Xv7ztncnx8dcN4W6zJM6E0+RtCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729637; c=relaxed/simple;
	bh=CHdDe+BUQ62guidxh4D5DQ0w+0rvA5ZaJvZOr/6hUqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eQpAxriHgGfAupcUKJ9iZxUrXO25i9qfwtqJfUVncTIw61G7kScV1I5XqMlhg5E8ukf/24PissozQGg76Uonxl6OKnmCp8gbymSSKORrwwC0+iimRNyLsiVx4LvpR+eT+Prca06I46VRpG3xgDYzw1JQbP4uOX+ktldkdBzZtKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDab6gCi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXw3W99o; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3w22601595
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fFV/fYYZ5actoreseKxiGB
	Q65zNAHd/sIZ8nm+2uXhM=; b=CDab6gCiodNwxNdi8o/ilUBGOekJjFcGDVQvFE
	Eu3FX5D/FJUwukfJb8z6vVqDZweMneMYimz7MB45NYypKXxM2xWonUHtlMAQtiE2
	3tu41zvfXSH3zNRX7CESap3k/IYfwTmtGicUNE6V4lrAFjuuJ76+p2ndRyfG86dj
	a7IbtIpW6upbzy96sDg19Etsq0uANxTGS8eZNCEZuO1H5fkZa31w1mFGB92bCLxc
	JIpMcxIdAOJ3TDtw+GDO2NrDkvtbZR8KMj9OateEH/yFMHSqgsf6CEvX8Y0aIzTS
	ijtlbVtL57Z70nqCudoqCjJpRwITLY88OeozpylqlUVAY+DQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8de9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:40:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139f2c46ef1so1861852c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729635; x=1783334435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFV/fYYZ5actoreseKxiGBQ65zNAHd/sIZ8nm+2uXhM=;
        b=fXw3W99oI8v7fUVtDXRMP1Q/YXG3NEqyj51Ee3Q86tXYWRGDSpl0QVPralSJVabRVn
         CLOYb55NXES4Y/VBZf5zcMd0PZ1WtwNpeEVR/pd4PSwW4eliF/TJ3xzjVtaPe1u7SO8z
         GeqK6WcjnNyVXPcMzr3+kx5M/nGEmXKDYRSDOQUVUEQe0qq4b0qa4Ma0YFFUiGu6LBuW
         GR9cckikdvT6mDurhWyViNnKrRC1R5o9TxStXi0QjgnC6LWqZrQWhsyREXJuoZzvtHJ9
         rMpVT9a/6ZIM29sg3ZxzNIG7Ye9WkQT59aFDUYY0mYgHmvxLn4PfuxTUpZtDRs+0lJKH
         FXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729635; x=1783334435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFV/fYYZ5actoreseKxiGBQ65zNAHd/sIZ8nm+2uXhM=;
        b=fDF7FmKFKxAczvIHKPJuZqmMxFXRuAbxBlZ/nI7acZid56r5FTctbZ5FJp6SBETNOF
         Fa6ZWYZmdNa4LdAD4DzGiN7PUKpru5RFYIEzak5mbV6amrJ/vCJAIYa8vpRchpqUzhVu
         sJhGb0NRaKA3opOipRbbtx8do6juglb4KyBzbLQbWeBXk6eyjyNBlW06hWv21lurbefD
         YiiaYBrAnhNqapl6Dh1tI7y14c7JbHwLrArpejSX4/gkqdxc9EMINS5IS2/UFxcxNLfF
         tdp+25KxUfNeyF90z2/ptSUbQ2dBrOAJWs6hFXYLlmRwtvs5cn6umFqkSwE5XTdAEE3j
         g7Og==
X-Gm-Message-State: AOJu0YwSD6Vn52tfVzi17e6bE5STZJ4/hfSjn4mgCHvyiQ9Toyas7vWu
	HzRhiu3ufyMTcqiENWga8CO5mwch+7wsKeJ5Fn2pfpBmg0dlBOso1zXW4fA87cz0mo9UomNY28E
	LrQR6mkiK7T+sJebulrFG31t6iED0rBZg7jsGe5qUG5AUIlw5cHrim1G+BUtmIGgJt4Ch
X-Gm-Gg: AfdE7ckqIpkgmTHnIUc1GkV5j/ORBpxPbY7AHCtsvomgMt4xOpSfa8gloqhrh8UGyha
	184LKpxntudRHrWlcai98uIeQy/qonezVcGUbEC5puRng/LQOQdfqnErtSMWwnRNvj+JUqyXO6Y
	4clOZ9tSOnpPAV7LKfgzZJDQSJCYZaasdDK3YOBmXvoGBtV6IE1HA/Joz6QngqsiydZCAb3q6v0
	4L5xZw2PvjRPT9N6RGC1rC1erf20Xg3JAOCuuvhacGDO/y6GX6xbdYla5ZWcSp9/KGLFW3Hik8l
	r3cLQ/3JIp+NYWvPZEqQs2rUf4ckSf3PFhlrF/zTuMMjD4REqEfZPQKN4zDx3c3e5X9zbAAY43G
	V5mK4BUAyonLmjXK+6dXnU1sOWf1NRsmlBConUhiGJx5KG065A+19P0ATx5Eeis6VlHRkzdQEUt
	cQNF1TLhS1PT5j0q+2Csr1sLY=
X-Received: by 2002:a05:7022:45:b0:138:3613:db8 with SMTP id a92af1059eb24-139dbb18492mr16019772c88.3.1782729634664;
        Mon, 29 Jun 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:7022:45:b0:138:3613:db8 with SMTP id a92af1059eb24-139dbb18492mr16019744c88.3.1782729634176;
        Mon, 29 Jun 2026 03:40:34 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25413085c88.10.2026.06.29.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:40:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add EC support for Purwa IOT EVK
Date: Mon, 29 Jun 2026 16:10:16 +0530
Message-Id: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBLQmoC/x3MQQqAIBBA0avErBPMhVlXiZCyqYYgZSwLorsnL
 d/i/wciMmGEtniAMVEkv2dUZQFuHfYFBU3ZoKTSUqtGoLPxDMHzYWfPNpx8DRbTJrSpayNHdLI
 xkPPAONP9r7v+fT/dHwePagAAAA==
X-Change-ID: 20260629-ec_support_for_purwa_evk-687780bec098
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782729630; l=777;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=CHdDe+BUQ62guidxh4D5DQ0w+0rvA5ZaJvZOr/6hUqw=;
 b=djmfSy+gQEzHqI3AgW76H/2zUNpH/2uf1mAQc25+994OQLTK2eCx56dfEZTtl5pC58KCBBZl9
 kFoP7CJ8kk3AJ1bY4h6evfExiDS8vs83ev5S08BB/a9Yq8LbJoAPXx9
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX97G4jW1926ke
 CcObPQJIauNFs+lXdwK4hbMiM4mKAb7oiHDaPQ9akXjPEEipgbggrMLzbYHmi39TnhBzr3DUdLN
 un3O8V/2uGc3vqDnWkK9D/mOMuZM88I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX/R+zY6MAOCHf
 D8cQ3/HXsnk0XmF7t4hvfXDwuv7uD0wISF+/J+MCVWzaB+Ti3n2wtszGJ1vuX4CssFE8Ex6pwNM
 zXXBlu4er+3l6qTcY1+Gb4lgVp/+8CjZwRoYDgO93pEdcV/nR2BXBs2D+zOPa6DdMOtr68dUpUp
 4XFTVqg2YVOKt6P0UpYm5OBmnXtjXGaZ8ykHZwo+zPsGq5W/JzH/tqRtzPgdDN1+YsQZWc1uTc+
 Qxwy78rzVEg6fL/dCuYTgWBV94vh5mr4d4BC6Hx7k6SP69uvKcD13CyYx+GGDhJM4CFkDClypUJ
 ImasJ3lgPO2QN78X1I7rpE0oIl5ftfp/RbGzuc3avfT0er/D5E4rCqbLhFoEBahg1Oi1gOtqHgq
 +wlu78gzQUW/RlTMuMzojwe0cGUnTYSjFsQPtkIaAEbYAO0SCvmuOZCvp0TSfHiXbDjNOcX+/93
 mexuZlBAE8IXY2ts3SA==
X-Proofpoint-GUID: DJYkeZxqMMDMW8qOqxsuXeDF43r-VBc_
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424ba3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uL1NMb7WAb6n0rh1RjkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: DJYkeZxqMMDMW8qOqxsuXeDF43r-VBc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114981-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 136C46D9018

Add the embedded controller node to the Purwa IOT EVK board and document
its compatible. The EC provides fan control, temperature sensors and EC
state change notifications.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
Anvesh Jain P (2):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT EVK
      arm64: dts: qcom: purwa-iot-evk: Add Embedded controller node

 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml  |  1 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260629-ec_support_for_purwa_evk-687780bec098

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


