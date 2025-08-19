Return-Path: <linux-arm-msm+bounces-69659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D8B2B998
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A1517A510E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0A62698A2;
	Tue, 19 Aug 2025 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxriH++/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA2E26CE13
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585411; cv=none; b=gC3olvhjlWFXxphRnW1cOalsgcmhwya8sVTBticZP5XzEqqhRaMaotzF/oeY8S/WAE+rTUYlHGU/taAgtSiRLf/+xTvOiaHOeYUJb3n2QWCW+LTdSIhq8/nEFtvp9VwjBZ+ZXGdDpkPkHKq8YsQvZA6qND6KWrCzkTRh6fulnm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585411; c=relaxed/simple;
	bh=ag43pockrDVtSatmI1WnRHpBp2uI2rmdqCD6gVEQcbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYnwGa3hnLlw4Hdv0h+XAe0ozRNYsQK4PTSzUVEafYdEZZcT9D3BFcQ5n3u4LvJ5DeAUunyBVi1M40rN7XAgIWJ0QcIKPVSXLMUyqfhbCi1+EQTil3R7/hZItFh4y/fzgc6BG30tgpyKM/54nbvTONO6MqMT2c3tM4ZVvlu57WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxriH++/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J133AP031569
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=; b=SxriH++/O4uXEARY
	InmyMzGsG3soLrLTTxi5nUolDv1QgOL05Falu8ascfpYMwGcrIXNhIN09FazkZW+
	RAZeUFb4rW/0Dvd/u1OWZMjT6a27OcdqsSye2NS3ZKNbxyfRWV3lj7nJBM5U+v5k
	GoZmRDOaFJgLsK5f52TBQEx5oY7gjtlJE4ytHq2kGqpWLamu9p4NMDWnRXZpyRK1
	Ds02flI5hTrxzGLBqi0z+1rhaI+9oFSOZxJ6MKj/FYJWIWidAr7Tu6CfAM/YUTEE
	ucwY0N5MAxumQ+BCjPKeZg1WvOmCGu+u60PSXSdVqXO10KaRF+M891uqucQEqIAQ
	q9Ys4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mfcbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:36:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806eab4so51926875ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585408; x=1756190208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld9b/944CjtaKJ4f0GVdMrbvW/5r/vcAN6uf8GN4R0w=;
        b=IS1rDD79jpJqA/EbOq+EHZijK5IRTswS2B7vYW0SdUj1b6jlCOhgRoPCKrc/cJ749N
         UeVhze/YY+2/8iARXSS1bAXvYaeHmTIP6QLJvpQeIyHWNu+Ha7pe56PHPyRpQmXH+xwQ
         o1P0joFqPJeDgteHuTGqSJkoRKdmm74PaK9+drLxff/t5t+KyCrAVhXH/0tJDanvdlVT
         jQLWoM3k16ZlTypZY5h4kA1Tx4p/KbGVu2Tsw3/mwzInZQnp0ZMuq0cEvhP9I4OZI+PK
         YUO3dvVhz5XJ3HqgUI9GvtB6OPaPCf4g/3hbW1eCCCdBkF2/E7/Kay5aS1zBogbEvbNB
         L6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX/UiYRwMsSedPu7x4xt+eVQT5aOtDEoRaR93+D2xJX0udCcaSeUjBrztfG2BOsuq2xiW11T+Y+DQhZrWju@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn9YDJQHs4Ez+7FdPgll7ZjtoZWTzBm6AVjNttVECKy5DHXHUh
	RGXRebdhXszhi03fLJGLkKPfsTO5ePIszP59DBw/v3KcSGjFLdBMjzgpK+OSlQqSQucU4WB56bf
	NfsJa1aL4jk4bK2/V4yj6z1qFfLu5FWUt1/SxP6Ray7XHBkgZ0w0RUXByG6FX/+R1OE0e
X-Gm-Gg: ASbGncszMqTehsLkUMNhTzxuKdSjknIXlsfRfWHqnkvogmqJ9CiGifmxuPlvMS2Fpxw
	cCQzEnf1U7FeTZiec5wUullVJ5m3YIx6z04R3KCyRO+rb8SbLfrFytodL8QvZVncedTESb6gzBr
	eODygk3OmS8gcZieTnnwhvzU2EtwpiQ6o5WdHMLG8EXnPQ/guudtNpL6oT00vEpCRXsPUgqtpfv
	D/xnqb/66RevyBXEqhfL5HAgHcNMZxfDy7Og9gUrcqkz5S67krZio/Yn0TUBFmmhrf0R0pjZgb6
	WePIwAzZsWGHFT+fQ5iaFV8DM0HJJRMkfY+IVNeAgh8dHAnCMZbfcPf+NV0kboBYwT/fDKOkZ2s
	uO62KshPIcm4FeD5WzoAA/SIAj61C/X2bSg==
X-Received: by 2002:a17:902:ec85:b0:242:9bcb:7b92 with SMTP id d9443c01a7336-245e04eadeamr18308445ad.54.1755585407752;
        Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjWML1uqzguCXznXnAu0JqJOKHjx8VTTczeOLxTEHogZ2jjjwiB/QPUxpZhx7gk6jZa+sNw==
X-Received: by 2002:a17:902:ec85:b0:242:9bcb:7b92 with SMTP id d9443c01a7336-245e04eadeamr18308195ad.54.1755585407263;
        Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:36:47 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:57 +0800
Subject: [PATCH v4 2/6] net: stmmac: Inverse the phy-mode definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-2-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=2354;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ag43pockrDVtSatmI1WnRHpBp2uI2rmdqCD6gVEQcbQ=;
 b=Fcu73+RjcncqZavOSj+QtxfGgYLFkY5TAdyWRJtMz8D97y7ERiL7+MMw4ItBYEW6ZfIbO3jIv
 G65ah+bKButDKbO2XcT87cRZ+H7HKxJ/fAzmR9/uMZr0AG4GRu1e3tC
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a41b80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-JoBx-Ykr0mbciFiY24A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zTLPEEO1FKjqXWVyQvV9V7W0K91ntm6b
X-Proofpoint-GUID: zTLPEEO1FKjqXWVyQvV9V7W0K91ntm6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX7uPIUVbJknJ0
 knoE2V99oJJrrt+KoEN8oZFIoJls4lR/OmJ9LMNBp7O1Msb6YoIxPwvWKI6Gun1kczbLLPUChO8
 JD19B+7YPjNmQvmSHa7FpAuMH8rb4pmfFO3hBAx+jyOMkJFsyFe+tkXAO06XDK/h3VSULIAGmeR
 xfibDDtthEv/li8atGkxA4EENAnd4yXkjAwANcyLh04u2ebw9YLvX/brsjEAkhc3J7jSvhuZ9Jf
 zOVZ6opAjMr+oN623kv+mi4NF2PJ3bzPiQl2lGNcaLKaXcJh/BsIrXU0qR6QYt04AcG54/Bil7k
 OoN7WAJhdMSfZ3fK7Ln3OtFgvI8nUnN67nLwZW2guSt7zGbm9OTXy4zHjb0h3kDNfVAWoVmVFfw
 SUkeplRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

In the initial device tree submission, the definitions of rgmii and
rgmii-id in the phy-mode property were inverted compared to the
conventions used by the upstream Linux kernel community.

Only QCS-EVB-400 and SA8155-ADP platforms are affected due to the
incorrect PHY mode configuration: 'rgmii' was used instead of the
correct 'rgmii-id'. This change results in an ABI compatibility break,
but it is acceptable as these platforms are not actively used by any
customers, based on current observations.

Qualcomm expects the MAC, not the PHY, to introduce the timing delay,
and the driver is designed accordingly. This is due to specific SoC
hardware that handles delay and sampling internally.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a4ea72f86ca8..a3e595e3b1e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -390,14 +390,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	int phase_shift;
+	int phase_shift = 0;
 	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
-		phase_shift = 0;
-	else
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID)
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
 
 	/* Disable loopback mode */
@@ -803,7 +800,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (!ethqos)
 		return -ENOMEM;
 
+	/* Qualcomm configures the MAC to introduce delay; instruct the
+	 * PHY not to add additional delay.
+	 */
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RGMII_ID)
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:

-- 
2.34.1


