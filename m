Return-Path: <linux-arm-msm+bounces-60192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5643ACD93F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388903A8490
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEA828C2BB;
	Wed,  4 Jun 2025 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TcIN7Eq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15928C020;
	Wed,  4 Jun 2025 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024185; cv=none; b=IPcPn/+S1Lmi28fPto88vwD2xWOu8kIPjX2FKVK/ggOTw/ilzujCOMBEaF05QKF0W2gqjBNE8KpTMvMMKmITcDdXdy+7pkFrVNjVb9SP/BHPMsmlIviT19GjJIsSFWUtU5CNmrhq3EheRLJV1J0H8hVjUi9AJebT9BkCxzka2FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024185; c=relaxed/simple;
	bh=4KefP7PNXUmcgu/GIVlZ0ueSZmEaWF8VSwxRvG9dJp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EQrdwXGNCMRB4yY8wIIVYTv0hfg7wYp6oHfIUsCVhJu4n1nKCNANP/Oo9BA2gBpqZ5RvCMl0yhZGAIhJdKtgYyT9YF+bR277laONrDuqyGX/CEZnV47P6Z9VXPFkB1HYYizTZMB/b8vb7zCrqsnbGuCB2nl/eoEiPJWL2gVrZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TcIN7Eq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540FT3l014030;
	Wed, 4 Jun 2025 08:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ax3dNThhsQF
	Qv1KqRutPvEbeoFGjs6CAg3uERSNArtw=; b=TcIN7Eq8m09iPz1OL9bZUST/Rqn
	j9nsw0o7KQYfBu5BTRp1xO8wRPzQwmkFEYbxhAIhGTU4M/FpK/GrJaFYhXcEsQcg
	/4+Xy4hQ2K/LzFi2xgmaWdm8i/qN3DItI51VWKtPv+A2Yj1H1SBUTD9jcpJOtLxF
	LXXgPtmfPkGkvcRBmzHvTXGEGY6zFv7XDTfJ+Q8H1CWSXnvWPsexw/f8DPwuCZoo
	CV/DU9YnqWKldDqdqXA6evnp4yonv5jh6Q/05gU+slFWUqZCs3mnMpVYZDFLLCbx
	1PnJ8s63P3GdCGQLb0ufowUh7azAwOYLXubPg26rT1a509DuGqiQ8XF67IQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be810gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:45 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482htg018772;
	Wed, 4 Jun 2025 08:02:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46ytum6jg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:43 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482hng018764;
	Wed, 4 Jun 2025 08:02:43 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 55482hLc018762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:43 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 246A540D25; Wed,  4 Jun 2025 16:02:41 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com
Subject: [PATCH v4 1/5] arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
Date: Wed,  4 Jun 2025 16:02:33 +0800
Message-Id: <20250604080237.494014-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683ffda5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XEm5LDYL5XlitVSwr20A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lNdDJ3Y1azeL_vwq5Iqhj_UciF8_Sh1j
X-Proofpoint-ORIG-GUID: lNdDJ3Y1azeL_vwq5Iqhj_UciF8_Sh1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX0XAwizpOpzaE
 lCLIBXDtyIg6NVo3Fgn35z8dazpnroBxA3f9jyzvGGQSQE3aOaV9uF+jCiXtODMpgRgA/bVre3p
 pn7Z1blP5XEpgFxPvSWa4Nkw8u6WLBbDHFUys0VsOUTeYwSL5l7NQujOC6NFMJU0pD+cnSX+O3I
 C1psGXmf1D8r+ZUyOjjXaIW2FJwxQyOlQomMvohdTmKd43LNakZsSJlhdN2cf+LHvV9XkdUR2v4
 uGklqFGPjK3nWUlcTFL1JCGgXI/oBwyGtc3H2DkqMu0EeIvy4E2dshdVx/i1PQTEsKjGQxsyy1q
 /jMEL8KTZWfLF1wPpNUbOD29VndZZbruAzXQGHt5dH4aTQAYaZClLYj/fqOph3xnEVspEPzSOKT
 2rXpznsL61ozECd4AcOq2n1iAZ3za77dWEvzcQFc91la217fP1vxpw1r+9uf1cmgLaOX59pU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=803 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040063

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Enable the pwrctrl driver, which is utilized to manage the power supplies
of the devices connected to the PCI slots. This ensures that the voltage
rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
correctly turned on/off if they are described under PCIe port device tree
node.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029..0ffd65e36 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -270,6 +270,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select PCI_PWRCTRL_SLOT if PCI
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
-- 
2.34.1


