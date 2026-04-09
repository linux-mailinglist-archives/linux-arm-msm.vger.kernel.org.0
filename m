Return-Path: <linux-arm-msm+bounces-102526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFV2F9Lr12nnUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59853CE7A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DBF63006B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCE03C5DBE;
	Thu,  9 Apr 2026 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOv1WGiD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cxno2Sek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6D33E37D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758265; cv=none; b=jJx+4cG597hvWLwqI3XGB8WfEPvKMMq7fUPeWe5X/DBFNssMFKaNYrMx0G0EfTX4dUTBBy+MU/OxRtEm5BDImJ43wzNwacrzFRUMz6aYceD84k4QLDzKDyGEx1IWGHzJD0kHQ3eI74BMyU6wPRWGhw9hA3xZvpxkxtM05gp4ifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758265; c=relaxed/simple;
	bh=DcNNggxe3/4gvizHu0j9sZrhDu4v9aPRRQ+y/3tUjT0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AoipBsGi2/OKdDQe3PRJEPH3nJizDEKOBkMmZgnvexygKlQh8yx8hKJK5S8137T05BAW6ndwo2Jxil4IfnhXP3rNAnxTi0jLFBtRp+mbuu20txsX4hLYWyFyCqjdMCB1a0subLWBiMXKZZppc9dm7azgEg5V78LR1gyJGYzsUG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOv1WGiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cxno2Sek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CZT0m780153
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vYpYuC0n38W0nO+hluOO6j
	DvBMadgq+PwfBPn4EQ3kw=; b=oOv1WGiDKNP8CjOph4FPN5YWeLxm8jl8ZEPeHH
	NxDmx0A+301t04L2xXkKAdJ+5J0BE1bJvrlZPk2oNNcNkl9NdhY5sx96RJW8eDwI
	N0y+WxDQq3PtfXK1KKH+ffWlPPaLsE2aYb79UKSq8E8BrJCyKCb25Fg7w3ws6kHH
	pumfCHyQrszHMnvkp3HMkrA6A4U2X/AtsSiwnjVbolVYINyEdNTcDZoN3ZlN7uah
	D2/1VSFjAeHTtG+/90Xydm0G5cIyJc9/FAjArPJdpOfxBr0IudV6UEsdUdHsn21Y
	mAoa0AtQ6/4npULpXkMuepFBdpHlFC6Nxm85bSSJR9sa25zw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hsd3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:11:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76fdf996a1so733104a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758262; x=1776363062; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=Cxno2SekJG838nN7BOjlLvHGwmfLQQvkhlni+/i/ZtOevjcKRGiB4/ILlJy/u1KeBX
         Tti3VrUrvZ6CKPAe0WHbXRsKrPwvCEQL4ypSO/epTZ05pkGFXI+6IOb22zZx0JtJ3/Ef
         dWQS4ABea/SmDGlQHxXWbC7hSalZwRPqFaNcTA44zgLxXcKfixEP1hRtMpIgaqvT6hUU
         MKaAJFyzqEncYItfFTja/HUVxAzbaIqezk5x+s3a8HUBdIdZseRuyf0i2nIP4+knI2pX
         Xc1MEsjqpTP/dQ4FwlB2Oh3YD8+MrP7+iRhN6uhdpYDPSTKibOGSJ7V59n2+U/MTbk2X
         Tgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758262; x=1776363062;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYpYuC0n38W0nO+hluOO6jDvBMadgq+PwfBPn4EQ3kw=;
        b=N83gbZH6AoustPQ4K32o4oxPoA/mJKu54h8VRbl9+FUDp+7KN0fwlWWipNWjpRHDps
         4m1QQ6aJ3ZUvuh90u4YYFRqfGrYqtiG0qT/2WRSZSbXqfec/FscHAuMZyiwU9PPF7H0K
         fUBzkyOzMNVyoPR1yl5m8bPhFai+pWu8O25VPwPOBEEzISoTgFM1LhhjgH7PSnRnPomM
         KRnz3gFGbzVHq+CoOJeXOYspGyUQ/9H/8xI0v0Ljz8ov/K94e4gpOtc7WdW1t4dD8Mfw
         BucADbnfWesG+96e2Ym0x++K8mefZTAGRpWEMOU5QcEbWjSWxM10JlryUi5O608A+k4G
         pJFw==
X-Forwarded-Encrypted: i=1; AJvYcCXdCnq/h5VEjmqAl3UsdOo6/xK3hNPXvvs9zh2HxHYDoX8OsJmLI9xHopZrf0o9qjx/AeisvNWHwOJSXeHc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrv+FzU5a1cP9TQxCIObVf13xa618eSqeVk8x49a/z2miKrw9Y
	XBiIQNTf4k7TU+GeV82Xfggy2QGb0KvfMehBtsMO8LFuj8uQUWRDcIPpPQe4seuzuNicEdPKycp
	2zE+5UxG3RjaBxbwkTbLDnJpMWCOhveO7pujFu1QU5zntE6LH8H6XRXmzkUycfndSQKsW
X-Gm-Gg: AeBDievXJwAnnpMdWMX4UZUPPhf9PX01rkXng542R85EmLieMy5+L1jECyPvr4J5g9Q
	vlulT/WRo2aNSSDTc8z1GosRVGI8tGx9j99ET3ayQVpkdogHvkafGn+OmVy6RPXE56Ws3KcIO2z
	lJO8UQSHqPCYGXgO5HQqMHF+rD5RjqaXjgLIDCOhd8qIPft2mke3BYfshrXT94kaZ5HLCYEgE34
	wW7T5Epd+RSmbiKZU1CPYgRa5Ci6yntBCFBQNcmeZeRECdzx1IKdWiIqY891hEeBUzec0AmtJzi
	cmu2dC1W2x5x6O5uVfopqn5dv3EA6XkBV/FtezalLal4J2HgnTp7eBWBVJY8EgZ8lW62Hd2ByP8
	lOqQkNhGcy9+ETSIqhNSKTYMZOVgPZjelCYQPvWhYWJ/UaA==
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843579637.40.1775758262373;
        Thu, 09 Apr 2026 11:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:39b:fbb2:5e46 with SMTP id adf61e73a8af0-39f2f0968d0mr27843534637.40.1775758261702;
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Thu, 09 Apr 2026 23:40:41 +0530
Message-Id: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHr12kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3dSczKrE+Nzc+OTk+DIjXXMDw2Rjk5SUJHOTVCWgpoKi1LTMCrC
 B0bG1tQCG5W/qYAAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
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
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d7ebb7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 56MoNMcynS570VlLmUrun14_JrVxrFo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXyQZXtuhwGNqe
 CEUallDfFzt0oXDLGlmsgSO+lzNw002ta2Rx69o/YS+YZDzMCsB0wBQK051RauE8QBIjwuQTcGg
 Cl53AUVz2rqYQmI2g3HAqAAlJ+ypZ+HLM4OJ5xIA/WfswEUDHzcwyMy4pXdM2qM6PH9uyjq+ncF
 k9IEvSfBrjoDANO2zu0Q/vn8ZPB+BEhYKFMlxqiti0uIGQAlH6SsBzgeQZUE0lx0yu77MjWZbnH
 C4RqxaEPfX9qXDxwdzbO1DclkXfVZy6Yk5rK+S1PvlA9F4CZqe8IwibJJDVPM9VlTx1bfopsUt8
 ISFZhnH0kEhqfGoUh/KKTsrhjbmtWtfg2MCn5RmSdo+k3vsqtre5a4c7qapQGYSZ1hQsXK9WoNp
 G48IUk9MU3f/SM90cfPikNPQMKH8rNcGpbhu6m7hPB4tqjIS5ZDKMpm8i4XnYMgbcBgUPmAU9b8
 SkRnIqnhU99ayBpH71g==
X-Proofpoint-GUID: 56MoNMcynS570VlLmUrun14_JrVxrFo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102526-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B59853CE7A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,eliza-camcc.yaml           |   55 +
 .../bindings/clock/qcom,eliza-videocc.yaml         |   51 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   54 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  403 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4761 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


