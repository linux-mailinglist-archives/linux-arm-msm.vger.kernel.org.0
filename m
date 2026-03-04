Return-Path: <linux-arm-msm+bounces-95258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG50Hsbrp2lDlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:22:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DD51FC7B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28A94300B748
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 08:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68890389101;
	Wed,  4 Mar 2026 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4Ei9OZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLZVz4TF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286223859FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612521; cv=none; b=LsC4rLoYJPSiQLLlJIxYRoPQckU8omg5J34SGVSFNQ32ElZKhsKLhpEY+qIVUiZkV/Y+mXKveawbf1tCCnJPcsLqAJuL3i4/VvevIzPEt9I3rdXfe41axPddynADbQ4O3ZHWQoa1Jc0sCwebRY3ZO/Na96TfO5BPHiyAkxeEOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612521; c=relaxed/simple;
	bh=tAeFX5lUx3zHGnPBcDDuWMbJQ0LMMLSG9GejN6zNU08=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tedN4cYlYTYkrQPGoLAvGRNrTUYxtnLLqfAemWAqB4t/52XmsKgzRf5MPQQgjFIY4YKGzq59ECHODIR/SfRmx4cI7FPShC39LihifI+g/xd4jtOOPPXzM5rbw+uMpxZdAG/9bTrXfcJtXOEcYar4hkrnb0Xa6TG2vfBkFvth0b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4Ei9OZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLZVz4TF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245T5wb946568
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 08:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V3r+Cv5485ydj9E8Fx9KDY
	de6r4vNbk5e+OFQXeeIXE=; b=o4Ei9OZrptfNPJ9+c+lC0wXhcJTRcI5vK1cbue
	3bZ5shFo0nWBPDkKV6kETOC9bcoqKYaWZKgs2ofAXPtcK7FH43GEs0tjZKV58K2i
	sE3hRTJvw19DexiHcpbrpw1v3vTzNWQlXFeVkkFcxorq6MI1yRGz2ULsKsJNnl+T
	4zaLnb3hYz/9Uj+3d0gvRvd6SHW2BMcIW5hfLYTn5C8lvBJD1wL0OcMBpqE7YG6o
	V4ePpW769aXyRXTADgw2kWEOJOZiFGLP6RQDN4pNLg85C/LbGWQCVbS7+MCzEP/n
	xwTe5sk08YvTzOzYSjQdM8h3n87xUoiN5REQoYDvykHUS+Vg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfc811-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 08:21:58 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40ea48ccbd2so6414374fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 00:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772612518; x=1773217318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V3r+Cv5485ydj9E8Fx9KDYde6r4vNbk5e+OFQXeeIXE=;
        b=gLZVz4TFjp0JirLdgitwboNMkua+obcN2D+enudsFy6Bc9SY5bMuPwtn9P0trQy4Ca
         NutXf+n77bjvAcRZAUExGmOZt30T3RnIhzGfj5Vl2Dip5n04xdKP565wLcv86GwXXbXY
         40F5+6cPD/PrvaQnlRAqitXRkgPbDZ+MAZ/2kaOnvUuoSKZcwlQZXfAucPrkq3mEgxDL
         3KFYtgld6Hzps9WQAzkPdMI9KZBVKRlvDF/FpLArdtsT7DWLKIoZjICm4J02Lpa0p9fj
         Uykp9+L11eKX8JeDfR37j49+azc65bAjYVL3nZTSE1yQ66mMXfAoG+uhzTJtQ+FHPxuj
         W1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612518; x=1773217318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3r+Cv5485ydj9E8Fx9KDYde6r4vNbk5e+OFQXeeIXE=;
        b=BgOHr3y8ZSkze9PrjqAeOhu1e9J0b/9p/fiBYwFoPJ5wrBDS0s+sVilrT6BU2zssCx
         5sBziZtl2gWmD9a/znydFKX+iaJsrFObNRC8Y7v67S4K0Py3raTEgD9nnvgt+I9PyY7g
         nOWeH9Qoq66RgcjjbNtY4cu4EjITnu+MvSkLk8JgNLuiNZU86gLYK7tfi/odKEKHW0P9
         Q/ZweBlyfwJ0XvfVdfCRCOzN5MEl78YbuNp2uwN81kgKiyW+46SSOnDpcyU5iZF36I4q
         hxB5cu6ymnXljNc44Dn9P55S8SkPJsoSLR1y9/z1X5Q008VDp+ksKTMX0jUsGkPpb1Xr
         HidQ==
X-Gm-Message-State: AOJu0YyV+shstiVrN4FZEdVdniAmczTPfnzcHMJCKL1P++pSr3WOL0Kt
	i3WeGi4IcsL6RtTUIKIK6FUJDS+iaYqniSntl/afhnYAEqFJ9gdBJcPdBmtqixzBKXTbGi9MLnY
	9DtBcXl/+XVDOvMUQcEPDf93mpxAWwptT3JJVMbo6x5qg2lWsl/lcnkTNejysHxOrwWNA
X-Gm-Gg: ATEYQzzskFY+tXttkNIH68JU2LToB09mN7ZlyqQ4+RuiWxO7cx7/ZvItmkqIhH/+LWy
	Q6sxukIACAblI8J8bq7+hMu9ufpnut/U3vyfGnDR9rlHroCoJwtDa5uZQEka6sN7xBMdbL7ezzR
	OpNS252KcnSyUqSg36OCbzyOdsWwaxzOgSp+VBfDSG03L0GHfXk/15bHaqHt8QO30x5RG+nzlSt
	k1BY7PQw3Fwt5K8XV9y13jjsuMkVaWnm6/clBxGxsq7Xl3IojYliYQ+rSqQRXcnS7h64/Oizceo
	0jC8FUjK7lnIHm4QyYrEEhanBEsOzj+oYjvayRNPVycbTTPlx9CfG7c/mtwYYQhvS9eggKhbsWP
	mIIN+wlOPC7V47wSvCgx6giIMbU246vE91rDuIMXCUPXjL3B4FOVeoSJMueYI4oI1ZGGO
X-Received: by 2002:a05:6871:a981:b0:409:5fc2:7eb3 with SMTP id 586e51a60fabf-416aba63d1dmr664456fac.34.1772612518314;
        Wed, 04 Mar 2026 00:21:58 -0800 (PST)
X-Received: by 2002:a05:6871:a981:b0:409:5fc2:7eb3 with SMTP id 586e51a60fabf-416aba63d1dmr664449fac.34.1772612517951;
        Wed, 04 Mar 2026 00:21:57 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d26d9absm18006952fac.16.2026.03.04.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:21:57 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane bifurcation
 support for Glymur
Date: Wed, 04 Mar 2026 00:21:54 -0800
Message-Id: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKLrp2kC/x3MQQqAIBBA0avErBNMs6KrREjUZANlohRKdPek5
 Vv8/0BATxigLx7weFOg02ZUZQHzNlmDjJZsEFw0XHLJzJ6Oy2uDVsVOuy0xbFHWVb12UinInfO
 4Uvyfw/i+H6IvOGBjAAAA
X-Change-ID: 20260303-glymur_gen5x8_phy-e7e3414f8355
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772612516; l=2617;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=tAeFX5lUx3zHGnPBcDDuWMbJQ0LMMLSG9GejN6zNU08=;
 b=sFR/WpsXzFu2Te7khAtAWsDEWkf8JqGWZy4FYWoNF7S12iHMO5aXuTyQXMwHUQdas7Ri1REd4
 Dleu+C62WzyB1qkS9yRFAIxEk9k7PaCWYF87izEogCCcg75eoca8HAO
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NCBTYWx0ZWRfX/XQa8/thvBVI
 nZQS9QCROZxDCordz9Rhi6vpOLG6loLE6qnmdWmSSqCImQfNcY8ApLfV1JKrrTFywYSJXRfxhwS
 Hh2kCxdixlvVXSu0kCS8FJraQ1TO9od56Wyiyd51NO8nAkECQvn4osGEvVjIuQ7DPJIG6waeUUB
 jVB94Fw841fBVz9fjoICo4F4KVTwJyZIX84wWjvPX8QJ1i/MRcSj1eje8+PqK8jIRJA8TUn77t/
 qrQQFXEiesOSPew0bIlVs2T1OPjulDrk3A533uJtcquEDjbTiwFtFpgS3Vqu024Ha87MUT8xgV1
 jwBxcIOGmt0N5jlWG4mo7Sou0Yw7iq6ZPDbad1xLgrGhh2MB8g27gbvSNec4gdoMZUSPKAGw02g
 /3A3Z/h6a552B1sM1vh/fqVFoLGxOOU2i6I1vWG0U8njjYoPFjtUDHimLk1gIJ1c9mFPAvo4YhA
 SuY9QutVi28XpYmkTzA==
X-Proofpoint-ORIG-GUID: kpiUpEl6hfFb7RQke7VzM4_d11jJufED
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7eba7 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pO9I23orwyiV47DujX0A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: kpiUpEl6hfFb7RQke7VzM4_d11jJufED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040064
X-Rspamd-Queue-Id: 12DD51FC7B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95258-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (bifur_aux)
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

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add support for glymur Gen5 x8 bifurcation mode
      phy: qcom: qmp-pcie: Add multiple power-domains support
      phy: qcom: qmp-pcie: Support multiple nocsr resets
      phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for Glymur
      arch: arm64: dts: qcom: Add support for PCIe3a

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  45 ++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 314 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 130 ++++++++-
 3 files changed, 469 insertions(+), 20 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260303-glymur_gen5x8_phy-e7e3414f8355

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


