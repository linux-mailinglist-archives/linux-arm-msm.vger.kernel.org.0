Return-Path: <linux-arm-msm+bounces-89800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E7D3C5A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AC25761FFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3692738F93F;
	Tue, 20 Jan 2026 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/bLsQkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaLte5nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AF43E8C79
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905208; cv=none; b=iNWmC87CQZxvDgv6c5dMhZICLeDxiR0vMyZc6ubtO9K44sZNfte/KMoYfRfH3WSoI+Gv49NFp9rFETA6oVi1srl33EE3cHFBylnQ7UEbNL3b9kV9kJrL6WjTdY1Pgj9aTtwy6s8Oy+PlnWC+iRE+lVrI28Q37lHWTLE0P+Lbm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905208; c=relaxed/simple;
	bh=iJYPfbsaVRJLjJF6ouY7r1QpOGnx5V6e5FYaMLRBpGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U+BlbyXwgpgZRrhfW0mcp+MgRlituKYedQc11tG8xEGdUZqQwwncYzCWBF8lwM6AWV6UOl8lYr4MEmywVWsifMth/75OD/HagryUndAgVkiLcksnCB+K7nk7Q+ND9UBiUt0yCz489+5RzbDpYtVUSunOEV68DPNWm5pYwsujBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/bLsQkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaLte5nl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KA7iYE3837141
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=chAWrisEFvUfO+2YxDyxtwyJsoSPhEtK4VC
	X6IwXaY8=; b=K/bLsQkVhB99uaDsdCzwpKc4U6EPHrKEEVsQrt2OgVxlrqrE/NT
	nxPGvkK9/X31OosKlxFchFeWiixLqmroCGxZNoP6mR1mIw9Ucpkqxub8qyQSwQru
	0mAEbGTArqBksxwVFNtULUNzdsCZgYxFnNPCsFeOqZ8e4sYfO0wLzTlmZZzxEV33
	lGey30sCadSXlO1i25EaNIhPqF/72s0DlfXCST30xoZhpEO8LvJxQtO4GJgkRoMc
	7YKLjj9/7dEKWe6j2V9XoW9Nih/vSJXbU6Ir3NsCnf2YDWknSsqF5ZJ/er9F9uDb
	mjzSh2+XTsdn8nMc9HI4a/6VrNhwh9uwsvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt7pb828b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c52d37d346dso2706821a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768905205; x=1769510005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chAWrisEFvUfO+2YxDyxtwyJsoSPhEtK4VCX6IwXaY8=;
        b=iaLte5nld8W7XjkQzQleWNbCgR8nJZ1ptrgF2BDq5lmDl/RSzcO/erL4TZRGoIoMrM
         dnzPVQh7JvgFMI3US8HmpA/IU9zULFMyJaPxPKVOe0nrctqjHJdongIPUUKlGtCtgbpo
         tN36SZ7EJ+wgjnR80/XZ7JEyNH1PUoX5MVxmEM06fNJieB9bK12OZgHPlDGyGGlEFq++
         PTsADZPKKCZ9J5Sat1eYDTjRoQO5dCn3vG6rSNvVJOVTYzaHOziiqxjf3PX8YyZKg/N1
         hl5hsM6EQin9o60QWZ4SB6f4iwRv59nZgnP+KFgWtrpMrLt58XtXfKGKg6rZx+SzbZ8v
         jRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905205; x=1769510005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chAWrisEFvUfO+2YxDyxtwyJsoSPhEtK4VCX6IwXaY8=;
        b=iQfhK5T4Vo92Aspu5OOm4oIGf1ok3Igc/Ga1DmbXl8qd/o4l/xXdRgkUOkomvefGzU
         njcDFnsL5sTrnLaTaepx0Cjn0ifR3Gz9WSZweY7oU54J8VHUF7DfPBm95XRF30Si1ZcC
         GF9Tn83YYrzaG+R2Acxno93iqu0YUDv/fIZikhzxEeSEL38ltRBQMaXt5hZR+r90ORd+
         KvMI43DVgSL6ta/HOSMm82UYkbzjx9AOAuPePIQzHu0lFF5LDfKP+YqCW/fhkDb7Zx+p
         D/blLJSTN1PjR7WdKF77noeI1HtQEnxUjWeDW57xVXk12WQJkfuysFZC77B4nOiEsdg0
         WmPw==
X-Forwarded-Encrypted: i=1; AJvYcCUlQMJpZf+wTlwO/TF02k29EqLkIMoCyyopSZAsTsUWhU6B8lZ2ne2sLKmfqg7pj9RhUITxfx6PP5WbHbNk@vger.kernel.org
X-Gm-Message-State: AOJu0YwKx76RHTge5Pw2Vw8jwx0r9gzPPrq86Azs1F9H0mCx6x10Tukl
	uFxejahGoHN6tuwoK1e7ktfm59Kvbc9xW2Np0iddxAnNbHYi2CE044SXR6hYHeyxoqmSvfokffL
	OtCC+iGZ373DsoHWDsntx2ytA62Fsdxjz9uBipRPMp1suhwMRaAdpxjelg4Q2xtw14kw6
X-Gm-Gg: AY/fxX4hCeWLQhnGDvQaSfpbCEnwU9EQMUQ7G4VsOm4CeaoYWvRHO/ogHaM0gzAOTOm
	03EhXXlgTnboSdzO5/YQsd8Okj/S/8auDiD6qpQTUgb0DH5J6R4Fm1jADga5xXYOFxiycwhxaxH
	HFnyOMxmdl4yjCFonC1vicRmdwKdT89aavVNhmP1g8XW6v23dpBHEbFxIpCkBtejFq9W7pICNDa
	IMDXE3BXc/ayw3GX3iwg8neWzhZrXlq5z7H9gjmyhbYZxFNugU7fXtje3a1ahp+VOASguXYyA5C
	jpmZ0ap/I31U4cNuXsWngaw7h0ySOyV52nsNDxZT+vcjL+gUTqBCT+pxb/4xElRr1ggcZRfZIUy
	rHJTmxJUGVq1DmNB6kOwdPNazANH3VlOnZEp2ZPOVILQ=
X-Received: by 2002:a05:6a21:6112:b0:38d:eeca:b34a with SMTP id adf61e73a8af0-38e45e2d811mr1404061637.52.1768905205085;
        Tue, 20 Jan 2026 02:33:25 -0800 (PST)
X-Received: by 2002:a05:6a21:6112:b0:38d:eeca:b34a with SMTP id adf61e73a8af0-38e45e2d811mr1404046637.52.1768905204571;
        Tue, 20 Jan 2026 02:33:24 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf3791e5sm10050709a12.31.2026.01.20.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:33:24 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Enable secondary USB controller in host mode
Date: Tue, 20 Jan 2026 16:03:08 +0530
Message-Id: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMwqHCaB c=1 sm=1 tr=0 ts=696f59f5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BbGdbhBj7xDDEJ_r43wA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: DCzIzo-JckLeUU0Ca9PyhtG4l_K6QcmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX62mylyG1/Stb
 S03/2WVMaBkzgBZ5tG3Z6mPZT+OHVR0wD6WxDZV8JBP58WTNlP+5YfxaMPreLEzmJ4Xd8GX3l7g
 4KFNlYm1JYO657uL/Vhk9EqDPmwH7V+Y/lCfLZ/aJqF+l4VywYI9JuqU9TSXpvVvmKGc5S8JZJv
 V5/zgxqt8NegqQeANREKOVqMzYOKn4qMFVQc+kz5CCVWqgKnado1C418DLJ2z0PUjHTpS32FJRX
 1bG3bpzz8Pf1q3Nad8RIh+flpnAdc+2N2kgSKkFai9Sh5V3AB8Q5A9acf+hM1K31FeK3pPPSNjL
 IdxBuRJ0yDNztSzU2MWTCcUGz2ZenDkGf+W5ScoKejDkaaYvhANBNloCQoS4mPdUo8AwzF6Ibw9
 uWpsPdtrSZUfVJsHB6YWonqyHB6TQ/CJcLr4VPFY3qmNco6Z7v51F/StnBJ0XaMBY/s2HNG1hDn
 istphLJpwGI4zOyY3xA==
X-Proofpoint-ORIG-GUID: DCzIzo-JckLeUU0Ca9PyhtG4l_K6QcmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086

Enable secondary USB controller in host mode on lemans EVK platforms.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/

Swati Agarwal (4):
  dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
  usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 .../bindings/usb/genesys,gl850g.yaml          |  17 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 217 +++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.c            |   1 +
 drivers/usb/misc/onboard_usb_dev.h            |   8 +
 4 files changed, 239 insertions(+), 4 deletions(-)

-- 
2.34.1


