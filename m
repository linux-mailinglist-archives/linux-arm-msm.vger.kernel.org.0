Return-Path: <linux-arm-msm+bounces-84817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E07CB1657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F423F302F8F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396E830E0F5;
	Tue,  9 Dec 2025 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jx1dNMqO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sz98R9AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360D2FFF8E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321799; cv=none; b=WK9TXn7azg/Dls/F0WyhdanpUlekeu7zdz54XPdYBC2OsBjMbHQCk2aFjPALeu0cShJbBM8hs1T3pTGxaY2/UXpcF/LZ+wod7eR31BvN70NQQYEM8XjxvUTRklFySqWK+vs4BERgGbJC/9KiWhicSbHZp39qBzJlBQ735Bvkk+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321799; c=relaxed/simple;
	bh=IqdAfpb+3vzIp2W4FFmDHieWNlz5qeA+WAVwx4pe82w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKdnJ2TFwiJxNNl42RTdk/zj/c++mkFh6IlkbMINjS+RCrjBG0J13zGiJW95iDA4590r3VgFJVaGXnhW3Vnn2kEqeQ6/K2g1be3RG8uDwElce8ss7crGWkU3caux+S9x7g+p9kca9b/KovDGjCeHJrr2SWKSMz+6TLhtzIL0Urs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jx1dNMqO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sz98R9AI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MlgSD653699
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXkKhV06XOvaYojoXJXB0CKRn4gqEtEQ+n3gBadFTn0=; b=jx1dNMqO7gQ52geZ
	cCge22xFFgtwmq8UHif4IqFf6BfzS2zvEnKrdumgnmxOZs/KHgCKERBZZ1YZdThU
	CwFLLUU83Y5mQ+BEKlDoLJauHu9WqomGPbFMbxO0HYGykyS+iC5CQ2+YM8664yq5
	sdj5sSxadfVJv0QSLcz/aUv94m8sbtYBLV1/aWgMmUsrKdWPeHp+QXu2EU9QNSJO
	dzSdBwGfwlPYXyiq+UB1Uu2JqNX63wa4bmIcsOtGoxUUrc3ogCY6SLEpirpBJN1W
	pLKzxYWpFdG0vBtA/WrBLcVjn1ETMfHdE4/3s/v/J4PdmC94WIDToFrEuiw+EbmO
	Z5DvnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk528cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343daf0f488so6323363a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321796; x=1765926596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXkKhV06XOvaYojoXJXB0CKRn4gqEtEQ+n3gBadFTn0=;
        b=Sz98R9AI/RctdxqdNfzGe/FVeTl0QIeZBQa3GnMFYz3ZJisvd61tIHeNt1GkivL4pS
         wtNkV7pTqnB/eP+XTkJ0BA2zM/Pni4xYH0twM4J+BAAAHPzFOqIXWMWN5ewiaPwDJ9g9
         7fVSMKthWYi4RujFo32Imk/biM0JpMLWDYlWl9ex8iYUxGbXbXaV7Eyl8XZV6s/LBto0
         hNo7fFN3ZD7vd0wDaxJnOD7jC8GecYCiPQ5tOrqfp4j+M12gANm3X2eVqBvFgnVF1637
         34DZ+zs87Xftfx/f/uhrZT/zS0TqrzURHI3alIYFzqLajSb/LFlz0Hspd/in614dJPID
         r0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321796; x=1765926596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BXkKhV06XOvaYojoXJXB0CKRn4gqEtEQ+n3gBadFTn0=;
        b=ApaxK+66JNPt4MA0ICfHMPXi/UDAbI73XTtMDzCgU35lI5DQvqKX3KaL/0EsyTQqob
         FY2SL8iWXRpLfbwBneDQ2t+yLwdCrTfCjYjiHiqbF0NJZ5o//cZKpRuK0IDLwq5QSqrU
         IEhKfxrVczHZAOFfKDeKdRBtk1YxVBUpLin3N0ECPaVetVS9bMx7gNLg4yTtodS3lHb+
         oCv3jZSRCYIxoKEoRWtqA+lxY42Bs/yJffhLpylyLYRr0xTTzEDrSK8DmWrA4JwD+gSU
         0YZ7erZsYflmUPmy5wx1ZwK6reLmoILx7tcuAU5+QUGuq7hLfe8AvUsiXMpD3oh7K71v
         ljsA==
X-Gm-Message-State: AOJu0Yxu49KOx1oUUD2+JCMCJodGKXwgrDYE3dBbOIW2r35objO1AkIb
	WcJLmWctOutJQArykA4UWEwJO/jI/ppsXOW30ihYrc3HDMp4b08YDp/4PL4CHAT3kbuj85lGsP3
	m87OZNtD9FKVA/kP3VpKw1Emcwc1x/i1yNM9Z8sdpAc+wtKjUeOV31s2TfTX9rZtnQkQU
X-Gm-Gg: ASbGnculPxIilk5SDEj3rWMJlYkwK2MH87FRhbCun9pWYiZiIT+kAKPk6Zpm7jPhSDl
	t3tV5l2gQ7fIkSbDTENvkeqc02tjjCbeR7ESS46sqajixanbnraemGVZIf8fAEjSqE3WpyZZuoH
	EUyDfeSbSUcRIyQbZbWodkTDinsa4rXyvUQyYR7oqcMU2neDyV+lls27GpqDNLLUMfDL593sXUi
	h0M5dLeNNK+A6Jg1C/FCb1obO/8q5DLkH7bwtd0aWriDyZoJJy7zlVlWh8rX4EEK9A/QBxsUdbN
	IU70MBRQlR522W/ZFqWq7BCUsOFFiwBUbRU9+YuyMtvLn3qUjjrEg7UBbiolRwZbhNCyBlamu5m
	4UWUKWODgxL80Wm3OUWgY7wqDygp47j2dQwXuRjQy8Cgunb6oBVuFJu4U08iLaw==
X-Received: by 2002:a05:7022:6982:b0:11b:ceee:a46d with SMTP id a92af1059eb24-11f2967cc1emr265287c88.15.1765321795492;
        Tue, 09 Dec 2025 15:09:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEqGVqDSiiM+sW4HLL2N4zrzp5y2S9w5IZLpjIL0bbPSZt4mouYBGIQ+g9BNfCwCBEb/Q6Kw==
X-Received: by 2002:a05:7022:6982:b0:11b:ceee:a46d with SMTP id a92af1059eb24-11f2967cc1emr265260c88.15.1765321794931;
        Tue, 09 Dec 2025 15:09:54 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:54 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH v8 7/9] phy: qualcomm: Update the QMP clamp register for V6
Date: Tue,  9 Dec 2025 15:09:43 -0800
Message-Id: <20251209-linux-next-12825-v8-7-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mUcIM8mfn2DyYyBuKY02Cw_90xB_wcls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX7+Nk/0k+do4E
 c2y2M9lFiWx3gXDwWxraIYp/SHxyyyuy+DRLwvM4c3jzdva59yhrYrSoqIJJoKPVfz9IhActJWw
 GtvjPxifFAXfBEVtFi/67G5pMyTBVAmxCt/wK2DZl1SWed/Ku6PgwiRMrp8WRMplSSpwjqyR6xW
 cK3XntKndMUkcHXyG9bMD3qQOgqaQKdXs42UftcC1IawI9JIorF5JZU3Be/tFjBIIVDJvl1Xzgz
 e8GWQ+dTCit4gR+vFtKiX0VcE8RlQXzcwvdad6fF1wo6tITDXBQZ9FUUP6HDZwBEyR+aAnFywRu
 8+YGOM3t5TUZnCTgtwfIbuO41VdPixrEqbYt8rylIXLo6ZdJ5CnNCeYFeJKlbg6eQrPZVpoj8gS
 kHmiPY4Ewg/uGkwQCoXKUAw9j1w95A==
X-Proofpoint-GUID: mUcIM8mfn2DyYyBuKY02Cw_90xB_wcls
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938ac44 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=6zIwrvuT6hO6z1e-hKYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090181

QMP combo phy V6 and above use the clamp register from the PCS always on
(AON) address space.  Update the driver accordingly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c       | 38 +++++++++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h  | 12 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h | 12 ++++++++
 3 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9e2a6c5d0f58..59a8c6a535ee 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -30,7 +30,10 @@
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-pcs-aon-v6.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-misc-v4.h"
+#include "phy-qcom-qmp-pcs-misc-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
 #include "phy-qcom-qmp-pcs-usb-v6.h"
@@ -79,6 +82,7 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
+	QPHY_PCS_CLAMP_ENABLE,
 
 	QPHY_COM_RESETSM_CNTRL,
 	QPHY_COM_C_READY_STATUS,
@@ -106,6 +110,8 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
 
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
+
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
@@ -131,6 +137,8 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
+
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
@@ -156,6 +164,8 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V5_PCS_MISC_CLAMP_ENABLE,
+
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V5_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V5_COM_CMN_STATUS,
@@ -181,6 +191,8 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,
+
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
@@ -206,6 +218,8 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
+	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,
+
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
 	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
@@ -1771,6 +1785,7 @@ struct qmp_combo_offsets {
 	u16 usb3_serdes;
 	u16 usb3_pcs_misc;
 	u16 usb3_pcs;
+	u16 usb3_pcs_aon;
 	u16 usb3_pcs_usb;
 	u16 dp_serdes;
 	u16 dp_txa;
@@ -1852,6 +1867,7 @@ struct qmp_combo {
 	void __iomem *tx2;
 	void __iomem *rx2;
 	void __iomem *pcs_misc;
+	void __iomem *pcs_aon;
 	void __iomem *pcs_usb;
 
 	void __iomem *dp_serdes;
@@ -1976,6 +1992,7 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.usb3_serdes	= 0x1000,
 	.usb3_pcs_misc	= 0x1c00,
 	.usb3_pcs	= 0x1e00,
+	.usb3_pcs_aon	= 0x2000,
 	.usb3_pcs_usb	= 0x2100,
 	.dp_serdes	= 0x3000,
 	.dp_txa		= 0x3400,
@@ -3361,6 +3378,7 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
 	void __iomem *pcs_misc = qmp->pcs_misc;
+	void __iomem *pcs_aon = qmp->pcs_aon;
 	u32 intr_mask;
 
 	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
@@ -3380,9 +3398,14 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	/* Enable required PHY autonomous mode interrupts */
 	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
 
-	/* Enable i/o clamp_n for autonomous mode */
-	if (pcs_misc)
-		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+	/*
+	 * Enable i/o clamp_n for autonomous mode
+	 * V6 and later versions use pcs aon clamp register
+	 */
+	if (pcs_aon)
+		qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	else if (pcs_misc)
+		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
 }
 
 static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
@@ -3390,10 +3413,13 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
 	void __iomem *pcs_misc = qmp->pcs_misc;
+	void __iomem *pcs_aon = qmp->pcs_aon;
 
 	/* Disable i/o clamp_n on resume for normal mode */
-	if (pcs_misc)
-		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+	if (pcs_aon)
+		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	else if (pcs_misc)
+		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
 
 	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
 		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
@@ -4058,6 +4084,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	qmp->serdes = base + offs->usb3_serdes;
 	qmp->pcs_misc = base + offs->usb3_pcs_misc;
 	qmp->pcs = base + offs->usb3_pcs;
+	if (offs->usb3_pcs_aon)
+		qmp->pcs_aon = base + offs->usb3_pcs_aon;
 	qmp->pcs_usb = base + offs->usb3_pcs_usb;
 
 	qmp->dp_serdes = base + offs->dp_serdes;
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
new file mode 100644
index 000000000000..52db31a7cf22
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_AON_V6_H_
+#define QCOM_PHY_QMP_PCS_AON_V6_H_
+
+/* Only for QMP V6 PHY - PCS_AON registers */
+#define QPHY_V6_PCS_AON_CLAMP_ENABLE			0x00
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
new file mode 100644
index 000000000000..77d04c6a1644
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_MISC_V5_H_
+#define QCOM_PHY_QMP_PCS_MISC_V5_H_
+
+/* Only for QMP V5 PHY - PCS_MISC registers */
+#define QPHY_V5_PCS_MISC_CLAMP_ENABLE			0x0c
+
+#endif

-- 
2.34.1

