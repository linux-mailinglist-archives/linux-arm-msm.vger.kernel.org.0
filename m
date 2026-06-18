Return-Path: <linux-arm-msm+bounces-113805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qWu0D4RpNGqoXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 862616A2D58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nLgJ5la1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QSm28An7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113805-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113805-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B5B03079AF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 21:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE47832E73E;
	Thu, 18 Jun 2026 21:55:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49032E7381
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:55:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819706; cv=none; b=SXuimQAGupDKdwUpCcnCJzfcclVvPHQVOgq0JHWYS1g30/ch4tdoI3QhpUxHia+mSqU1M9eM/qpdChg+xM4PupNncdXeErEO1UicUABRrsMHR0svKJVXbn0lt41l/nWSqfN71rjHYw19dnfzy2dbPYvIZkcbm6WP9/OE+PUSX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819706; c=relaxed/simple;
	bh=aBXWJ0r4or2tqJncgmtJelcxw20MKlf/BGJn+EVJx5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4BcQBvGo+jcwf+AyCL739RWlSSFFS8916BrcqMG13Er5nSOfWpcQ/+qTJvVfavtIRfOYAKtT4wi6CgaH5feVmiI1dAW5jywiklePH9zt1mn0sVNhQ/Ir2HeYYBU5bs8plXUw6ABXEmIpuH1doOvdpEBRjudqOQfxvyPp0Z7P5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLgJ5la1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSm28An7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILs7qI3056813
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0PhRt6Mj3x6ngV/f9g7/BRoB8MAV17hSd810xgm1ik=; b=nLgJ5la1NF1tZDhy
	9vhRWMSu1S7ygk+LQi0tppkBwjm+b3+eNyyq8i/VWh280r3aSpYTAeAixYMkFTEU
	BUMdTBgRa00oo02d6uAYQKoDgofj+nMdjWmZzZZJUeJvK8YrMGSYznP1gprBZ6aU
	QDeSFa2zTYmajX7ufH2X9g/+LP0ePl0lK/iqlUaUoAt0ENpJwt4Z3Y/T6YTe3K/F
	14bsWlA7HNk+6DFT6YDVt0SNQeV826lAqDD4I9KkyRlewvnx/foa7Q1qMh7XVwMx
	FI1/6P/Dx7lSL7tDMJJe8zAKsiCq/V4jH+gWIDUpmo5Bgtq025jJiIU/aOLw51dw
	EMbC0Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm229gax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:55:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcbb34e57so2314386eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819701; x=1782424501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0PhRt6Mj3x6ngV/f9g7/BRoB8MAV17hSd810xgm1ik=;
        b=QSm28An78qqrbPvEjDzXcWHx8eJHiB+IfHU3V6gQPK5hS5xGijhPp1AAf+R/AnQoJY
         3G7tHD1Gl4YPnbgWIM7+X2Sz4q9Lbmme0LWlOy4MV9/ISMFokoNdnZ3LjjhjZYVv/UNV
         b7t8aK4Pni5MeNxJob1pVS8KJH3lRsKfdljgrg9lnyVxqmvO/d9Q41nBPOADTC/oXLCt
         LZvJfMOz42piIEFhFtYIrAnS4SIwzuwUkXFetvJc6IQaG0wNGwn6TmaY8hzhBXeKbETW
         1Q7Bm/Iz1D004utGesPGcF76nNCpRnQq2CEE/caQez0EqBWjPku5+9s+7KsU7tegkzEj
         /2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819701; x=1782424501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0PhRt6Mj3x6ngV/f9g7/BRoB8MAV17hSd810xgm1ik=;
        b=TmYhyARWRgs0rY7UcsmmHXoNBkvmSk69jdcprk8YbmShJoGqTTi3w/W2+cAdW5fDgT
         Z2jv+Irr6U2vcLEGDb0Ky4i+fSARw5zWbe8Ax7ZFIoHrf8UFqvgYVJxrgCUL6zxtIDv7
         PZkhzMgkA0crEU+NatByE0rkIjq/ITOqIHxotC7hv0ymLA67ruOxLT8X3snzs3v4Il7T
         4Xo6CftMWoiyF1bQQQ3GehmfHqwnVl1CGhSZ/a4jk14kLCIOGdDAlDqSOpq/u7RP/XlJ
         Z+WMj6Jex8zCT6LBaVvrpUV0g4zQPeh1u2EYiPYU8EiFpuj7IVXJjCq3jsQojGP0BDZG
         jDmw==
X-Gm-Message-State: AOJu0YxgkhjH0KjeDSF43YhPz0x2JEiV5DUi4kLBa34yu40WST+KrUYC
	+UnGpTlRIsfWywUfUmUE2FnC+7SxknbxJbBXayxABQY1DS9kXEfbsWFEC3D/W1jzMK8WdIHD2rA
	jDqa4ZCJ3Y7w8zL8xLBpp5dMV892vUlHMrv2x+lsFuZ4Re0/C1XgK1wRu/4vPQSTAmSy1WtAgjV
	qt
X-Gm-Gg: AfdE7cnT3g9b38F+TWHYjPfHf804Hu7C7OzENM9dAJk+aTvsk8vlDewuT4W75MfXLy8
	fV1QKFbdGeIaeKjAezM+tJsbE9ZgAzkdkm+4bG812hT2voShdK2Q7sP5F47EUGz+afqEppsmTXO
	lM4rfCkLXwHYE/rq7e6dSgQIIwvK3MNH4vUNq+tGnJMRSEpJpjTrkwgB47IdtDvIxTGdF0GHHlV
	nDOl9opxYhLNyMu8xvAHIaiUz9hQrzIV+VvRmteoxwzWEprUa5cOAwGsEzot1j5kmBKTT4sWxvL
	a4mOv267lbgAPo8/Qrc9YiQ76PNP9YlPLy0vxJ0rMB2gvtOucR86SKapTKXRpo7v03/S1FZpv+R
	0RdMkGUS8db82t6i+CNME5XURPg9pQ+6y4AVwuPbIN41uOL0n
X-Received: by 2002:a05:7301:578c:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30c0702d47fmr965461eec.11.1781819700546;
        Thu, 18 Jun 2026 14:55:00 -0700 (PDT)
X-Received: by 2002:a05:7301:578c:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30c0702d47fmr965428eec.11.1781819699972;
        Thu, 18 Jun 2026 14:54:59 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:59 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 21:54:39 +0000
Subject: [PATCH v3 4/4] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-phy-pcie-v3-4-3fa42ca45ea4@oss.qualcomm.com>
References: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=21800;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=aBXWJ0r4or2tqJncgmtJelcxw20MKlf/BGJn+EVJx5I=;
 b=lFOo+RBu9IlZqUXiAdPYbIimZFg8p05py9+j7JQOkhVP8q/BjhfRD5a50YYrkPT1xm5f9N3nb
 EAlDo8I4/H+CGCx5Y81GWTLOnCRTXx2nAPX3LegvgxkYx7cNCaeHZ9z
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a346935 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0NEZ95bNQYYi-I2mXMoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gxmmlnMkpitq0r6TDTl6fzDmMh-4O1jG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX5Yu3PJonmbVH
 DUkOPALgcFwc5prQfl5vlJfOelkIVq57CMfg/GOtWkO90PMfknjFd3DulG/0jWm0Joi1mNSnyCU
 srpRlkv+94Kx32ydkdB9dDgL+P/j0ZA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX5MQssb1Cdf1O
 JtexQ5LGmlWnhEgyISbHeV0CfdzggyesCzibpc5D+8Ktzzw5d1+wnp5QY+94ZaTPvVx8LOcP7s9
 Qhe19iDzOolkUNawJx7SDytJ0VCyDvzVa+6cGSN3GGudKpgnz1hkmQTK4o7f6+L5GQ2yDf6RKry
 LPzRkfO9mt8+7kFZIGQwQnxuySrgtqgM6FhV1W+F37IMUESHolWE3VqEwHkybZoUvzh+sgn5JGH
 Nzt2DEiymgPl+SeWfoyJnqytXJwzJ4uYI2gs3ugRBMbav5P1UoLR10RtM3hzpVk787ptlecD25Q
 1JNtWWv/yAYk8xtHHFQkstcichCO8NF5/Q1b2trnOK6DD4Os39NUMv7sjKHCehn2Ko4UWBeQjKh
 vko0GQtKBrsQus+94Pjwe54hpl/jWEP8DUy3hE4C+eWNhjQ2GY+bt03HGNpEAtphexdrelm7g5+
 a2mk/4L/TXmKX8rB1pQ==
X-Proofpoint-ORIG-GUID: gxmmlnMkpitq0r6TDTl6fzDmMh-4O1jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113805-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 862616A2D58

Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
the Hawi platform.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 373 +++++++++++++++++++++++++++++++
 1 file changed, 373 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fb66e2a97ce0..ca3a5d974422 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -118,6 +118,20 @@ static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v10_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V10_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V10_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V10_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V10_PCS_POWER_DOWN_CONTROL,
+};
+
+static const unsigned int pciephy_v10_60_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V10_60_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V10_60_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V10_60_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V10_60_PCS_POWER_DOWN_CONTROL,
+};
+
 static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -3222,6 +3236,287 @@ static const struct qmp_phy_init_tbl kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl[] =
 	QMP_PHY_INIT_CFG(QPHY_PCIE_V8_PCS_POWER_STATE_CONFIG6, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_ADDITIONAL_MISC_3, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_COM_CORE_CLK_EN, 0xa0),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_GM_CAL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH2, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_HIGH4, 0xec),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH2, 0x49),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH3, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_HIGH4, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_01_LOW, 0xd1),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH2, 0x49),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH3, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_HIGH4, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_MODE_10_LOW, 0xd1),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_TX_ADAPT_PRE_THRESH1, 0x3e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_TX_ADAPT_PRE_THRESH2, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_TX_ADAPT_POST_THRESH, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_VGA_CAL_CNTRL2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CNTRL, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_3, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_LANE_MODE_5, 0x7d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_PI_QEC_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V10_TX_RES_CODE_LANE_OFFSET_TX, 0x14),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_REFGEN_REQ_CONFIG1, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RX_SIGDET_LVL, 0x77),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_RATE_SLEW_CNTRL1, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_EQ_CONFIG2, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_PCS_TX_RX_CONFIG, 0x8c),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(QPHY_V10_PCS_G3S2_PRE_GAIN, 0x2e),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen3x2_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_EQ_CONFIG1, 0x1e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG6, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_PCS_OSC_DTCT_ACTIONS, 0x00),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP_EN, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_LOCK_CMP_CFG, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CORE_CLK_EN, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CMN_MISC1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_CMN_MODE, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_VCO_DC_LEVEL_CTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_COM_PLL_SPARE_FOR_ECO, 0x02),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_TX, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RES_CODE_LANE_OFFSET_RX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CAL_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CAL_TRIM, 0x66),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_TX_BAND0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_TX_BAND1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SEL_10B_8B, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SEL_20B_10B, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE3, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EQ_RCF_CTRL_RATE4, 0x22),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_PHPRE_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE2, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE3, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CTRL4, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SVS_MODE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RXCLK_DIV2_CTRL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_BAND_CTRL0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_TERM_BW_CTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE3, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_FO_GAIN_RATE4, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_SO_GAIN_RATE4, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_UCDR_PI_CONTROLS, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE3, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_AUXDATA_BIN_RATE4, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_EOM_MAX_ERR_LIMIT_MSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_VGA_CAL_MAN_VAL, 0x8e),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_GM_CAL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_EQU_ADAPTOR_CNTRL6, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_ENABLES, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_CNTRL, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_LVL, 0x84),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_SIGDET_DEGLITCH_CNTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE32, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_Q_PI_INTRINSIC_BIAS_RATE45, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B0, 0xc2),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B1, 0xc2),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B2, 0xd8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B3, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B4, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B6, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B8, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B9, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE_0_1_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B2, 0xd8),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B3, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B4, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B6, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B8, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B9, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE2_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B0, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B1, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B2, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B3, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B4, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B5, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B6, 0x4c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B8, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B9, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE3_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B2, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B3, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B5, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B6, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B7, 0x86),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B8, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B9, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_RX_MODE_RATE4_SA_B10, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_LANE_MODE_1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_LANE_MODE_2, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V10_60_TXRX_LANE_MODE_3, 0x00),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_G12S1_TXDEEMPH_M6DB, 0x17),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_G3S2_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_RX_SIGDET_LVL, 0xcc),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_ELECIDLE_DLY_SEL, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_PCS_TX_RX_CONFIG1, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_PCS_TX_RX_CONFIG2, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_EQ_CONFIG4, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V10_60_PCS_EQ_CONFIG5, 0x22),
+};
+
+static const struct qmp_phy_init_tbl hawi_qmp_gen4x1_pcie_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG2, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG, 0xc0),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_ENDPOINT_REFCLK_DRIVE, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_EQ_CONFIG1, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G3_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_RXEQEVAL_TIME, 0x27),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_EQ_CONFIG5, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_PRE_GAIN, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG3, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_RX_MARGINING_CONFIG5, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G3_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_G4_FOM_EQ_CONFIG5, 0xf2),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V10_60_PCS_POWER_STATE_CONFIG6, 0x1f),
+};
+
 struct qmp_pcie_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -3534,6 +3829,24 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
 	.txrxz      = 0xd000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v10_0 = {
+	.serdes		= 0x0000,
+	.pcs		= 0x0400,
+	.pcs_misc	= 0x0800,
+	.tx		= 0x1000,
+	.rx		= 0x1200,
+	.tx2		= 0x1800,
+	.rx2		= 0x1a00,
+};
+
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v10_60 = {
+	.tx		= 0x0000,
+	/* no .rx; tx and rx share the same register block */
+	.serdes		= 0x1000,
+	.pcs		= 0x1400,
+	.pcs_misc	= 0x1800,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -4650,6 +4963,60 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg hawi_qmp_gen3x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v10_0,
+
+	.tbls = {
+		.serdes			= hawi_qmp_gen3x2_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_serdes_tbl),
+		.tx			= hawi_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_tx_tbl),
+		.rx			= hawi_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num			= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_rx_tbl),
+		.pcs			= hawi_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_misc		= hawi_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(hawi_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v10_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
+static const struct qmp_phy_cfg hawi_qmp_gen4x1_pciephy_cfg = {
+	.lanes = 1,
+
+	.offsets		= &qmp_pcie_offsets_v10_60,
+
+	.tbls = {
+		.serdes			= hawi_qmp_gen4x1_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_serdes_tbl),
+		.tx			= hawi_qmp_gen4x1_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_tx_tbl),
+		.pcs			= hawi_qmp_gen4x1_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_pcs_tbl),
+		.pcs_misc		= hawi_qmp_gen4x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(hawi_qmp_gen4x1_pcie_pcs_misc_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v10_60_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5406,6 +5773,12 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,hawi-qmp-gen3x2-pcie-phy",
+		.data = &hawi_qmp_gen3x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,hawi-qmp-gen4x1-pcie-phy",
+		.data = &hawi_qmp_gen4x1_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1


