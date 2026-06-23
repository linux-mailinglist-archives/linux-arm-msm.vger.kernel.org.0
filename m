Return-Path: <linux-arm-msm+bounces-114214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HeOkGJ2EOmpx+wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:05:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5736B74FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:05:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=K0BKUTsm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iw+6XxOm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 670F9300AC9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9072D46B3;
	Tue, 23 Jun 2026 13:05:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781442D593E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219930; cv=none; b=d1TW0mtULaAalltJbSpnWNHB8lQq6yMLrnA6Uxq+YqoK+yDRqUV8C04UZNxCO4CT/KUvqRldWF6eK6FIYQmFPNEm1bsqEqWq8zv+3aJe3url8OL0j2pLGxAAazgRceV6ZCN0atnWMldPB9iCytl4HpRheObvimfjkRJoUNovEME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219930; c=relaxed/simple;
	bh=DaHhfiRLFVU/fu3bWCMMNv3jDUDFySbSeji8kiG1hxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H3nEczXdqSg2dv/BTRuT3gD7olHrrtyXyAD1M9ABjxirwwbV3kn+HHP6LH34OKMlwOtqIcFcx4yjjLjTRs/JY5ms6yT+mTOXv6X4KY5zSic2QxRqlznFOUi0FwNcKNYuzncORSe2C8ykk62B7PDuSmuIrUQqZ+wR0kSrbrKidCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0BKUTsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw+6XxOm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXaRm3752853
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DBViIKy9a0R4hZeNWh4F6w
	nIWTV470k0mjBWwWHsFME=; b=K0BKUTsmpy28hk2Qzau1vQI7o8Mcuf/p3GgwSH
	pCfqpmgchKHQkZlwIgGwt45IAh5sbhYVQ6ZSlOq44JSLh+vr/6ALYilouqhmDAgA
	JKW0+M8YEvezh1mgNiQpndX7xRd5luG8XZF/brK7bEfHdPhJTSRQtOuMKUdlX34a
	MyelkYYklMu9E6ls8fc1pzPxRpzom3ScPJMOVDI3gJVpobP2rVRkEjuXvqPyhIiw
	08El/MBU0STh7GpSb/NnP1bf8HnC/rE/tlHAXP2ukv9kuEWFszoBYRUA6fDAGB9f
	4BP+jnShavyU8EuE/GESU6oWUHhoJRtSzYAI10SbJerwYKJw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29h86h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:05:28 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7ddd34a6336so113516217b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782219928; x=1782824728; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBViIKy9a0R4hZeNWh4F6wnIWTV470k0mjBWwWHsFME=;
        b=iw+6XxOmP714adgwFQl9FGTSVIsVRhT7ttyUOmPJ1XMErUuxFFClnKpBXZHxJXM1OX
         lc5wIfsteUW+fJPrz4GqAWN+QMsqNg6zR/0H0xcKp78+hqETpJArLpGdKpRX+x+eQCha
         yZbXNm/9OoFrI7oH/eqf1fUZIivhS8GiIKS7L2voQ6j/ercmRCmSt3+9wbE+Tc8+Bigl
         ILUPWPkZIsQk7O9fj8Lx6KL90WBnSHip/SLN9ZQevThc80rRuwMpMF90FxoP2solNh5L
         wno5xEhe+JuABUmoU+nT60k8fdLZ22cKWRI/Z2Vik4uEXqon0GO8Uffd1HmS0MavoiII
         y02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219928; x=1782824728;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBViIKy9a0R4hZeNWh4F6wnIWTV470k0mjBWwWHsFME=;
        b=fM5Akeg48nkslI8FFPczI+OUMZ+LJN+7wOKScpZ4AcJ5AV1e9hIiV0U/PWX3APEAs8
         zoDgOJAjakr6XpVK199aMatiI8kClfY755fP7D6LKnC6L0IjEsRykXOYeKf6K622CP2R
         NNK1vkckN0UpYGzdkwZhNEC/4Aa2Phy3RGzs6lSVDfBiTPBsKjiXYlFdbzCewUVG1u/n
         Y2ua+s2sVEq5yzHwiwqHZx8uM1/wWgrSHUJI/FgHn27N62xypAI6mERcIReyWlvZ/r/M
         +fXcHDzWMsr59JEaVxfY+ZDBHdbKlce+vUZnMHly06NtMvTkaHrnLkXcPLgOg/+HQQdL
         SCig==
X-Gm-Message-State: AOJu0YxRNGcExUnwz1ja7v8+r6ENr0fyQAhRFSVe1jfTLfFLIYN48/sJ
	9zGxU/XMIja3tQrYxmQrVip6ZHSvlBAPYfJqhhzPOWllKC1nzY0EX9PaNOU7HiqDN5/8LMKZWL8
	Aoxq0b/2cBN5KXg4NdIjIMJQVKV65xm9Od/XKZnha9m04LtNHfG+TJbVAT6pjZ+fAEs2Q9dmXs4
	Nz
X-Gm-Gg: AfdE7cml/U3WnUtuExpOobxNXUjV/MpZMOXjAZR3QbukQL8z0qevlsYvuLMYqq0SwvI
	L2UNg9D8j3dvBTAZRFsK9heSdQABgONZg/5OYr4JE/2CkF2+ol9212CzTjg+/Ipnx5dwbODTIpp
	VFydrqW7qaBcWZv0ALdmhuIFQS9GdQvayc3ypIX9akg5E+x35uJ6DsfG1YK6pCft/EO67rkLmWx
	fmSKpCJsUagyDdLN7fWKyRrTLNahcIaeopCd4ipygmjWD6Sm9+v8AJWql/+R/XIQzLE4gORIjC1
	9EKEsoGEtLQj6FTGasosmO6WcP4Mw9CIE7lTlhzk/kqmc5D1aRy6r1BMRsgrYrqY3dVSZpcSlu8
	DsygTVSx69n4su3QSJhEcR/4CLr98dlxElf+A8z+pVdpRHP3QUlBDgm6J/Q==
X-Received: by 2002:a05:690c:e34e:b0:7f8:7e11:d0d8 with SMTP id 00721157ae682-806deb9d6fdmr22653927b3.51.1782219927733;
        Tue, 23 Jun 2026 06:05:27 -0700 (PDT)
X-Received: by 2002:a05:690c:e34e:b0:7f8:7e11:d0d8 with SMTP id 00721157ae682-806deb9d6fdmr22652837b3.51.1782219926718;
        Tue, 23 Jun 2026 06:05:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025ffc700bsm44091127b3.36.2026.06.23.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:05:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Tue, 23 Jun 2026 06:05:16 -0700
Message-Id: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIyEOmoC/yXMQQqAIBCF4avIrBPMKKGrRETaVNPCRCsK6e5ZL
 b8H748Q0BMGqFkEjwcFWm2CzBiYubcTchqSQQpZiUrm3M1X53Gc0PJBK1XkCo0oe0gHl3Y6v1j
 T/g67XtBsbwHu+wGcgJW3bgAAAA==
X-Change-ID: 20260621-phy_refgen-db77317ec05a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782219925; l=1309;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=DaHhfiRLFVU/fu3bWCMMNv3jDUDFySbSeji8kiG1hxU=;
 b=fBnBIKVwLJ4q/a5apyIBbKs9IPH6R5TzQIeU0p15+x/XMDSzdvtCIcQSBH+0VbqkRhjeTEEQW
 MEJZrkvkjllBI6uSI75fcV8mWkVS+7uXcDXKyBrneft3NQ0+homLm+p
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a8498 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w8xSe1B2Uj80E1ISm04A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: tswT3yz8gHD8E62CWqjkUi6fWU0roctE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX0L3W9AJNhDsd
 YaC8AalArR3ENpvF83A1mhhzaYmSzNH0ca7mJOeHXHMgpH92VXxdhraHelNuCAtQviaBc9Rq64T
 KizKFD6hbZ/bG0YiabB2doQWc4T02o4=
X-Proofpoint-ORIG-GUID: tswT3yz8gHD8E62CWqjkUi6fWU0roctE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwNyBTYWx0ZWRfX2EzB4/thHi46
 dHzMZKCBiilikgFSwCyx9TbRRnZExp5vhHArBGHF2aAMWgh08hhUurMkTifa4vyBQL9e1pHt+hB
 IFyWNYI8hruYwZSCKcWZWrn4FLqCpfPIXhy7l65x1ecZFBlHQOwunrYG/RdJj0jpfXwCd93KekN
 BL/4TCgciTcE9C0JCcvpgjXt/AG3uBjBIjS2Bxy5x+bNWSge+p7y1fj1pwc0IstFwchJ6eLocpz
 8/N1WF8JX0z3cOmWnIiFurULcWCJ2kGL3V4ly0TNbWTHeOa5Awz0EZddN0ByGDA5Tyys/owxzrH
 cYlqYdEFd2J0C4SebLmC79LDYW1g5ivrMNOSMK6XGStL9OmGyDLxJsevqmZXOnnJKyBLt7TZg2y
 jlnzHIIn8FL+VpHUYf56XtEqUT1iUTGHSVI+4Xj410wBWKywGdcEvUCfwQyZnfMSM/aefWYE2TC
 lKwLqlnPFJ5v3B4Gkrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5736B74FC

The PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

can be extended in the future.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: glymur-crd: Add refgen supplies for PCIe PHY on Glymur

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  8 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 3 files changed, 32 insertions(+), 4 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260621-phy_refgen-db77317ec05a

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


