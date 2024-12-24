Return-Path: <linux-arm-msm+bounces-43204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606E9FBAAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AABE7167421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15111925AE;
	Tue, 24 Dec 2024 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gs7VcH9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08AA1B0F01
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030014; cv=none; b=onAHYKymvclS73LCMoTGJVS9yuo2jtxZGpftNOFTnkQqv2ctm7MlCd2TlF0xux0ss4nCKQG+NXSt66h47DJc5l/LGZlZFv3Gw5n4Lx+8RjlK7/gKx9CtZhwWtu5Ioue1RyxERbF7vKyYFO3eppbDhXspDdHmHJASJ/QtWW1TJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030014; c=relaxed/simple;
	bh=qGpWgIXL47YBUsbnUQeWjPLqABrak3lVm1Q6K257iLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OUsE1Hgo6lLLxYbEAnwQaRfYRwfK7jAkgodD/1vkhceEmMV3pJlCNwHp3YL7NUZO8MoXvpEbeuUbr0P1m/D2apsF65sOjpOicN4rp6dV72XsvX+vBl2Pm5JScVWy35lW2+dFZP8NO+maWHEfcyRAUsLOActn6O9vvfJSyATrEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gs7VcH9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO5wbGw025581
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=suI55uQNzGC
	SiQih4YuTNalcRhTRpBC18Rzl3f7fUjE=; b=gs7VcH9cb0WKlxVuEkk6YPCR+th
	7pgopASOK2rGRLaX3o+HJqmIiptGf/hxMHYvNK8ZMfLw1IjDBtGVO29BAc/MO2Gq
	w3TAJlQ569k0F2WsNrk96ZpGFgu0VnJfQvEbxKnoR2hFoz01m86HR3AP3ZBTWJ75
	0R3EWaaJQ5TU9qVwFNLQwo4m9OWnSv6UbE7GdxMiTBfNtYtSiyPTUo5s/X1cPYOv
	VekT2DG0y9cv+NNGHvPxteJoS7O+Z6iGHxAsG6JHvVclYycP0Vvp9QuVB84fD32q
	2MPL0GLymdNNcISV37olrTqVUZLY/CXnOfbWUHo/bSh4q+YwnvEbgZKsLYw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qq9hgqdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:46:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso5263846a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 00:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030011; x=1735634811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suI55uQNzGCSiQih4YuTNalcRhTRpBC18Rzl3f7fUjE=;
        b=ThZ2MU6G7jNaSbewEjDUpghLX2xom0J30Jn66LN1UKuPQ2dqismJ/HZaVWpgNVPqp2
         V8vubpHczK4h6i8+Y2P24feZrcwX1A46EQsQrHZaSlGj0TyDgN7PR8b2puvxcF3rk7Nu
         eIHs4zjxIzC9nrGPRIZPIVRQrDW/inJZGPvFXbDipFw2UGxSNxCbCWyxDGWW8T14Gmws
         jJr6mfnICcEZYIAJQP3sCwD28ET6ZltwEVnhObO0KsYkgkMeesBqjSr5mjN3ZJnrGWBQ
         PyrsCtWiH91rFE32iyB53TP3zD68AU+WSffo1JFO71Se6/PzdS5bPztS8ZycQFu6Mz+a
         2wTw==
X-Forwarded-Encrypted: i=1; AJvYcCVIcMWg6wK4k95PTLM5EVshU70/rB1R4ACeKpWjStuMc07p/ugMbiUi4JbTc921287pab8ICsTcAdiogBiZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjsqJs9NQoJpIjJUgJKoPFdWQpxnt5VFMA1fH1Fjp14f0xh0RW
	xEI4HhQ2RCaXGo/8HXrkVqM7s/ppx1fNm/iR2KDSgYxuCRrQA8dgLfUt60mtR9wpHBfOLnakYkP
	/gZ3V6vX1Wkocir0JGtj9R/H7eVtETq8dBRJqHIz0aXgsK0cTl3n8wgr7W7SsESb9
X-Gm-Gg: ASbGnctbbUA3R+89dBTPN2He9DzjF+q4k1N+A6EbHs9KU7nvAysaC5oiJaH9lBKgx6f
	BdT+f/SxRT4WdcmbA0nMJwD+7BYfwX47sndy6ou01Rvh8QhqWOz6pMwEXkXCYlTWr3vfR7qiS2p
	JYINw2OBzdxon6h1d6Qi/I2kms5GfVU1SBDyB0rNeiVIPi3NkXh9ZLdr2iUsNCR9CdUYIASaWdo
	ZNgtSp5PGskObpSugupmYskzFCENCUYbABS9NMzuTYdvJW7RmrS3NK2ydRZA3y49ubYNu8/sOFN
	EW5F3hjt1bJ5p695y00=
X-Received: by 2002:a17:90b:5202:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f452ec6a53mr22070963a91.28.1735030011252;
        Tue, 24 Dec 2024 00:46:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0+3qD4z7RnyTP4+sb8Ve+3MnRYVWj8h/D611r2RH3W4G7mum8I0Hgbn+yFyukzggbMv9nwA==
X-Received: by 2002:a17:90b:5202:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f452ec6a53mr22070941a91.28.1735030010895;
        Tue, 24 Dec 2024 00:46:50 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f692fsm85471195ad.216.2024.12.24.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:46:50 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v3 3/3] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
Date: Tue, 24 Dec 2024 14:16:21 +0530
Message-Id: <20241224084621.4139021-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
References: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0Dsjoe8wFRt1ZOVB7xql2pSt7AlRmU3K
X-Proofpoint-ORIG-GUID: 0Dsjoe8wFRt1ZOVB7xql2pSt7AlRmU3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240073

From: Krishna Kurapati <quic_kriskura@quicinc.com>

Provide PHY configuration for the USB QMP PHY for QCS615 Platform.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index cf12a6f12134..5e7fcb26744a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1124,6 +1124,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,qcs615-qmp-usb3-phy",
+		.data = &qcm2290_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
-- 
2.34.1


