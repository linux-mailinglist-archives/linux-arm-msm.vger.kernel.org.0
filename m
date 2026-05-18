Return-Path: <linux-arm-msm+bounces-108207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L1nGBUZC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:50:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4BB56DFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32F29302735C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEAF480350;
	Mon, 18 May 2026 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLoe+VM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQ5NjmPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A920C42885E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112205; cv=none; b=Kt6KXgGcB5PAALaKH08vdc7gdlNn7z9+pvJkLuzU8j7LuA+1rIfqrTrWaApPtuF1IbClNT9l47mexmphm0Soncg7WCIQYzNnx5KwfvQf4zxRZh3ViT7urOIaVmSk7PIBEgNBev+6or1pCYvoLPFi1gc+2rlEZmS35RFYlbgPCro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112205; c=relaxed/simple;
	bh=AlGBGljytiN4hDB9oPg2R7DR+x7S1E5bboaK2Vh4TXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DChPqei3eqKD7ysSMw08sG0lwPkdrVHyZA9sx412dh6hoCXk9OrE9B2Ldy62dOIUCsO/RbogfMeINk6dvVFal/sTlQ0Bc/0uWknCWSydRKyL49HnMpup5s6G+C+V77BRyUq+aZf/wUn7lg3XA7iiBm2I4JEArTp7zMI019iOWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLoe+VM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQ5NjmPb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAolrc2082390
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CC0Pys7yhh/moaCo/yEEim
	J2CkQSGIL8p0FbL7FdrhI=; b=mLoe+VM3eBbzaYBOL9UBa9fAAycg3gl9C+gUF3
	pmYIJd9yiNGV8ZCGxn3BugOQUZX/yjxDQIFqTrQFv8rPdPd/sxOq7kArRGOWZfg2
	3gJFGXx15kidvlcvGeaSqwkFzT8RIraIdYEpcFZS2pgEYxb079w03/z0dFQTIbHo
	wshfu9rHB+mHBfuBw6D7g73sHUhIVlcVQhS+GUmChkGt/TQPy5aB7HLG1AEwSath
	16n9rt/dT2NxVvoQv5e/tluuLHIT4V6NadgVmDyhMpzr7a2SQPatiKiBQGTQxMHV
	yvQZ1LXpF+YoTnRtfvQ3WGKewOIW58czwqxUZT8R28OhXV0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch8phu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so25288545ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112201; x=1779717001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC0Pys7yhh/moaCo/yEEimJ2CkQSGIL8p0FbL7FdrhI=;
        b=TQ5NjmPbPsG88J8Wl+xFT8WJDq4DAHUDtfyphkMGdgGU1pVwbTXjOYNBpPRUone/F7
         Xa1Id3W0122nVdeGlDKI9x9poebvzSnLp9ELQEiuAMIFUNrFJyNf6SPaMyy2C1bqZgGn
         vkbKIevPtlSEbmS6i4wNe4cc+/y4d2/KO9f7LgnCD0btH4OR8RbqHl0K6D/pwrXVSTEq
         xbIkjCFv8atzHLHLFysxDYEMu9/QbnMCWYDDrzDT61cU7C1zeN4cN1EVm2Fg48MH+GaY
         TxVhIDEJp6aUNSoAmSD4eHmgY2mqROcFf6enW/xotsmGetztoY1xBf7Cf1X0cUHRLHlX
         Y+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112201; x=1779717001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC0Pys7yhh/moaCo/yEEimJ2CkQSGIL8p0FbL7FdrhI=;
        b=UsbTZY5dZaRwxB9vncPwWFu2BqqC/gRSrqlPfLI+iqOfh023HSNVW7HcGSGS8KMR7q
         nDBG3TOTTNUvmjOy84Xx81/TSBdSZIIljdAh202roV6sdOrloBKXiXiUE+q7iXQPOG3S
         xGMVzAFixkZMaOteOOmqEIchcA5YvfUhR4CpcgvII872ek9ouQ8ox/Vuko0m8/m3VaTP
         1d5wSYilgMTp3JDBOHjYJ5U1b0jCQGmaJ75k7qBpgo9WCRJ3gM/oGs8+28trpu4ZB3ib
         SbzcwcGVDudIgFZTvIAdt7flFZ7/0C685rl3BZZI1o0OKLx3dKyCJm3gJGwewooOdoFh
         efpA==
X-Gm-Message-State: AOJu0Yypmk0YBL1YZK5EHa6x5vpEYyKDMMjGmWcuSJtyg5YhzaoK9bc2
	fL3LiG9xB/ZwSLNkYOryNgFMnbwfuWSK8nPUxLzR+5ogYKzMlCVDdi2zOQtsEBOooTnvkq6QN3Y
	+VjXgS2R1GGDl7R6WqPVYLmvyBf9JHM37TKE/8LqPvrnGTiLKWQ+RIBsKlxX/z9ourXKnt/VCuX
	Q=
X-Gm-Gg: Acq92OHHRohRn4w9WTQ+A7or2sjM+cXPAR8wK2ZELXoVB80kM87PatjS1GPaInoznT4
	NHxlez8MLfibn27RYJY+NSrSPFdrrf5guwzn1crGxlqNlHzf/0roIInfA9Khk+yos1LCAJ5pYY3
	qyhXKCDj0tPFd9M6pGFxD6fmk6aqLb8K430CPcdS8fQIi7zhhp965W0icOD04C/ZCoaX+aktEUL
	Kj7rjSHJhVoDRqJnNZHT5dR5UyScQRsMlPNxqrHY0kvnIYlY7wSV8rQog6Ub4VpEb9wRxq19KUi
	61DnxYZ3dqQ8kG+NTPHyC4A0sVt79UI0HK+4YH2NUI2Irnz+pxDUGXOsPUZmqWGAs7F/DyCs0bN
	pfIQPm5VgrxhX53rpqW0XeDxY0ta9s1uwDrX95l9d632MbBDByf/INfKQjbV85w==
X-Received: by 2002:a17:903:1109:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bdd6f13874mr43024585ad.28.1779112201407;
        Mon, 18 May 2026 06:50:01 -0700 (PDT)
X-Received: by 2002:a17:903:1109:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2bdd6f13874mr43024295ad.28.1779112200943;
        Mon, 18 May 2026 06:50:00 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm185411275ad.21.2026.05.18.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:50:00 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS support
Date: Mon, 18 May 2026 19:19:38 +0530
Message-Id: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIYC2oC/x3MQQqAIBBA0avIrBNKK6KrRIg4Y83GRCuC8O5Jy
 7f4/4VMiSnDLF5IdHPmI1R0jQC327CRZKwG1aqxHbpJWkSDznAw+YrxSKf02mvXo3UjTVC7mMj
 z8z+XtZQPi7RmU2MAAAA=
X-Change-ID: 20260518-add_dc_in_support-f3f3c4dac6e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779112197; l=971;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=AlGBGljytiN4hDB9oPg2R7DR+x7S1E5bboaK2Vh4TXg=;
 b=AajfUv3+tI9ERd3k30BSORtEcMBzSPSdqFnpZ7pmCx16dx/V3w/9k3XHVKgWLxSiNMY02HevE
 bVGQ9kIT/fRC2yMO9VEQEJFwKPWUup4Bv9CVsr+OtqpuaRUAQILbwLL
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b190a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sIspjCRwiSg0d1WxQfkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX6FzxiOoQJ3SF
 Zt4Pc+CUJCz19ztND8mO3wbCqQ5R0k1uIogQEUIZqFkWxE6Ad5afWuFeX8TeFx8TM4ITfLngDDR
 GPxyN0NqaRsHb7Suu9WZP7kBFE1Q6tT1kj5aadkbtdgLyVCNPkwwkKYjfbkq4SQWOfw1T8PjBlf
 pbx0IYIm284RU18wCd7o1inx9BmWGLJAOJlMdiIrJ2WfZx2wl/MielpA0axr3Ydy80ZF3RROFa7
 HnHm5gKzz92hEdswfMwEfR2Z0I6rl+1PwTonKUVkY1+/HtPfXqdpUtM7QcjrNClbJwI7v7Dihaw
 aFqyKQPKy/mq8mCA7t+kn39q+KjQBSdbhB3RDogQTCMf/BLcGEe2kZvVmzOlUtsb18hIWJMzn2Z
 qSSCoTZlzhXOgYCEu8EBJ05e18e2tFEkiS1n3lqZ9XMJKNLn5nq/2P5REmjrrP2sCnV+2jj8Gza
 iGXbW6P2YPgSBLTJ36Q==
X-Proofpoint-ORIG-GUID: f3R2z835oCZrkrY4B8U4MZpbuKO2m2a2
X-Proofpoint-GUID: f3R2z835oCZrkrY4B8U4MZpbuKO2m2a2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108207-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC4BB56DFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On batteryless boards powered by 12V DC adapters, registering the
power supply as BATTERY causes userspace to incorrectly trigger
battery power-saving sequences.

This series introduces a new "qcom,batteryless" boolean DT property.
When present, the driver registers the power supply as
POWER_SUPPLY_TYPE_MAINS instead, accurately reflecting the hardware.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: soc: qcom: pmic-glink: Document batteryless property
      power: supply: qcom_battmgr: Add support batteryless boards as MAINS

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  8 ++++
 drivers/power/supply/qcom_battmgr.c                | 47 +++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-add_dc_in_support-f3f3c4dac6e8

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


