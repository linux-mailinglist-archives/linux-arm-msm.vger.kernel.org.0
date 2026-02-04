Return-Path: <linux-arm-msm+bounces-91837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKkjIAGGg2niowMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:46:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B80EB1B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C333430804C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5EA354ACE;
	Wed,  4 Feb 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OD8lMy+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu7m1fvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11D352F96
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226975; cv=none; b=meJ153pa/Wkl0PLiVJGdf7L3aU7q2zI8szJ3oQV2pdRJurCUfUZ6RVXrXDQhNrVoWKN787iLG4Nm0hSlflCMX8J9Xe8WBtMsu4GQ8syduhGHDrJDN7N+uFVhObGHR7Q+0Q1c3I2RHm68ARuwCZs/8oVife5BkN2io2Ecu45qL2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226975; c=relaxed/simple;
	bh=UwJBqVNlAoP/3rom+IEdULEsm+PmtEYbK6RAsliv5mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxfGATs9wm8YEI1JTsc0drmPexmoXTwUOY84HG3MaEy85SLZ3nxu4ckK9U3UaJITDOZgVSNZrkYcmD7x1iMd3Zrn20C6TriGZJaBoAZOblJPGScr7dsyge0AFP7iNiDkidZeSMaLVV87eXc0tlnicfhWJ/QAI49S/NFxLCgvdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OD8lMy+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu7m1fvL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIYCw794249
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VpOE8ZUKF05
	Ol33FXMw/Gy+drB/FcanggYS/wQ+QeH4=; b=OD8lMy+empsB3ckNcSehBT6fyHv
	ui3X2dg4qxSMSaiOMNBLjxJnYMUyhzzjdycNqQVMoGGy/beXDK2vz/ch+jl8aS/O
	ACK/G4eOOhOtjEl5xwqmig4/op3QCJ86AL6jfhRYHsQ7Jfr8ysqwu+i/Q3QDepk9
	RxVbraCS3RBx+RVkO3aA5ujrrh2IqhjswdBBwah3DUezWfKsP1OXGfEZ1hKsBgmg
	mEcxCtVKJNtNBl21PjKsd+0g69U5S/e17hRFGToDZkjUFP2VRzTMetWOnKYA1v6+
	cC98GwhGnW0nWAGtAHA4g5OjHW7PyNFEkfsky1Wlhw1bPLYK6vLuQhxdiGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxhgcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:42:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so2277895585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770226974; x=1770831774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpOE8ZUKF05Ol33FXMw/Gy+drB/FcanggYS/wQ+QeH4=;
        b=Qu7m1fvLn8tOyyn75IzqLSZX9QLCFPWOW8fgJC+zItSD/cuWog4fxYQcT1IfleW35R
         +UVlgYh36NPa4gQel2CTGfAAW1l+x3hO2jImGq/h4Aq6X4oVey5gKHJ+kxIyziIyckfQ
         aa+Lkm6G6+BlTCSjwn/LqRdPAWzN0+hb3QBLUn5MDjObdU47C7z+wFVfLQvKCvoA+Fsd
         g0lSYav+ddKnKN2a4M9SjEruqmqS7PI36BrSz2EljswuosSHTu7EB9MbJzgYaYv8O1VP
         +szCpu/orReRsW0B2iE2L9tkOL9RQ5raGdu/S2/AufOMps5vnbevHb8FS1MkIk5l6EhF
         n51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226974; x=1770831774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpOE8ZUKF05Ol33FXMw/Gy+drB/FcanggYS/wQ+QeH4=;
        b=Iz25xDPtjekqRtacZK8+OiqeTQ8G1/fGHGOHglHbX5xLEDEhoQAGssTMnq41V6sbYh
         WMq/kNM0SYz/+BOWkjlke10GW1GPvFJk4ri3rDd9eIHc5XfAkmdWa86IxJqMITUYF/So
         ZRgWKLF4HiOmAwdnh4GRwrMYn42WjGCR2EHssL2V6zMPSKim8sRZoKemr8nWUdD1Bc6j
         Xzx+JtCHuDK/KzqLjY7ikbxYsEWrqnouKoj0CwjQf5MxUAvw1uzHpEFnVYkDHo+nITER
         TBezmB1+QqxRwQCaUrUwPOt9JRJxIcfrGwQSFxjHtd6fgNMAUFFxtBcRtUlWjCdw0l29
         WcoA==
X-Forwarded-Encrypted: i=1; AJvYcCWBv2RI2GN3S3KR6izxwX99gJYhBAEYoce8buKs1wLM1mipCn9f4FOTpp3lGtoG364MtjYTNLXkwjQcCGWn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdo55cMw2ketoZqypkmqNd7CdFNS20rRwhIaFueWgw/ZjrjI7l
	1XOWemd6lHTEi71Y9a097L01RSOZWt8ZsmRCZewY+A59JeiD0ZLRZC9IFFzQLkmoCeOQsIaxyd1
	fNg7ZKI5H2n7TCJvW6m/blcgeoTDOooSIWlqHgMUtiwbWeiBF7/sVTcUy9+hgzE+4kjJV
X-Gm-Gg: AZuq6aJsusHBJZkeTJWxxX5LOVfplJrS9GdXzGNVRcKZ6z6wNMqqHM+t0Kxdhc82kzx
	xpu+qx0CC3ahWYykuWoYehe6Tt4LP3WJRyH9vAZa47TkIx5aMuxp0aIhNMgvJOcyrDwCIU1ZKxJ
	WKgmf0JC+VhP1nhpq9pdzINpD6aALVBzj3XT0GxVYMmnjXHcxZT/qfYmENfg7Pk2y2sTHfbZeK7
	OitGose3JRu9J/FVFlMmznXdUiSesiVbfj7gkiAQ0ow5F5cIuET1XTahrAeLdlU3F2Adc+7upxu
	Lwimnl/gj9NVSo8r+NA+d+oKn+T1pCH/vOd6rUMxyKQyMRz8Ma/ED1MAdr1e3vNk8lUnsfMp0Y4
	htq82mtsEP5+2nlbaUqlNjDCyPCVwgy2juUA35cJKrII=
X-Received: by 2002:a05:620a:4104:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8ca2fa5eb71mr469324385a.87.1770226974207;
        Wed, 04 Feb 2026 09:42:54 -0800 (PST)
X-Received: by 2002:a05:620a:4104:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8ca2fa5eb71mr469321585a.87.1770226973767;
        Wed, 04 Feb 2026 09:42:53 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm959985e9.0.2026.02.04.09.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:42:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add QCS8300 LPASS LPI
Date: Wed,  4 Feb 2026 12:42:36 -0500
Message-ID: <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=6983851f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6qwD5vHFcjQxT5bUl8gA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3l_naIcZbk1RV16pJdUKdUAyGEiPc4Jr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX9pMhf2Dpzafx
 BE2o5I7n7xHhMTalYWfiQdBjE5sVxvmmuea4cUswg7VWEl55vYJ/y1m0qAEr69wha7LMTiNSv9Q
 e6C6gNuL3WAT5ZjIL0e+wQ0lOzdBOcHclZRWsSFE3dozV8JjOoFqkk7Z87WHMEhfHWWsVipe3+d
 7c+OGIFl2Q+hCPYJV1Lb3006e6VNWvBMC93HeXZ0H1GGVJ2xHfey65S5NUg6e6i1tYEFQ8j+hGW
 qiNOOGuOOtvju80zoLBRJgRh3RdIB8xmNwVPSzcfGp+eRn3vUHe4LkTAAtwl8dQqWk5O81GO5Uh
 gXEnv1idkuNVIzepZcRsOkv0X9W2YdqK6jSytsxFBY6dgy6HZOWbLPb4IZGm3Ax2gUXLtb4uwjW
 m8n2Hf7qhHpys/lId7sX+gtfmpkdMLzyQ1Fl4bXXSJFuYry/jEVRBj+D7HnyqsMA4M3oxXVOv7l
 5bv2VRKu5+xfqaDkaIA==
X-Proofpoint-ORIG-GUID: 3l_naIcZbk1RV16pJdUKdUAyGEiPc4Jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91837-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23B80EB1B1
X-Rspamd-Action: no action

Document the Qualcomm QCS8300 SoC Low Power Audio SubSystem Low Power
Island (LPASS LPI) pin controller, compatible with earlier SM8450 model.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index e7565592da86..c81038320c35 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm8450-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,sm8450-lpass-lpi-pinctrl
+      - items:
+          - const: qcom,qcs8300-lpass-lpi-pinctrl
+          - const: qcom,sm8450-lpass-lpi-pinctrl
 
   reg:
     items:
-- 
2.47.3


