Return-Path: <linux-arm-msm+bounces-102873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJnlALWM3GkhSwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:27:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4F3E7C18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AF54300443D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01A2391853;
	Mon, 13 Apr 2026 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwrRp50v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grb1ZnzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231A389111
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061581; cv=none; b=PV/zud+wrO4/2S3OQupEycbGKLvwUCoBX7+U8gcjrpK1v7WGITx7oZwYplgTXrNZml9bPc7SgkIQdkSHOCPihA+MvaBR98B7+dhoS+dpsGlr7NsF2sNPe5pGGcbajwXiIs9qj4clfK5hfsYpn4PECsB9kQp920P7xNKS+pwPo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061581; c=relaxed/simple;
	bh=Bp5Zz9OAjaPM/NWNLYQwMkODCFblbcKCNjR4M7lIWIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RZa/IgO6aOnSKdIsBZnof0cR1ndIP2eiSzgk8SeGKFCEZzdpv1dFnw1T/4LzyvlitD4cF6D6QT3ajHA64SimoqNKbv1WL4JisbhguF1TImuWmWk+aBst/YRw0t999ukuYgvkOk1vbethwP9ywamX06GZCdV+OBfEf8eQsNARPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwrRp50v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grb1ZnzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CK0SHS3502347
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AWGCmR8aJAExtEtpb9rmjD
	wl/rMkwNi772UTCaZg3p0=; b=NwrRp50v+ssZCi01RvcEQ8aWl7J+ZQ++xtbBzD
	I9j+zqMVB9WqMKG1hBvgnZyXOsKbsJygGJodgFTY+yL8ALYDBg8YlQ4ww6NqZl5e
	GzceiQvZzisabjbprH0F1R6G9QOxYk1/rY7veS89qGYSe3ltK+bSl6qGdkKYILPS
	ZQs3nbqv4/cFwp4VrlgU6L2f0r8fNsL7ylk9/HhH1tWcDIxYR8Wc6jubw7VYh4LU
	d5o2lWyL0VndwnVyJ7PIR8q8uRgYxHsCpH1O9XV46u2kpw9vRJLhje5101ItNmYG
	dUGOPeDgWZfcnlpDgOiHYLTl8sK99pYDZiHc6NRuNTZt/pSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpbr8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2cc75e79b97so14519918eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061579; x=1776666379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWGCmR8aJAExtEtpb9rmjDwl/rMkwNi772UTCaZg3p0=;
        b=grb1ZnzASTfX/i1UoyJiFEtSWNk5y+lDgm2Uemeq3bRds0Gl3HMskAHjJVvQOYNvIP
         BVQ/SZ25cZBV49iAah45hstMp2WPIIo5vyymJgTpbG/fijZnhuLNrkbZClCfAl3Jt6/I
         BmbVK/MOcpBaLRRIhEeKSH8k/AfiZP2ESY4G4QqBnpuRkYe8j/r0fwlWC4ZhT0fta29s
         3Oqvvf/AfUVi27jrAKpa3wUXBHMXpGLYXF/wUfYHvxXj40o6EC7qD8s9VuQZ+p1phXfF
         9eQ1lF/jXI8qeUtQcrXQjpbNofmWxp0hW+ima5BCo2RC+zS6P8vl1ZZmm0OtEDpsUE0j
         o0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061579; x=1776666379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWGCmR8aJAExtEtpb9rmjDwl/rMkwNi772UTCaZg3p0=;
        b=cmc+hCsnSEIgjPRBiV77EltikGMZ76UEw0xElcAYh3uk5Ae96u5pTtyThChlLRf3YN
         zIp0mx2fMggc1i2qrD9P4mDpG5J+kCwVoiI1z4IBTrrg3i875Op/DQbz/0cJcYHwSXOu
         TGENBQm1j/WU6UTIHxVwi8ne6Q5Utu0pLZF+L40I3FNtm0bMBup2dQ1aUDDe6ZEyVfGW
         HP/vspqjuPZMKi5Q3zQZN4iihFK/UKmrWIfvDrbICEVaMQcA3mQkMgWEEOvvyCMiN22j
         1YmoINvNJySi4nJAS2Xd8oAWd3GZZOq+UCFA0MJl1FXLoZGZAteDcQHV2Y392O1aQUvo
         7RDg==
X-Gm-Message-State: AOJu0YwFMC4OpEgTsznzWCiu59QJZ57i9rG8+Oo2wN/9kBe2ivMrHSai
	c1BpIwqUc01TcTc0Mw5PwFCBdxf2pcSNvyKNjLPrz2h+VFAhXbATBZX9eJCe93HX8DLvSyicm8R
	VLzGA9xyTEDY4EsHUeJtgld0GXtjnjpX4x1uxM9GpSGdKoyX+LNolebBCjAfRW0VoMym2
X-Gm-Gg: AeBDietxj2d1BaGbfIWXQc4zusxtb/BWJ7JjK+aHa/wzfg64B64MzKbM8LbhcfwMqi/
	Q9zJNvlCKP+1LFQDcEQVEWXmCpNTPkcQ+QEYh/jctXc0r+enP/BKPn+jhJsLRocwc5I8UZRSfmP
	pnSB/CCX/4EAeqBcbvqOPAwjI/NlKEYmfGQkvJIainL1P+bXXh2NdSX4MTJ0zZ2Zo8rgKNUyyDe
	bDY2i/L0+BWhit1DMtPm1ITKHQicTSmqp8I3COkomIJMzWORUYP+/K/Yaw93dF6dR6M6dduHy35
	LKDyR1bRq6JiJEJOy3A5n+7kxKkmzSqhrKq092b4WVzz5hC0awEtPsItJUqrxX62r3g8si+uGTu
	xe7Lesm7JzmlA597q7bamitr3ise6nPSCJGEPF3Yb7ka9UEyrNUvJ2h74rJWiUoeWLL4A
X-Received: by 2002:a05:7300:8607:b0:2d4:afb3:7aeb with SMTP id 5a478bee46e88-2d58a19749amr5883486eec.27.1776061579129;
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
X-Received: by 2002:a05:7300:8607:b0:2d4:afb3:7aeb with SMTP id 5a478bee46e88-2d58a19749amr5883476eec.27.1776061578573;
        Sun, 12 Apr 2026 23:26:18 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:18 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane
 bifurcation support for Glymur
Date: Sun, 12 Apr 2026 23:25:55 -0700
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSM3GkC/x2MWwqAIBAArxL7nVBu76tESORmC2WhFEZ096TPG
 Zh5wJNj8tAlDzi62PNuI2CawLSM1pBgHRlkJqusyKUw672dThmyZWjUsdwqahS11ohTW6Iea4j
 x4Wjm8I/74X0/2QFFm2gAAAA=
X-Change-ID: 20260412-glymur_gen5x8_phy_0413-7dd33c953da7
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=3157;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Bp5Zz9OAjaPM/NWNLYQwMkODCFblbcKCNjR4M7lIWIw=;
 b=GrDMInn2G/ze720Ld5pMb115eVq4lhJxVmCJqWG/qScsXUB7uOYNRTdpM3yFhWzwONT9Ui7hU
 VHWIWSHkAn8AjzrJjH1sbMUBwcpjFGi0ZHkDTXhFEZ5AOF+PUGjTStq
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dc8c8b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eou8XWEe3vdVWCyqOSsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: hY0tc9Oadlk720b4lyBNVWhNp8vyQAg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfXzn1dItMAPeVM
 v7aQ+qcVNWTX7IytuXcBbdwQG06U3gC8K1Hd+kbgM/y9cYM4uKZkjWa4vPlypS4lyKGQUFIDyw5
 qSEkr257j9ipfLiMygcLALQVLKYCJxjDv3cb0sLQVL98a4dg6sEf/5FOZi3YxAciSatkXNoiOeh
 XdQY9+WERcup4qYkR1jTmBuR5ZO81Z4TNR/AIrGHpxaeko0Fr5wgN9Drd24f5TDdZvNUJnyeB0C
 0L2tDflvUH8tkcf05LKm1qOY5hSjZnnTubMAnoRPNuIXl1kAqoDxePNjRTlSrlT2HAQ7tL4bPQH
 C5oDtqbBF2ljKaD+B6q1iK4/41rXWiv40icvWam6T/SFbdPa9aue+vW2CGyyzkPHT0WH51MY3Sm
 4TpKD7WxP2jVNYTdmHBufG1y0KiHwGjBfEz/p+aOrzqv/BsBrQ6GOCCwWOl8+z0FQLio/jzDIxd
 PXaJctMuNRpZdEg7pHw==
X-Proofpoint-GUID: hY0tc9Oadlk720b4lyBNVWhNp8vyQAg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102873-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FA4F3E7C18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
Gen5 interface.

To support 8-lanes mode, this patch series add multiple power domain and
multi nocsr reset infrastructure as the hardware programming guide
specifies a strict initialization sequence for bifurcation mode that
requires coordinated multi-PHY resource management:

1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (phy_b_aux)
4. Poll for PHY ready status

Changes Overview:

Patch 1: Updates dt-bindings to add qcom,glymur-qmp-gen5x8-pcie-phy
compatible string with proper validation rules for the unique clock
sequence and multiple power domains/resets required for bifurcation mode.

Patch 2: Extends the QMP PCIe driver to support multiple power domains
using devm_pm_domain_attach_list() and enables runtime PM for proper power
domain control during phy_power_on/phy_power_off operations.

Patch 3: Adds infrastructure for handling multiple nocsr resets by
introducing num_nocsr_resets and nocsr_reset_list fields to qmp_phy_cfg,
allowing the driver to manage arrays of nocsr resets using
reset_control_bulk APIs.

Patch 4: Implements the complete Gen5 8-lane configuration for Glymur by
adding the glymur_qmp_gen5x8_pciephy_cfg with proper reset lists, clock
configuration.

Patch 5: Add PCIe3a device tree node and required system resources in
glymur.dtsi. PCIe3a slot is not present on Glymur CRD, so there is no
changes to glymur-crd.dts.

Changes in v3:
- Add description of each power-domain.
- Add 64bit prefetchable memory range required by some EPs eg. AI100 ultra.
- Move PCIe3a after PCIe3b and move PCIe3a PHY before PCIe3b PHY.
- Link to v2: https://lore.kernel.org/all/20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com/

Changes in v2:
- Remove pd_list from qmp_pcie struct as it is not used in phy driver.
- align clk-names on "
- Link to v1: https://lore.kernel.org/all/20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add support for glymur Gen5 x8 bifurcation mode
      phy: qcom: qmp-pcie: Add multiple power-domains support
      phy: qcom: qmp-pcie: Support multiple nocsr resets
      phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for Glymur
      arch: arm64: dts: qcom: Add support for PCIe3a

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  53 +++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 316 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 ++++++++-
 3 files changed, 478 insertions(+), 20 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260412-glymur_gen5x8_phy_0413-7dd33c953da7

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


