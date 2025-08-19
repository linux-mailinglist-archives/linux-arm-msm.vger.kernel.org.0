Return-Path: <linux-arm-msm+bounces-69662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7349B2B9B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993CD1753ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB0A2848BA;
	Tue, 19 Aug 2025 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJMZZ1+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D126CE12
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585430; cv=none; b=dJ6m/Xi4kZLekHZ7CaeS8LNbZltn+ldU5k3FCsZpUiXgncUTJcEycN8e+xC2JFOp0VVh9a6Iigq7MvQbN1OvijONpOaTZa+jH/BkMDV+kNSKPZwhOt00xQKHJpPL1cZfW7E8+mL6Wo7N0zNLtjMpNydYydBlP6B1dxd2TzYZ+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585430; c=relaxed/simple;
	bh=VJbvSPzR7nYekRfOxydBQiO6Zxq0O3MtfapiK80ggjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNUzhyOXBhidO6eoU4MabBehwT8QCPiJVeuzeRDa499BbuYDJfSbjhT2armWNhpdbKcb+Fn9YasKhj3uyHe47Ix1tnVgQrxBVZmHBtNIKUSPkp8jXnqG+LKEbDrLmgvOEy6xhUxkP16AH9JfOwnrgqqUgIISl0ntD3JnasWRR0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJMZZ1+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J23f4v023991
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=; b=bJMZZ1+VRZp2ZgcF
	/LByZH8rEzTSngp8mNSOikSd3O0NTWP7wfWanZc2E9c3jy1om2eHJZJMrGxuYtXr
	YuN+iMeXcG9uIFswqVYqlkvUZexSZtAr/1lJncV3FXMYGGZiXgC/EPnOj7UgUjYs
	UmYMsxEoNTHDO8Ubt6ON0jz14hZSypcKSoqg8XPRRR/LiEN8/mMTXzcZuPmkwxaD
	aCC/9TJ3DVSsBwAoyfpEWXce3PVxGOdqTzjSsB+W+B8qWV9GZGNE3RQStYNQsB9d
	P1GlXir6ATskn+L59jkb9WfCjNZ+cULABOpqolm6r+CV8LqQ2So/6MIuH6OzRJdy
	iZrhpw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyfft3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458297be0so115904645ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585427; x=1756190227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyiKtoOw6v5xNC85LbQnn0O181F2eSfm873V8UTSEA4=;
        b=MWIxNsZVb8C6p7NzfDpZr1gKfyGxifGxn2v1tCrKDp861OLjF5k5ieFTzYsENvwDyN
         mvoJTPogehJWOZyvolyoKteTJLdDpejjsTLbmu1w/gVjoDQUHF6S5v+V3sOvAeGbRy63
         a/EK0SCJoc6ifb5ifVkbj071j4v2uIO5oV3mFqgjJEiDwgbSWVopdfBvprjlmMu2FtDV
         kViX/Mc8IsPwly681GiICYD+9dzItmK/TkzzWt49kRS5nUV7TALp2W8XGORpSQu++6Y1
         UCyhNeJ9Yi5FWn7iMz7RGs0h7teBDdxwAFZQT9BXf5MGokmlS7OHNLb8e6hEK5YSNzTU
         G0dg==
X-Forwarded-Encrypted: i=1; AJvYcCXnOZtcvtIO38Hu5NFdmkEs0hdOlRAgk2Je+0GTaFTSx4ld+o3UsqazuAgyJfmz1U/QO1YpZCngyeO+7qfM@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmbNkfp+U1hiQtaU7eZx4WnbxrBZeoVQvwyq/SEBqW1/A/RWw
	QROQijAHSNU4qJSxw6NW7yWWugJsz4H5PB8Lt2RsIKbcQiuxCFhJTOEFhaNvzWcypMNkUvppg/W
	RoIXz/+BRqxGg+BcOzh8J1SJkoGYXezF8l73/hom88HJ7wv78FPGMxShf0ltita4rARc5
X-Gm-Gg: ASbGnct4gPoPy/z03KwRaxV0YpQce8PcbjfnAyBE9Xa8idRx1sVT1x9+7S9QECihmA+
	YF2i3QnzIhJtYu6MgJDHv3tgPYsYe36KDq5kxJGinv7Z8ACZogkj7hFU3f/VtdjNoX1llZggNeS
	Au1a+t8fgXPpHI1Wbbxq9GnFD53x49hCaV+xyPre4HUu4mSiE8wiZWcCq4QRRGcjtNxFNM7S1MX
	EgN64NbXzU5RolaDEocrdYQUF9OR6w2FQzJaw5emWv0SubPE+J4tjOFBpEHXpK/O8Pl4aUbuCA3
	uyEG0rEjBacSN7q1/eGZ31BpO/KbM1RmcmyiRjSz6Iy6YnGfSO9DzHMDzZy45j7aFANDezJfJvo
	S1y2Jb1pTcdzx+wrZVSFs9E4zeV8TITFLrQ==
X-Received: by 2002:a17:903:2acd:b0:23f:dc73:7798 with SMTP id d9443c01a7336-245e02aa607mr18391695ad.6.1755585426624;
        Mon, 18 Aug 2025 23:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEazJmFdGaBIAHWXLR4lCSydXu9MeqjV3bEY6sPcOpXqB1mWNgIGjkbWAfT3wdTKq1teGvRyA==
X-Received: by 2002:a17:903:2acd:b0:23f:dc73:7798 with SMTP id d9443c01a7336-245e02aa607mr18391265ad.6.1755585426036;
        Mon, 18 Aug 2025 23:37:06 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:37:05 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:36:00 +0800
Subject: [PATCH v4 5/6] arm64: dts: qcom: qcs404: Inverse phy-mode for
 EVB-4000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-5-5050ed3402cb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=972;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=VJbvSPzR7nYekRfOxydBQiO6Zxq0O3MtfapiK80ggjo=;
 b=caBB0fwY7GcFvoMDwpRbiG5mbkhc6TVqdTkdOaZN/liBSLS7pCblke/P68n8ZiPuYBVZRQN/f
 BsIYbowh9CUBMJa+bW1NgLEsQ7AKwPN5rzk5oXw7hs1C185gDkhyaDe
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: 4EhqJytAp9LL3s-Uz3UOqjUi2LxEXsLr
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a41b93 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=78Yoz-F5aJHhz6vTWxYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4EhqJytAp9LL3s-Uz3UOqjUi2LxEXsLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXxFHY/SGApooI
 u9AzbrdoMmEBVGPMuZxFA2MFevTp0fpjpElTe87ZUgYuhtbRp2f4AhEIWizTKEDKYGxBeHW/sxZ
 PiIr20c31ZW+z5L/XKUct3ZLWLZscGe0Ojz3ffB5OQJ1VXruEVJ1GfCAPaH7U3qxMQrnTs4jzGk
 EqBFrx/rhWzJRmmjDJFyNPPMUrijp60APrKgTwUDiJ2hP7ZQttwDH8l55CzwrZLrwTMUKfl6X5c
 ayv+ryLKP+5f3mMC+WT8tcOJz4L5i+4D5zwKn3gsrf/LPYlOKgBRR1NmfHi+Np7pCdudvq7FL5p
 RoGV7KsngeBcxThMP4TIQxjt1y66UjbsCTldqM1MLRbl1PkatrkZ61hABXTJTE+nx7LHq8IYATJ
 ApmzJXbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

This board expects the MAC to add the delay. Set `phy-mode = "rgmii-id"`
in DTS to match upstream definition and work correctly with the updated
driver, which switches the semantic handling of 'rgmii' and 'rgmii-id'.

Breaking ABI compatibility is acceptable for this board, as it has no
known users or interest from any users.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 358827c2fbd3..a3e67e83f69f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -25,7 +25,7 @@ &ethernet {
 	pinctrl-0 = <&ethernet_defaults>;
 
 	phy-handle = <&phy1>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.34.1


