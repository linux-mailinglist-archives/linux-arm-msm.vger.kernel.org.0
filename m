Return-Path: <linux-arm-msm+bounces-107375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKxBLkSdBGr3LwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:48:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D0536741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 191DD30344F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B37638E8DA;
	Wed, 13 May 2026 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvpdaSqD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABTcZvlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC7540DFA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686073; cv=none; b=RZG1TkvGA/MKofsaWDsUASzuLv+xV+2Xn0Tk2kQBQ/pywXM67m3SEZpfj5SlJQXgyi68dKcRueygRJQVHuZaW1QESVAuMVp70a486aQayLm0ECYZ10RPC2UDnZZ6X8UNae/r2vb2a5ZJjrBiLN1Q0SZmk7f04ZmE8UDI0Lmcq5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686073; c=relaxed/simple;
	bh=xW5eze9G538c9pLng86D7qiRJfzInYX8HsnIET2Obnw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TiyidwU+UBf8w0fWXUm/CTWU1WqwXkeNWdV6sf5ejYNI8BqysuAzpuWPfM+ujnaP2vk7+LTlxwh2O1kWwo+NKBAeAyIE8VcdHhlk/5mh57DwwCyFnzc1G+cHJ0tsO5DNgfJ9qBHNR2MNhcb1FU91WdJoveyMCi5ZLRLt51QarHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvpdaSqD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABTcZvlH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DC4gZr3324691
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PLRVRXYe5uxCYuxI2XGDi5
	MFd0LhFIIf1w7B7feNGuY=; b=SvpdaSqDEuf58NMSIVLGrh34lNxh9ggqfW0V08
	eCMylx2jLky9u1WwsE14Pr2E+uXUSDkZoF2A4dumhbT5RQ5jlQhmq/KnIpz46Fvw
	welp096pKenb0K2VikdluhG3C7oOi20KC4FF/BU+YLPaBy9QxTtq20kcYNJfLngt
	i6iXfv9R1QC+pEr60/jV+YWCQFXm94wg9kiSUjYARn1Ril2jdzqnNTXFr0Ous9+K
	mWotc6Wnvb+r2j6XTz5s7DhpTPANGFUD269YjCLaCrIK7a6VjEfq5CHrSVz0tdej
	vWb6s2hVa0xjypgDGJ/p1/iE5uY8ITRfojaucXR95ZK+VdUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvda5q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:27:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso75240545ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686069; x=1779290869; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
        b=ABTcZvlH4UUqSFtl24sbmt9GBPrb64HX8q5YTXWxmwCUbUfGHqh1b5ZM0u5EUfpk35
         xoPxv2pjIIia8cFKQi6s4r5FTfDeW+61IFTmaEYuarRb8GpcplXmObX2o6v7LWXDVrnd
         ryTiecHeGzLwD/p2oiAIL8yuF77TOizn8PaM1h59PcWnUJfMyxI1WYxsZB86zMCpUDFm
         ZquRtHfm4Ys1CqMeJE/OeZTW/n37OZgMxX7VhKRkYZI4eEf5Hb77d07/K78WxNcg/hBC
         IIo5Q2FoJS9O65VEg8cl/X8OgdVElKG6htaOfkJB6px676AO4SKxmWVlOSQJM4gDNBZ5
         MdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686069; x=1779290869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
        b=Y/XtLvPu3xpJJ9a1piN1AQfl3Kp7BtkWtvZ0PFoSkSoQU90ok7v37u4oC6x+DWvMre
         jFuC+3HswoIrDmOFjQaPLuXHgNCfNIeIkkTk6LVNoYxd4PZSn+CJxJGUZnkLp4RNfSML
         CAqu9C7bpY8PK0dYY5YImnxAZwr3GgiuCM5ruQ6cscFAwOq0B2kx0PQdV9O3Uy709TFI
         55GJyKwDiZxqwih7rbBjGgyHPiIQRwD8zkl8OcQZITI80Q4planWMpPYx8m2Gy+G+cRK
         K3PupPGkeCMsRbgtDgd9XcWE7yhHj5wPV3TjuW/N631FjlYQ/Qe27l7SW1TYhpsgATGi
         5CYw==
X-Forwarded-Encrypted: i=1; AFNElJ+FvqVlbras7dW45b3ahqdJjcRpfOcB36gw69ODkL60P3VMpvp9eWg3BuUMViRUfuDWRr1B9ip/A3Drv1AX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8nVrXCrhGze4WriyQ2aAMKP+iHQQ/A3z83zfnawatpP/9/wYI
	qsFT2lFyQQc6OzBUxNLnXJYe30lr6nzIw360XY8tMK/fdT1Vph293bWyeR4RXk0zM5IDdV4sOof
	sLPnLgaGZOnK4iZ+rYIop7Oknz6xjnHihlq6fFi/EhPRi3pV9uKy7pvXs1oFdGsxg1uJr
X-Gm-Gg: Acq92OHwsB8B0NrVC9yvCu3bYWC0B4o1VVi2ksg5BoQ5LZOusu4DO20gSV+wDV5pE7S
	JLgyTKlV9i6Ie81EFJkA2LwGxpfSHMF31/VjYzea8Xg/XvjLvxdLBRj/ZE2kp19BUhU16hyaeYr
	ouK6oUDi8GqK+w7foGGGk8UhUJgZR/wRnZVHTqM6rxbtqNaciqyX4qCdaBCKxGoTjinFgql6xV5
	Vi9ldg3AwzxUsH8KAh9Kc7QOxmnXqwY9f9im3S1NojeEbBdfulbgORHyebtstZMMu8ehsTvgqcU
	GAFQ+nL8EuAeuVfayEeUcjHTV1Y8XjcOAQX5wahI6/ENus0XZVCngN7uW97zKCEV9cbfNHldNfU
	qGQyurzgCUb4ZnuHW/ezGfT0sz03BnWCNG2qETwhadvXW1Q==
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2bd3032f9a5mr37432225ad.36.1778686069430;
        Wed, 13 May 2026 08:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2bd3032f9a5mr37431695ad.36.1778686068872;
        Wed, 13 May 2026 08:27:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:27:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Wed, 13 May 2026 20:57:35 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeYBGoC/3XMUQuCMBDA8a8ie24yt+myp75HhOht5YFztdWox
 O/e9KWHCo6D/8H9JhKMRxPILpuINxEDujGF3GQE+nY8G4o6NeGMV0yympoBX21jbQPQRE4VK0B
 IrTslDUlPF29O+FjBwzF1j+Hm/HP1I1+uf6k0jHbAoNJaqQ7KvQshv97bAZy1eVpkEaP4KGUhv
 hSxKGUNQjENfFv8UOZ5fgOZ6B+O+QAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: ip8aiOf6pz32AejWsedgGddE9fGVZ2X0
X-Proofpoint-ORIG-GUID: ip8aiOf6pz32AejWsedgGddE9fGVZ2X0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX3DqpKP66DZOI
 9HqqZ+YYTb24J3DZdrtXKmUAik3l6D7JXhZqcQ3TMoZQCl9uv4rwF4lVeIh5GoRUzwMM5CcWGzm
 RS9hjsKMu5yL63Xyz04Ych65aAGDF1jBOB+k3ZuHSgmQ5XG22znQWM3KPc5f9oQcujsjwl5k8UE
 pviJetTbfbiak9pZvlXyBQXIo90HxjVHOFqN55nakb0IJHCUsD1c3A7sWdtH+0hnVssW4xEj4Zx
 6cwrm8adD1snAgg6U/d3FO6S6hiEhB2WqSvaAItqblATLS5UvHi5r/FHTZhtd6RVGoEr/Egtxis
 mGjFW69D76S7XyTQl1jROvoZnkI7xazzAL00kzS+zGrcW+mGaL9Yo9Ilo0Fnb/E0QMVFW3rYG2G
 VWHhw3jJENpYl2nSlBxecK4AeRmHpD4csP7ZeTrTtkK8/QVSxU5J9MC5RXaQmM9aU2Y4o7Nn4UJ
 e2cPd5/afDP2ngN8Dcg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a049876 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-Rspamd-Queue-Id: 381D0536741
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107375-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


