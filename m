Return-Path: <linux-arm-msm+bounces-85483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA933CC76BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E33630CAD0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6039234E743;
	Wed, 17 Dec 2025 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hvzuk02p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018B342536;
	Wed, 17 Dec 2025 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970954; cv=none; b=Qg1fZ1tpxdM0/UrbbeRA3ym3hhDJIB3FAVVn6vpfrHSmSxADuxQZansAnTMFR5gIp2dpdOiQrqaC1onV8zVhxLLnqPNMs5Rqm5r8x61FeVkgqQhsCzbT9xvPS5y8KcCFgrTjNqTFsBjuwef1eFOtmv/Vix9QY99+UCVt06r+SbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970954; c=relaxed/simple;
	bh=5NqklE43HWDTICJw7orEOpHDsxsRul2la3vvba4oE7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ogCEdtPbJtegn0qVZMX2HLQxUoY0yAmx6aqAHcs4tBMySXYcwSgIpkErPv+SS7fq0Y5/MICzBMzFpTCod6b/50rrUY1BgXMwEq39nrhIv8WQdzWAbLXnl9XJwW5TErYuyJr3fQYZM8Jx0aT+vRQefyrvXMDv2orlCzKZ/HTDZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hvzuk02p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH86ZO51946921;
	Wed, 17 Dec 2025 11:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mXzkP7MO76PmA7jaC7uI4ruDr+bcyfI6bJu
	GlFeNrPY=; b=Hvzuk02pxdo8aSvHkpxbJfa0mspv8FpeoaZ4m6hiBbeMhUXBTj4
	ZGH4iUk6jdeah3ERLXZsdEYcmffXfJAVKPdEtQOnRkoy73jtFX16qsQJL0MM3vgo
	ZinkSDP8nYQxZBfLuqpQlEFA+DMqg4q5C/qYYMEKWjA5oodwnFG7UYzBf82IFBgT
	20O+lVQuaJV1d3Qdt+nNQ58FNA6M2/6KWT8/D5VpwH0g00l7OuSNb/TLMf5u9wvx
	Rr98yxUJIU+T3JuVtiN0FPVgmo4RIpVmP9sb/SATnxNfLW6gJjHpwLS3uVse+cjB
	gn+7HRmNyc/qPiHNnvHAWR5h2L0aECzt2Dw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa8nmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 11:29:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHBT2S7016648;
	Wed, 17 Dec 2025 11:29:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b3t8c8mqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 11:29:02 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BHBT2nR016638;
	Wed, 17 Dec 2025 11:29:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-vivesahu-hyd.qualcomm.com [10.213.96.223])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BHBT2Vt016633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 11:29:02 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3937004)
	id 659DD58F; Wed, 17 Dec 2025 16:59:01 +0530 (+0530)
From: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
Subject: [PATCH 1/2] DT: add bindings for QCC2072 Add DT compatible string "qcom,qcc2072-bt" to yaml file.
Date: Wed, 17 Dec 2025 16:58:49 +0530
Message-Id: <20251217112850.520572-1-vivesahu@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: c1izbWdqL7_RZ8G8e-F_ZBTQsEOV0w1J
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=69429401 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=p7UfVyd0fHF4_Exo6hwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MCBTYWx0ZWRfX9WU7dSB9oMhA
 nIdz+htRHr6khiwm/5TAdc5hpVshp5kymIu9hbQOEuXOn1w+sH6uQmqToisBdfzRvlkGUjytrHv
 4zGu9+kxGbNTRA3XH6LlIv/DXzvnUltLTYDxPK+g7tvdtJgt+ZH6jltKCad5hHAy7CzMDUGdrXg
 G9dSqQydtM3eahK0pPmM4nOTTI+xX4S8IoV2RTkRIM2jrk2qtz6cyo1AMSF3Se4D745z1xdi3Cc
 fqZew0XkWcaHu6fsudoRq7dHXDWFjqyMnIbsuaB6487dJLXUXuRXy48kywchYypLFbn9RGU2lNN
 pktrwQbKIv5F4t2SGCxxaAIjkfeuUvOR5AY4w0U+v+i00FHTLnhrXfM3oDc9yCFiPsIFtjXLe5g
 AmeTYMWTM/tRlBl3joMl79UqFmGAmQ==
X-Proofpoint-GUID: c1izbWdqL7_RZ8G8e-F_ZBTQsEOV0w1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170090

Signed-off-by: Vivek Kumar Sahu <vivesahu@qti.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 6353a336f382..197248d6f7b8 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -28,6 +28,7 @@ properties:
       - qcom,wcn6750-bt
       - qcom,wcn6855-bt
       - qcom,wcn7850-bt
+      - qcom,qcc2072-bt
 
   enable-gpios:
     maxItems: 1
-- 
2.34.1


