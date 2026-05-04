Return-Path: <linux-arm-msm+bounces-105664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B5TDNpV+GnRtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:16:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD74BA0AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02197302410E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F3F30276A;
	Mon,  4 May 2026 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxQZMiJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rk3/En3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F6F2D8DA8
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882297; cv=none; b=isypiIDqN+jSrHcKRwp4F34Yr7dohh1luiu4j0kvvq5o4Sic061zcB1aPmP5TkIARIn6NlXvOCIiGqx9+3WS3kMuxrgx3Z6DIBURmZ0yArYmmuI9WrlF8WQ9T6bXiIXsX42C+GjT/w2r2EEqlNqlb0CqSS9DfeHJFzOiKd+OX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882297; c=relaxed/simple;
	bh=Fs8aw0GwDMxzXF5DoZ4DIJuh1XJ4u215nDizum5b5vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4SYJ/tYakUfvMaY3gqPWXzhzKyfcAWvQ5YmUQpuG5TA8SWeK5x2lFAWG4/Jcou1HsAzV3Zlto14DbH3OO7/rMIu+dNcsShh7zZw+YpR5NXEHcNaSL3rAhFWx9o9vCWNc6hplB8wTkg+5nRBqUXiuGfJLbxJ2faHsoxRXbufsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxQZMiJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rk3/En3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DBtv483769
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2Zx1VURkpdCX5NdltAMIOg0C30qagOXX/1o
	D6d6vHWM=; b=FxQZMiJzE5cyYy55mTKHXiVB7cwKsRMm8jmRWrBbLUOl9eSi+kH
	yAFdk21CDZagpxthFXFbZHuKNNJ+E7qNmSUEXrTrKMN/9f2AMY7rO117ODLA7+8N
	nPBtJK4wzE1I0+kz1TkzRqCYEZWl6aT7D9OwGxvT7PBQfdD/2+5N4y/HXeTjuqyk
	GlZzbnrQwc7wpkEX+8+ng+TP6SPa66irpTcbMjaOrppUjSY/m+Say/rLYgc/T4+U
	HsjdfNGbD+VR8M6TpRh2vFTcIIIqHkmEmVFl9g1oiuqKvNqMVcrS31nelQOKcTz1
	9YRvMbTVqX3WMY43w5EhfW6wkMDmTb1mwfg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87sd18b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:11:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so3219079eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882295; x=1778487095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zx1VURkpdCX5NdltAMIOg0C30qagOXX/1oD6d6vHWM=;
        b=Rk3/En3TKN62BiP5B1xVaiZIdWjJnjAKYHJhdT2lJz+ecvS38RLzefw/rc7ks9wsqB
         CCQZmi3RzUBgY4XJjiORsrrPcoEoCg4FwsXl9vA7mdfjome/HBmOEZlbk9ek4Y8o5Qzd
         RDkRkkfgTLnkcW5mn+F9xHGXG67RF6Q5Px9Xtk7cwQfueFPa/6BwiJ137lCpRF/4252t
         p0yH+VXbBjFtmNh8e/pTXeAazFcaGLDtLzimg7Ct3r2qSQ/4OSoojmcymowLHIkj2kmD
         9jPbe5xxeMx9SbKCpy93BhF+IqWi85wtWj4CRWRQpm1b7Dyr5lFMx06aF08d9kRC/Rwo
         SlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882295; x=1778487095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zx1VURkpdCX5NdltAMIOg0C30qagOXX/1oD6d6vHWM=;
        b=ljPWon+zQ5Hjarp2uOEmPcX5UXP/OwfDuihj9v3NLxjF+ZW0jG1Y9tv7wN0nSXnhWE
         wGzwb0Csj5IfEf9cDXm9IQQROR75Me1tEbcITPqzxJMRqy747WfLNCni2paqgvuNOO92
         IaQg0FZFdERhFZEibP5vIhbKy2CA/Tcog6BMZDCNHg8yF3bjgoEnfXWLF4uJ97J1xN2L
         AXs6goIeDFlHBywyMllFImO28411Pg/fIYnP04CtyOr9LyzSrHcECczMn8pIoGAs2Afu
         Nhog2g5Q+ATM0IOTk1eOl0HdLnWystUpHbAs6JzmDFNkY0gro5UsHl2cxXJ63X/6Sw7K
         AV0Q==
X-Forwarded-Encrypted: i=1; AFNElJ97QyHKG4COFY49uD44JkvoojHevtfUUSxpbSQ78UPukjbSW9C0NlZkzhtrv+CYT9ZMvcOKN4dUWEWscho7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGL8DSU5B9uCwlqHmrYE8M0cRn3voGbic4HcJbmJ6Ix8kV6HEO
	GsjpmMzl2zsxgEai7/qC1xOcdM2xlSC3BoGJ0WA0x+Szzw1WJN2ZhfVpAmj33XTb3ULs++FkcAc
	PPY+82buvCjSZrxPSqXrLTkgOtiho71LYDv/Taw8OGDhETRd72OkLdo8En+bkAY3YdPp6
X-Gm-Gg: AeBDiesJMVpkXQgWOfsrSQG42dglns+j48arnVM3dACTBXE56XlyCTJPczGjlcpWWfM
	/DPs/RsEaZglsB2CAsv1baspZYkTQhql+JYwCI3SePabS+SZzyjOKhPxwPFRrmDtUvn1g/ZF1pm
	Cw8X+8OpgxFFN+7NVsKwQnATuFIE/eCAZTw7/icq1K3ezLzKofsDj1X3MAtOxQIaYN4SxoglubF
	nOQ0M3g8YGgL+nF8y/TYmvp82PNtxQoTg3wX+PO4QpFU3HizxqbV8JLEyHBzkdksnXBwgjMSPiR
	BjDWJUu4mVMTBYJtazmnz7fl6fdmQjU1APUO1iCddq1YXEbDbNnDbyy9U3jw5++IJ3MJ50o4fpW
	Z0yFabuIjJCOowYNkTaJ9uknhIYPVUWKtINgc9CP2pSfXK29ql3e972nyQEC75t9kGmaY1TD8UD
	NbfHnioO780qKCp4I3
X-Received: by 2002:a05:7301:5789:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2efb09f2b92mr3478902eec.7.1777882294987;
        Mon, 04 May 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a05:7301:5789:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2efb09f2b92mr3478890eec.7.1777882294391;
        Mon, 04 May 2026 01:11:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bb60811sm14760444eec.24.2026.05.04.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:11:34 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon,  4 May 2026 16:11:22 +0800
Message-ID: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B_fJe0cefgSQATRGBITegLcn1Tdr7RyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OCBTYWx0ZWRfX5f1Zx4fIAeRr
 Wz9KFMzJ1FGkKcbUgfYkek78dX/+gB/wiNrD1QaAfTR1lXr2mvQqiVTjuIesvYLWqc2UoGKKRDX
 DW4hfwOAQQK43+W3gc92ZHuJNfgolpCZnLqIiTsfOg+bc0OJZHqi7moPrM8CkZkh/i1K/4O7huj
 c+oHob2OLtafTk3+7afiP2xwLJTBY0DSt2wx475OhWo7ybhd4zc8dymVn8st7WZcpojGSJGstBd
 +hXuBQIhp9q9yyQwXuts4rUtMLwnetR5V2+Z0wP3pVekdNPRQrnOhB3cvg8UeAhQlKZaust81mS
 CGoRk6GBDpE1I/75ySuj/jcaKsBMDwh5526yRJzuP+1GSfCL3/UGXY4QRGYQAeYMHI70FT1ZflX
 pj9CTyI/1t2FJzzvLjp61RQ0ZtTHag==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f854b7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lMbzd2IQPU6w-k6tvTsA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: B_fJe0cefgSQATRGBITegLcn1Tdr7RyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040088
X-Rspamd-Queue-Id: 83FD74BA0AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105664-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register (TCSR) controller on Qualcomm
Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427012116.231226-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0


