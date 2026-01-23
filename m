Return-Path: <linux-arm-msm+bounces-90343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGKwLMplc2mivQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:12:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9527596B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 577423029627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FB73242B1;
	Fri, 23 Jan 2026 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+DxtUJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnQCSDPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628D2F6925
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170367; cv=none; b=pekWO/lJDxzVZmqYaXIrPo+0s4L24Akoi5Ii7h9Plghh8j1852+/Zc+MiZN41eP3L0KxpisA9uEHsmNgWl2R5nIf9D5V3Xset6CN4HB6Yeag7EWSaSIESEj2wWY1hJQ0d+TCWVxQOYpY5cYUsfHh+NzUpz1F7gHURaKpoP2fJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170367; c=relaxed/simple;
	bh=8q+2Na3PKf7MhkrNMBhjn7/ES2UJJmcUb8wMU3jlfrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YqoW2zj7drcVwzlROkYvTtXkTF2lccMjEe39heWEKMDk3Z+vhYNoj7AhV4uTjvVJjuqNlt5hxmtBDdoO4hPNWwCwWqu8dHX30Lg3FqMcaryaeXpQ73JY/IR3fAlVtcq4lDfjLdqcumBEjF+YDtjGxYm9Agpmfq6Dq9uH9oX8Pnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+DxtUJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnQCSDPO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBMSoF1118692
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YkmeV/dutdxiR4NWAGqpTb
	SHxF/BLbjYEpwtGgo/NWU=; b=A+DxtUJfnuOPx2eSlvOX/kX/dt3BIc/p+kn1Tx
	y+kGVGKPlmCNxNrsm5DHbljWrxpMyyGI72Q5gktgyFOVGEJbUhNJFKIfsZXCkKCT
	uWPGHeBeEMW2wImTqL9MYdsuf9yKLqUF4QyKBOfu7wy6FDD2rhZOp4jKxgd99u/O
	4CtaQ1ShcdwIM0e7ybpQXbDpu8geZg0oy20E1evYq/HTNKaW/qcpDEKHtdBfLzPY
	RKRhws594g01MswTwdgbNfpfAXY5SAT9EPXMRdlR8Le7fZ8l0uSNFyLAwGW6gTPA
	qWl/b/ksy045JZLxMXLEfRZK1DD25+B/WppGplbytfiGAWPw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bur1cbr3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:12:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-822426d844aso1503211b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769170363; x=1769775163; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkmeV/dutdxiR4NWAGqpTbSHxF/BLbjYEpwtGgo/NWU=;
        b=VnQCSDPOqWTeaVfw2DQL4WSzRzhqoHzTOfWnlWw6u8ZWFkNd45rx6dv8ttZ7F+bO6Q
         T1gR3xOKGgJLfrpDLHKsOZ6PfObg4ZxlQBnBuEKesX0flphJFKpe5HEOe8i24BK9+DSa
         aWnNr+dGLzsPwcfkX6xBjcMEMmkcLM2FszMSzXKoqivv0L2SOQX7PfhtDnmLo0WSVHYq
         hiNcoavVUAjBqxU/YCDZ16MRRY2eRQVWBf5hQj+9uazKGk+tK1fMsT+bJX1DPc1DxR0+
         IQL+WuNO8JvY55E2Pv/ElPWAYEQswLjetELy/00cTfxxsuBDXxUI35LMrqCTplcRyonT
         lPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170363; x=1769775163;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkmeV/dutdxiR4NWAGqpTbSHxF/BLbjYEpwtGgo/NWU=;
        b=oPA+93aW9REERkaVVMO4X7PKAjOIH0pTEaI2fzaJB4HEfAu5BI5R7Wy5RKcU1K9v7N
         gWDK67c99lOcUoD6TeZNpsnj2UDUDMUSEkxAdtwGf3T4COIphQPiQSLwKTMRgoO/zSy7
         oMzfTpceDez80EmiM3lnI3RU0jlMZHIa0a4uBAX9qGJ0wGNe0IASvzrF97Idke0fyGBr
         bl6nJha/Dfo4RLLNnC+aohZxMJPwaAqzXzg1YQSiP31wrHnaawjkjEWUhCBLY5ljwKO5
         fYkbUc+rDC/cSAc7G3yh1hSoqdZAa2MkO680fOiANZmLzJkcP9lBnuHrn3kuN+E2Ge3y
         uf2A==
X-Gm-Message-State: AOJu0Ywr9j8NlRb1PXd5f7ycrBGuJ6idp6MaWK9D1XxBhycoNdCXaPlD
	+lJPqPngj9NjsovxlO92gUlnACyBI09CC1C2/dIepX8XQ88BJM9FTsgkkwHNiaMpEZNlhvANRLq
	tSSBMjXK8n4VzBvdbe1Eiok+jUzEsX9ol6aKbuuU66xEBxzmOSGzyxJOg9DS//N7ESOvW
X-Gm-Gg: AZuq6aIVCxXGtrF2fuoht9MYurppklyn4pbY47QRons1yXQIoy+BL2RImQPVP22zEON
	Dfk4CWCON59Rf6oRSVTNYpsijUiO6dG5tYaNubUfWsTZIVaO/26mnl7rIaW89oqXmHyTxeaHrKq
	aQHetEoyJTrnI1gdge3PARhWwMjezokLs3mi9fPPsiZAji/dVsVetMSQhqd/A8G/Z7EJ9SKCi8e
	XB+e4Ddncf8reTtB0/k/uElwLtirNAlQOMp6AsQ7GYSosnPEKn+WLwGi7ZvfRpdxWRkol0BDUXr
	tEboRKrKJp1C8Rw2HfqzrwNFojRDu4AQiv/OJXkN/m8gtCIGaosz/2FgpwFPIWameA4jwDlO01e
	dXz9bbJ016HE4VYlOR1i75rMo35ANTW3jV2juZYnbVy2w
X-Received: by 2002:a05:6a00:1825:b0:81f:804f:af26 with SMTP id d2e1a72fcca58-8219ede8a3emr6160315b3a.19.1769170363404;
        Fri, 23 Jan 2026 04:12:43 -0800 (PST)
X-Received: by 2002:a05:6a00:1825:b0:81f:804f:af26 with SMTP id d2e1a72fcca58-8219ede8a3emr6160281b3a.19.1769170362909;
        Fri, 23 Jan 2026 04:12:42 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm2109288b3a.45.2026.01.23.04.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:12:42 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:42:27 +0530
Subject: [PATCH] arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKplc2kC/x2MQQqAIBAAvxJ7TlArpb4SIaFbLkWJQhTS35OOA
 zOTIWEkTDBUGSJelOg8Coi6AuvnY0VGrjBILhUXsmEL3SZYQmGCf4zdN6a4c12v5dxqAaULEYv
 0P8fpfT/jbnDsYwAAAA==
X-Change-ID: 20260123-fix_pcie1_phy_clk-60dd5972a471
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769170359; l=1779;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8q+2Na3PKf7MhkrNMBhjn7/ES2UJJmcUb8wMU3jlfrE=;
 b=VCsTBBgl5eqKY2BrpNC66+H9WobjZ+V0pF+azJfaot1c4n9hilbpFzFGKm3wRpvgZSR0A7adw
 +NW14FjdtP3Dq/01ruRiLkRUxzq/AQ6fLbCrTs0LUGH6TAb59DXm+c/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=FswIPmrq c=1 sm=1 tr=0 ts=697365bc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: KCEfigwpEjK4n-XLgC8Uy_mVXcETR5PG
X-Proofpoint-GUID: KCEfigwpEjK4n-XLgC8Uy_mVXcETR5PG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwMCBTYWx0ZWRfX+Pb1SE7/s0dF
 gD9XqWfLw6ZDhpew/8VGfdCup4p9MXH7tfBdtuxNvjvkljpoQ64hytxVULcvX8jt5pUysHxKFMS
 Ioa6i0TDy1nHJWRIGe5v+QO0sgSJBP5rdsdnAH0Q3uLrKps82ff/tKBjBXFh2pDf9+fdV0+6YhV
 qrDoVc66OYc0aYfxU2+LeiV1XLx4c905SksJSzmzAmj+dlD56M+Rh4O8Nw4g7CdIUIiYWr15Tew
 ud+j/zdDLNRq/1bEdqI7ZdRbvcTqmAQ43Lm5Gm6yJYn2XwvBDyAOYCkV8cqvQj2IBECp8PeidP1
 W8KgPpQHTpTq1oSywuXGuqWI2gzXx6gHNB9M3jLyrUOuqKejxxX5IOv08oBA0STXNlpTKNLOdNX
 aYWA0rsbEc09wSgaJtctd9gJOkJ5c/T3EabIJg6W8qF2uIhIWhsmdz6G83m5WCPIbB5iX8Wy8S4
 RjxLPXJWNtlnJ0FPh9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230100
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
	TAGGED_FROM(0.00)[bounces-90343-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C9527596B
X-Rspamd-Action: no action

GCC_PCIE_CLKREF_EN controls a repeater that provides the reference clock
only to the PCIe0 PHY. PCIe1 PHY receives its refclk directly from the CXO
source.

If the PCIe1 driver in HLOS votes for or against GCC_PCIE_CLKREF_EN, it
will inadvertently modify the refclk to PCIe0 as well. Since PCIe0 is
managed by WPSS while PCIe1 is managed in HLOS, there is no mechanism to
coordinate these votes. As a result, HLOS may disable this repeater
during suspend and cut off the PCIe0 PHY refclk while PCIe0 is still
active.

Replace the unused GCC_PCIE_CLKREF_EN clock entry with RPMH_CXO_CLK to
reflect the actual hardware wiring and prevent unintended changes to
PCIe0 clocking.

Fixes: 92e0ee9f83b3 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800cb9927627f991e3d97174cc73c64..1bd5f907e4915efeabd836dea12735b94626294a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2440,7 +2440,7 @@ pcie1_phy: phy@1c0e000 {
 			reg = <0 0x01c0e000 0 0x1000>;
 			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
 				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_1_PIPE_CLK>;
 			clock-names = "aux",

---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-fix_pcie1_phy_clk-60dd5972a471

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


