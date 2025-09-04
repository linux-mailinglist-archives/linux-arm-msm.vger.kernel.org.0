Return-Path: <linux-arm-msm+bounces-72100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B124B44331
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D05B41CC389F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642C23126B5;
	Thu,  4 Sep 2025 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPrOq2X3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1983126CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003989; cv=none; b=bNhMiStSXmMxmy3/60Ge9sBYmhWZzIn87r84Pozw67TnsTzq7ifhI2vmiPAk88MNYpw1a4RY/Demx09nBdgoKT9rAhF6feGNy2hxIXFMeEVuVezN2D7UwmOHIAGs9uQhWqD5dWYIyCCNEc+py+Afoc11vEsO9pp2fjCuU6UgAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003989; c=relaxed/simple;
	bh=HhL7R2sKeXiIqlZtecSPlVNqig495+ove8KywGSPyYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTZvPooJ7NZqeUUZ3Hc71LP0buXhFeeFXksySnVC9zEPWgCEy5AfBAZDM6BUOp/DKiY3PdmYBpuKZ2XSlB0DplYirJTfmoAw8AgaUUqUoZLoEiOmWuSZuNvmZOp4zmIMblXqNYYBUcNhN+yFDnVb9J/kUsvcyIYgJwEtOsup1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPrOq2X3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849Xb6E032532
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKDDTZaIKoToqk8fUCVl9/PoEAVOsBabIY9X0ZzII60=; b=dPrOq2X30vuUjcqA
	qdDU5SBWGN61IJcp1GcTxGrJrHDKbP6MOFgss63MYZeZ8rrALkf/KhDPmwKE+3Yh
	AtPm1SlOx5XQhnSm30J60csq8lbT5MLJrfC4R3GuZHxqPD4k46HRuyD2zRhjT/Bg
	hfg089DB7yhUoBn4Y01T0SqPe6gsanl21ZNXCYqsq+1/QWa8UH0/biBhFqKEEIgM
	ClWfKbAQzX6scc0A+49oUPLSQH0iy8BM4lSQpQsGDgs2POXije92ocGphCeoPnfm
	vXz6UPwEkj38w2BYnKbxzluW1x5kFUy0yH9vrcEESWn451gi3D2vrwXU0v+KfRwG
	OvvCVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpgbx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:39:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329cb4c3f78so1195060a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003985; x=1757608785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKDDTZaIKoToqk8fUCVl9/PoEAVOsBabIY9X0ZzII60=;
        b=T1VWjvz+HFkRzt1KTdsFwIjMlzqwerOxPgRMSdVBOjBI1dX/7HE5qY6g1sDdlrXZv7
         E1++RmEV+x07ASu7ZFuSmpm6FOFdARctpYBM/VaHiT28B3qd1YY8GuB7cvO8Npv06yVV
         CVGMFaZj1dJivf9hvD51E4V+gsu78BclML7bmzOf378PRp103T/6Yqu2V0EqMrfjwsNw
         i+6IKqfwaAIedkHViuMpBkRdKLVcn9A0u8HXU2iyGoW2o6joYS7sU53lNhZybYGfnb8H
         A4NZn4otQ/cymmkyg1zucHSaXfQUTkwv6PSAMwRcrh/JCcwnHLvPngxulm8jQPIxx7bw
         mB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPol8KCJvTo4c511iz6zJZMBbFQOiHQ9vnHGz8/zCMdhFBUQrn/bIGRDfgiOPoMdplGFyslO/O2z3YDUxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YztJnO2jzWbSm/PN9MhfeNFZMv58VzOMGxlAiCweiBDOit+4CsW
	TdzOerw7yhhm1N4gl/BHWBf5jbeLmYRUXaZHq+1huGABCtbCl22sF3qvp1iceiurQ3u8oMkoWVO
	A2wzCal21XPvg2IWyDXQ0WkBGyr8a10IAKYzVil66UeXwbvMvEHbL0mn86z1AxfiEPfG3
X-Gm-Gg: ASbGncvPk6/X0cG1/aM7QQ+JBCfcTheaoLjplsFMKe7z1SeG+mAy2e7feiFf2/hgMjS
	EOxlyj39Ff58ewRIyZ1qTFSKuv3yaFpKvKKhDNTjv6X02NO8E5lSdHy5XmnihoHNKyCB+BFtOTZ
	qr6xOUbcsHOTQkTTjy9ODxBLHEiuvNCoCQaU2p+6dopcdb5ZpQei7dmzx87lYHlCU9Dmumwb0wL
	P1Cn1mseny25R2tTqoqfVUaHTnVZlrBtfz7ODLLHSokRkAuK/s9MJEot1+8I9oRn+n91aQZk1bp
	zfQNRQP6C4YJUXuaJWcrWwP7vndqatbB3LfVVfJn7/MwdOine21Q7fgVUALKtzoi6z5X
X-Received: by 2002:a17:90b:3c91:b0:32b:6223:259 with SMTP id 98e67ed59e1d1-32b62230456mr7502194a91.13.1757003985494;
        Thu, 04 Sep 2025 09:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcJGB1HfigKhlcseZuGD2dtBOZEFUdCtR1Qdkw0I+kOZzDpeSQstZ3kbfO4q41mt5kED78NA==
X-Received: by 2002:a17:90b:3c91:b0:32b:6223:259 with SMTP id 98e67ed59e1d1-32b62230456mr7502162a91.13.1757003985074;
        Thu, 04 Sep 2025 09:39:45 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:44 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:01 +0530
Subject: [PATCH v3 05/14] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24C256C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=724;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=HhL7R2sKeXiIqlZtecSPlVNqig495+ove8KywGSPyYM=;
 b=bgkk/VscrfaA2/hD0MOxPzz3j6BO3GCVxc+5R4gTrIIsO0E6coSAdgcyTz97r1uWzih4pZ74O
 0uVXMCw3Y02AEkF2PrgKKFK5vv/0lgO26zSG7N4OT1QRJWv4W77TVKT
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: qc2KJmprlpOUp35_p_q3DM0u7ay2nwGW
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9c0d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Yg4z3stHfqcsaZAJ4NoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qc2KJmprlpOUp35_p_q3DM0u7ay2nwGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1K5Z9HI5LxM6
 0LZKtCpF2Fb9gqtrRIv+l1GhPKASj8Yf/KXdMrw7Bd4lFGQlW8KTb0k/XcnrEt5X2Tz2mC8ZXuO
 UGiSp2nKFsgkONDYoBe52sNhs3hK9yP1zsZYa3av8A4fC0eBseHXw3u5hNvzhcUwH5a7gOGDdXe
 pZOtAaAVATIPBmxz8fhHN/Z7UZFYFgyIQur+mcd1AU7IsMXUDcWaVzT+abTFJLkrqlTrFPtjvHl
 FmQf38sBDqybZceuY5WK+tmrXqu7AfjbrfgU8auYNl+N9s78ibd5tx5EPCI4BHYPApEA0qUYmI7
 4i8BSlOw3qwuZ9v7RBDYf2dH3I7SALz0vGNWZ7lIu4p4702XlY4onqma6+fpMQE56Ek/X+4NVKJ
 9KGc2qZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Add the compatible for 256Kb EEPROM from Giantec.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 0ac68646c077..50af7ccf6e21 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -143,6 +143,7 @@ properties:
           - const: atmel,24c128
       - items:
           - enum:
+              - giantec,gt24c256c
               - puya,p24c256c
           - const: atmel,24c256
       - items:

-- 
2.51.0


