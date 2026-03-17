Return-Path: <linux-arm-msm+bounces-98241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAPiJZCNuWk5KQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:21:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 285802AF61B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1A7D331D1B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6243F54DC;
	Tue, 17 Mar 2026 17:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKi1oFx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgonHltB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539426FD9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767688; cv=none; b=PjYDaUkeBQk9VQx6Prrtpzvy/qs+rfYbab2UrpsH/t7mAb9nllScW5UoP73xcAq4lmZcsYqMD8tvhKPmKFxUQ4J0yIcOkLlCzd4+ygKn2VidUdfN2sXfSjTQdAdMGeII65js4O+jQgsrQoiQ+FNJbHL0tUjlGz0Rdzw5AJZC6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767688; c=relaxed/simple;
	bh=vx0w9PUU9iUocKYSf4pra+YZUvM5C2gHGYO5N/eo8QU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iDccrwt2uWRGAD3PevylOTCG/Gg2YV/sTu/qJJBRE+D5437izFknrKjoe0fqWOjTbSuoln9fAcZN2qnNtMSz+5mrTy7vagUzgZlwLyQtT3aeFVkdIbJjg7HbLLGSM+erw6I3kLAo7jpCZayQnOrJZgHowK6qfwO20Q2zKNwgEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKi1oFx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgonHltB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HEHsOO2188418
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q7jsL4kfOR01N3u01XCOBm
	HY0kjj5+Rnj/VeLPkBFHY=; b=fKi1oFx91Kt+EuYmVN33Ko0q/ALbTfi9PtQQWF
	zO+xsxFa/54aJlp4UOJgO2jXJBkj8g9Mbeo6UhyMw4Rx/xz+byDZ4qTzyiOgcjsx
	V9cfat8UorvJd9Dc9uDHwc61MfKszME1jkmpCmQ0pg3UO+bE1wipReiDZdQ5AwtS
	7/ORx/iAMzIuz3Sb/c10/Wn+obyzOvEaPRX2A79OVjR+hE34fUBRzcaccxCI8pnj
	VJUwxZLDFSaOC4HO0OQT2EOqkaZfsylTdaBlpvXgj1WgWbBwMBJy1LSWuNukm0z7
	2vEWsK8TRoWmn9e3DG97yVaB+S+DzWak50jKr9EP5LFomNYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjrqaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:14:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec8d85199so737985ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767684; x=1774372484; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=;
        b=UgonHltBDbR6+kuqIQE7LnGxB8BLzhMia1CH4R7d8xVOd1Phg+96CZcLZwqAfyaakq
         R89XEeIG56iLQxGJu9slBABOqpZBnnAT+aq4KbD3KYpBQVoeO/CsVb4bmgW8JThU7aI2
         DqxobzkdskWP+28mO+CXrKDqBNlYVyWPc2hH4abkcjzcl1A+WXyOQ7sdfdU/WojIm3eJ
         6x6xGLLaWFR885kk7sdDYWPz0n4j0JlDwvfrqu0OHFC/N3SWo2iIRDH7ICoTO7t7RCO0
         F4PYW7LFrNh/QXfN96FIcrnsfyDfNCb+S+hdMrk1nMqfO4xbrVWKZztiGYSdF5qyBKy1
         dGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767684; x=1774372484;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=;
        b=RROd4bemzkWypHjl9s1ByOfr8svT9m1dRPLjBVa8cso58tpuDNdG1Zmo7qu0BCIq3x
         FBO9WuDtNXDfETV+uNr2e837Oc9T1MtKn0ac6qArEHYwIB4MbVRBJtuRl1JLaufyS7oc
         P4vu9dUUjyxiC7FPersK+bgTE5aOnRKTOi1EnDHHQJKPku5J/N8uj6toeevqiWrtbrz7
         Ypzg8lZhmDr8gjx+8awfIFnRkrEvA1wJ0+24yuvYOWt4+jVs9tBjv9yVzV7sJfIKVtOW
         zVdyZuLCb49HjAPgrpB4C8WpGQnC0e+IT7+9L45Wd/HwKEwj4chyobDTyhwKOX1gOBtK
         gfGA==
X-Forwarded-Encrypted: i=1; AJvYcCU1B5md5Mwrr36kZj21kMwgHLufGm2srnQzOSmD8Uye5lh2VPqUcF3fJMD1AzBDDswlgfT5mh3JEaUahIHr@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqSkzgeHx8PAU+jSeM4bNZ8Lcc0LHjAvRT8UTp89vm5d7ct/N
	tfOvjNk9JjZdBCU0xf6vHVpxaHsjVXRfg0hpnr/mY12vNYCrXxRmt24s73IS2vFToD94M1BlVWU
	aaCV4XYS823iQXZYJ2Y5HnYt6kHltTInXcg8daJccyXaD1SfiX0L5OvV/xDlW52S8Ax6T
X-Gm-Gg: ATEYQzzgG+ecZf+6b6IuH4IDzZAuibQ/zDom12XluyR4HHWfMnfdK87JJVb7UQAk+c4
	9QWw8i1JIFJpcYPK3ehkuf3Cjw+g1M5TfzBcwBuwbQr1l9V0w9NBeWwWIdCZR+5PuhIyTvGhaqB
	ybGxtQsNCqMOJygzFi+250hrgGVlfW8cETR/5iSnczuKuCDYVksHNjqOT53pDNXX6Dnn2+oxMUd
	MO1uGbNvwWwdFTwrSzsYO03nELT3KbiDB4cfBVjsrBALsy+ep4ojgidL4CTPW0/GWLkZuVRinG/
	Lzs7t/ORqSqFQDasoYQ71QTNECot4OyXTUOtWMIMVX54+bF5upfBqVEYxfm8dkfG+Dwg+3p38wF
	B3MnmDx+UAu2fvD1MUiG9ER5jinekwClwRA9CQXlM/eYTCw==
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35bb9964818mr360748a91.3.1773767683986;
        Tue, 17 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35bb9964818mr360731a91.3.1773767683454;
        Tue, 17 Mar 2026 10:14:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 17 Mar 2026 22:44:21 +0530
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO6LuWkC/yWNQW7CMBBFrxJ53Ykcg3EaIdR7VMhypgO1sGPwJ
 FZVxN0xZPOl9xfv3QVT9sRiaO4iU/Hs01Sh+2gE/rrpTOB/Kgsl1U5uOgMU/L+zMVoMCS8W0zT
 nFAJltqUDov6kkFRnpBbVcc108n9v//dx5Uy3pWbm9RSRmN07MzT7tSI1nK8LouXYGy1tUVA0S
 DC9+lTjVo5Sb74Sc3tbXMAUY1vn8MqNjglej5+HpphWQsatOD4eT+UX+sXoAAAA
X-Change-ID: 20260317-eliza_mm_clock_controllers_v1-ee8f2ce21705
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfXyWZWjbabpK3v
 /IW74ElqVOeDG0xDvuMU5SvSL7AaHigSHELF4eaDWJHKj7kWZN6JuCv/V0z1wYhykAO294KGEvf
 i90XK6ysurIPdfMIanYK/kXIuWTfS2FNXwD6M4iXA4jiEQ+iTLq1DzooDjYpi7CADiFEEy4VzaC
 IyVTKuAiWOVXoOKR9ZlyZJcs609q1gOCtxS6KiQiJ0fahhnhPSRuhup6NwwiV3O4BfAUhNIgTjF
 O68TVc65EDKFcpdO+DhKm+7ViFbCcSPPf18ILQPGPOm50D8F12d+hiKHT4aomQql2I0uTu0sJ9w
 ErYLOaMInBZYfhYNncTjQ7Oan0IXGpAjVQWr34xLMdLNP+QcWgGAvd7h0S+gVMaPM1mfCjF5OA0
 5a+2FFF2R03q01ZyojLNsy7RQ5g5kWArMGP0j2qdCH9n3BHkkxsTHVtYtPHflS5q50vsfe5TvyM
 3LpVvA4+MOJ9SKooFrA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b98c04 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 6UJrPwKAPfb0nze9p4ZUUUaCg4R1zJDw
X-Proofpoint-GUID: 6UJrPwKAPfb0nze9p4ZUUUaCg4R1zJDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170152
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98241-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 285802AF61B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Dependency:
https://lore.kernel.org/lkml/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    5 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   16 +
 arch/arm64/configs/defconfig                       |    5 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  467 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2805 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  630 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4638 insertions(+)
---
base-commit: 34cb4f916af10153c87fabaf6c34e4cafa170427
change-id: 20260317-eliza_mm_clock_controllers_v1-ee8f2ce21705
prerequisite-message-id: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
prerequisite-patch-id: 6a8e7d82a3210a06ca00766dcb091d9ccb0ebc35
prerequisite-patch-id: 5705b420f0f4987aa8dad89118aa0c354c6a3d6d
prerequisite-patch-id: 8f7f73eb125f508dba66bf2373280048f62e44e3

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


